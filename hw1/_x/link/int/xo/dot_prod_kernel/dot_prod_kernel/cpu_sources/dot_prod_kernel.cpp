#include <assert.h>
#include <cstring>
#include <ap_int.h>
// #include <ap_fixed.h>

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
  // int CHUNK_SIZE=1024;
  // int num_chunks = 4;

  int CHUNK_SIZE=256;
  int num_chunks = 16;

  // TODO: just to debug--fix later
  float local_a[4096];
  #pragma HLS ARRAY_PARTITION variable=local_a cyclic factor=num_chunks dim=1
  // #pragma HLS ARRAY_PARTITION variable=local_a block factor=num_chunks dim=1
 
  float local_b[4096];
  #pragma HLS ARRAY_PARTITION variable=local_b cyclic factor=num_chunks dim=1
  // #pragma HLS ARRAY_PARTITION variable=local_b block factor=num_chunks dim=1
  ap_uint<512> local_ba[256];
  // ap_ufixed<512> local_ba[256];
  #pragma HLS ARRAY_PARTITION variable=local_ba cyclic factor=CHUNK_SIZE dim=1

  for(int i=0; i<num_chunks; i++){
    #pragma HLS UNROLL
    memcpy(&local_ba[i*CHUNK_SIZE/16], &a[i*CHUNK_SIZE], CHUNK_SIZE*4);
    // memcpy(&local_a[i*CHUNK_SIZE], &local_ba[i*CHUNK_SIZE/16], CHUNK_SIZE*4);
  }

  ap_uint<512> local_bb[256];
  #pragma HLS ARRAY_PARTITION variable=local_ba cyclic factor=CHUNK_SIZE dim=1

  for(int i=0; i<num_chunks; i++){
    #pragma HLS UNROLL
    memcpy(&local_bb[i*CHUNK_SIZE/16], &b[i*CHUNK_SIZE], CHUNK_SIZE*4);
    // memcpy(&local_b[i*CHUNK_SIZE], &local_bb[i*CHUNK_SIZE/16], CHUNK_SIZE*4);
  }
/*
 for(int i=0; i<num_chunks; i++){
    memcpy(&local_a[i*CHUNK_SIZE], &local_ba[i*CHUNK_SIZE/16], CHUNK_SIZE*4);
  }

  for(int i=0; i<num_chunks; i++){
    memcpy(&local_b[i*CHUNK_SIZE], &local_bb[i*CHUNK_SIZE/16], CHUNK_SIZE*4);
  }
*/

/*
  // data transfer in scratchpad
  for(int i=0; i<num_elems; ++i){
    #pragma HLS UNROLL
    local_a[i]=a[i];
  }

  for(int i=0; i<num_elems; ++i){
    #pragma HLS UNROLL
    local_b[i]=b[i];
  }
*/

  for(int i=0; i<256; i++){
    for(int j=0; j<16; ++j){
      local_a[i*16+j]=local_ba[i].range(j*32,32*(j+1));
    }
  }

  for(int i=0; i<256; i+=16){
    for(int j=0; j<16; ++j){
      local_b[i*16+j]=local_bb[i].range(j*32,32*(j+1));
    }
  }

 
  float local_result=0;

  float local_temp_result[num_chunks];
  #pragma HLS ARRAY_PARTITION variable=local_temp_result cyclic factor=num_chunks dim=1

  for(int j=0; j<num_chunks; j++)
  {
    local_temp_result[j]=0;
  }

  int stride=0;
  for(int i=0; i<CHUNK_SIZE; ++i){
    #pragma HLS PIPELINE
    stride = i*num_chunks; // this dependency doesn't effect
    for(int j=0; j<num_chunks; ++j){
      #pragma HLS UNROLL factor=num_chunks
      local_temp_result[j] = local_temp_result[j] + local_a[stride+j]*local_b[stride+j];
      // local_temp_result[j] = local_temp_result[j] + local_a[i*num_chunks+j]*local_b[i*num_chunks+j];
    }
  }
  for(int j=0; j<num_chunks; ++j)
  {
    #pragma HLS PIPELINE II=2
    local_result = local_result + local_temp_result[j];
  }
  c[0] = local_result;

}

}  // extern "C"
