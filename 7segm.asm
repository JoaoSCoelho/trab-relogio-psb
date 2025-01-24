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


extrator_hora:
    clr r24
    mov r20,r29
    mov r21,r30
    mov r22,r31
    

extrator_hora_loop:
    subi r22, 60
    inc r24 ; quantidade de vezes que subtraiu, ou seja, resultado inteiro da divisao
    brcs dec_r21 ; branch if negative
    rjmp extrator_hora_loop

dec_r21:
    dec r21
    ldi r16, 255
    add r22, r16
    inc r22
    cpi r21, 255
    breq dec_r20
    rjmp extrator_hora_loop

dec_r20:
    dec r20
    ldi r16, 255
    add r21, r16
    inc r21
    cpi r20, 255
    breq return_extrator_hora
    rjmp extrator_hora_loop

return_extrator_hora:
    dec r24
    ret

    
