#include <string.h>
#include <math.h>
#include <assert.h>
#include <iostream>

using namespace std;

const int burstLength = 1800; // 1800 is not a power of 2
const int numImages = 1;
const int burstSize = burstLength*numImages;
const int num_chunks = 360; // if factor of 1800--can remove conditional check
const int num_elements = 18000;

template <typename T>
inline T Min(const T& a, const T& b) { return a < b ? a : b; }

//  These data requests might be further partitioned to multiple requests during RTL generation, based on max_read_burst_length or max_write_burst_length settings.
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

extern "C" {

// not sure what it is doing here
void init_knn_mat(bool enable, unsigned char* a, int num_elems) {
#pragma HLS inline off
  // Initialize the knn set
if(enable){
  init:
  for (int y = 0; y < num_elems; ++y) {
    a[y] = (unsigned char)50;
  }
}
}

// TODO: local_num_elements is actually not required in this implementation
// update knn set
// I can do tiling here
void update(unsigned long* dis, unsigned char* local_knn_mat) {
#pragma HLS inline off
  init_knn_mat(true, local_knn_mat, 3);
update:
  for (int y3 = 0; y3 < burstLength; ++y3) { // cannot flatten this or pipeline this--seems reasonable
    #pragma HLS PIPELINE
    unsigned long max_id = 0;
    for (int i1 = 0; i1 < 3; ++i1) {
      if (local_knn_mat[max_id] < local_knn_mat[i1]) {
        max_id = i1;
      }
    }
    if (dis[y3] < local_knn_mat[max_id]) {
     local_knn_mat[max_id] = dis[y3];
    }
  }
}

// see this const issue
// TODO: split it later according to the parallelization strategy
void compute(bool enable, unsigned long test_image, unsigned long* train_images, unsigned char* local_knn_mat){
  #pragma HLS inline off
  if(enable){
    // Compute the difference using XOR
    unsigned long local_temp[burstSize];
    #pragma HLS ARRAY_PARTITION variable=local_temp cyclic factor=num_chunks dim=1

    diff: // Completely parallel
    for (int x1 = 0; x1 < burstSize; ++x1) {
      #pragma HLS UNROLL factor=num_chunks skip_exit_check
      local_temp[x1] = train_images[x1] ^ test_image;
    }

  // Compute the distance
    unsigned long dis[burstSize];
    #pragma HLS ARRAY_PARTITION variable=dis cyclic factor=num_chunks dim=1

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
// print(dis, local_num_elements);
    update(dis,local_knn_mat); // pass the size here
}

}

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

  // TODO: try their mapping
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

// the outer loop is not a perfect loop because there is nontrivial logic before entering the inner loop.

int knn_mat_index = 0;

outer_loop:
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
