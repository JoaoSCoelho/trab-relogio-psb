extrator:
    rcall extrator_minuto
    rcall extrator_hora

extrator_minuto:
    clr r24
    clr r23
    mov r20,r29
    mov r21,r30
    mov r22,r31

extrator_minuto_loop:
    subi r22, 60
    inc r24 ; quantidade de vezes que subtraiu, ou seja, resultado inteiro da divisao
    brcs dec_r21 ; pula se o resultado da subtração for negativo
continuacao_extrator_minuto_loop:
    cpi r24, 0
    breq inc_r23
    rjmp extrator_minuto_loop

inc_r23:
    inc r23
    rjmp extrator_minuto_loop

dec_r21:
    dec r21
    ldi r16, 255
    add r22, r16
    inc r22
    cpi r21, 255
    breq dec_r20
    rjmp continuacao_extrator_minuto_loop

dec_r20:
    dec r20
    ldi r16, 255
    add r21, r16
    inc r21
    cpi r20, 255
    breq return_extrator_minuto
    rjmp continuacao_extrator_minuto_loop

return_extrator_minuto:
    dec r24
    cpi r24, 255
    breq dec_r23
continuacao_return_extrator_minuto:
    sts minutos, r24
    subi r22, -60
    sts segundos, r22
    ret

dec_r23:
    dec r23
    rjmp continuacao_return_extrator_minuto


extrator_hora:
    clr r25
    mov r20, r23
    mov r21, r24

extrator_hora_loop:
    subi r21, 60
    inc r25 ; quantidade de vezes que subtraiu, ou seja, resultado inteiro da divisao
    brcs dec_r20_hora ; pula se o resultado da subtração for negativo
continuacao_extrator_hora_loop:
    cpi r25, 0
    breq inc_r23
    rjmp extrator_hora_loop

dec_r20_hora:
    dec r20
    ldi r16, 255
    add r21, r16
    inc r21
    cpi r20, 255
    breq return_extrator_hora
    rjmp continuacao_extrator_hora_loop
