interrupcao_int0:
    lds r26, mostrar_horas_e_minutos
    com r26
    sts mostrar_horas_e_minutos, r26
    clr r26
    sts EIFR, r26
    reti