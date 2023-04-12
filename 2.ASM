.model small 
.data
        msgg db "msg" ,10 ,"$"
.code
        mov cx,5
    lop:
        mov ax , @data
        mov ds,ax
        mov ah,9h
        mov dx,offset msgg
        int 21h
        dec cx
        jnz lop
        mov ah,4ch
        int 21h
        end
