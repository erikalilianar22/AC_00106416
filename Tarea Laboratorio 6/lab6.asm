org 	100h

	section	.text

    call 	leerclave
	call	escribirclave
    int 	20h

    section	.data

    contra	db	"contra", "$"
    msjB	db	"Bienvenido", "$"
    msjI	db	"Incorrecto", "$"

    EsperarTecla:

        mov     AH, 01h
        int     21h
        ret

    leerclave:

        xor     DI, DI
        xor     SI, SI

        while: 

            call    EsperarTecla
            cmp     AL, 0x0D
            je      exit
            call    comp
            mov     [300h+SI], AL
            inc     SI
            jmp     while
    exit:
        mov byte [300h+SI], "$"
        ret

    comp:

        cmp [contra + SI], AL
        je sum
        ret
    
    sum:

        inc DI
        ret
    
    escribirclave:

        cmp DI, SI
        ;Mostrar mensaje correcto
        mov 	AH, 09h
        mov 	DX, msjB

        jne incorrecto
        int 	21h
        ret

    incorrecto:
        mov 	AH, 09h
        mov 	DX, msjI
        int 	21h
        ret