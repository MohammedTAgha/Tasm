.model small
.stack 100h

.data
    msg1 db 0ah, 'Enter the first number: $'
    msg2 db 0ah, 'Enter the second number: $'
    sumMsg db 0ah, 'The sum is: $'

.code
main:
    mov ax, @data
    mov ds, ax

    ; Print message to enter the first number
    mov ah, 9
    mov dx, offset msg1
    int 21h

    ; Read the first number
    mov bx, 0  ; BX for  first number
    mov cx, 0  ; CX for digit count
    
    read_first_digit:
    mov ah, 1
    int 21h

    cmp al, 0Dh  ; Check for Enter key
    je read_second_number

    sub al, 30h  ; Convert ASCII digit to numerical value
    add bx, ax  ; Add the new digit to the number
    mov ah, 0
    mov al, 10
    mul bx       ; Multiply the current number by 10
    mov bx, ax

    inc cx       ; Increment digit count
    jmp read_first_digit

read_second_number:
    ; Print message to enter the second number
    mov ah, 9
    mov dx, offset msg2
    int 21h

    ; Read the second number
    mov ax, 0  ; AX will store the second number
    mov cx, 0  ; Reset digit count
read_second_digit:
    mov ah, 1
    int 21h

    cmp al, 0Dh  ; Check for Enter key
    je calculate_sum

    sub al, 30h  ; Convert ASCII digit to numerical value
    add ax, bx  ; Add the new digit to the number
    mov ah, 0
    mov bx, 10
    mul bx       ; Multiply the current number by 10
    mov bx, ax

    inc cx       ; Increment digit count
    jmp read_second_digit

calculate_sum:        
    
    ; Calculate the sum
    add bx, ax

    ; Print the sum
    mov ah, 9
    mov dx, offset sumMsg
    int 21h  
    

    mov dl, bl
    add dl, 30h  ; Convert the result to ASCII
    mov ah, 2
    int 21h

    mov ah, 4Ch  ; Exit program
    mov al, 0
    int 21h

end main
