#----------------------------------------------------------------------
# NAME: Arjuna Herbst
# DATE: 4/20
# FILE: p7.s
#----------------------------------------------------------------------

        .global _start
        .text
_start:
        
        movb    mystr, %al
        subb    $32, %al        # make "b" uppercase
        movb    %al, mystr

        # make l uppercase
        movq    $mystr, %rax    # treats mystr as address literal
        addq    $1, %rax        # add one to address
        movb    (%rax), %bl     # treats %rax as pointer (deref)
        subb    $32, %bl        # make "l" uppercase
        movb    %bl, (%rax)     # store result (again as pointer)

        # make u uppercase
        movq    $mystr, %rax    # treats mystr as address literal
        addq    $2, %rax        # add one to address
        movb    (%rax), %bl     # treats %rax as pointer (deref)
        subb    $32, %bl        # make "u" uppercase
        movb    %bl, (%rax)     # store result (again as pointer)

        # make e uppercase
        movq    $mystr, %rax    # treats mystr as address literal
        addq    $3, %rax        # add one to address
        movb    (%rax), %bl     # treats %rax as pointer (deref)
        subb    $32, %bl        # make "l" uppercase
        movb    %bl, (%rax)     # store result (again as pointer)
        
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
