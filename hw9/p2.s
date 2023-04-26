#----------------------------------------------------------------------
# NAME: Arjuna Herbst
# DATE: 4/25/2023
# FILE: p2.s
#----------------------------------------------------------------------

.data
xs: .quad 10, 20, 30, 40, 50 # 5 element array of long ints
n: .quad 5

.text 

.global _start

_start: 
    
    mov     n, %rbx         # set up loop
    mov     $xs, %rcx       # store address of array in %rcx    
test1:

    cmp     $0, %rbx        # 0 - n
    jg      body            # if n > 0
    jmp     begin_sum       # done pushing values onto stack

body:
    
    mov     (%rcx), %rsi    # move array value into %rsi
    add     $8, %rcx        # add 8 to %rcx
    push    %rsi            # push value from array stored in %rsi onto stack 
    sub     $1, %rbx        # n - 1
    jmp     test1           # jump back to while loop

begin_sum:

    cmp     $5, %rbx        # 5 - 0
    jl      sum             # if n < 5
    jmp     done            # exit loop

sum:

    pop     %rdx            # pop value into %rdx
    add     %rdx, %rax      # add value to sum
    add     $1, %rbx        # n + 1
    jmp     begin_sum       # loop

done:

    # exit program
    movq    $60, %rax       # system call 60 is exit
    xorq    %rdi, %rdi      # we want return call 0
    syscall
    


