org 100h

    section .text
    xor AX, AX
    xor SI, SI
    xor BX, BX
    XOR CX, CX
    xor DX, DX

    MOV SI, 0
    MOV DI, 0
    MOV DH, 10
    MOV DL, 20
    
    call modotexto

    MOVER:
        call movercursor
        MOV CL, [caracter+SI]
        call escribircaracter
        INC SI
        INC DL
        INC DI

        CMP DI, 30d
        JB MOVER

        jmp esperartecla

    modotexto: 
        MOV AH, 0h
        MOV AL, 03h
        INT 10h
        RET

    salto_linea:
        INC DH
        INC DH
        MOV DL, 19
        RET
    
    comparar:
        CMP DI, 5d
        JE salto_linea

        CMP DI, 13d
        JE salto_linea

        CMP DI, 23d
        JE salto_linea
        INT 10h
        RET


    movercursor:
        MOV AH, 02h
        MOV BH, 0h
    
        call comparar

        INT 10h
        RET

    escribircaracter:
        MOV AH, 0Ah
        MOV AL, CL 
        MOV BH, 0h
        MOV CX, 1h
        INT 10h
        RET

    esperartecla:
        MOV AH, 00h
        INT 16h

        ret
    exit:
        int 20h

section .data

caracter DB "Erika Liliana Rodriguez Ponce"