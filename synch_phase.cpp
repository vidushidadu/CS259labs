#include <iostream>
using namespace std;

#define E 100 // E: number of edges processed in a bucket in parallel
#define N 100 // N: hash table size (worst case number of dest edges)
#define V 200

int main() {

  // input data structures
  int dest_id[E];
  int cur_dist[E];

  // fill data
  for(int i=0; i<E; ++i) {
    dest_id[i] = rand()%10;
    cur_dist[i] = rand()%100;
  }

  // TODO: get the number of conflicts here

  // output data structures (hash table with collision)
  std::pair<int,int> final_dist[N]; // <dest_id,dist>

  for(int i=0; i<N; ++i) {
    final_dist[i] = std::make_pair(-1,-1);
  }

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

  return 0;

}
