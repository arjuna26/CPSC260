#----------------------------------------------------------------------
# NAME: Arjuna H
# DATE: 3/19/23
# FILE: p7.s
#----------------------------------------------------------------------

        .global _start
        .text
_start:
        
        movl    $34, %r8d       # move value 34 into r8d (x)
        movl    $27, %r9d       # move value 27 into r9d (y)
        movl    $19, %r10d      # move value 19 into r10d (z)
        movl    %r9d, %r11d     # move value from r9d into r11d (u)

        # calculate v's value
        movl    %r8d, %eax      # move value x from r8d into %eax to hold temporarily
        subl    %eax, %r10d     # subtract value stored in %eax by value stored in %r10d (z)
        movl    %eax, %r12d     # move temp value in %eax to %r12d as v

        # x = x - z + y - z
        movl    %r9d, %eax      # since v is already equal to x - z, we just have to calculate y - z
        subl    %eax, %r10d     # y - z
        addl    %eax, %r12d     # v = x - z, so add v to the value in %eax which is y - z
        movl    %eax, %r8d      # store x

        # y = y + x - z
        movl    %r9d, %eax      # move y into %eax to store temporarily
        addl    %r8d, %eax      # add value of x to %eax (y + x)
        subl    %r10d, %eax     # sub value of z from %eax (y + x - z)
        movl    %eax, %r9d      # move new calculated value of y back to %r9d
 
        # exit program
        movq    $60, %rax       # sys call 60 is exit
        xor     %rdi, %rdi      # return 0
        syscall