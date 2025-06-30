section .data
    var1 dd 15          
    var2 dd 8         

section .bss
    result resd 1      

section .text
    global _start

_start:   
    mov eax, [var1]     
    mov ebx, 2
    imul eax, ebx          
   
    mov ecx, [var2]    
    sub ecx, 3           
   
    cdq                 
    idiv ecx           
    
    mov [result], eax   
    
    mov eax, 60         
    mov edi, 0          
    syscall
