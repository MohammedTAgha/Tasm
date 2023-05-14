               .model small
.stack 100h

.data
    msg1 db 'Enter the first number: $'
    msg2 db 'Enter the second number: $'
    Rev db 5 dup(0)

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Print message to enter the first number
    mov ah, 9
    mov dx, offset msg1
    int 21h

    ; Read the first number
    mov cx, 5
    mov si, 4

read_first_number:
    mov ah, 1
    int 21h

    mov [Rev+si], al
    dec si
    loop read_first_number

    ; Print message to enter the second number
    mov ah, 9
    mov dx, offset msg2
    int 21h

    ; Read the second number
    mov cx, 5
    mov si, 4

read_second_number:
    mov ah, 1
    int 21h

    mov [Rev+si], al
    dec si
    loop read_second_number

    mov ah, 4Ch  ; Exit program
    mov al, 0
    int 21h
main endp

end main
