.model small
.stack 512
.386

.data
inputStr db 1000 dup(?)
space db 10,'$'
emptySentence db 10,'emptySentence!',13,10,10,'$'

vowelWasRecently dw 0
consonantsWasRecently dw 0
thisWordBad dw 0
counter dw 0
testTemp dw 0
spaceWas dw 0


.code
main:

    mov ax, @data
    mov ds, ax
    mov si, offset inputStr

input: 
    
    mov ah, 01h
    int 21h

    cmp al, 13 ; enter button
    je displayWord

    mov [si], al
    inc si

    jmp input

vowelIsHere:

    mov ax, vowelWasRecently

    cmp ax, 1
    je resume

    inc di
    inc counter

    mov consonantsWasRecently, 0
    mov vowelWasRecently, 1

    jmp again

consonantIsHere:

    mov ax, consonantsWasRecently

    cmp ax, 1
    je resume

    inc di
    inc counter

    mov vowelWasRecently, 0
    mov consonantsWasRecently, 1

    jmp again

movCounterForGetBack:
 
    mov cx, counter

getBack:

    cmp cx, 0
    je movCounterForOutput

    dec di
    dec cx

    jmp getBack

movCounterForOutput:
 
    mov cx, counter

    cmp cx, 1
    je label1

    jmp outputWord

label1:

    mov spaceWas, 1
    inc di
    jmp tempLabel    

outputWord:

    cmp cx, 0
    je tempLabel
    
    mov dl, [di]

    mov ah, 02h
    int 21h

    mov spaceWas, 0

    inc di
    dec cx

    jmp outputWord

doInc:

    inc di
    jmp again

tempLabel:

    cmp spaceWas, 0
    jne labelInTempLabel

    mov dl, ' ' ; newline
    mov ah, 02h
    int 21h

    mov spaceWas, 1
    mov consonantsWasRecently, 0
    mov vowelWasRecently, 0
    mov counter, 0
    mov thisWordBad, 0
    inc di
    

    jmp again

    labelInTempLabel:
        mov consonantsWasRecently, 0
        mov vowelWasRecently, 0
        mov counter, 0
        mov thisWordBad, 0
        
        cmp cx, 1
        je doInc
        
        jmp testForNextSpace

        checkForNextSpace:
            mov spaceWas, 0

    jmp again

testForNextSpace:

    inc di

    mov dl, [di]

    cmp dl, ' '
    jne checkForNextSpace
    mov spaceWas, 1

    jmp again

displayWord: 

    cmp si, 0
    je emptySentenceLabel
    
    mov si, '$'
    mov di, offset inputStr

    mov dl, 13 ; enter buton
    mov ah, 02h
    int 21h

    mov dl, 10 ; newline
    mov ah, 02h
    int 21h

    jmp again

littleLoop:

    inc di

    mov dl, [di]

    cmp dl, ' '
    je temphuita

    mov counter, 0
    mov thisWordBad, 0

    jmp littleLoop

temphuita:

    mov thisWordBad, 0
    inc di
    jmp again

dotFinded:

    cmp counter, 0
    jg movCounterForGetBack
    jmp last

testLoop:

    cmp vowelWasRecently, 1 
    je movCounterForGetBack

    cmp consonantsWasRecently, 1
    je movCounterForGetBack

    inc di

again: 

    cmp  thisWordBad, 1
    je littleLoop
    
    mov dl, [di]

    cmp dl, ' '
    je skip

    cmp dl, 10
    je last

    cmp dl, '.'
    je dotFinded

    startCheck:

        testForVowel:  ; Aa Ee Ii Oo Uu Yy

            cmp dl, 'A'
            je vowelIsHere
            cmp dl, 'a'
            je vowelIsHere

            cmp dl, 'E'
            je vowelIsHere
            cmp dl, 'e'
            je vowelIsHere

            cmp dl, 'I'
            je vowelIsHere
            cmp dl, 'i'
            je vowelIsHere

            cmp dl, 'O'
            je vowelIsHere
            cmp dl, 'o'
            je vowelIsHere

            cmp dl, 'U'
            je vowelIsHere
            cmp dl, 'u'
            je vowelIsHere

            cmp dl, 'Y'
            je vowelIsHere
            cmp dl, 'y'
            je vowelIsHere

        testForConsonant: ; Bb Cc Dd Ff Gg Hh Jj Kk Ll Mm Nn Pp Qq Rr Ss Tt Vv Ww Xx Zz

            cmp dl, 'B'
            je consonantIsHere
            cmp dl, 'b'
            je consonantIsHere

            cmp dl, 'C'
            je consonantIsHere
            cmp dl, 'c'
            je consonantIsHere

            cmp dl, 'D'
            je consonantIsHere
            cmp dl, 'd'
            je consonantIsHere

            cmp dl, 'F'
            je consonantIsHere
            cmp dl, 'f'
            je consonantIsHere

            cmp dl, 'G'
            je consonantIsHere
            cmp dl, 'g'
            je consonantIsHere

            cmp dl, 'H'
            je consonantIsHere
            cmp dl, 'h'
            je consonantIsHere

            cmp dl, 'J'
            je consonantIsHere
            cmp dl, 'j'
            je consonantIsHere

            cmp dl, 'K'
            je consonantIsHere
            cmp dl, 'k'
            je consonantIsHere

            cmp dl, 'L'
            je consonantIsHere
            cmp dl, 'l'
            je consonantIsHere

            cmp dl, 'M'
            je consonantIsHere
            cmp dl, 'm'
            je consonantIsHere

            cmp dl, 'N'
            je consonantIsHere
            cmp dl, 'n'
            je consonantIsHere

            cmp dl, 'P'
            je consonantIsHere
            cmp dl, 'p'
            je consonantIsHere

            cmp dl, 'Q'
            je consonantIsHere
            cmp dl, 'q'
            je consonantIsHere

            cmp dl, 'R'
            je consonantIsHere
            cmp dl, 'r'
            je consonantIsHere

            cmp dl, 'S'
            je consonantIsHere
            cmp dl, 's'
            je consonantIsHere

            cmp dl, 'T'
            je consonantIsHere
            cmp dl, 't'
            je consonantIsHere

            cmp dl, 'V'
            je consonantIsHere
            cmp dl, 'v'
            je consonantIsHere

            cmp dl, 'W'
            je consonantIsHere
            cmp dl, 'w'
            je consonantIsHere

            cmp dl, 'X'
            je consonantIsHere
            cmp dl, 'x'
            je consonantIsHere

            cmp dl, 'Z'
            je consonantIsHere
            cmp dl, 'Z'
            je consonantIsHere

            mov testTemp, 1
            jmp testLoop

    resume:

    mov thisWordBad, 1
    mov consonantsWasRecently, 0
    mov vowelWasRecently, 0
    jmp again

skip:

    jmp movCounterForGetBack

next:

    cmp thisWordBad, 0
    je movCounterForGetBack

emptySentenceLabel:

    lea dx, emptySentence
    mov ah, 09h  ; display string, which is stored in dx
    int 21h

last: 
    
    lea dx, space
    mov ah, 09h  ; display string, which is stored in dx
    int 21h

    mov ah, 4ch
    int 21h

end main