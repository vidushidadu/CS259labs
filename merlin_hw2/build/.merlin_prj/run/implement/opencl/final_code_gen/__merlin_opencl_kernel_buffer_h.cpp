#include "__merlin_opencl_if.h"
int opencl_init_kernel_buffer();
int __merlin_release_kernel_buffer();
extern opencl_kernel __vec_add_kernel_kernel;
extern cl_event __event_vec_add_kernel;
#ifdef __cplusplus
extern "C" {
#endif
int __merlin_init_vec_add_kernel();
int __merlin_release_vec_add_kernel();
int __merlin_wait_kernel_vec_add_kernel();
int __merlin_wait_write_vec_add_kernel();
int __merlin_wait_read_vec_add_kernel();
#ifdef __cplusplus
}
#endif
extern opencl_mem __vec_add_kernel__a_buffer;
extern cl_event __event___vec_add_kernel__a_buffer;
extern opencl_mem __vec_add_kernel__b_buffer;
extern cl_event __event___vec_add_kernel__b_buffer;
extern opencl_mem __vec_add_kernel__c_buffer;
extern cl_event __event___vec_add_kernel__c_buffer;
