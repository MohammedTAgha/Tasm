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
    lea dx, msg1
    int 21h

    ; Read the first number
    xor bx, bx  ; BX will store the first number
    xor cx, cx  ; CX will store the digit count
read_first_digit:
    mov ah, 1
    int 21h

    cmp al, 0Dh  ; Check for Enter key
    je read_second_number

    sub al, 30h  ; Convert ASCII digit to numerical value
    mov ah, 0
    shl bx, 1  ; Multiply the current number by 10
    adc bx, 0  ; Add the new digit to the number

    inc cx       ; Increment digit count
    jmp read_first_digit

read_second_number:
    ; Print message to enter the second number
    mov ah, 9
    lea dx, msg2
    int 21h

    ; Read the second number
    xor ax, ax  ; AX will store the second number
    xor cx, cx  ; Reset digit count
read_second_digit:
    mov ah, 1
    int 21h

    cmp al, 0Dh  ; Check for Enter key
    je calculate_sum

    sub al, 30h  ; Convert ASCII digit to numerical value
    mov ah, 0
    shl ax, 1  ; Multiply the current number by 10
    adc ax, 0  ; Add the new digit to the number

    inc cx       ; Increment digit count
    jmp read_second_digit

calculate_sum:
    ; Calculate the sum
    add bx, ax

    ; Print the sum
    mov ah, 2
    lea dx, sumMsg
    int 21h

    mov dl, bl
    add dl, 30h  ; Convert the result to ASCII
    mov ah, 2
    int 21h

    mov ah, 4Ch  ; Exit program
    mov al, 0
    int 21h

end main
