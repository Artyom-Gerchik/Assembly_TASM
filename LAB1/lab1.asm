;Если a * (c + b) * (d ^ 2) = (a – d) * (b + c) то
;      Если a > b ^ 2 то
;        Результат = c ^ 2 /(d - c) - d ^ 2
;      Иначе
;        Если a < c + d то
;            Результат = d ^ 2 + (b OR c)
;        Иначе
;            Результат = a + (b AND c)

.model small
.stack 256

.data
a dw 1
b dw 0
c dw 0
d dw 1

.code

main:   

    mov ax, @data
    mov ds, ax

leftPart:

    mov ax, a

    mov bx, b
    add bx, c
    
    mul bx    ; ax = ax * bx
    mov bx, ax

    mov ax, d
    mul ax    ; ax = ax ^ 2

    mul bx    ; ax = ax * bx 

    mov bx, ax ; bx = a * (c + b) * (d ^ 2) leftPart
    mov ax, 0

rightPart:

    mov ax, a
    sub ax, d

    mov cx, b
    add cx, c

    mul cx     ; ax = ax * cx
    mov cx, ax ; cx = (a – d) * (b + c) rightPart
    mov ax, 0

compareLeftAndRight:

    cmp cx, bx
    jne secondIf


firstIf:       ; a > b ^ 2

    mov bx, a

    mov ax, b
    mul ax     ; ax = ax ^ 2 

    cmp bx, ax ; bx = a, ax = b ^ 2
    jl secondIf


firstSolution:  ; c ^ 2 / (d - c) - d ^ 2

    mov ax, c
    mul ax      ; ax = c ^ 2
    
    mov bx, d
    sub bx, c   ; bx = d - c 

    cmp bx, 0 
    je exit     ; if denominator = 0 => exit (exception)
  
    div bx      ; ax = ax / bx

    mov bx, ax  ; bx = c ^ 2 / (d - c)

    mov ax, d
    mul ax

    sub bx, ax  ; bx = c ^ 2 / (d - c) - d ^ 2
    mov ax, bx

    jmp exit


secondIf:      ; a < c + d
    mov ax, a

    mov bx, c
    add bx, d

    cmp ax, bx
    jg thirdSolution



secondSolution: ; d ^ 2 + (b OR c)
    
    mov ax, b
    mov bx, c

    or ax, bx   ; puts 'or' result in ax
    mov bx, ax  ; then in bx

    mov ax, d
    mul ax

    add ax, bx

    jmp exit

thirdSolution:   ; a + (b AND c)

    mov ax, b
    mov bx, c

    and ax, bx

    mov bx, ax

    mov ax, a

    add ax, bx

    jmp exit

exit:
    mov ax, 4c00h
    mov al, 0
    int 21h
    
end main