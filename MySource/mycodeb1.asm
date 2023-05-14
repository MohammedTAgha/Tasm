.model small
.stack 100h

.data
    msg1 db 0ah, 'Enter the first number: $'
    msg2 db 0ah, 'Enter the second number: $'
    sumMsg db 0ah, 'The sum is: $'

.code
main:
     ; Print message to enter the first number 
      
    mov ax, @data
    mov ds, ax

    ; Print message to enter the first number
    mov ah, 9
    mov dx, offset msg1
    int 21h 
    
    ;-----------------    
    
    ; Read the first number
    mov bx, 0  ; BX for  first number
    mov cx, 0  ; CX for digit count
    read_first_number:    
    mov ah, 1
    int 21h  
    sub al ,30
    mov bx ,al
    cmp al, 0Dh  ; Check for Enter key
    je read_second_number 
    
    read_first_digit:
    mov ah, 1
    int 21h
    
    
    mov al, 9 ; here the value of curr digit  
     mov bx, 9 ; here the value of old value
     mov cl,al
    mov bx ,ax 
    mov ch, 10    
    mul ch       
    add bx,cl
    
    ;-----------------
    
    
    ;-----------------    
    
    ; Read the second number
    mov bx, 0  ; dX for  first number
    mov cx, 0  ; CX for digit count
    read_second_number:    
    mov ah, 1
    int 21h
    mov bx ,al
    read_first_digit:
    mov ah, 1
    int 21h
    
    
    mov al, 9  
     mov bx, 9
     mov dh,al
    mov bx ,ax 
    mov dl, 10    
    mul dl       
    add bx,ax
    
    ;-----------------
    
    
    
   mov ah, 4Ch  ; Exit program
    mov al, 0
    int 21h

end main
