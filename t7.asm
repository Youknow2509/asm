.MODEL SMALL
.stack 100h
.DATA
    s1 DB 'nhap xau $'
    s2 DB 10, 13, 'in xau $'
    s3 DB 10, 13, 'xau sau khi doi $'
    s db 100dup(?)
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    
    MOV AH, 9
    LEA DX, s1
    INT 21H

    mov bx, 0
nhaptiep:
    mov ah, 1
    int 21h 
    cmp al, 13
    je enter
    mov s[bx], al
    inc bx
    jmp nhaptiep
enter:
    mov ah, 9
    lea dx, s2
    int 21h 
    mov s[bx], '$'
    lea dx, s1
    int 21h 

    mov cx, bx 
    mov bx, 0 
doitiep:
    cmp s[bx], 97 ; nho hon 97 la chu hoa
    jl chuhoa ; ko lmj 
    sub s[bx], 32; chu thuong chuyen doi
chuhoa: 
    inc bx
    cmp bx, cx
    jle doitiep

    mov ah, 9 
    lea dx, s3
    int 21h    

    lea dx, s 
    int 21h 
    

    ; Exit
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
