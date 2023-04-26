#----------------------------------------------------------------------
# NAME: 
# DATE:
# FILE: p8.s
#----------------------------------------------------------------------

        .global _start
        .text
_start:

        # swap b and l
        movb    mystr, %al      # move b to al
        
        movq    $mystr, %rbx
        addq    $1, %rbx
        movb    (%rbx), %cl     # move l to bl
        movb    %cl, mystr      # move l to b's pointer
        subq    $1, (%rbx)      # change pointer back to first position
        movb    %al, (%rbx)

        # swap e and u
        movq    $mystr, %rbx
        addq    $2, %rbx
        movb    (%rbx), %cl     # move u to cl
        movq    $mystr, %rsi
        addq    $3, %rsi        
        movb    (%rsi), %dl     # move e to dl
        movb    %dl, (%rbx)
        movb    %cl, (%rsi)

        # swap " " and g
        movq    $mystr, %rbx
        addq    $4, %rbx
        movb    (%rbx), %cl     # move " " to cl
        movq    $mystr, %rsi
        addq    $5, %rsi        
        movb    (%rsi), %dl     # move g to dl
        movb    %dl, (%rbx)
        movb    %cl, (%rsi)

        # swap r and e
        movq    $mystr, %rbx
        addq    $6, %rbx
        movb    (%rbx), %cl     # move r to cl
        movq    $mystr, %rsi
        addq    $7, %rsi        
        movb    (%rsi), %dl     # move e to dl
        movb    %dl, (%rbx)
        movb    %cl, (%rsi)

        # swap e and n
        movq    $mystr, %rbx
        addq    $8, %rbx
        movb    (%rbx), %cl     # move e to cl
        movq    $mystr, %rsi
        addq    $9, %rsi        
        movb    (%rsi), %dl     # move n to dl
        movb    %dl, (%rbx)
        movb    %cl, (%rsi)
 
        # write(1, mystr, strlen)
        movq    $1, %rax        # system call 1 is write
        movq    $1, %rdi        # file handle 1 is stdout
        movq    $mystr, %rsi    # address of string to output
        movq    $mylen, %rdx    # number of bytes
        syscall

        # exit(0)
        movq $60, %rax          # system call 60 is exit
        xorq %rdi, %rdi         # we want return call 0
        syscall

        .data
mystr:  .ascii "blue green\n" # or .string to add \0
        .equ mylen, (. - mystr)