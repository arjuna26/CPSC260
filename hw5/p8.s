#----------------------------------------------------------------------
# NAME: Arjuna H
# DATE: 3/19/23
# FILE: p8.s
#----------------------------------------------------------------------

    .global _start
    .text 


_start: 

    # a different system call
    movq    $1, %rax        # system call number 1
    movq    $1, %rdi        # first arg of call
    movq    $str, %rsi      # second arg of call
    movq    $3, %rdx        # third arg of call 
    syscall
    
    # exit program
    movq    $60, %rax       # sys call 60 is exit
    xor     %rdi, %rdi      # return 0
    syscall                 # execute system call

str: .ascii "Hi\n"
