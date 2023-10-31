; nhap so, in ra so do
.MODEL SMALL
.STACK 100h
.DATA
    s1 DB 'Nhập n: $'     ; Chuỗi thông báo nhập số
    s2 DB 10, 13, 'n = $' ; Chuỗi thông báo in số
    a DW 0               ; Biến lưu trữ giá trị đầu vào
.CODE
MAIN PROC
    MOV AX, @DATA       ; Load segment dữ liệu vào thanh ghi AX
    MOV DS, AX          ; Khởi động DS bằng AX

    ; In ra thông báo "Nhập n: $"
    MOV AH, 9            ; Chuẩn bị dịch vụ in chuỗi
    LEA DX, s1           ; Địa chỉ của chuỗi s1
    INT 21H              ; Gọi hàm DOS để in chuỗi

    MOV BX, 10           ; BX lưu giá trị 10, dùng cho việc chuyển đổi

    ; Khởi tạo biến đếm CX và lưu giá trị 0 vào a
    XOR CX, CX
    MOV a, 0

nhaptiep:
    ; Nhập một ký tự từ bàn phím
    MOV AH, 1
    INT 21H

    ; Kiểm tra xem người dùng đã nhấn Enter (ký tự 13) chưa
    CMP AL, 13
    JE enter            ; Nếu là Enter, chuyển tới nhãn "enter"

    ; Chuyển ký tự số thành giá trị số và cập nhật biến a
    SUB AL, 48          ; Chuyển ký tự số thành giá trị số
    MOV CL, AL
    MOV AX, a
    MUL BX              ; Nhân a với 10
    ADD AX, CX          ; Cộng giá trị mới vào a
    MOV a, AX
    JMP nhaptiep

enter:
    ; In ra thông báo "n = $"
    MOV AH, 9            ; Chuẩn bị dịch vụ in chuỗi
    LEA DX, s2           ; Địa chỉ của chuỗi s2
    INT 21H              ; Gọi hàm DOS để in chuỗi

    MOV BX, 10           ; BX lưu giá trị 10

    ; Khởi tạo AX với giá trị của a và đặt CX (đếm) bằng 0
    MOV AX, a
    XOR CX, CX

chiatiep:
    ; Chia AX cho 10 và lấy phần dư
    MOV DX, 0
    DIV BX
    PUSH DX              ; Đẩy phần dư vào ngăn xếp
    INC CX               ; Tăng đếm

    ; Kiểm tra xem giá trị trong AX còn lớn hơn 0 hay không
    CMP AX, 0
    JNE chiatiep         ; Nếu còn lớn hơn 0, tiếp tục chia

intiep:
    ; In từng chữ số
    MOV AH, 2
    POP DX               ; Lấy phần dư từ ngăn xếp
    ADD DL, 48           ; Chuyển phần dư thành ký tự số
    INT 21H              ; In ký tự lên màn hình
    LOOP intiep          ; Lặp lại cho đến khi CX bằng 0

    ; Kết thúc chương trình
    MOV AH, 4Ch          ; Dịch vụ kết thúc chương trình DOS
    INT 21H

MAIN ENDP
END MAIN
