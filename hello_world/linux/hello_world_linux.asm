; adapted from https://en.wikibooks.org/wiki/X86_Assembly/NASM_Syntax#Hello_World_(Linux)
global _start  ; define the entry point for the linker (ld)

section .data ; or segment .data
    ; Align to the nearest 2 byte boundary, must be a power of two
    align 2
    ; String, to be printed, 0xA is newline
    str     db 'Hello Nico!', 0xa
    strLen  equ $-str



;       op      dst,  src
section .text ; or segment .txt
    _start:
        ;
        ; Call write(2) syscall:
        ;       ssize_t write(int fd, const void *buf, size_t count)
        ;
        mov     eax, 4          ; Syscall number : 4 = write syscall
        mov     ebx, 1          ; Arg one        : file descriptor, 1 = stdout
        mov     ecx, str        ; Arg two        : the address of the string
        mov     edx, strLen        ; Arg three      : the length of the string
        int     0x80            ; Call the linux kernel via the Interrupt 0x80

        ;
        ; Call exit(3) syscall
        ;       void exit(int status)
        ;
        mov     eax, 1          ; Syscall number : 1 = exit
        mov     ebx, 0          ; Arg one        : the exit status number
        int     0x80            ; Call the linux kernel via the Interrupt 0x80
