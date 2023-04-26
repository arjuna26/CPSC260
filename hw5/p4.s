#----------------------------------------------------------------------
# NAME: Arjuna H
# DATE: 3/19/23
# FILE: p4.s
#----------------------------------------------------------------------

        .global _start
        .text
_start:
        movb    $0x01, %ah        # put value into low ax byte
        movw    $65535, %ax       # put value into ax
        # exit program
        movq    $60, %rax         # sys call 60 is exit
        xor     %rdi, %rdi        # return 0
        syscall                   # execute system call