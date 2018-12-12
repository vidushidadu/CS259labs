#include <string.h>
#include <math.h>
#include <assert.h>
// #include <iostream>

// using namespace std;

#define E 100 // E: number of edges processed in a bucket in parallel
#define N 100 // N: hash table size (worst case number of dest edges)
#define V 200

int find_min(int x, int y){
  return x<y?x:y;
}

#pragma ACCEL kernel
void digitrec_kernel(
        unsigned int *dest_id,
        unsigned int* cur_dist,
        int *final_dist_id,
        int *final_dist_val) {

  #pragma ACCEL interface variable=dest_id depth=100
  #pragma ACCEL interface variable=cur_dist depth=100
  #pragma ACCEL interface variable=final_dist_id depth=100
  #pragma ACCEL interface variable=final_dist_val depth=100

  // conflict detection and resolution
  for(int i=0; i<E; ++i){
    int cur_local_dest = dest_id[i];
    int hash_loc = cur_local_dest%N;
    if(final_dist_id[hash_loc]==-1) { // insertion
        final_dist_id[hash_loc] = cur_local_dest;
        final_dist_val[hash_loc] = cur_dist[i];
    } else if(cur_local_dest==final_dist_id[hash_loc]) { // update
        final_dist_id[hash_loc] = cur_local_dest;
        final_dist_val[hash_loc] = find_min(cur_dist[i],final_dist_val[hash_loc]);
    } else { // collision
        for(int k=hash_loc+1; k!=hash_loc; k=(k+hash_loc)%N){
           if(cur_local_dest==final_dist_id[k]) { // update
             final_dist_id[k] = cur_local_dest;
             final_dist_val[k] = find_min(cur_dist[i],final_dist_val[hash_loc]);
           } else { // insertion
             final_dist_id[k] = cur_local_dest;
             final_dist_val[k] = cur_dist[i];  
           }
        }
    }
  }
  
/*
  int dist[V];
  // write to DRAM
  for(int i=0; i<N; ++i){
      if(final_dist[i].first!=-1){
          dist[final_dist[i].first] = final_dist[i].second;
      }
  }
*/


}
