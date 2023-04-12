dosseg
.model small
.code
mov cx,5
LP1:
mov dl,41h
mov ah,2
int 21h
dec cx
jnz LP1

mov ah , 4ch
int 21h
end
