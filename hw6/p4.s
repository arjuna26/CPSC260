#----------------------------------------------------------------------
# NAME: 
# DATE:
# FILE: p4.s
#----------------------------------------------------------------------

        .global _start
        .text 

_start:

        # x2 = x1 * 4
        movl    x1, %eax
        shl     $2, %eax

        # x3 = ( x2 * 32) + ( x1 / 8)
        movl    %eax, %r10d
        shl     $5, %r10d
        movl    x1, %r11d
        shr     $3, %r11d
        addl    %r10d, %r11d
        movl    %r11d, %ebx

        # x1 = x3 / 16;
        shr     $4, %r11d
        movl    %r11d, x1



        # exit program
        movq    $60, %rax         # sys call 60 is exit
        xor     %rdi, %rdi        # return 0
        syscall                   # execute system call

        .data 
    
x1: .int 1246
