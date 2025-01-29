extrator: ; função que extrai as horas, minutos e segundos a partir do contador total de segundos em r29:r30:r31
    rcall extrator_minuto ; extrai os segundos corretamente e os minutos totais restantes serão extraídos no extrator_hora  
    rcall extrator_hora ; extrai os minutos e as horas que restavam
    RET 

; Efetua múltiplas subtrações por 60 e conta a quantidade de subtrações, 
; essa quantidade será o total de minutos no dado momento do dia e o resto será o total de segundos
extrator_minuto: 
    ; r23:r24 serão usados para armezenas o total de minutos 
    clr r24
    clr r23

    ; é feito uma cópia dos registradores r29:r30:r31 para que possam ser alterados durante o processamento
    mov r20,r29
    mov r21,r30
    mov r22,r31

extrator_minuto_loop:
    subi r22, 60
    inc r24 ; quantidade de vezes que subtraiu, ou seja, resultado inteiro da divisao
    brcs dec_r21 ; decrementa r21 se o resultado da subtração for negativo
continuacao_extrator_minuto_loop: ; outras subrotinas voltam para esse ponto, já que não são chamadas com rcall
    cpi r24, 0 ; se r24 extrapolou seu limite (acabou voltando a zero), incrementa o mais significativo (r23)
    breq inc_r23
    rjmp extrator_minuto_loop ; caso contrário, continua a divisão

inc_r23: ; apenas incrementa r23 e continua a divisão
    inc r23
    rjmp extrator_minuto_loop

dec_r21:
    dec r21
    cpi r21, 255 ; se r21 diminuiu para aquém de zero, decrementa o menos significativo (r20)
    breq dec_r20
    rjmp continuacao_extrator_minuto_loop ; caso contrário, volta para continuar a rotina da divisão

dec_r20:
    dec r20
    cpi r20, 255 
    breq return_extrator_minuto ; se r20 diminuiu para aquém de zero, significa que a divisão chegou ao fim, e essa última subtração será desconsiderada.
    rjmp continuacao_extrator_minuto_loop ; caso contrário, volta para continuar a rotina da divisão

return_extrator_minuto:
    ; fim da divisão, desconsidera a última subtração, diminuindo o total de minutos em 1 e aumentando o total de segundos em 60
    dec r24
    cpi r24, 255
    breq dec_r23 ; como r24 e r23 trabalham juntos, pode ser que ao decrementar r24, aconteca um overflow, então decrementa r23
continuacao_return_extrator_minuto: ; ao decrementar r23, ele volta para esse ponto
    subi r22, -60 ; adiciona 60 ao total de segundos, como não há instrução para adicionar com valor imediato, adicionamos com subi de um número negativo (a + b = a - (-b))
    sts segundos, r22 ; armazena o total de segundos na variável segundos
    ret ; esse ret retorna a chamada à extrator_minuto

dec_r23:
    dec r23
    rjmp continuacao_return_extrator_minuto


; ---------

extrator_hora: ; 
    clr r25 ; usa r25 para contar a quantidade de horas

extrator_hora_loop: ; efetua múltiplas subtrações por 60 na quantidade total de minutos extraída da função anterior (r23:r24), e conta a quantidade de subtrações
    subi r24, 60
    inc r25 ; quantidade de vezes que subtraiu, ou seja, resultado inteiro da divisao
    brcs dec_r23_hora ; se o resultado da subtração for negativo, decrementa o mais significativo (r23)
continuacao_extrator_hora_loop:
    rjmp extrator_hora_loop

dec_r23_hora:
    dec r23
    cpi r23, 255
    breq return_extrator_hora ; se o resultado da subtração for negativo, significa que a divisão chegou ao fim, e essa última subtração será desconsiderada.
    rjmp continuacao_extrator_hora_loop ; caso contrário, volta para continuar a rotina da divisão

return_extrator_hora:
    dec r25 ; desconsidera a última subtração, diminuindo o total de horas em 1
    subi r24, -60 ; soma 60 ao total de minutos restantes para desconsiderar a ultima subtração
    sts minutos, r24 ; seta o valor dos minutos na variável minutos
    sts horas, r25 ; seta o valor das horas na variável horas
    ret ; esse ret retorna a chamada à extrator_hora