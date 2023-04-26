#----------------------------------------------------------------------
# NAME: Arjuna Herbst
# DATE: 4/1/2023
# FILE: p3.s
#----------------------------------------------------------------------

        .global _start

        .data  
prompt:     .ascii "Enter a character: "
            .equ prompt_len, (. - prompt)

prompt2:    .ascii "You entered: "
            .equ prompt2_len, (. -prompt2)

        .bss
            .lcomm answer, 2        # 2 byte allocated

        .text

_start:    

        # print "Enter a character: "
        movq    $1, %rax            # system call number
        movq    $1, %rdi            # 1 is stdout fd
        movq    $prompt, %rsi       # prompt string's address
        movq    $prompt_len, %rdx   # prompt_len value
        syscall

        # take in user character
        movq    $0, %rax            # system call number
        movq    $0, %rdi            # 0 is stdin fd
        movq    $answer, %rsi       # address to put char read (bss)
        movq    $2, %rdx            # read two bytes
        syscall

        # print "You entered: "
        movq    $1, %rax            # system call number
        movq    $1, %rdi            # 1 is stdout fd
        movq    $prompt2, %rsi      # prompt2 string's address
        movq    $prompt2_len, %rdx  # prompt2_len value
        syscall

        # print out user character
        movq    $1, %rax            # system call number
        movq    $1, %rdi            # 1 is stdout fd
        movq    $answer, %rsi       # answer's string's address
        movq    $2, %rdx            # answer's value
        syscall



        # exit program
        movq $60, %rax
        xorq %rdi, %rdi
        syscall
