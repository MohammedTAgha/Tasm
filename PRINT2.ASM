        .model small
.data
        messagee db "m1data$"
.code
        mov ax,@data
        mov ds,ax
        mov ah,9h
        mov dx,offset messagee
        int 21h
        mov ah,4ch
        int 21h
   end
