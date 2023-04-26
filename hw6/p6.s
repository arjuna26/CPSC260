#----------------------------------------------------------------------
# NAME: 
# DATE:
# FILE: p6.s
#----------------------------------------------------------------------

        .global _start
        .text
_start:
        
        movb    mystr, %al
        subb    $32, %al        # make "b" uppercase
        movb    %al, mystr
        
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
