section .data
    filename db 'quotes.txt', 0
    
    quote3 db 'Better three hours too soon than a minute too late.', 10, 0
    quote3_len equ $ - quote3 - 1
    
    quote4 db 'No legacy is so rich as honesty.', 10, 0
    quote4_len equ $ - quote4 - 1

section .bss
    fd resd 1

section .text
    global _start

_start:
    mov eax, 5
    mov ebx, filename
    mov ecx, 1025
    mov edx, 644
    int 0x80
    
    mov [fd], eax
    
    mov eax, 19
    mov ebx, [fd]
    mov ecx, 0
    mov edx, 2
    int 0x80
    
    mov eax, 4
    mov ebx, [fd]
    mov ecx, quote3
    mov edx, quote3_len
    int 0x80
    
    mov eax, 4
    mov ebx, [fd]
    mov ecx, quote4
    mov edx, quote4_len
    int 0x80
    
    mov eax, 6
    mov ebx, [fd]
    int 0x80
    
    mov eax, 1
    mov ebx, 0
    int 0x80
