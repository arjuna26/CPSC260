#----------------------------------------------------------------------
# NAME: 
# DATE:
# FILE: p3.s
#----------------------------------------------------------------------

#----------------------------------------------------------------------
# NAME: 
# DATE:
# FILE: p2.s
#----------------------------------------------------------------------

        .global _start
        .text 

_start:

        # x2 
        movl    x1, %eax
        incl    %eax
        
        # x3 = ++ x1 + ++ x2
        movl    x1, %ebx
        incl     %ebx
        movl    %eax, %r10d
        incl     %r10d
        addl    %r10d, %ebx

        # x1 = -- x3 ;
        movl    %ebx, %r11d
        decl    %r11d
        movl    %r11d, x1

        # exit program
        movq    $60, %rax         # sys call 60 is exit
        xor     %rdi, %rdi        # return 0
        syscall                   # execute system call

        .data 
    
x1: .int 78557
