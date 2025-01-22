converter_r31:
    cpi r31, 0
    breq mostrar_zero
    cpi r31, 1
    breq mostrar_um
    cpi r31, 2
    breq mostrar_dois
    cpi r31, 3
    breq mostrar_tres
    cpi r31, 4
    breq mostrar_quatro
    cpi r31, 5
    breq mostrar_cinco
    cpi r31, 6
    breq mostrar_seis
    cpi r31, 7
    breq mostrar_sete
    cpi r31, 8
    breq mostrar_oito
    cpi r31, 9
    breq mostrar_nove
    
mostrar_zero:
    ldi r17, 0x3f
    out portc, r17

mostrar_um:
    ldi r17, 0x06
    out portc, r17

mostrar_dois:
    ldi r17, 0x5b
    out portc, r17

mostrar_tres:
    ldi r17, 0x4f
    out portc, r17
    
mostrar_quatro:
    ldi r17, 0x66
    out portc, r17

mostrar_cinco:
    ldi r17, 0x6d
    out portc, r17

mostrar_seis:
    ldi r17, 0x7d
    out portc, r17

mostrar_sete:
    ldi r17, 0x07
    out portc, r17

mostrar_oito:
    ldi r17, 0x7f
    out portc, r17

mostrar_nove:
    ldi r17, 0x6f
    out portc, r17
