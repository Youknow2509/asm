.MODEL SMALL
.stack 100h
.DATA
    s1 DB 'My test $'
.CODE
MAIN PROC

    MOV AX, @DATA
    MOV DS, AX

    

    ; Exit
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
