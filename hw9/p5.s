#----------------------------------------------------------------------
# NAME: Arjuna Herbst   
# DATE: 4/25/2023
# FILE: p5.s
#----------------------------------------------------------------------

# ======================================================================
.data
xs: .quad 10, 20, 30, 40, 50 # 5 element array of long ints
n: .quad 5

.text 

.global _start

_start: 
    
    mov     n, %rdi         # set up loop
    mov     $xs, %rsi       # store address of array in %rcx    
    call    populate
    push     %rdi
    push     %rsi
    push     %rdx
    push     %rcx
    push     %r8   
    xor     %rdi, %rdi
    
    call    sum 
    jmp     done            # exit

populate:


    cmp     $0, %rdi
    jg      test1


    pop     %rdi
    pop     %rsi
    pop     %rdx
    pop     %rcx
    pop     %r8
    ret
     
test1: 

    cmp     $0, %rdi        # 0 - n
    jg      body            # if n > 0
    jmp     populate

body:
    
    mov     (%rsi), %rbx    # move array value into %rsi
    add     $8, %rsi        # add 8 to %rcx
    push    %rbx            # push value from array stored in %rsi onto stack 
    sub     $1, %rdi        # n - 1
    jmp     test1           # jump back to while loop

sum:
    add     $8, %rsp
    cmp     $5, %rdi
    jl      begin_sum
    sub     $56, %rsp
    ret
begin_sum:
    
    cmp     $5, %rdi        # 5 - 0
    jl      add_together    # if n < 5
    jmp     sum

add_together:

    pop     %rdx            # pop value into %rdx
    add     %rdx, %rax      # add value to sum
    add     $1, %rdi        # n + 1
    jmp     begin_sum       # loop

done:

    # exit program
    movq    $60, %rax       # system call 60 is exit
    xorq    %rdi, %rdi      # we want return call 0
    syscall
    

