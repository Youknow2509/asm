.MODEL SMALL
.stack 100h
.DATA

    s1 db 'Input: $'
    s2 db 10, 13, 'String input: $'
    s3 db 10, 13, 'String solve: $'
    input db 100 dup(?)

.CODE
MAIN PROC

    MOV AX, @DATA
    MOV DS, AX
    ; HIEN THI THONG BAO NHAP
    MOV AH, 9
    LEA DX, s1
    INT 21h

    mov bx, 0 ; bx lam bien dem so phan tu trong input

nhaptiep:
    ; NHAP
    MOV AH, 1
    INT 21H ; BIEN NHAP LUU TRONG AL

    CMP al, 13
    je enter

    mov input[bx], al
    inc bx
    jmp nhaptiep

enter:
    ; hien thi thong bao chuoi da nhap
    MOV AH, 9
    LEA DX, s2
    INT 21h
    ; hien thi chuoi da nhap
    mov input[bx], '$'
    mov ah, 9
    lea dx, input
    int 21h

    mov cx, bx
    mov bx, 0

xulitiep:
    cmp input[bx], 97
    jge chuyen_thanh_in_hoa 
tang_index:
    inc bx
    cmp bx, cx
    je solve ; da chuyen doi xong
    jne xulitiep

chuyen_thanh_in_hoa:
    sub input[bx], 32
    jmp tang_index

solve: 
    MOV AH, 9
    LEA DX, s3
    INT 21h
    ; hien thi chuoi sau khi xu li
    mov ah, 9
    lea dx, input
    int 21h

    ; Exit
    MOV AH, 4CH
    INT 21H


MAIN ENDP
END MAIN