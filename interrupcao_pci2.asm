interrupcao_pci2:
    sbic pind, 1
    rcall toggle_temporizador
    clr r27
    out PCIFR, r27
    reti

toggle_temporizador:
    lds r26, temporizador
    com r26
    sts temporizador, r26
    sbrc r26, 0
    sbi portd, 7
    sbrs r26, 0
    cbi portd, 7
    ret