.intel_syntax noprefix
.code32

.section .multiboot
.align 4
    .long 0x1BADB002
    .long 0x00000000
    .long -(0x1BADB002)

.section .text
.globl _start

_start:
    mov esp, offset stack_top
    call kernel_main
.hang:
    hlt
    jmp .hang

.section .bss
.align 16
stack_bottom:
    .space 16384
stack_top:
