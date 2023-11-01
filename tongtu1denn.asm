; Tính tổng từ 1 đến n
.model small
.stack 100h
.data
    s1 db 'nhap n: $'
    s2 db 10, 13, 'n = $'
    a  dw 0
.code
    main proc
        mov ax, @data
        mov ds, ax
        ; hien thi thong bao nhap
        mov ah, 9
        lea dx, s1
        int 21h  
        
        mov bx,10 ; gan bx = 10
        mov cx, 0 ; gan cl = 0, ch 
nhaptiep:        
        ; nhap
        mov ah, 1
        int 21h

        cmp al, 13 ; xem da enter chua
        je enter 
        ; đổi chữ thành số
        sub al, 48 

        mov cl, al ; cl = al xu dung de loop
        mov ax, a 

        mul bx ; ax = al * 10
        add ax, cx ; ax = ax + cx

        mov a, ax  ; a = ax
        jmp nhaptiep
        
enter:  ; in n = 
        mov ah, 9      
        lea dx, s2
        int 21h
        
        mov bx, a ; bx = a
        mov ax, 0 ; ax = 0
        mov cx, 1 ; cx = 1
congtiep:        
        add ax, cx ; ax = ax + cx
        add cx, 1 ;  cx = cx + 1
        cmp cx, bx ; cx ? bx
        jle congtiep 
        
        mov bx, 10 ; bx = 10
        mov cx, 0 ; cx = 0
chiatiep:        
        mov dx, 0 ; dx = 0

        div bx ; ax = ax / bx

        cmp ax, 0 ; ax ? 0
        je kt

        push dx ; dx chua so du
        inc cl ; cl = cl + 1
        jmp chiatiep 
        
kt:     push dx 
        inc cl
intiep:        
        mov ah, 2
        pop dx
        add dl, 48
        int 21h
        loop intiep  ; loop cx lan
        
        mov ah,4
        int 21h
     main endp
     end main