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
  
  float local_a[num_elems];
  #pragma HLS ARRAY_PARTITION variable=local_a block factor=CHUNK_SIZE dim=1
  // #pragma HLS ARRAY_PARTITION variable=local_a block factor=M/2 dim=1 // (2 elements everywhere)
  
  float local_b[num_elems];
  #pragma HLS ARRAY_PARTITION variable=local_b block factor=CHUNK_SIZE dim=1

  // data transfer in scratchpad
  for(int i=0; i<num_elems; ++i){
    local_a[i]=a[i];
  }

  for(int i=0; i<num_elems; ++i){
    local_b[i]=b[i];
  }

  float local_result=0;

  int num_chunks = (int)num_elems/CHUNK_SIZE;
  float local_temp_result[num_chunks];
  #pragma HLS ARRAY_PARTITION variable=local_temp_result complete dim=1

  // #HLS INLINE OFF // not sure why is this required
  for(int j=0; j<num_chunks; ++j)
  {
    #pragma HLS UNROLL factor=num_chunks
    for(int i=j; i<(j+CHUNK_SIZE); ++i)
    {
      #pragma HLS PIPELINE II=2
      local_temp_result[j] = local_temp_result[j] + a[i]*b[i];
    }
    local_result += local_temp_result[j]; // how to make this atomic? (or is it by default?)
  }

  // result = local_result;
  c[0] = local_result;
  // check_correctness(a[M], b[M], result);
  // printf("The result is: %f\n",c[0]);
}

}  // extern "C"
