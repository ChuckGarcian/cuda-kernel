# Meta Symbols
CC := c++
LINKER := $(CC)
DRIVER := driver.x

# Include Header Files
PYTHON_INCLUDE := $(shell python3-config --includes) 
PYBIND := extern/pybind11/include
PYTHON_HEADER_DIR := $(shell python -c 'from distutils.sysconfig import get_python_inc; print(get_python_inc())')
PYTORCH_HEADER := $(shell python -c 'from torch.utils.cpp_extension import include_paths; [print(p) for p in include_paths()]')
INCLUDES += $(PYBIND) 
INCLUDES += $(PYTHON_HEADER_DIR)
INCLUDES += $(PYTORCH_HEADER)
IFLAGS := $(PYTHON_INCLUDE) $(foreach includedir,$(INCLUDES),-I$(includedir))

# Compiler Flags
OPT := -O1
CFLAGS := $(OPT) -O3 -Wall -shared -fPIC

# Directory Paths
BIN_DIR := bin
SRC_DIR := src
SRC_OBJS := main
SUFFIX := $(shell python3-config --extension-suffix)
OUTPUT := micro_kernel

default: run_test

build_extension:
	$(CC) $(CFLAGS) $(IFLAGS) $(SRC_DIR)/$(SRC_OBJS).c -o $(BIN_DIR)/$(OUTPUT)$(SUFFIX)

run_test: build_extension
	python3 test.py

# run: clean driver
# 	./$(BIN_DIR)/$(DRIVER)

# driver: $(SRC_OBJS) 
# 	$(LINKER) $(BIN_DIR)/$(SRC_OBJS) $(LFLAGS) -o $(BIN_DIR)/$(DRIVER) 

# %.o: $(SRC_DIR)/%.c
# 	$(CC) $(IFLAGS) $(CFLAGS) -c $< -o $(BIN_DIR)/$@

.PHONY: clean

clean:
	rm -r $(BIN_DIR)/*
