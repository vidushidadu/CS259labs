#include "memcpy_512.h"
#include <string.h> 
#include <stdio.h> 
#include <stdlib.h> 
#include "merlin_type_define.h"
static void __merlin_dummy_extern_int_merlin_include_G_();
static void __merlin_dummy_extern_int_merlin_include_G_();
static void __merlin_dummy_extern_int_merlin_include_G_();
static void __merlin_dummy_extern_int_merlin_include_G_();
static void __merlin_dummy_431();
void vec_add_kernel(merlin_uint_512 *a,merlin_uint_512 *b,merlin_uint_512 *c,int inc);
static void __merlin_dummy_extern_int_merlin_include_L_();
#include "__merlinhead_kernel_top.h"
static void __merlin_dummy_extern_int_merlin_include_L_();

void __merlinwrapper_vec_add_kernel(int a[10000],int b[10000],int c[10000],int inc)
{
  __CMOST_COMMENT__ commands;
{
    
#pragma ACCEL wrapper variable=a port=a depth=10000 max_depth=10000 data_type=int io=RO copy=false
    
#pragma ACCEL wrapper variable=b port=b depth=10000 max_depth=10000 data_type=int io=RO copy=false
    
#pragma ACCEL wrapper variable=c port=c depth=10000 max_depth=10000 data_type=int io=WO copy=false
    
#pragma ACCEL wrapper variable=inc port=inc
  }
  static __CMOST_COMMENT__ __m_a;
  static __CMOST_COMMENT__ __m_b;
  static __CMOST_COMMENT__ __m_c;
{
/*
    static int __m_a[10000];
    static int __m_b[10000];
    static int __m_c[10000];
*/
{
      
#pragma ACCEL debug printf("[Merlin Info] Start %s data for %s, data size = %s...\n", "copy in", "a", "10000 * sizeof(int )");
      
#pragma ACCEL debug fflush(stdout);
      if (a != 0) {
        __CMOST_COMMENT__ __vec_add_kernel__a_buffer;
        opencl_write_buffer(__vec_add_kernel__a_buffer,commands[0],0 * sizeof(int ),(int *)a,((unsigned long )10000) * sizeof(int ));
      }
       else {
        printf("Error! Detected null pointer 'a' for external memory.\n");
        exit(1);
      }
      
#pragma ACCEL debug printf("[Merlin Info] Finish %s data for %s.\n", "copy in", "a");
      
#pragma ACCEL debug fflush(stdout);
    }
{
      
#pragma ACCEL debug printf("[Merlin Info] Start %s data for %s, data size = %s...\n", "copy in", "b", "10000 * sizeof(int )");
      
#pragma ACCEL debug fflush(stdout);
      if (b != 0) {
        __CMOST_COMMENT__ __vec_add_kernel__b_buffer;
        opencl_write_buffer(__vec_add_kernel__b_buffer,commands[0],0 * sizeof(int ),(int *)b,((unsigned long )10000) * sizeof(int ));
      }
       else {
        printf("Error! Detected null pointer 'b' for external memory.\n");
        exit(1);
      }
      
#pragma ACCEL debug printf("[Merlin Info] Finish %s data for %s.\n", "copy in", "b");
      
#pragma ACCEL debug fflush(stdout);
    }
  }
  
#pragma ACCEL kernel
{
	#pragma ACCEL debug printf("[Merlin Info] Start set kernel %s argument....\n", "vec_add_kernel");
	#pragma ACCEL debug fflush(stdout);
	opencl_set_kernel_arg(__vec_add_kernel_kernel, 0, sizeof(opencl_mem), &__vec_add_kernel__a_buffer);
	opencl_set_kernel_arg(__vec_add_kernel_kernel, 1, sizeof(opencl_mem), &__vec_add_kernel__b_buffer);
	opencl_set_kernel_arg(__vec_add_kernel_kernel, 2, sizeof(opencl_mem), &__vec_add_kernel__c_buffer);
	opencl_set_kernel_arg(__vec_add_kernel_kernel, 3, sizeof(int), &inc);
	#pragma ACCEL debug printf("[Merlin Info] Finish set kernel %s argument....\n", "vec_add_kernel");
	#pragma ACCEL debug fflush(stdout);
	#pragma ACCEL debug printf("[Merlin Info] Start execute kernel %s....\n", "vec_add_kernel");
	#pragma ACCEL debug fflush(stdout);
	size_t __gid[1];
	__gid[0] = 1;
	opencl_enqueue_kernel(__vec_add_kernel_kernel, commands[0], 1, __gid, &__event_vec_add_kernel);
}
{
	clWaitForEvents(1, &__event_vec_add_kernel);
	#pragma ACCEL debug printf("[Merlin Info] Finish execute kernel %s....\n", "vec_add_kernel");
	#pragma ACCEL debug fflush(stdout);
	#pragma ACCEL debug cl_ulong start, end;
	#pragma ACCEL debug clGetEventProfilingInfo(__event_vec_add_kernel, CL_PROFILING_COMMAND_START, sizeof(start), &start, NULL);
	#pragma ACCEL debug clGetEventProfilingInfo(__event_vec_add_kernel, CL_PROFILING_COMMAND_START, sizeof(start), &end, NULL);
	#pragma ACCEL debug printf("[Merlin Info] vec_add_kernel: Kernel execution time = %0.3fs\n", (end -start) * 1e-9);
	#pragma ACCEL debug fflush(stdout);
}
{
    
#pragma ACCEL debug printf("[Merlin Info] Start %s data for %s, data size = %s...\n", "copy out", "c", "10000 * sizeof(int )");
    
#pragma ACCEL debug fflush(stdout);
    if (c != 0) {
      __CMOST_COMMENT__ __vec_add_kernel__c_buffer;
      opencl_read_buffer(__vec_add_kernel__c_buffer,commands[0],0 * sizeof(int ),(int *)c,((unsigned long )10000) * sizeof(int ));
    }
     else {
      printf("Error! Detected null pointer 'c' for external memory.\n");
      exit(1);
    }
    
#pragma ACCEL debug printf("[Merlin Info] Finish %s data for %s.\n", "copy out", "c");
    
#pragma ACCEL debug fflush(stdout);
  }
}

void __merlin_vec_add_kernel(int a[10000],int b[10000],int c[10000],int inc)
{
  
#pragma ACCEL string __merlin_check_opencl();
  
#pragma ACCEL string __merlin_init_vec_add_kernel();
  __merlinwrapper_vec_add_kernel(a,b,c,inc);
  
#pragma ACCEL string __merlin_release_vec_add_kernel();
}

void __merlin_write_buffer_vec_add_kernel(int a[10000],int b[10000],int c[10000],int inc)
{
  static int __m_a[10000];
  static int __m_b[10000];
  static int __m_c[10000];
{
    
#pragma ACCEL debug printf("[Merlin Info] Start %s data for %s, data size = %s...\n", "copy in", "a", "10000 * sizeof(int )");
    
#pragma ACCEL debug fflush(stdout);
    if (a != 0) {
      __CMOST_COMMENT__ __vec_add_kernel__a_buffer;
      __CMOST_COMMENT__ __event___vec_add_kernel__a_buffer;
// __MERLIN_EVENT_WRITE__ __event___vec_add_kernel__a_buffer
      int __MERLIN_EVENT_WRITE____event___vec_add_kernel__a_buffer;
      opencl_write_buffer_nb(__vec_add_kernel__a_buffer,commands[0],0 * sizeof(int ),(int *)a,((unsigned long )10000) * sizeof(int ),&__event___vec_add_kernel__a_buffer);
    }
     else {
      printf("Error! Detected null pointer 'a' for external memory.\n");
      exit(1);
    }
    
#pragma ACCEL debug printf("[Merlin Info] Finish %s data for %s.\n", "copy in", "a");
    
#pragma ACCEL debug fflush(stdout);
  }
{
    
#pragma ACCEL debug printf("[Merlin Info] Start %s data for %s, data size = %s...\n", "copy in", "b", "10000 * sizeof(int )");
    
#pragma ACCEL debug fflush(stdout);
    if (b != 0) {
      __CMOST_COMMENT__ __vec_add_kernel__b_buffer;
      __CMOST_COMMENT__ __event___vec_add_kernel__b_buffer;
// __MERLIN_EVENT_WRITE__ __event___vec_add_kernel__b_buffer
      int __MERLIN_EVENT_WRITE____event___vec_add_kernel__b_buffer;
      opencl_write_buffer_nb(__vec_add_kernel__b_buffer,commands[0],0 * sizeof(int ),(int *)b,((unsigned long )10000) * sizeof(int ),&__event___vec_add_kernel__b_buffer);
    }
     else {
      printf("Error! Detected null pointer 'b' for external memory.\n");
      exit(1);
    }
    
#pragma ACCEL debug printf("[Merlin Info] Finish %s data for %s.\n", "copy in", "b");
    
#pragma ACCEL debug fflush(stdout);
  }
}

void __merlin_read_buffer_vec_add_kernel(int a[10000],int b[10000],int c[10000],int inc)
{
  static int __m_a[10000];
  static int __m_b[10000];
  static int __m_c[10000];
{
    
#pragma ACCEL debug printf("[Merlin Info] Start %s data for %s, data size = %s...\n", "copy out", "c", "10000 * sizeof(int )");
    
#pragma ACCEL debug fflush(stdout);
    if (c != 0) {
      __CMOST_COMMENT__ __vec_add_kernel__c_buffer;
      __CMOST_COMMENT__ __event___vec_add_kernel__c_buffer;
// __MERLIN_EVENT_READ__ __event___vec_add_kernel__c_buffer
      int __MERLIN_EVENT_READ____event___vec_add_kernel__c_buffer;
      opencl_read_buffer_nb(__vec_add_kernel__c_buffer,commands[0],0 * sizeof(int ),(int *)c,((unsigned long )10000) * sizeof(int ),&__event___vec_add_kernel__c_buffer);
    }
     else {
      printf("Error! Detected null pointer 'c' for external memory.\n");
      exit(1);
    }
    
#pragma ACCEL debug printf("[Merlin Info] Finish %s data for %s.\n", "copy out", "c");
    
#pragma ACCEL debug fflush(stdout);
  }
}

void __merlin_execute_vec_add_kernel(int a[10000],int b[10000],int c[10000],int inc)
{
  int i;
{
	#pragma ACCEL debug printf("[Merlin Info] Start set kernel %s argument....\n", "vec_add_kernel");
	#pragma ACCEL debug fflush(stdout);
	opencl_set_kernel_arg(__vec_add_kernel_kernel, 0, sizeof(opencl_mem), &__vec_add_kernel__a_buffer);
	opencl_set_kernel_arg(__vec_add_kernel_kernel, 1, sizeof(opencl_mem), &__vec_add_kernel__b_buffer);
	opencl_set_kernel_arg(__vec_add_kernel_kernel, 2, sizeof(opencl_mem), &__vec_add_kernel__c_buffer);
	opencl_set_kernel_arg(__vec_add_kernel_kernel, 3, sizeof(int), &inc);
	#pragma ACCEL debug printf("[Merlin Info] Finish set kernel %s argument....\n", "vec_add_kernel");
	#pragma ACCEL debug fflush(stdout);
	#pragma ACCEL debug printf("[Merlin Info] Start execute kernel %s....\n", "vec_add_kernel");
	#pragma ACCEL debug fflush(stdout);
	size_t __gid[1];
	__gid[0] = 1;
	opencl_enqueue_kernel(__vec_add_kernel_kernel, commands[0], 1, __gid, &__event_vec_add_kernel);
}
}
