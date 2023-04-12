.model small
.data 
    ms1 db "yess$"  
    ms2 db "no$"    

.code

    mov ax , @data
    mov ds , ax
    
    mov al,200
    mov bl , 50
    add al,bl
    
    jc carryok
    mov ah , 9
    mov dx, offset ms2   
    int 21h
    jmp exit
    

carryok:
    mov ah , 9
    mov dx, offset ms1   
    int 21h   
    
exit:
    mov ah,9
    mov dx , offset ms2
    int 21h             
end
