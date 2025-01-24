extrator_minuto:
    clr r24
    mov r20,r29
    mov r21,r30
    mov r22,r31

extrator_minuto_loop:
    subi r22, 60
    inc r24 ; quantidade de vezes que subtraiu, ou seja, resultado inteiro da divisao
    brcs dec_r21 ; branch if negative
    rjmp extrator_minuto_loop

dec_r21:
    dec r21
    ldi r16, 255
    add r22, r16
    inc r22
    cpi r21, 255
    breq dec_r20
    rjmp extrator_minuto_loop

dec_r20:
    dec r20
    ldi r16, 255
    add r21, r16
    inc r21
    cpi r20, 255
    breq return_extrator_minuto
    rjmp extrator_minuto_loop

return_extrator_minuto:
    dec r24
    sts minutos, r24
    ret