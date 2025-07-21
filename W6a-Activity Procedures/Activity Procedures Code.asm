section .data
    newline db 10, 0    

section .text
    global _start

_start:
    mov al, 'A'         
    
print_loop:
    call print_char
    
    call print_newline
    
    inc al
    
    cmp al, 'Z' + 1
    jne print_loop     
    
    mov eax, 1          
    mov ebx, 0         
    int 0x80

print_char:
    push eax
    
    mov eax, 4          
    mov ebx, 1          
    mov ecx, esp        
    mov edx, 1          
    int 0x80
    
    pop eax
    ret

print_newline:
    push eax
    push ebx
    push ecx
    push edx
    
    mov eax, 4          
    mov ebx, 1         
    mov ecx, newline    
    mov edx, 1          
    int 0x80
    
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
