.MODEL SMALL
.STACK 100h
.DATA
    s1 DB 'Nhap so thu 1: $'
    s2 DB 10, 13, 'Nhap so thu 2: $'
    s3 DB 10, 13, 'Tong cua hai so la: $'
    num1 DW ?
    num2 DW ?
    result DW ?
    res_string DB 100 DUP (?) ; Định dạng là DB (byte) thay vì DW (word)
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Nhập số thứ nhất
    MOV AH, 9
    LEA DX, s1
    INT 21h
    
    MOV AH, 1
    INT 21h
    SUB AL, '0' ; Chuyển ký tự sang số
    MOV num1, AX

    ; Nhập số thứ hai
    MOV AH, 9
    LEA DX, s2
    INT 21h
    
    MOV AH, 1
    INT 21h
    SUB AL, '0' ; Chuyển ký tự sang số
    MOV num2, AX

    ; Tính tổng
    MOV AX, num1
    ADD AX, num2
    MOV result, AX

    MOV BX, 10
    MOV CX, 0
    MOV DX, 0

tieptucchia:
    DIV BX ; AX chứa kết quả chia, DX chứa phần dư
    
    ADD DX, '0' ; Chuyển phần dư sang ký tự

    MOV res_string[CX], DX
    INC CX
    CMP DX, 0
    JE chiaxong
    JMP tieptucchia

chiaxong:
    MOV res_string[CX], '$' ; Kết thúc chuỗi

    ; In chuỗi kết quả
    MOV AH, 9
    LEA DX, s3
    INT 21h

    MOV AH, 9 
    LEA DX, res_string
    INT 21h

    ; Kết thúc chương trình
    MOV AH, 4Ch
    INT 21h

MAIN ENDP
END MAIN
