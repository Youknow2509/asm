; hien thi so tu 0 den 255
.model small
.stack 100h
.data
    s1  db  'nhap so (enter de dung>: $'  ; In ra màn hình câu hỏi
    s2  db  10, 13, 'so vua nhap: $'      ; In ra màn hình số vừa nhập
    a   db 0                           ; Biến a lưu trữ số
    b   db  0                           ; Biến b lưu trữ kết quả nhân với 10
.code
main proc
    mov ax, @data       ; Khởi tạo DS từ DS của data
    mov ds, ax

    mov ah, 9            ; Gọi hàm 9 của DOS để in chuỗi
    lea dx, s1           ; Địa chỉ của chuỗi s1
    int 21h

    mov bh, 0            ; Đặt bh = 0
    mov bl, 10           ; Đặt bl = 10 (để sử dụng trong phép nhân với 10)

nhaptiep:
    mov ah, 1            ; Đọc một ký tự từ bàn phím
    int 21h

    cmp al, 13           ; So sánh với mã ASCII của Enter
    je inso              ; Nếu Enter thì chuyển đến inso

    sub al, 48           ; Chuyển ký tự số ASCII thành giá trị số

    mov bh, al           ; Gán giá trị vừa đọc vào bh (b = 2)
    mov al, a            ; Đưa giá trị số trước đó vào al (al=1)

    mul bl               ; Nhân al với 10 (al * 10 -> ax = 10)

    add bh, al           ; a = a*10 + al
    mov a, bh

    jmp nhaptiep         ; Lặp lại việc nhập

inso: ; biến a lưu số vừa nhập ở dạng số 
    mov ah, 9            ; In chuỗi "so vua nhap"
    lea dx, s2           ; Địa chỉ của chuỗi s2
    int 21h

    mov cx, 0            ; Khởi tạo cx = 0 (đếm số chữ số)
    mov ah, 0            ; Đặt giá trị AH = 0 (sử dụng cho việc chia)
    mov al, a            ; Đưa giá trị của a vào al

chiatiep:
    mov ah, 0            ; Đặt giá trị AH = 0 (sử dụng cho việc chia)
    div bl               ; Chia ax cho 10 (ax chứa kết quả, al chứa phần dư)
    cmp al, 0            ; So sánh phần dư với 0
    je thoat             ; Nếu phần dư bằng 0, thoát khỏi vòng lặp
    push ax              ; Đẩy ax (kết quả chia) vào ngăn xếp
    inc cl               ; Tăng biến đếm chữ số
    jmp chiatiep         ; Lặp lại quá trình chia

thoat:
    push ax              ; Đẩy ax (kết quả chia) vào ngăn xếp
    inc cl               ; Tăng biến đếm chữ số

intiep:
    mov ah, 2            ; Gọi hàm 2 của DOS để in ký tự
    pop dx               ; Lấy giá trị từ ngăn xếp vào dx (ký tự cần in)
    mov dl, dh           ; Di chuyển phần cao nhất của dx vào dl
    add dl, 48           ; Chuyển giá trị số thành ký tự ASCII
    int 21h
    loop intiep          ; Lặp lại việc in cho tất cả các chữ số

    mov ah, 4ch          ; Kết thúc chương trình
    int 21h
main endp
end main
