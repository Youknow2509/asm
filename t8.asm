.MODEL SMALL
.stack 100h
.DATA
    s1 db 'nhap xau: $'
    s2 db 10,13, 'xau vua nhap: $'
    s3 db 10, 13, 'xau chu hoa: $'
    s4 db 10, 13, 'xau chu thuong: $'
    s db 100 dup(?)
    xh db 100 dup(?) ;mang co 100 phan tu
    xt db 100 dup(?) ;mang co 100 phan tu
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
    int 21H
    cmp al, 13
    je enter
    mov s[bx], al
    inc bx
    jmp nhaptiep
enter:
    mov cx, bx 

    mov ah, 9
    lea dx, s2 
    int 21h 
    mov s[bx], '$'
    lea dx, s
    int 21h 

    mov bx, 0
    mov si, 0
    mov di, 0
doitiep:
    cmp s[bx], 97
    jge chuthuong
    mov al, s[bx]
    mov xh[di], al
    inc di
    jmp tiep
chuthuong:
    mov al, s[bx]
    mov xt[si], al
    inc si
tiep:
    inc bx 
    cmp bx, cx
    jle doitiep

    mov xt[si], '$'
    mov xh[di], '$'

    mov ah, 9 
    lea dx, s4 
    int 21h 
    lea dx, xt 
    int 21h 
    lea dx, s3 
    int 21h 
    lea dx, xh 
    int 21h 

    
    
    ; Exit
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN