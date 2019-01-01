#!/usr/bin/env bash

nasm -f elf hello_world_linux.asm
ld -m elf_i386 -s -o hello_world_linux hello_world_linux.o
./hello_world_linux


# support
# ld: i386 architecture of input file `hello_world_linux.o' is incompatible with i386:x86-64 output
# add the option `-m elf_i386` to ld