#include <string.h>
#include <math.h>
#include <assert.h>
#include <iostream>

using namespace std;

// const int burstLength = 256; // 1800 is not a power of 2
const int burstLength = 1800; // 1800 is not a power of 2
const int numImages = 1;
const int num_chunks = 8; // current unroll factor?

template <typename T>
inline T Min(const T& a, const T& b) { return a < b ? a : b; }
//  These data requests might be further partitioned to multiple requests during RTL generation, based on max_read_burst_length or max_write_burst_length settings.
template <typename T>
void load(const T* data_dram, T* data_local, int num_elem){

#pragma HLS inline off
  for(int i=0; i<num_elem; ++i){
#pragma HLS pipeline
    data_local[i]=data_dram[i];
  }
}

extern "C" {

// update knn set
void update(unsigned long* temp, unsigned char* knn_mat) {

// this is max_id for any given x3 and y3 pair max_id[local_num_elements]; or single loop and replace x3 in knn to ceil(burstLength*numImages/x3')
// this is serial for image size (1800) and parallel for num_images
// TODO: deal with non-round values (add an if condition)
  update: // unrolled by itself?
  for (int x3 = 0; x3 < numImages; ++x3) {
    for (int y3 = 0; y3 < burstLength; ++y3) { // cannot flatten this or pipeline this--seems reasonable
      unsigned long max_id = 0;
      for (int i1 = 0; i1 < 3; ++i1) {
        if (knn_mat[max_id + (x3 * 3)] < knn_mat[(i1 + (x3 * 3))]) {
          max_id = i1;
        }
      }
      if (temp[y3 + (x3*burstLength)] < knn_mat[max_id + (x3 * 3)]) {
        knn_mat[max_id + (x3 * 3)] = temp[y3 + (x3*burstLength)];
      }
    }
  }

}

// see this const issue
// TODO: split it later according to the parallelization strategy
void compute(unsigned long test_image, unsigned long* train_images, unsigned char* knn_mat, int local_num_elements){

// cout << "CAME TO COMPUTE, SHOULD BE 10 TIMES\n"; // see how can i reduce number of images

  // Compute the difference using XOR
  unsigned long temp[(numImages*burstLength)];
  diff: // Completely parallel
  for (int x1 = 0; x1 < local_num_elements; ++x1) {
    // it said can't unroll with variable trip count
#pragma HLS loop_tripcount min = 0 max = (numImages*burstLength)
#pragma HLS UNROLL factor=num_chunks
    temp[x1] = train_images[x1] ^ test_image;
// cout << "Output of xor stage: " << temp[x1] << "\n";
  }

  // Compute the distance
dis:
unsigned long dis[(numImages*burstLength)];
for(int i=0; i<local_num_elements; ++i){
  dis[i]=0;
}
    for (int i = 0; i < 49; ++i) {
#pragma HLS PIPELINE II=1
      for (int x2 = 0; x2 < local_num_elements; ++x2) {
#pragma HLS UNROLL factor=num_chunks
        dis[x2] += (temp[x2] & (1L << i)) >> i;
    }
  }
  update(dis, knn_mat); // pass the size here

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
  unsigned long local_train_images[local_num_elements];
#pragma HLS ARRAY_PARTITION variable=local_train_images cyclic factor=num_chunks dim=1
  unsigned char local_knn_mat[30]; // size of this is 30 (updated after each image)
#pragma HLS ARRAY_PARTITION variable=local_knn_mat cyclic factor=num_chunks dim=1
  unsigned long local_test_image = test_image;
#pragma HLS ARRAY_PARTITION variable=local_test_image cyclic factor=num_chunks dim=1

  // Initialize the knn set (jut copying?)
  init:
    for (int x = 0; x < 10; ++x) {
      for (int y = 0; y < 3; ++y) {
        // Note that the max distance is 49
        local_knn_mat[(y + (x * 3))] = (unsigned char)50;
      }
    }

  const int kMinTripCount = 0;
  const int kMaxTripCount = kMinTripCount + 18000/local_num_elements;

outer_loop:
// the outer loop is not a perfect loop because there is nontrivial logic before entering the inner loop.
  for(int i=0; i<18000; i+=(burstLength*numImages), train_images+=(burstLength*numImages), knn_mat+=3){
#pragma HLS loop_tripcount min = kMinTripCount max = kMaxTripCount
// TODO: need condition for out of range (I think it's in the loops)
    local_num_elements = Min(18000-i,(burstLength*numImages));
    load(train_images, local_train_images, local_num_elements);
    // cout << "INSIDE OUTER LOOP with i: " << i << " local num_elems: " << local_num_elements << "\n";
    compute(local_test_image, local_train_images, local_knn_mat, local_num_elements);
    load(local_knn_mat, knn_mat, 3);

  }

}

} // extern "C"
