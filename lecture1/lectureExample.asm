.model small
.stack 256

.data
a dw 1
b dw 2

.code
main:   
    mov ax, @data
    mov ds, ax

sum:
    mov ax, a
    add ax, b

exit:
    mov ax, 4c00h
    mov al, 0
    int 21h
    
end main

