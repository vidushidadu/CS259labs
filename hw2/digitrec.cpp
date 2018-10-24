#include <string.h>
#include <math.h>
#include <assert.h>
#include <iostream>

using namespace std;

// const int burstLength = 256; // 1800 is not a power of 2
const int burstLength = 1800; // 1800 is not a power of 2
const int numImages = 1;

template <typename T>
inline T Min(const T& a, const T& b) { return a < b ? a : b; }

template <typename T>
void load(const T* data_dram, T* data_local){
// cout << "CAME INSIDE LOAD\n";
#pragma HLS inline off
  for(int i=0; i<(burstLength*numImages); ++i){
#pragma HLS pipeline
    data_local[i]=data_dram[i];
  }
// cout << "LOAD DONE\n";
}

extern "C" {

// update knn set
void update(unsigned long* temp, unsigned char* knn_mat) {

// this is max_id for any given x3 and y3 pair max_id[local_num_elements]; or single loop and replace x3 in knn to ceil(burstLength*numImages/x3')
// this is serial for image size (1800) and parallel for num_images
  update:
  for (int x3 = 0; x3 < numImages; ++x3) {
    for (int y3 = 0; y3 < burstLength; ++y3) {
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
  unsigned long temp[local_num_elements];
  diff: // Completely parallel
  for (int x1 = 0; x1 < local_num_elements; ++x1) {
    temp[x1] = train_images[x1] ^ test_image;
  }

  // Compute the distance
//opt: make it dis[i] and take writing loop out dis[local_num_elements]
  dis:
  for (int x2 = 0; x2 < local_num_elements; ++x2) {
    unsigned long dis = 0;
    for (int i = 0; i < 49; ++i) {
      dis += (temp[x2] & (1L << i)) >> i;
    }
    temp[x2] = dis;
  }

/*
dis:
unsigned long dis[local_num_elements];
for(int i=0; i<local_num_elements; ++i){
  dis[i]=0;
}
    for (int i = 0; i < 49; ++i) {
      for (int x2 = 0; x2 < local_num_elements; ++x2) {
        dis[x2] += (temp[x2] & (1L << i)) >> i;
    }
  }

  update(dis, knn_mat);
  */

  update(temp, knn_mat);
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

  // cout << "CAME INSIDE KERNEL\n";

  int local_num_elements = burstLength*numImages;
  unsigned long local_train_images[local_num_elements];
  // unsigned char local_knn_mat[burstLength]; // size of this is 30

  // Initialize the knn set (jut copying?)
  init:
    for (int x = 0; x < 10; ++x) {
      for (int y = 0; y < 3; ++y) {
        // Note that the max distance is 49
        knn_mat[(y + (x * 3))] = (unsigned char)50;
      }
    }
  // cout << "INIT DONE\n";

  const int kMinTripCount = 0;
  const int kMaxTripCount = kMinTripCount + 18000/local_num_elements;

outer_loop:
  for(int i=0; i<18000; i+=(burstLength*numImages), train_images+=(burstLength*numImages)){
#pragma HLS loop_tripcount min = kMinTripCount max = kMaxTripCount
// TODO: need condition for out of range (I think it's in the loops)
    load(train_images, local_train_images);
    // load(knn_mat, local_knn_mat); // can i make this as a template?
    local_num_elements = Min(18000-i,(burstLength*numImages));
  cout << "INSIDE OUTER LOOP with i: " << i << " local num_elems: " << local_num_elements << "\n";
    compute(test_image, local_train_images, knn_mat, local_num_elements);
  }
}

} // extern "C"
