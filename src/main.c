#include <pybind11/pybind11.h>
namespace py = pybind11;

float* add(float* t1, float* t2) {
  // for (int i = 0; i < 5; i++) {
    // t1[i] += t2[i];
  // }
  return t1;
}

PYBIND11_MODULE(micro_kernel, m) {
  m.doc() = "pybind11 example plugin"; // optional module docstring
  m.def("add", &add, "A function that adds two arrays element-wise");
}
