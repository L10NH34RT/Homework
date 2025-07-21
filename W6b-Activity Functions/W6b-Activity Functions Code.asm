section .data
    odd_msg db 'odd', 10
    even_msg db 'even', 10

section .text
    global _start

_start:
    mov eax, 42         
    call check_odd_even
    
    mov eax, 1
    mov ebx, 0
    int 0x80

check_odd_even:
    test eax, 1         
    jz even             
    
odd:
    mov eax, 4
    mov ebx, 1
    mov ecx, odd_msg
    mov edx, 4
    int 0x80
    ret
    
even:
    mov eax, 4
    mov ebx, 1
    mov ecx, even_msg
    mov edx, 5
    int 0x80
    ret
