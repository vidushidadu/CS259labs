#include "memcpy_512_1d.h"
#define SIZE_1 16
#include "memcpy_512_2d.h"
#undef SIZE_1
#include <string.h> 
#include "cmost.h"
#include "merlin_type_define.h"
static void __merlin_dummy_extern_int_merlin_include_G_();
static void __merlin_dummy_extern_int_merlin_include_G_();
static void __merlin_dummy_extern_int_merlin_include_G_();
static void __merlin_dummy_extern_int_merlin_include_G_();
static void __merlin_dummy_kernel_pragma();
// Original: #pragma ACCEL kernel
static int vec_add_kernel_dummy_pos;
extern "C" { 

__kernel void vec_add_kernel(merlin_uint_512 *a,merlin_uint_512 *b,merlin_uint_512 *c,int inc)
{
  
#pragma HLS INTERFACE m_axi port=a offset=slave depth=625
  
#pragma HLS INTERFACE m_axi port=b offset=slave depth=625
  
#pragma HLS INTERFACE m_axi port=c offset=slave depth=625
  
#pragma HLS INTERFACE s_axilite port=a bundle=control
  
#pragma HLS INTERFACE s_axilite port=b bundle=control
  
#pragma HLS INTERFACE s_axilite port=c bundle=control
  
#pragma HLS INTERFACE s_axilite port=inc bundle=control
  
#pragma HLS INTERFACE s_axilite port=return bundle=control
  
#pragma HLS DATA_PACK VARIABLE=c
  
#pragma HLS DATA_PACK VARIABLE=b
  
#pragma HLS DATA_PACK VARIABLE=a
  int b_buf_0[625][16];
// Existing HLS partition: #pragma HLS array_partition variable=b_buf_0 cyclic factor = 16 dim=2
  
#pragma HLS array_partition variable=b_buf_0 complete dim=2
  memcpy_wide_bus_read_int_2d_16_512(b_buf_0,0,0,(merlin_uint_512 *)b,(0 * 4),sizeof(int ) * ((unsigned long )10000),10000LL);
  int a_buf_0[625][16];
// Existing HLS partition: #pragma HLS array_partition variable=a_buf_0 cyclic factor = 16 dim=2
  
#pragma HLS array_partition variable=a_buf_0 complete dim=2
  memcpy_wide_bus_read_int_2d_16_512(a_buf_0,0,0,(merlin_uint_512 *)a,(0 * 4),sizeof(int ) * ((unsigned long )10000),10000LL);
  int c_buf_0[625][16];
  
#pragma HLS array_partition variable=c_buf_0 complete dim=2
  int j_sub;
  
#pragma ACCEL interface variable=c max_depth=10000 depth=10000
  
#pragma ACCEL interface variable=b max_depth=10000 depth=10000
  
#pragma ACCEL interface variable=a max_depth=10000 depth=10000
  int j;
// Original pramga:  ACCEL PARALLEL FACTOR=16 
  for (j = 0; j < 625; j++) 
// Original: #pragma ACCEL parallel factor=16
// Original: #pragma ACCEL PARALLEL FACTOR=16
// Original: #pragma ACCEL PIPELINE AUTO
{
    
#pragma HLS pipeline
    for (j_sub = 0; j_sub < 16; ++j_sub) 
// Original: #pragma ACCEL parallel factor=16
// Original: #pragma ACCEL PARALLEL FACTOR=16
// Original: #pragma ACCEL PARALLEL
{
      
#pragma HLS unroll
      c_buf_0[j][j_sub] = a_buf_0[j][j_sub] + b_buf_0[j][j_sub] + inc;
    }
  }
// Existing HLS partition: #pragma HLS array_partition variable=c_buf_0 cyclic factor = 16 dim=2
  memcpy_wide_bus_write_int_2d_16_512((merlin_uint_512 *)c,c_buf_0,0,0,(4 * 0),sizeof(int ) * ((unsigned long )10000),10000LL);
}
}
