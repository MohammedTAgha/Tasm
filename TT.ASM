dosseg
.model small

.data

x db 10,13," Welcome to Lab4 Assembly $"
y db 10,13, " Variables $"

z db 9

.code

main:
mov ax,@data
mov ds, ax

mov ah,9
mov dx, offset x
int 21h

mov ah,9h
mov dx, offset y
int 21h

mov ah,2
mov d1,10
int 21h

mov al,z
add a1,30h
mov ah,2
mov dl,al
int 21h

mov ah,4ch
int 21h
end main
