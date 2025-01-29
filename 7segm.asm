converter_r28: ; faz um "switch" com todos os possíveis dígitos de 0 a 9 que podem ser mostrados no display
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
    

; Para cada uma das funções "mostrar_x" abaixo, é setada na porta C a sequência correta para exibir o dígito correspondente nos segmentos do display (cátodo comum)
; | dígito |         sequência        |
; |        | hexadecimal |  binario   |
; | ------ | ----------- | ---------- |
; |   0    |    0x3f     | 0b00111111 |
; |   1    |    0x06     | 0b00000110 |
; |   2    |    0x5b     | 0b01011011 |
; |   3    |    0x4f     | 0b01001111 |
; |   4    |    0x66     | 0b01100110 |
; |   5    |    0x6d     | 0b01101101 |
; |   6    |    0x7d     | 0b01111101 |
; |   7    |    0x07     | 0b00000111 |
; |   8    |    0x7f     | 0b01111111 |
; |   9    |    0x6f     | 0b01101111 |

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

   
