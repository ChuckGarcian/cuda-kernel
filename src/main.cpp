#include <pybind11/pybind11.h>
#include <torch/extension.h>
// #include <ATen/cuda/CUDAContext.h>

namespace py = pybind11;

void kernel (float* in_a, float* in_b, float* out_c, int N)
{
  printf ("Kernel Called \n");
}

void add (float *in_a, float *in_b, float *out_c, int N)
{
  // int N = in_a.numel ();
  for (int i = 0; i < N; i++)
    out_c[i] = in_a[i] + out_c[i];
    
  printf ("Size of tensor: %d \n", N);
  // printf ("Hello World!, Tensor a size: %d \n", N);
}

PYBIND11_MODULE(micro_kernel, m) {
  m.doc() = "pybind11 example plugin"; // optional module docstring
  m.def("add", &add, "A function that adds two arrays element-wise");
}
