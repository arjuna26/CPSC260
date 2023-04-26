#----------------------------------------------------------------------
# NAME: Arjuna Herbst
# DATE: 4/25/2023
# FILE: p3.s
#----------------------------------------------------------------------

.text

.global _start

_start:

    mov     $1, %edi 
    mov     $2, %esi
    mov     $4, %edx        # parameters to pass into function
    call    min_3           # int min3(1, 2, 4)
    mov     $6, %edi 
    mov     $4, %esi
    mov     $5, %edx
    call    min_3
    mov     $8, %edi 
    mov     $9, %esi
    mov     $7, %edx
    call    min_3
    
    jmp     done


min_3:

    mov     %esi, %ebx      # move y into %ebx
    cmp     %edi, %esi      # compare x and y
    cmovg   %edi, %ebx      # if x < y, move x into %ebx
    
    mov     %edx, %ecx      # move z into %ecx
    cmp     %edi, %edx      # compare x and z
    cmovg   %edi, %ecx      # if x < z, move x into %ecx
    
    mov     %edx, %r10d     # move z into %r10d
    cmp     %esi, %edx      # compare y and z
    cmovg   %esi, %r10d     # if y < z, move y into %ecx

    mov     %r10d, %eax     # move value in %r10d into %eax
    cmp     %ebx, %eax      
    cmovg   %ebx, %eax
    cmp     %ecx, %eax  
    cmovg   %ecx, %eax

    ret 
    

done: 
    # exit program
    movq    $60, %rax       # system call 60 is exit
    xorq    %rdi, %rdi      # we want return call 0
    syscall
    