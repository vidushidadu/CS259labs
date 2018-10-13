#include <assert.h>

extern "C" {

void dot_prod_kernel(const float* a, const float* b, float* c, const int num_elems) {
#pragma HLS interface m_axi port = a offset = slave bundle = gmem
#pragma HLS interface m_axi port = b offset = slave bundle = gmem
#pragma HLS interface m_axi port = c offset = slave bundle = gmem
#pragma HLS interface s_axilite port = a bundle = control
#pragma HLS interface s_axilite port = b bundle = control
#pragma HLS interface s_axilite port = c bundle = control
#pragma HLS interface s_axilite port = num_elems bundle = control
#pragma HLS interface s_axilite port = return bundle = control
  assert(num_elems <= 4096);  // this helps HLS estimate the loop trip count
  int CHUNK_SIZE=1024;
  int num_chunks = 4;
  // int num_chunks = (int)num_elems/CHUNK_SIZE;
  
  // float local_a[num_elems];
  // TODO: just to debug--fix later (Check if it works with equating to num_elems)
  int num_elem=4096;
  float local_a[num_elem];
  #pragma HLS ARRAY_PARTITION variable=local_a block factor=num_chunks dim=1
  // #pragma HLS ARRAY_PARTITION variable=local_a cyclic factor=CHUNK_SIZE dim=1
  // #pragma HLS ARRAY_PARTITION variable=local_a block factor=CHUNK_SIZE dim=1
  // #pragma HLS ARRAY_PARTITION variable=local_a block factor=M/2 dim=1 // (2 elements everywhere)
  
  // float local_b[num_elems];
  float local_b[num_elem];
  #pragma HLS ARRAY_PARTITION variable=local_b block factor=num_chunks dim=1
  // #pragma HLS ARRAY_PARTITION variable=local_b cyclic factor=CHUNK_SIZE dim=1
  // #pragma HLS ARRAY_PARTITION variable=local_b block factor=CHUNK_SIZE dim=1

  // data transfer in scratchpad
  for(int i=0; i<num_elems; ++i){
    #pragma HLS UNROLL
    local_a[i]=a[i];
  }

  for(int i=0; i<num_elems; ++i){
    #pragma HLS UNROLL
    local_b[i]=b[i];
  }
  float local_result=0;

  float local_temp_result[num_chunks];
  #pragma HLS ARRAY_PARTITION variable=local_temp_result cyclic factor=num_chunks dim=1
  // #pragma HLS ARRAY_PARTITION variable=local_temp_result complete dim=1

  for(int j=0; j<num_chunks; j++)
  {
    #pragma HLS UNROLL
    local_temp_result[j]=0;
  }

  // float local_prod[num_elems];
  float local_prod[num_elem];
  #pragma HLS ARRAY_PARTITION variable=local_prod block factor=num_chunks dim=1

  for(int i=0; i<num_elems; ++i){
    #pragma HLS UNROLL
    local_prod[i]=local_a[i]*local_b[i];
  }
  
  for(int j=0; j<num_chunks; j++)
  {
    #pragma HLS UNROLL factor=num_chunks
    for(int i=j*CHUNK_SIZE; i<(CHUNK_SIZE*(j+1)); ++i)
    {
      #pragma HLS PIPELINE II=1
      local_temp_result[j] = local_temp_result[j] + local_prod[i];
      // local_temp_result[j] = local_temp_result[j] + local_a[i]*local_b[i];
    }
    local_result = local_result + local_temp_result[j]; // how to make this atomic? (or is it by default?)
  }
  c[0] = local_result;

/*
  // #HLS INLINE OFF // not sure why is this required
  for(int j=0; j<num_elems; j+=CHUNK_SIZE)
  {
    #pragma HLS UNROLL factor=num_chunks
    for(int i=j; i<(j+CHUNK_SIZE); ++i)
    {
      #pragma HLS PIPELINE II=2
      local_temp_result[j] = local_temp_result[j] + local_a[i]*local_b[i];
    }
    local_result = local_result + local_temp_result[j]; // how to make this atomic? (or is it by default?)
  }
*/

/*
  for(int i=0; i<num_elems; ++i)
  {
    local_result = local_result + local_a[i]*local_b[i];
  }
*/
}

}  // extern "C"
