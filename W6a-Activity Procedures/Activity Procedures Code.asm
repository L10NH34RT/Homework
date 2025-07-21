section .data
    newline db 10, 0    ; newline character

section .text
    global _start

_start:
    mov al, 'A'         ; start with character 'A'
    
print_loop:
    ; Print the current character
    call print_char
    
    ; Print newline
    call print_newline
    
    ; Increment to next character
    inc al
    
    ; Check if we've reached 'Z' + 1
    cmp al, 'Z' + 1
    jne print_loop      ; if not equal, continue loop
    
    ; Exit program
    mov eax, 1          ; sys_exit
    mov ebx, 0          ; exit status
    int 0x80

print_char:
    ; Save the character on stack temporarily
    push eax
    
    ; Prepare for sys_write
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, esp        ; pointer to character on stack
    mov edx, 1          ; write 1 byte
    int 0x80
    
    ; Restore stack
    pop eax
    ret

print_newline:
    ; Save registers
    push eax
    push ebx
    push ecx
    push edx
    
    ; Print newline
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, newline    ; pointer to newline
    mov edx, 1          ; write 1 byte
    int 0x80
    
    ; Restore registers
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
