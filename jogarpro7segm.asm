mostrar_min_e_seg:
    ldi r18, 200

mostrar_min_e_seg_loop:
    rcall extrator
    lds r28, minutos
    rcall pensar_smart
    lds r28, segundos
    rcall pensar_smart
    dec r18
    brne mostrar_min_e_seg_loop
    RET

pensar_smart:
    rcall dividir_algarismos
    lds r28, dezena
    rcall converter_r28
    rcall delay
    lds r28, unidade
    rcall converter_r28
    rcall delay
    RET
