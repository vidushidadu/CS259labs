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

/*
// update knn set
void update(unsigned long* temp, unsigned char* knn_mat) {

// this is max_id for any given x3 and y3 pair max_id[local_num_elements]; or single loop and replace x3 in knn to ceil(burstLength*numImages/x3')
// this is serial for image size (1800) and parallel for num_images
// TODO: deal with non-round values (add an if condition)
  update: // unrolled by itself?
  for (int x3 = 0; x3 < numImages; ++x3) {
    #pragma HLS loop_tripcount min = 0 max = numImages
    // #pragma HLS UNROLL
    for (int y3 = 0; y3 < burstLength; ++y3) { // cannot flatten this or pipeline this--seems reasonable
      #pragma HLS loop_tripcount min = 0 max = burstLength
      #pragma HLS PIPELINE
      unsigned long max_id = 0;
      for (int i1 = 0; i1 < 3; ++i1) {
        if (knn_mat[max_id + (x3 * 3)] < knn_mat[(i1 + (x3 * 3))]) {
          max_id = i1;
        }
      }
cout << knn_mat[0] << "\n";
      if (temp[y3 + (x3*burstLength)] < knn_mat[max_id + (x3 * 3)]) {
        knn_mat[max_id + (x3 * 3)] = temp[y3 + (x3*burstLength)];
      }
    }
  }
}
*/

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

  int local_num_elements = burstLength*numImages;
  // TODO: try their mapping
  unsigned long local_train_images_0[local_num_elements];
#pragma HLS ARRAY_PARTITION variable=local_train_images_0 cyclic factor=num_chunks dim=1

unsigned long local_train_images_1[local_num_elements];
#pragma HLS ARRAY_PARTITION variable=local_train_images_1 cyclic factor=num_chunks dim=1

// Not sure why, but just to try -- because I don't know how it executes the loop (does it reorder the instructions?--just execute in dataflow order?)
  unsigned char local_knn_mat_0[3]; // size of this is 30 (updated after each image)
#pragma HLS ARRAY_PARTITION variable=local_knn_mat_0 cyclic factor=3 dim=1

  unsigned char local_knn_mat_1[3]; // size of this is 30 (updated after each image)
#pragma HLS ARRAY_PARTITION variable=local_knn_mat_1 cyclic factor=3 dim=1

  unsigned long local_test_image = test_image;
// #pragma HLS ARRAY_PARTITION variable=local_test_image cyclic factor=num_chunks dim=1

  const int kMinTripCount = 0;
  const int kMaxTripCount = kMinTripCount + 18000/local_num_elements;

outer_loop:
// the outer loop is not a perfect loop because there is nontrivial logic before entering the inner loop.
  for(int i=0; i<num_elements+burstSize; i+=burstSize, train_images+=burstSize, knn_mat+=3){
#pragma HLS loop_tripcount min = kMinTripCount max = kMaxTripCount
// TODO: need condition for out of range (I think it's in the loops)
    local_num_elements = Min(num_elements + burstSize - i, burstSize);

    if((i/burstSize) % 2) {
      load(i < num_elements, train_images, local_train_images_0, local_num_elements);
      init_knn_mat(i < num_elements, local_knn_mat_0, 3);
      compute(i > 0, local_test_image, local_train_images_1, local_knn_mat_1, local_num_elements);
      load(i > 0, local_knn_mat_1, knn_mat, 3); // store
cout << (local_knn_mat_1[0]-'0') << "\n";
    } else {
      load(i < num_elements, train_images, local_train_images_1, local_num_elements);
      init_knn_mat(i < num_elements, local_knn_mat_1, 3);
      compute(i > 0, local_test_image, local_train_images_0, local_knn_mat_0, local_num_elements);
      load(i > 0, local_knn_mat_0, knn_mat, 3); // store
    }
  }
}

} // extern "C"
