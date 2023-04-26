#----------------------------------------------------------------------
# NAME: Arjuna Herbst   
# DATE: 4/1/2023
# FILE: p1.s
#----------------------------------------------------------------------

        .global _start
#------------------------------------------------------------
        .data
        xs: .long 10, 20, 30, 40, 50
#------------------------------------------------------------
        .text
_start:
        
        # first value
        movl    xs, %r8d

        # second value
        mov     $xs, %rax
        movq    $1, %rdx
        movl    (%rax, %rdx, 4), %r9d

        # third value
        movq    $2, %rdx
        movl    (%rax, %rdx, 4), %r9d
    
        # fourth value
        mov     $xs, %rax
        movq    $3, %rdx
        movl    (%rax, %rdx, 4), %r11d

        # fifth value
        mov     $xs, %rax
        movq    $4, %rdx
        movl    (%rax, %rdx, 4), %r12d

        # exit(0)
        movq $60, %rax
        xorq %rdi, %rdi
        syscall