.model small
.stack 100h
.data
    s1  db  'nhap so (enter de dung>: $'
    s2  db  10, 13, 'so vua nhap: $'
    a   db  0
    b   db  0
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 9
        lea dx, s1
        int 21h

        mov bh, 0
        mov bl, 10
        
nhaptiep:        
        mov ah, 1
        int 21h

        cmp al, 13
        je  inso

        ; doi thanh so
        sub al, 48      

        mov bh, al       ; b = 2
        mov al, a       ; so truoc do (al=1)

        mul bl          ; al * 10 -> ax = 10

        add bh, al       ; a = a*10 + al
        mov a, bh

        jmp nhaptiep
        
inso:   
        ; so chua trong a
        mov ah, 9
        lea dx, s2
        int 21h
        
        mov cx, 0
        mov ah, 0
        mov al, a
chiatiep:
        mov ah, 0        
        div bl
        cmp al, 0
        je  thoat
        push ax
        inc cl
        jmp chiatiep
        
thoat:  push ax
        inc cl
        
intiep:        
        mov ah, 2
        pop dx
        mov dl, dh
        add dl, 48
        int 21h
        loop intiep
        
        mov ah, 4ch
        int 21h
        main endp
    end main