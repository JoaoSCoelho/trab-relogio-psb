interrupcao_int0: ; muda a variável mostrar_horas_e_minutos de 0 para 1 e de 1 para 0
    lds r26, mostrar_horas_e_minutos ; carrega da memória em r26
    com r26 ; inverte todos os bits de r26
    sts mostrar_horas_e_minutos, r26 ; salva o valor intertido na memória
    
    ; lógica para acender o led na porta pd6 se mostrar_horas_e_minutos for 1
    sbrc r26, 0
    sbi portd, 6
    sbrs r26, 0
    cbi portd, 6

    ; limpa o registrador de flag da interrupcao
    clr r26
    out EIFR, r26
    reti ; retorna da interrupção