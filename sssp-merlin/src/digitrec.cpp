#include <string.h>
#include <math.h>
#include <assert.h>

void digitrec_kernel(
        unsigned int *dest_id,
        unsigned int* cur_dist,
        unsigned int* final_dist) {

  // conflict detection and resolution
  for(int i=0; i<E; ++i){
    int cur_local_dest = dest_id[i];
    int hash_loc = cur_local_dest%N;
    if(final_dist[hash_loc].first==-1) { // insertion
        final_dist[hash_loc] = std::make_pair(cur_local_dest,cur_dist[i]);
    } else if(cur_local_dest==final_dist[hash_loc].first) { // update
        final_dist[hash_loc] = std::make_pair(cur_local_dest,min(cur_dist[i],final_dist[hash_loc].second));
    } else { // collision
        for(int k=hash_loc+1; k!=hash_loc; k=(k+hash_loc)%N){
           if(cur_local_dest==final_dist[k].first) { // update
             final_dist[k] = std::make_pair(cur_local_dest,min(cur_dist[i],final_dist[hash_loc].second));
           } else { // insertion
             final_dist[k] = std::make_pair(cur_local_dest,cur_dist[i]);  
           }
        }
    }
  }
  
  int dist[V];
  // write to DRAM
  for(int i=0; i<N; ++i){
      if(final_dist[i].first!=-1){
          dist[final_dist[i].first] = final_dist[i].second;
      }
  }


}
