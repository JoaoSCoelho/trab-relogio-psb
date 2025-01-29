interrupcao_pci2: ; muda a variável temporizador de 0 para 1 e de 1 para 0
    sbic pind, 1 ; verifica se o pino de interrupção 1 (PD1) está 0, se sim, nao alterna o bit (pois queremos apenas a interrupção na borda de subida, ou seja, quando o bit for 1)
    rcall toggle_temporizador ; caso o bit seja 1, chama a função toggle_temporizador
    
    ; limpa o registrador de flag da interrupção
    clr r27
    out PCIFR, r27
    reti ; retorna da interrupção

toggle_temporizador: ; alterna o valor da variável temporizador
    lds r26, temporizador ; carrega da memória em r26
    com r26 ; inverte todos os bits de r26
    sts temporizador, r26 ; salva o valor invertido na memória
    
    ; lógica para acender o led na porta pd7 se temporizador for 1
    sbrc r26, 0
    sbi portd, 7
    sbrs r26, 0
    cbi portd, 7

    ret