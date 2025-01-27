interrupcao_int0:
    lds r26, mostrar_horas_e_minutos
    com r26
    sts mostrar_horas_e_minutos, r26
    sbrc r26, 0
    sbi portd, 6
    sbrs r26, 0
    cbi portd, 6

    clr r26
    out EIFR, r26
    reti