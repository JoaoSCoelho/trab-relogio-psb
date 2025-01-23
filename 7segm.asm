converter_r28:
    cpi r28, 0
    breq mostrar_zero
    cpi r28, 1
    breq mostrar_um
    cpi r28, 2
    breq mostrar_dois
    cpi r28, 3
    breq mostrar_tres
    cpi r28, 4
    breq mostrar_quatro
    cpi r28, 5
    breq mostrar_cinco
    cpi r28, 6
    breq mostrar_seis
    cpi r28, 7
    breq mostrar_sete
    cpi r28, 8
    breq mostrar_oito
    cpi r28, 9
    breq mostrar_nove
    
mostrar_zero:
    ldi r17, 0x3f
    out portc, r17
    RET

mostrar_um:
    ldi r17, 0x06
    out portc, r17
    RET

mostrar_dois:
    ldi r17, 0x5b
    out portc, r17
    RET

mostrar_tres:
    ldi r17, 0x4f
    out portc, r17
    RET

mostrar_quatro:
    ldi r17, 0x66
    out portc, r17
    RET

mostrar_cinco:
    ldi r17, 0x6d
    out portc, r17
    RET

mostrar_seis:
    ldi r17, 0x7d
    out portc, r17
    RET

mostrar_sete:
    ldi r17, 0x07
    out portc, r17
    RET

mostrar_oito:
    ldi r17, 0x7f
    out portc, r17
    RET

mostrar_nove:
    ldi r17, 0x6f
    out portc, r17
    RET

extratordehora:

extrator:
    clr r24
    mov r20,r29
    mov r21,r30
    mov r22,r31

extrator_loop:
    subi r22, 60
    inc r24
    brmi dec_r21

dec_r21:
    dec r21
    add 

    
