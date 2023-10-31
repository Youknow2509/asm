  .MODEL SMALL
.stack 100h
.DATA
    s1 DB 'nhap chuoi: $'
    s2 DB 10, 13, 'chuoi vua nhap: $'
    input db 100 dup(?)
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    ; in nhap chuoi
    mov ah, 9
    lea dx, s1
    int 21h

    mov bx, 0; khoi tao bx de dem so ki tu trong chuoi nhap vao
    ; nhap
nhaptiep: 
    mov ah, 1
    int 21h
    cmp al, 13
    je enter
    
    mov input[bx], al 
    inc bx

    jmp nhaptiep
enter:         
    
    mov ah, 9
    lea dx, s2
    int 21h

    ; in chuoi
    mov input[bx], '$'
    mov ah, 9
    lea dx, input
    int 21h

    ; Exit
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
