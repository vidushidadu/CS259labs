#include <assert.h>

extern "C" {
  
void  local_dot_product(float *a, float *b, int start, int end, float &res)
{
  for(int i=start; i<end; ++i)
  {
    #pragma HLS PIPELINE II=2
    res = res + a[i]*b[i];
  }
}

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
  // int CHUNK_SIZE=1024;
  // int num_chunks = 4;

  int CHUNK_SIZE=512;
  int num_chunks = 8;

  // TODO: just to debug--fix later
  float local_a[4096];
  #pragma HLS ARRAY_PARTITION variable=local_a block factor=num_chunks dim=1
 
  float local_b[4096];
  #pragma HLS ARRAY_PARTITION variable=local_b block factor=num_chunks dim=1
  
  // data transfer in scratchpad
  for(int i=0; i<num_elems; ++i){
    local_a[i]=a[i];
  }

  for(int i=0; i<num_elems; ++i){
    local_b[i]=b[i];
  }
  float local_result=0;

  float local_temp_result[num_chunks];
  #pragma HLS ARRAY_PARTITION variable=local_temp_result cyclic factor=num_chunks dim=1

  for(int j=0; j<num_chunks; j++)
  {
    local_temp_result[j]=0;
  }

  #pragma HLS INLINE OFF
  for(int j=0; j<num_chunks; j++)
  {
    // #pragma HLS UNROLL factor=num_chunks skip_exit_check
    #pragma HLS UNROLL skip_exit_check
    local_dot_product(local_a, local_b, j*CHUNK_SIZE,(CHUNK_SIZE*(j+1)),local_temp_result[j]);
/*
    for(int i=j*CHUNK_SIZE; i<(CHUNK_SIZE*(j+1)); ++i)
    {
      #pragma HLS PIPELINE II=2
      local_temp_result[j] = local_temp_result[j] + local_a[i]*local_b[i];
    }
   */
    local_result = local_result + local_temp_result[j]; // how to make this atomic? (or is it by default?)
  }
/*
  for(int j=0; j<num_chunks; ++j)
  {
    #pragma HLS PIPELINE II=2
    local_result = local_result + local_temp_result[j]; // how to make this atomic? (or is it by default?)
  }
*/
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
