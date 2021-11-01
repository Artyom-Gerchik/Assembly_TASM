.model small
.stack 256

.data
msg db 60 dup(?)

.code
main:
    mov ax, @data
    mov ds, ax
    mov si, offset msg

input: 
    
    mov ah, 1
    int 21h
    cmp al, 13
    je displayWord
    mov [si], al
    inc si
    jmp input

displayWord: 
    
    mov si, '$'
    mov di, offset msg
    mov dl, 13
    mov ah, 2
    int 21h
    mov dl, 10
    mov ah, 2
    int 21h

again: 
    
    cmp di, '$'
    je last
    cmp di, 32
    je next
    mov dl, [di]
    mov ah, 2
    int 21h
    inc di
    jmp again

next:
    
    mov dl, 13
    mov ah, 2
    int 21h
    mov dl, 10
    mov ah, 2
    int 21h
    inc di
    jmp again

last: 

    mov ah, 4ch
    int 21h

end main