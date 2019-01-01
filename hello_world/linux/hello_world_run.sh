#!/usr/bin/env bash

# Create an object file 
nasm -f elf hello_world.asm

# Link
ld -m elf_i386 -s -o hello_world hello_world.o

# Run
./hello_world