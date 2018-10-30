#ifdef __cplusplus
extern "C" {
#endif
extern int __merlin_init(const char * bitstream);
extern int __merlin_release();
extern int __merlin_init_vec_add_kernel();
extern int __merlin_release_vec_add_kernel();
extern int __merlin_wait_kernel_vec_add_kernel();
extern int __merlin_wait_write_vec_add_kernel();
extern int __merlin_wait_read_vec_add_kernel();
extern void __merlinwrapper_vec_add_kernel(int a[10000],int b[10000],int c[10000],int inc);
extern void __merlin_write_buffer_vec_add_kernel(int a[10000],int b[10000],int c[10000],int inc);
extern void __merlin_read_buffer_vec_add_kernel(int a[10000],int b[10000],int c[10000],int inc);
extern void __merlin_execute_vec_add_kernel(int a[10000],int b[10000],int c[10000],int inc);
extern void __merlin_vec_add_kernel(int a[10000],int b[10000],int c[10000],int inc);
#ifdef __cplusplus
}
#endif
