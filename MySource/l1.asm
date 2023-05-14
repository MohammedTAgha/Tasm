.model small 
.data
        msgg db "msg$"
.code
        mov cx,5
    lop:
        mov ax , @data
        mov ds,ax
        mov ah,9h
        mov dx,offset msgg    
        int 
        dec cx
        jnz lop
        mov ah,4ch
        int 21h
        end