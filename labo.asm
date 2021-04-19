        org 100h
        section .text

        ;PRIMERA PARTE 

        mov byte [200h], "E"
        mov byte [201h], "L"
        mov byte [202h], "R"
        mov byte [203h], "P"

        ;Copiar el valor de 200h a AX usando direccionamiento directo.

        mov AX, [200h]

        ;Copiar el valor de 201h a CX usando direccionamiento indirecto por registro.

        mov BX, 201h
        mov CX, [BX]

        ;Copiar el valor de 202h a DX usando direccionamiento indirecto base más índice.

        mov SI, 001h
        mov DX, [BX+SI]

        ;Copiar el valor de 203h a DI usando direccionamiento relativo por registro.

        mov DI, [BX+002h]


        int 20h