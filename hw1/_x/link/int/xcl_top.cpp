#include "libspir_types.h"
#define EXPORT_PIPE_SYMBOLS 1
#include "cpu_pipes.h"
#undef EXPORT_PIPE_SYMBOLS
#include "xcl_half.h"
#include <cstddef>
#include <vector>
#include <pthread.h>

extern "C" {

void dot_prod_kernel(size_t a, size_t b, size_t c, int num_elems);

static pthread_mutex_t __xlnx_cl_dot_prod_kernel_mutex = PTHREAD_MUTEX_INITIALIZER;
void __stub____xlnx_cl_dot_prod_kernel(char **argv) {
  void **args = (void **)argv;
  size_t a = *((size_t*)args[0+1]);
  size_t b = *((size_t*)args[1+1]);
  size_t c = *((size_t*)args[2+1]);
  int num_elems = *((int*)args[3+1]);
  pthread_mutex_lock(&__xlnx_cl_dot_prod_kernel_mutex);
  dot_prod_kernel(a, b, c, num_elems);
  pthread_mutex_unlock(&__xlnx_cl_dot_prod_kernel_mutex);
}
}
