.MODEL SMALL
.stack 100h
.DATA
   s1 db 'nhap so (enter de thoat) :$'
   s2 db 10, 13'so vua nhap :$'
   a db 0
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 9
    LEA DX, s1
    INT 21H
    
    mov bh, 0
    mov bl, 10
nhaptiep:
    mov ah, 1
    int 21h
    cmp al, 13
    je inso     ; jump equau
    sub al, 48
    mov bh, al ; cat so vua nhap
    mov al, a
    mul bl     ; *10 tra ve ax
    add bh, al
    mov a, bh
    jmp nhaptiep

    sub al, 48; doi ra so
inso:
    mov ah, 9
    lea dx, s2
    int 21h

    mov al, a
    mov cx, 0
chiatiep:
    mov ah, 0
    div bl
    cmp al, 0
    je thoat
    push ax
    inc cl
    jmp chiatiep
thoat:
    push ax
    int cl

    mov ah, 2
    pop dx
    mov dl, dh
    add dl, 48
    int 21H
    loop intiep
    ; Exit
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
