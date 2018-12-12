#include <iostream>
#include <string>

using namespace std;

#define E 100 // E: number of edges processed in a bucket in parallel
#define N 100 // N: hash table size (worst case number of dest edges)
#define V 200

using std::cout;
using std::endl;
using std::string;
using std::to_string;

#ifdef MCC_ACC
#include MCC_ACC_H_FILE
#else
void digitrec_kernel(unsigned long test_image, unsigned long* train_images,
    unsigned char* knn_mat);
#endif

// Util functions for host
// void read_train_file(string filename, unsigned long *train_image);
// void read_test_file(string filename, unsigned long *test_image, int *test_label);
// int vote(unsigned char *knn_mat);

int main(int argc, char **argv) {

  // input data structures
  unsigned int *dest_id = (unsigned int*)malloc(sizeof(unsigned int) * E);
  unsigned int *cur_dist = (unsigned int*)malloc(sizeof(unsigned int) * E);
  // fill data
  for(int i=0; i<E; ++i) {
    dest_id[i] = rand()%10;
    cur_dist[i] = rand()%100;
  }

  // output data structures (hash table with collision)
  int final_dist_id[N]; // <dest_id,dist>
  int final_dist_val[N]; // <dest_id,dist>

  for(int i=0; i<N; ++i) {
    final_dist_id[i] = -1;
    final_dist_val[i] = -1;
  }




// #ifdef MCC_ACC
//   __merlin_init(argv[argc-1]);
// #endif

//   string path(argv[1]);
// 
//   // Prepare data
//   for (int i = 0; i < 10; ++i)
//     read_train_file(path + "/training_set_" + to_string(i) + ".dat",
//         &train_image[i * 1800]);
//   read_test_file(path + "/testing_set.dat", test_image, test_label);

  // Compute
#ifdef MCC_ACC
    __merlin_digitrec_kernel(dest_id, cur_dist, final_dist_id, final_dist_val); 
#else
    digitrec_kernel(dest_id, cur_dist, final_dist_id, final_dist_val);
#endif
  // cout << "Accuracy: " << 100.0 * ((float)correct / NUM_IMAGES) << "%" << endl;

// TODO: host code compute for validation

#ifdef MCC_ACC
    __merlin_release();
#endif

  free(dest_id);
  free(cur_dist);
  return 0;
}
