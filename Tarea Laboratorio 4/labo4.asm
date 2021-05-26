        org 100h
        section .text

        mov     BP, arrByte
        call    StoreArr

        int 20h

        section .data

        arrByte db      01,02,03,04,05,06,07,08,09,0xa,0xA

        StoreArr:
        xor     SI, SI
        xor     AX, AX
while:  
        mov     AL, [BP+SI]
        cmp     AL, 0xA
        je      end
        mov     [0200h+SI], AL
        inc     SI
        call    es_par
        jmp     while

es_par:
        mov     BX, 02h
        div     BX
        cmp     AH,00h
        mov     [0300h+SI], AL
        xor     AX,AX
end:    
        ret   