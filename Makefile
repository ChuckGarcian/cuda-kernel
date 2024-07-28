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
SRC_OBJS := main.o 

default: cg

cg:
	python3 setup.py install --force

run: clean driver
	./$(BIN_DIR)/$(DRIVER)

driver: $(SRC_OBJS) 
	$(LINKER) $(BIN_DIR)/$(SRC_OBJS) $(LFLAGS) -o $(BIN_DIR)/$(DRIVER) 

%.o: $(SRC_DIR)/%.c
	$(CC) $(IFLAGS) $(CFLAGS) -c $< -o $(BIN_DIR)/$@

.PHONY: clean

clean:
	rm -r $(BIN_DIR)/*
