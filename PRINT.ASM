.model small
.code
mov ah,2h        
mov dl,"xxxxx$"
int 21h 
mov ah,4ch
int 21h
end
