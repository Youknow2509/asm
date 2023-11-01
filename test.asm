.MODEL SMALL
.STACK 100h

.DATA
    s1 DB 'Nhap mot so bat ky: $'
    s2 DB 10, 13, 'Ket qua: $'
    number DB 0
    result DB 0

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; In chuỗi nhập
    MOV AH, 9
    LEA DX, s1
    INT 21h

    ; Đọc số từ bàn phím
    MOV AH, 1
    INT 21h
    SUB AL, '0' ; Chuyển ký tự thành giá trị số
    MOV number, AL ; Lưu trữ số vào biến number

    ; Tính kết quả (số vừa nhập cộng 1)
    MOV AL, number
    ADD AL, 1
    MOV result, AL

    ; In chuỗi "Ket qua:"
    MOV AH, 9
    LEA DX, s2
    INT 21h

    ; In kết quả
    MOV DL, result ; Đặt ký tự kết quả vào DL
    ADD DL, '0' ; Chuyển ký tự thành giá trị số

    MOV AH, 2
    INT 21h

    ; Kết thúc chương trình
    MOV AH, 4Ch
    INT 21h

MAIN ENDP
END MAIN
