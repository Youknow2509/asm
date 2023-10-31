.MODEL SMALL
.stack 100h
.DATA
    s1 DB 'Input: $'
    s2 db 10, 13, 'Output: $'
.CODE
MAIN PROC

    MOV AX, @DATA
    MOV DS, AX

    mov ah, 9
    lea dx, s1
    int 21H

    mov ah, 1   
    int 21H

    mov bx, al
    mov cx, 1

    mul 

    ; Exit
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
