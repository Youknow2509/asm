.MODEL SMALL
.stack 100h
.DATA
    MSG_A DB 'My test $'
   
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    
    LEA DX, MSG_A
    MOV AH, 9
    INT 21H

    ; Exit
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
