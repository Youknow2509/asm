.model small
.stack 100h
.data
    ; khai bao du lieu
    inp1   db  'Inut character a: $'
    inp2  db  10, 13,'Inut character b: $'
    s1  db  10, 13,'a lon hon b$'
    s2  db  10, 13,'b lon hon a$'
    s2  db  10, 13,'a bang b$'
    a  db ?
    b  db ?
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        ; hien thu sau nhap ki tu a
        lea dx, inp1
        mov ah, 9
        int 21h
        ;nhap ky tu a
        mov ah, 1
        int 21h     ; ky tu -> al
        mov a, al
        
        ; hien thu sau nhap ki tu b
        lea dx, inp2
        mov ah, 9
        int 21h
        ;nhap ky tu b
        mov ah, 1
        int 21h     ; ky tu -> al
        mov b, al
        
        cmp bl, bh
        jg agreater
        jl bgreater

    agreater:
        mov ah, 9
        lea dx, s3
        int 21h
        jmp kt
    bgreater:
        mov ah, 9
        lea dx, s4
        int 21h

    kt:
        ; ket thuc
        mov ah, 4ch
        int 21h
        
    main endp
end main