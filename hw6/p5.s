#----------------------------------------------------------------------
# NAME: 
# DATE:
# FILE: p2.s
#----------------------------------------------------------------------

        .global _start
        .text 

_start:

        # x2 = x1 * 4
        movl    x1, %ecx
        imull   $4, %ecx, %ecx
        

        # x3 = ( x2 * 32) + ( x1 / 8)
        movl    %ecx, %r10d
        imull   $32, %r10d, %r10d
        
        # divide
        movl    x1, %eax
        movl    $8, %r12d
        idivl   %r12d

        # () + ()
        addl    %r10d, %eax
        movl    %eax, %ebx

        # x1 = x3 / 16;
        # shr   $4, %r11d
        movl    $16, %r13d
        movl    %ebx, %eax
        idivl   %r13d
        movl    %eax, x1



        # exit program
        movq    $60, %rax         # sys call 60 is exit
        xor     %rdi, %rdi        # return 0
        syscall                   # execute system call

        .data 
    
x1: .int 1246
