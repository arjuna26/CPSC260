#----------------------------------------------------------------------
# NAME: Arjuna Herbst   
# DATE: 4/1/2023
# FILE: p2.s
#----------------------------------------------------------------------

        .global _start
        
        .data
        xs: .long 10, 20, 30, 40, 50
        n: .long 5

        .text
        
_start:

        movl $0, %eax      # initialize the sum to zero
        movl $0, %ebx      # initialize the index to zero

loop:
        cmpl n, %ebx       # compare the index with n
        jge end_loop       # jump to end_loop if index >= n

        addl xs(,%ebx,4), %eax   # add xs[index] to sum
        incl %ebx                # increment index
        jmp loop                 # jump back to loop

end_loop:
        movq $60, %rax
        xorq %rdi, %rdi
        syscall