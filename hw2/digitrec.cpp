#include <string.h>
#include <math.h>
#include <assert.h>
#include <iostream>
#include <ap_int.h>

using namespace std;

// const int burstLength = 1800; // 1800 is not a power of 2
const int burstLength = 360; // 1800 is not a power of 2
const int numImages = 1;
const int burstSize = burstLength*numImages;
const int burstWidth = 256; // datawidth size = should be a multiple of 8 (otherwise other issues)
// const int num_chunks = 360; // if factor of 1800--can remove conditional check
// const int num_chunks = 8; // if factor of 1800--can remove conditional check
const int num_chunks = 180;
const int num_elements = 18000;
const int longSize = 32; // 4 bytes
const int tileSize = 8; // should be a multiple of 1800

template <typename T>
inline T Min(const T& a, const T& b) { return a < b ? a : b; }

template<typename To, typename From>
inline To Reinterpret(const From& val){
  return reinterpret_cast<const To&>(val);
}

template <typename T>
void load(bool enable, const T* data_dram, T* data_local, int num_elem){
#pragma HLS inline off
  if(enable){
    for(int i=0; i<num_elem; ++i){
      #pragma HLS pipeline
      data_local[i]=data_dram[i];
    }
  }
}

/*
template <typename T>
void load(bool enable, const ap_uint<burstWidth>* data_dram, T* data_local, int num_elem){
#pragma HLS inline off
  if(enable){
    for(int i=0; i<num_elem / (burstWidth/longSize); ++i){
      #pragma HLS pipeline
      ap_uint<burstWidth> tmp = data_dram[i];
      for(int j=0; j < burstWidth/longSize; ++j){
        #pragma HLS UNROLL
        data_local[i*(burstWidth/longSize)+j] =
        Reinterpret<unsigned long>(static_cast<unsigned>(tmp((j+1)*longSize-1,j*longSize)));
      }
    }
  }
}
*/

template <typename T>
void store(bool enable, const T* data_local, T* data_dram, int num_elem){
#pragma HLS inline off
  if(enable){
    for(int i=0; i<num_elem; ++i){
      #pragma HLS pipeline
      data_dram[i]=data_local[i];
    }
  }
}

template <typename T>
inline void print(const T a, int num_elem){
  for(int i=0; i< num_elem; ++i){
    cout << a[i] << endl;
  }
}

// Initialize the knn set
void init_knn_mat(bool enable, unsigned char* a, int num_elems) {
#pragma HLS inline off
  if(enable){
    init:
    for (int y = 0; y < num_elems; ++y) {
      a[y] = (unsigned char)50;
    }
  }
}

void write_min(unsigned char* array, unsigned long val){
  #pragma HLS inline off
  unsigned long max_id = 0;
  for (int i1 = 0; i1 < 3; ++i1) {
    if (array[max_id] < array[i1]) {
      max_id = i1;
    }
  }
  if (val < array[max_id]) {
    array[max_id] = val;
  }
}

// Reduce k*3 to m*3 sets *finally we want 1*3 set
template<int start_size, int end_size>
void Reduce(unsigned char* array) {
  #pragma HLS inline
  unsigned char knn_mat[3*end_size];
  init_knn_mat(true, knn_mat, 3*end_size);
  reduce:
  for (int i = 0; i < start_size; ++i) { // cannot flatten this or pipeline this--seems reasonable
    for (int j = 0; j < 3; ++j) {
      #pragma HLS PIPELINE
      write_min(knn_mat, array[j + (i*3)]);
    }
  }
  store(true, knn_mat, array, 3*end_size);
}

extern "C" {

void update(unsigned long* dis, unsigned char* knn_mat) {
  #pragma HLS inline off
  unsigned char local_knn_mat[tileSize*3];
  init_knn_mat(true, local_knn_mat, 3*tileSize);

  update:
  for(int i=0; i < (burstSize/tileSize); ++i){
    #pragma HLS PIPELINE
    for(int j=0; j < tileSize; ++j){
      #pragma HLS UNROLL factor=tileSize
      write_min(&local_knn_mat[j*3], dis[i+(j*burstSize/tileSize)]);
    }
  }
  // Reduce<tileSize,1>(local_knn_mat);
  // Reduction tree
  reduce:
  Reduce<8,4>(local_knn_mat);
  Reduce<4,2>(local_knn_mat);
  Reduce<2,1>(local_knn_mat);
  store(true, local_knn_mat, knn_mat, 3);
}

void compute(bool enable, unsigned long test_image, unsigned long* train_images, unsigned char* local_knn_mat){
  #pragma HLS inline off
  if(enable){
    unsigned long local_temp[burstSize];
    unsigned long dis[burstSize];
    #pragma HLS ARRAY_PARTITION variable=local_temp cyclic factor=num_chunks dim=1
    #pragma HLS ARRAY_PARTITION variable=dis cyclic factor=num_chunks dim=1

    // Compute the difference using XOR
    diff:
    for (int x1 = 0; x1 < burstSize; ++x1) {
      #pragma HLS UNROLL factor=num_chunks skip_exit_check
      local_temp[x1] = train_images[x1] ^ test_image;
    }

    // Compute the distance
    dis_init:
    for(int i=0; i<burstSize; ++i){
      #pragma LOOP UNROLL factor=num_chunks skip_exit_check
      dis[i]=0;
    }

    dis:
      for (int i = 0; i < 49; ++i) {
        #pragma HLS PIPELINE
        for (int x2 = 0; x2 < burstSize; ++x2) {
          #pragma HLS UNROLL factor=num_chunks skip_exit_check
          dis[x2] = dis[x2] + ((local_temp[x2] & (1L << i)) >> i);
      }
    }
    update(dis,local_knn_mat);
}

}

// ap_uint<burstWidth>* train_images,
// this is called 180 times for all test images
void digitrec_kernel(
    unsigned long test_image,
    unsigned long* train_images,
    unsigned char* knn_mat) {
#pragma HLS interface m_axi port=train_images offset=slave bundle=gmem
#pragma HLS interface m_axi port=knn_mat offset=slave bundle=gmem2
#pragma HLS interface s_axilite port=test_image bundle=control
#pragma HLS interface s_axilite port=train_images bundle=control
#pragma HLS interface s_axilite port=knn_mat bundle=control
#pragma HLS interface s_axilite port=return bundle=control

  unsigned long local_train_images_0[burstSize];
  unsigned long local_train_images_1[burstSize];
  unsigned long local_train_images_2[burstSize];
  unsigned char local_knn_mat_0[3];
  unsigned char local_knn_mat_1[3];
  unsigned char local_knn_mat_2[3];
  unsigned long local_test_image = test_image;

#pragma HLS ARRAY_PARTITION variable=local_train_images_0 cyclic factor=num_chunks dim=1
#pragma HLS ARRAY_PARTITION variable=local_train_images_1 cyclic factor=num_chunks dim=1
#pragma HLS ARRAY_PARTITION variable=local_train_images_2 cyclic factor=num_chunks dim=1
#pragma HLS ARRAY_PARTITION variable=local_knn_mat_0 cyclic factor=3 dim=1
#pragma HLS ARRAY_PARTITION variable=local_knn_mat_1 cyclic factor=3 dim=1
#pragma HLS ARRAY_PARTITION variable=local_knn_mat_2 cyclic factor=3 dim=1

  const int kMinTripCount = 0;
  const int kMaxTripCount = kMinTripCount + num_elements/burstSize;

int knn_mat_index = 0;

outer_loop:
  // for(int i=0; i<num_elements+(2*burstSize); i+=burstSize, train_images+= (burstSize/(burstWidth/longSize)))
  for(int i=0; i<num_elements+(2*burstSize); i+=burstSize, train_images+=burstSize) {
#pragma HLS loop_tripcount min = kMinTripCount max = kMaxTripCount

    bool cond1 = i < num_elements;
    bool cond2 = (i > 0) && (i < (num_elements+burstSize));
    bool cond3 = (i > burstSize);

   if(((i/burstSize) % 3)==0) {
      load(cond1, train_images, local_train_images_0, burstSize);
      compute(cond2, local_test_image, local_train_images_2, local_knn_mat_2);
      store(cond3, local_knn_mat_1, &knn_mat[knn_mat_index], 3);
    } else if(((i/burstSize) % 3)==1) {
      load(cond1, train_images, local_train_images_1, burstSize);
      compute(cond2, local_test_image, local_train_images_0, local_knn_mat_0);
      store(cond3, local_knn_mat_2, &knn_mat[knn_mat_index], 3);
    } else {
      load(cond1, train_images, local_train_images_2, burstSize);
      compute(cond2, local_test_image, local_train_images_1, local_knn_mat_1);
      store(cond3, local_knn_mat_0, &knn_mat[knn_mat_index], 3);
    }
    if(cond3) {
      knn_mat_index += 3;
    }
  }
}

} // extern "C"
