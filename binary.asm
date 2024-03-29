.model small
.data
        no dW 05H
        array dw 01H,02H,03H,04H,05H
        key dw 04H
.code
        mov ax,@data
        mov ds,ax
        mov SI,0
        mov DI,no
        add DI,DI
        sub DI,2

  back: cmp SI,DI
        JA loc3
        mov bx,SI
        add bx,DI
        shr bx,1
        and bx,0FFFEH
        mov ax,array[bx]
        cmp ax,key
        JE loc1
        JB loc2
        mov DI,bx
        dec DI
        dec DI
        JMP back
  loc2: mov SI,bx
        add SI,2
        jmp back
  loc3: mov cx,0
        JMP ahead
  loc1: mov cx,1
 ahead: mov ah,4ch
        int 21h
end

