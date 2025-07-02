section .data
    value1 dd 0x12345678
    value2 dd 0xABCDEF00
    mask   dd 0x0000FF00

section .bss
    result1 resd 1
    result2 resd 1

section .text
    global _start

_start:
    mov eax, [value1]
    mov [result2], eax
    
    xor eax, eax
    mov [result1], eax
    
    mov ebx, [value1]
    xor ebx, [value1]
    
    mov ecx, [value2]
    test ecx, [mask]
    jz bits_clear
    
bits_set:
    jmp done
    
bits_clear:
    jmp done
    
done:
    mov eax, 1
    xor ebx, ebx
    int 0x80
