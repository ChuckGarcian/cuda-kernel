# Meta Symbols
CC := gcc
LINKER := $(CC)
DRIVER := driver.x

# Compiler Flags
LFLAGS := -L.
IFLAGS := -I.
OPT := -O1
CFLAGS := $(OPT) -Wall -std=c99 -Wno-missing-braces

# Directory Paths
BIN_DIR := bin
SRC_DIR := src
SRC_OBJS := main
OUTPUT := micro_kernel


default: run_test

PYBIND := $(shell python3-config --includes) -Iextern/pybind11/include
PYTHON_HEADER_DIR := -I$(shell python -c 'from distutils.sysconfig import get_python_inc; print(get_python_inc())')
CGIFLAG := $(PYBIND) $(PYTHON_HEADER_DIR)
SUFFIX := $(shell python3-config --extension-suffix)

build_extension:
	c++ -O3 -Wall -shared -fPIC $(CGIFLAG) $(SRC_DIR)/$(SRC_OBJS).c -o $(BIN_DIR)/$(OUTPUT)$(SUFFIX)

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
