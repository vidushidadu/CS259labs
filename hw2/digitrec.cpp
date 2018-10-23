#include <string.h>
#include <math.h>
#include <assert.h>

const int burstLength = 256; // 1800 is not a power of 2
const int numImages = 10;

template <typename T>
void load(const T* data_dram, const T* data_local){
#pragma HLS inline off
  for(int i=0; i<burstLength*numImages; ++i){
    data_local[i]=data_dram[i];
  }
}

extern "C" {

// see this const issue
// TODO: split it later according to the parallelization strategy
void compute(unsigned long test_image, unsigned long* train_images, unsigned char* knn_mat, int local_num_elements){
  // Compute the difference using XOR
  unsigned long temp[burstLength];
  diff:
  for (int x1 = 0; x1 < local_num_elements; ++x1) {
    temp[x1] = train_images[x1] ^ test_image;
  }
  
  // Compute the distance
  dis:
  for (int x2 = 0; x2 < local_num_elements; ++x2) {
    unsigned long dis = 0;
    for (int i = 0; i < 49; ++i) {
      dis += (temp[x2] & (1L << i)) >> i;
    }
    temp[x2] = dis;
  }
  
  // Update knn set
  update:
  for (int x3 = 0; x3 < local_num_elements; ++x3) {
    unsigned long max_id = 0;
    for (int i1 = 0; i1 < 3; ++i1) {
      if (knn_mat[max_id + (x3 * 3)] < knn_mat[(i1 + (x3 * 3))]) {
        max_id = i1;
      }
    }
    if (temp[x3] < knn_mat[max_id + (x3 * 3)]) {
      knn_mat[max_id + (x3 * 3)] = temp[x3];
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


  unsigned long local_train_images[burstLength];
  unsigned char local_knn_mat[burstLength];


  // Initialize the knn set (jut copying?)
  init:
    for (int x = 0; x < 10; ++x) {
      for (int y = 0; y < 3; ++y) {
        // Note that the max distance is 49
        knn_mat[(y + (x * 3))] = (unsigned char)50;
      }
    }
  int local_num_elements;
outer_loop:
  for(int i=0; i<18000; i+=(burstLength*numImages), train_images+=(burstLength*numImages)){
	// TODO: need condition for out of range
    load(train_images, local_train_images);
    load(knn_mat, local_knn_mat); // can i make this as a template?
    // unsigned int a;
    local_num_elements = Min((burstLength*numImages)-i,burstLength);
	  compute(test_image, local_train_images, local_knn_mat, local_num_elements);
  }
}

} // extern "C"

/*
unsigned long temp[burstLength];
diff:
for (int x1 = 0; x1 < numImages; ++x1) {
  for (int y1 = 0; y1 < burstLength; ++y1) {
    temp[(y1 + (x1 * burstLength))] = train_images[(y1 + (x1 * burstLength))] ^ test_image;
  }
}

// Compute the distance
dis:
for (int x2 = 0; x2 < numImages; ++x2) {
  for (int y2 = 0; y2 < burstLength; ++y2) {
    unsigned long dis = 0;
    for (int i = 0; i < 49; ++i) {
      dis += (temp[(y2 + (x2 * burstLength))] & (1L << i)) >> i;
    }
    temp[(y2 + (x2 * burstLength))] = dis;
  }
}

// Update knn set
update:
for (int x3 = 0; x3 < numImages; ++x3) {
  for (int y3 = 0; y3 < burstLength; ++y3) {
    unsigned long max_id = 0;
    for (int i1 = 0; i1 < 3; ++i1) {
      if (knn_mat[max_id + (x3 * 3)] < knn_mat[(i1 + (x3 * 3))]) {
        max_id = i1;
      }
    }
    if (temp[y3 + (x3 * burstLength)] < knn_mat[max_id + (x3 * 3)]) {
      knn_mat[max_id + (x3 * 3)] = temp[y3 + (x3 * burstLength)];
    }
  }
}
*/
