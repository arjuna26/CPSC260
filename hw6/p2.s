#----------------------------------------------------------------------
# NAME: Arjuna Herbst
# DATE: 3/28/2023
# FILE: p2.s
#----------------------------------------------------------------------

        .global _start
        .text 

_start:

        # x2
        movl    x1, %eax          # move value of x1 into register %eax
        addl    %eax, %eax        # add value of x1 to x1 to create x2's value

        # x3 
        movl    %eax, %r10d       # temporarily store x2 in %r10d
        negl    %r10d             # negate the value of x2 
        movl    x1, %r11d        # move x1 into %r11d to add 4 to it 
        addl    four, %r11d      # x1 + 4
        subl    %r10d, %r11d      # -x2 - (x1 + 4)
        movl    %r10d, %ebx       # store x3 in %ebx

        # x2 updated
        movl    x4, %r12d  
        addl    two, %r12d
        movl    %r12d, %eax


        # exit program
        movq    $60, %rax         # sys call 60 is exit
        xor     %rdi, %rdi        # return 0
        syscall                   # execute system call

        .data 
    
x1: .int 78557
x4: .short 163
four: .int 4
two: .int 2