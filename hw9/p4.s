#----------------------------------------------------------------------
# NAME: Arjuna Herbst
# DATE: 4/25/2023
# FILE: p4.s
#----------------------------------------------------------------------
    .data 

newline: .ascii "\n"
         .equ newline_len, (. - newline)
# ---------------------------------------------------------------------

.text

.global _start

_start:

    mov     $65, %rdi
    call    to_lower
    call    println_char    # println_char(to_lower('A'))

    mov     $50, %rdi 
    call    to_lower
    call    println_char    # println_char(to_lower('2'))

    mov     $99, %rdi 
    call    to_lower
    call    println_char    # println_char(to_lower('c'))

    mov     $88, %rdi 
    call    to_upper
    call    println_char    # println_char(to_upper('X'))

    mov     $121, %rdi 
    call    to_upper
    call    println_char    # println_char(to_upper('y'))
    
    mov     $124, %rdi 
    call    to_upper
    call    println_char    # println_char(to_upper('|'))

    jmp     done

println_char:

    push    %rax           # preserve char
    movq    $1, %rax       # system call number
    movq    $1, %rdi       # 1 is stdout fd
    movq    %rsp, %rsi     # char's address
    movq    $1, %rdx       # char value
    syscall
    pop     %r15

    movq    $1, %rax       # system call number
    movq    $1, %rdi       # 1 is stdout fd
    movq    $newline, %rsi # newline's address
    movq    $1, %rdx       # char value
    syscall
    
    ret

to_lower:

    cmp     $91, %rdi
    jl      lower
    jmp     return1

lower:

    cmp     $64, %rdi
    jl      return1
    add     $32, %rdi 
    mov     %rdi, %rax
    ret

return1:

    mov     %rdi, %rax
    ret

to_upper:

    cmp     $96, %rdi
    jg      upper
    jmp     return2

upper:

    cmp     $123, %rdi
    jge     return2
    sub     $32, %rdi 
    mov     %rdi, %rax
    ret 

return2:

    mov     %rdi, %rax 
    ret

done:

    # exit program
    movq    $60, %rax       # system call 60 is exit
    xorq    %rdi, %rdi      # we want return call 0
    syscall