# Use Clang to compile the common files.
CC = clang

# Directories.
BUILD_DIR := build
SRC_DIR := src
MODULES_DIR := modules

COMMON_DIR := $(MODULES_DIR)/common

# Common source and build directories.
COMMON_BUILD_DIR := $(COMMON_DIR)/build
COMMON_SRC_DIR := $(COMMON_DIR)/src

# Common objects.
COMMON_OBJS := $(COMMON_BUILD_DIR)/utils.o $(COMMON_BUILD_DIR)/cmd_line.o $(COMMON_BUILD_DIR)/config.o

# Source and out files.
SEQ_SRC := sequence.c
SEQ_OUT := sequence.o

MAIN_SRC := main.c
MAIN_OUT := pcktbatch

# Global and main flags.
GLOBAL_FLAGS := -O2
MAIN_FLAGS := -pthread -lyaml

# Chains.
all: mk_build sequence main

# Creates the build directory if it doesn't already exist.
mk_build:
	mkdir -p $(BUILD_DIR)

# The sequence file.
sequence: mk_build
	$(CC) -I $(COMMON_SRC_DIR) $(GLOBAL_FLAGS) -c -o $(BUILD_DIR)/$(SEQ_OUT) $(SRC_DIR)/$(SEQ_SRC)

# The main program.
main: mk_build sequence $(COMMON_OBJS)
	$(CC) -I $(COMMON_SRC_DIR) $(GLOBAL_FLAGS) $(MAIN_FLAGS) -o $(BUILD_DIR)/$(MAIN_OUT) $(COMMON_OBJS) $(BUILD_DIR)/$(SEQ_OUT) $(SRC_DIR)/$(MAIN_SRC)

# Cleanup (remove build files).
clean:
	$(MAKE) -C $(COMMON_DIR)/ clean
	rm -f $(BUILD_DIR)/*.o
	rm -f $(BUILD_DIR)/$(MAIN_OUT)

# Install executable to $PATH.
install:
	cp $(BUILD_DIR)/$(MAIN_OUT) /usr/bin/$(MAIN_OUT)

.PHONY:

.DEFAULT: all