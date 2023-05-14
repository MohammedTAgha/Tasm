.model small
.code
    mov bx,01h   
    mov ax,100h   
    mov al,33h 
    add al ,bl    
    mov [7180h],ax  
    
    add di ,ax   
    add cl, 44h  
    

end