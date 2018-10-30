#include "__merlin_opencl_kernel_buffer.h"
opencl_kernel __vec_add_kernel_kernel;
cl_event __event_vec_add_kernel;
opencl_mem __vec_add_kernel__a_buffer;
cl_event __event___vec_add_kernel__a_buffer;
opencl_mem __vec_add_kernel__b_buffer;
cl_event __event___vec_add_kernel__b_buffer;
opencl_mem __vec_add_kernel__c_buffer;
cl_event __event___vec_add_kernel__c_buffer;
int __merlin_init_vec_add_kernel(){
	#pragma ACCEL debug printf("[Merlin Info] Start create kernel for %s....\n", "vec_add_kernel");
	#pragma ACCEL debug fflush(stdout);
	opencl_create_kernel(&__vec_add_kernel_kernel, (char *)"vec_add_kernel");
	#pragma ACCEL debug printf("[Merlin Info] Successful create kernel for %s....\n", "vec_add_kernel");
	#pragma ACCEL debug fflush(stdout);
	#pragma ACCEL debug printf("[Merlin Info] Start create buffer for %s....\n", "a");
	#pragma ACCEL debug fflush(stdout);
	opencl_create_buffer(&__vec_add_kernel__a_buffer, 4*10000, 2);
	#pragma ACCEL debug printf("[Merlin Info] Successful create buffer for %s....\n", "a");
	#pragma ACCEL debug fflush(stdout);
	#pragma ACCEL debug printf("[Merlin Info] Start create buffer for %s....\n", "b");
	#pragma ACCEL debug fflush(stdout);
	opencl_create_buffer(&__vec_add_kernel__b_buffer, 4*10000, 2);
	#pragma ACCEL debug printf("[Merlin Info] Successful create buffer for %s....\n", "b");
	#pragma ACCEL debug fflush(stdout);
	#pragma ACCEL debug printf("[Merlin Info] Start create buffer for %s....\n", "c");
	#pragma ACCEL debug fflush(stdout);
	opencl_create_buffer(&__vec_add_kernel__c_buffer, 4*10000, 2);
	#pragma ACCEL debug printf("[Merlin Info] Successful create buffer for %s....\n", "c");
	#pragma ACCEL debug fflush(stdout);
	return 0;
}
int opencl_init_kernel_buffer() {
	__merlin_init_vec_add_kernel();
	return 0;
}
int __merlin_release_vec_add_kernel(){
	if(__vec_add_kernel_kernel) {
		opencl_release_kernel(__vec_add_kernel_kernel);
	}
#ifdef __MERLIN_SDACCEL
	if(__event_vec_add_kernel) {
		opencl_release_event(__event_vec_add_kernel);
	}
#endif
	if(__vec_add_kernel__a_buffer) {
		opencl_release_mem_object(__vec_add_kernel__a_buffer);
	}
	if(__vec_add_kernel__b_buffer) {
		opencl_release_mem_object(__vec_add_kernel__b_buffer);
	}
	if(__vec_add_kernel__c_buffer) {
		opencl_release_mem_object(__vec_add_kernel__c_buffer);
	}
	return 0;
}
int __merlin_release_kernel_buffer() {
	__merlin_release_vec_add_kernel();
	return 0;
}
int __merlin_wait_kernel_vec_add_kernel() {
	opencl_wait_event(__event_vec_add_kernel);
	#pragma ACCEL debug cl_ulong vec_add_kernel_start, vec_add_kernel_end;
	#pragma ACCEL debug clGetEventProfilingInfo(__event_vec_add_kernel, CL_PROFILING_COMMAND_START, sizeof(vec_add_kernel_start), &vec_add_kernel_start, NULL);
	#pragma ACCEL debug clGetEventProfilingInfo(__event_vec_add_kernel, CL_PROFILING_COMMAND_START, sizeof(vec_add_kernel_start), &vec_add_kernel_end, NULL);
	#pragma ACCEL debug printf("[Merlin Info] vec_add_kernel: Kernel execution time = %0.3fs\n", (vec_add_kernel_end -vec_add_kernel_start) * 1e-9);
	#pragma ACCEL debug fflush(stdout);
	return 0;
}
int __merlin_wait_write_vec_add_kernel(){
		opencl_wait_event(__event___vec_add_kernel__a_buffer);
		opencl_release_event(__event___vec_add_kernel__a_buffer);
		opencl_wait_event(__event___vec_add_kernel__b_buffer);
		opencl_release_event(__event___vec_add_kernel__b_buffer);
	return 0;
}
int __merlin_wait_read_vec_add_kernel(){
		opencl_wait_event(__event___vec_add_kernel__c_buffer);
		opencl_release_event(__event___vec_add_kernel__c_buffer);
	return 0;
}
