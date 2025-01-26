dividir_algarismos:
    clr r19

dividir_algarismos_loop:
    subi r28, 10
    inc r19
    brcs return_dividir_algarismos
    rjmp dividir_algarismos_loop

return_dividir_algarismos:
    dec r19
    subi r28, -10
    sts dezena, r19
    sts unidade, r28
    RET