.MODEL SMALL
.stack 100h
.DATA
    s1 DB 'nhap chuoi: '
    s2 DB 10, 13, 'chuoi vua nhap: '
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    
    

    ; Exit
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
