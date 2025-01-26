mostrar_min_e_seg:
    ldi r18, 80

mostrar_min_e_seg_loop:
    rcall extrator ; seta nas variáveis horas, minutos e segundos, valores de 0-24 e 0-60 respectivamente
    lds r28, minutos
    ldi r20, 0x00  ; r20 é booleano, se 0 mostrar os dois displays da esquerda, se 1 mostrar os dois da direita
    rcall pensar_smart
    lds r28, segundos
    ldi r20, 0x01
    rcall pensar_smart
    dec r18
    brne mostrar_min_e_seg_loop
    RET

pensar_smart:
    rcall dividir_algarismos ; divide o número em dezena e unidade
    lds r28, dezena
    sbrc r20, 0 ; habilita o display da dezena da esquerda se r20 for 0, da direita se for 1
    rcall habilitar_dezena_direita
    sbrs r20, 0
    rcall habilitar_dezena_esquerda
    rcall converter_r28 ; mostra a dezena
    rcall delay
    lds r28, unidade
    sbrc r20, 0 ; habilita o display da unidade da esquerda se r20 for 0, da direita se for 1
    rcall habilitar_unidade_direita
    sbrs r20, 0 
    rcall habilitar_unidade_esquerda
    rcall converter_r28 ; mostra a unidade
    rcall delay
    RET


habilitar_dezena_esquerda:
    ldi r16, 0b11111110
    out portb, r16
    RET

habilitar_unidade_esquerda:
    ldi r16, 0b11111101
    out portb, r16
    RET

habilitar_dezena_direita:
    ldi r16, 0b11111011
    out portb, r16
    RET

habilitar_unidade_direita:
    ldi r16, 0b11110111
    out portb, r16
    RET
