#include <pybind11/pybind11.h>
#include <inttypes.h>

namespace py = pybind11;

void add (int64_t a_ptr, int64_t b_ptr, int64_t c_ptr, int N)
{
  /* Cast to Pointers*/
  int32_t* in_a = (int32_t *)a_ptr;
  int32_t* in_b = (int32_t *)b_ptr;
  int32_t* out_c = (int32_t *)c_ptr;

  /* Perform Operation */
  for (int i = 0; i < N; i++)
    out_c[i] += in_a[i] + in_b[i];
}

PYBIND11_MODULE(micro_kernel, m) {
  m.doc() = "Simple Add function"; 
  m.def("add", &add, "Simple Demo Add function");
}
