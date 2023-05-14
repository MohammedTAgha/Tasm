.model small
.data 
    n1 db 2  
    n2 db ?
    msg1 db  "is power of 2$"
    msg2 db 10,13, "not power of 2$" 
    msg3 db 10,13, "my name is mohammed agha$"   

.code
    ; this is my name mohammed , and this is my code
     mov ax , @data
    mov ds , ax
     mov ah , 9
    mov dx, offset msg3
    
    ; first store the num in bl 
    mov bl,8 
    ;store the num -1 in cl
    mov cl , bl
    sub cl,1  
    ;do bitwise AND between n and n-1
    and bl , cl 
    ;if result =0 so its a power of 2  
    jz powerof2
    
    jmp notpowerof2  
    Mov ah, 4ch 
    Int 21h
    
    powerof2: ; print if n is power of 2 msg
   mov ax , @data
    mov ds , ax
     mov ah , 9
    mov dx, offset msg1   
    int 21h  
    jmp exit  
    
    notpowerof2:  ; print if n is not power of 2 msg
   mov ax , @data
    mov ds , ax
     mov ah , 9
    mov dx, offset msg2   
    int 21h  
    jmp exit 
     
exit:    
    Mov ah, 4ch
    Int 21h 
       
         
end
