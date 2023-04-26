#----------------------------------------------------------------------
# NAME: 
# DATE:
# FILE: p5.s
#----------------------------------------------------------------------

.global _start

        .data  
prompt:     .ascii "Guess a digit between 0 and 9: "
            .equ prompt_len, (. - prompt)

prompt2:    .ascii "You guessed it!\n"
            .equ prompt2_len, (. - prompt2)

prompt3:    .ascii "Try again with a digit\n"
            .equ prompt3_len, (. - prompt3)   

prompt4:    .ascii "Better luck next time\n"
            .equ prompt4_len, (. - prompt4)

        .bss
            .lcomm answer, 2        # 1 byte allocated

        .text

_start:    

        

        # print "Guess a digit between 0 and 9: "
        movq    $1, %rax            # system call number
        movq    $1, %rdi            # 1 is stdout fd
        movq    $prompt, %rsi       # prompt string's address
        movq    $prompt_len, %rdx   # prompt_len value
        syscall

        # take in user guess
        movq    $0, %rax            # system call number
        movq    $0, %rdi            # 0 is stdin fd
        movq    $answer, %rsi       # address to put char read (bss)
        movq    $1, %rdx            # read one bytes
        syscall

        # loop
        movq    answer, %rbx
        cmp     $58, %rbx
        jge     character
        cmp     $52, %rbx
        je      correct
        cmp     $58, %rbx
        jl digit


character:

        # print "Try again with a digit."
        movq    $1, %rax             # system call number
        movq    $1, %rdi             # 1 is stdout fd
        movq    $prompt3, %rsi       # prompt string's address
        movq    $prompt3_len, %rdx   # prompt_len value
        syscall

        jmp     _start

correct:

        # print "You guessed it!"
        movq    $1, %rax             # system call number
        movq    $1, %rdi             # 1 is stdout fd
        movq    $prompt2, %rsi       # prompt string's address
        movq    $prompt2_len, %rdx   # prompt_len value
        syscall

        jmp     exit

digit:        
        
        # print out "Better luck next time"
        movq    $1, %rax             # system call number
        movq    $1, %rdi             # 1 is stdout fd
        movq    $prompt4, %rsi       # prompt string's address
        movq    $prompt4_len, %rdx   # prompt_len value
        syscall
        
        jmp     _start



exit:  

        # exit program
        movq $60, %rax
        xorq %rdi, %rdi
        syscall

        

        
