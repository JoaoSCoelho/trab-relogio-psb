mostrar_min_e_seg: ; mostra os minutos e os segundos ou horas e os minutos por 1s nos 4 displays 
    ldi r18, 100    ; loop de 100 vezes

mostrar_min_e_seg_loop:
    rcall extrator ; seta nas variáveis horas, minutos e segundos, valores de 0-23 e 0-59 respectivamente
    lds r26, mostrar_horas_e_minutos ; carrega da memória em r26
    ; se r26 (mostrar_horas_e_minutos) for 0, nos displays da esquerda, mostra os minutos, se for 1, mostra as horas
    sbrs r26, 0
    lds r28, minutos
    sbrc r26, 0
    lds r28, horas
    ; r20 é booleano, se 0 mostrar os dois displays da esquerda, se 1 mostrar os dois da direita
    ldi r20, 0x00  ; mostra os dois displays da esquerda
    rcall pensar_smart
    ; se r26 (mostrar_horas_e_minutos) for 0, nos displays da direita, mostra os segundos, se for 1, mostra os minutos
    sbrs r26, 0
    lds r28, segundos
    sbrc r26, 0
    lds r28, minutos
    ldi r20, 0x01 ; mostra os dois displays da direita
    rcall pensar_smart

    ; verificação do loop
    dec r18
    brne mostrar_min_e_seg_loop
    RET


; Mostra o valor de r28 (horas | minutos | segundos) em dois displays, a dezena e a unidade. 
; Se r20 for 0, mostra nos displays da esquerda, se for 1, mostra nos displays da direita
pensar_smart: 
    rcall dividir_algarismos ; divide o número em r28 em dezena e unidade e seta nas variáveis de dezena e unidade
    lds r28, dezena ; coloca o valor da dezena em r28
    ; habilita o display da dezena da esquerda se r20 for 0, da direita se for 1
    sbrc r20, 0 
    rcall habilitar_dezena_direita
    sbrs r20, 0
    rcall habilitar_dezena_esquerda
    rcall converter_r28 ; mostra a dezena no display correspondente
    rcall delay ; aguarda um pouco
    lds r28, unidade ; coloca o valor da unidade em r28
    ; habilita o display da unidade da esquerda se r20 for 0, da direita se for 1
    sbrc r20, 0 
    rcall habilitar_unidade_direita
    sbrs r20, 0 
    rcall habilitar_unidade_esquerda
    rcall converter_r28 ; mostra a unidade no display correspondente
    rcall delay ; aguarda um pouco
    RET




; Os códigos abaixo habilitam os displays com base nos pinos da porta B.
; Sempre, apenas um pino dos 4 usados (PB0 - PB3) deve estar em 0.
; | display                     | PB0 | PB1 | PB2 | PB3 | descrição           |
; | --------------------------- | --- | --- | --- | --- | ------------------- |
; | display0 (mais a esquerda)  |  0  |  1  |  1  |  1  | dezena da esquerda  |
; | display1 (segundo display)  |  1  |  0  |  1  |  1  | unidade da esquerda |     
; | display2 (terceiro display) |  1  |  1  |  0  |  1  | dezena da direita   |
; | display3 (mais a direita)   |  1  |  1  |  1  |  0  | unidade da direita  |

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
