#include <string.h>
#include <math.h>
#include <assert.h>
#include <iostream>

using namespace std;

// const int burstLength = 256; // 1800 is not a power of 2
const int burstLength = 1800; // 1800 is not a power of 2
const int numImages = 1;
const int burstSize = burstLength*numImages;
const int num_chunks = 8; // current unroll factor?
const int num_elements = 18000;
const int double_buf_pipe = 3;

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
inline void print(const T a, int num_elem){
  for(int i=0; i< num_elem; ++i){
    cout << a[i] << endl;
  }
}

extern "C" {

// update knn set
void update(unsigned long* temp, unsigned char* knn_mat) {

update:
  for (int y3 = 0; y3 < burstLength; ++y3) { // cannot flatten this or pipeline this--seems reasonable
    #pragma HLS loop_tripcount min = 0 max = burstLength
    #pragma HLS PIPELINE
    unsigned long max_id = 0;
    for (int i1 = 0; i1 < 3; ++i1) {
      if (knn_mat[max_id] < knn_mat[i1]) {
        max_id = i1;
      }
    }
    if (temp[y3] < knn_mat[max_id]) {
      knn_mat[max_id] = temp[y3];
    }
  }
// print(knn_mat, 3);
}



// see this const issue
// TODO: split it later according to the parallelization strategy
void compute(bool enable, unsigned long test_image, unsigned long* train_images, unsigned char* knn_mat, int local_num_elements){
  #pragma HLS inline off
  // cout << "CAME TO COMPUTE, SHOULD BE 10 TIMES\n"; // see how can i reduce number of images
  if(enable){
    // Compute the difference using XOR
    unsigned long local_temp[burstSize];
    #pragma HLS ARRAY_PARTITION variable=local_temp cyclic factor=num_chunks dim=1
    diff: // Completely parallel
    for (int x1 = 0; x1 < local_num_elements; ++x1) {
      // it said can't unroll with variable trip count
      #pragma HLS loop_tripcount min = 0 max = burstSize
      #pragma HLS UNROLL factor=num_chunks
      local_temp[x1] = train_images[x1] ^ test_image;
    }

  // Compute the distance
    dis_init:
    unsigned long dis[burstSize];
    #pragma HLS ARRAY_PARTITION variable=dis cyclic factor=num_chunks dim=1

    for(int i=0; i<local_num_elements; ++i){
      #pragma HLS loop_tripcount min = 0 max = burstSize
      dis[i]=0;
    }

    dis:
      for (int i = 0; i < 49; ++i) {
        #pragma HLS loop_tripcount min = 0 max = 49
        #pragma HLS PIPELINE
        for (int x2 = 0; x2 < local_num_elements; ++x2) {
          #pragma HLS loop_tripcount min = 0 max = burstSize
          #pragma HLS UNROLL factor=num_chunks
          dis[x2] = dis[x2] + ((local_temp[x2] & (1L << i)) >> i);
      }
    }
// print(dis, local_num_elements);
    update(dis, knn_mat); // pass the size here
}

}

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
  unsigned char local_knn_mat_0[3]; // size of this is 30 (updated after each image)
  unsigned char local_knn_mat_1[3]; // size of this is 30 (updated after each image)
  unsigned char local_knn_mat_2[3]; // size of this is 30 (updated after each image)
  unsigned long local_test_image = test_image;

#pragma HLS ARRAY_PARTITION variable=local_train_images_0 cyclic factor=num_chunks dim=1
#pragma HLS ARRAY_PARTITION variable=local_train_images_1 cyclic factor=num_chunks dim=1
#pragma HLS ARRAY_PARTITION variable=local_train_images_2 cyclic factor=num_chunks dim=1
// Not sure why, but just to try -- because I don't know how it executes the loop (does it reorder the instructions?--just execute in dataflow order?)
#pragma HLS ARRAY_PARTITION variable=local_knn_mat_0 cyclic factor=3 dim=1
#pragma HLS ARRAY_PARTITION variable=local_knn_mat_1 cyclic factor=3 dim=1
#pragma HLS ARRAY_PARTITION variable=local_knn_mat_2 cyclic factor=3 dim=1

  const int kMinTripCount = 0;
  const int kMaxTripCount = kMinTripCount + num_elements/burstSize;

// the outer loop is not a perfect loop because there is nontrivial logic before entering the inner loop.
outer_loop:
  for(int i=0; i<num_elements+(double_buf_pipe*burstSize); i+=burstSize, train_images+=burstSize, knn_mat+=3){
#pragma HLS loop_tripcount min = kMinTripCount max = kMaxTripCount
    const int local_num_elements = Min(num_elements + (double_buf_pipe*burstSize) - i, burstSize);

   if(((i/burstSize) % double_buf_pipe)==0) {
      load(i < num_elements, train_images, local_train_images_0, local_num_elements);
      init_knn_mat(i < num_elements, local_knn_mat_0, 3);
      compute(i > 0, local_test_image, local_train_images_1, local_knn_mat_1, local_num_elements);
      load(i > -burstSize, local_knn_mat_2, knn_mat, 3); // store
    } else if(((i/burstSize) % double_buf_pipe)==1) {
      load(i < num_elements, train_images, local_train_images_1, local_num_elements);
      init_knn_mat(i < num_elements, local_knn_mat_1, 3);
      compute(i > 0, local_test_image, local_train_images_2, local_knn_mat_2, local_num_elements);
      load(i > -burstSize, local_knn_mat_0, knn_mat, 3); // store
    } else {
      load(i < num_elements, train_images, local_train_images_2, local_num_elements);
      init_knn_mat(i < num_elements, local_knn_mat_2, 3);
      compute(i > 0, local_test_image, local_train_images_0, local_knn_mat_0, local_num_elements);
      load(i > -burstSize, local_knn_mat_1, knn_mat, 3); // store
    }
  }
}

} // extern "C"
