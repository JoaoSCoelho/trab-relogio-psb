; antes de usar essa rotina, deve-se setar no registrador r28 o número a ser dividido, o número obrigatoriamente deve estar entre 0 e 99
dividir_algarismos:
    clr r19

dividir_algarismos_loop: ; efetua múltiplas subtrações por  10 e conta a quantidade de subtrações
    subi r28, 10
    inc r19 ; conta a quantidade de subtrações
    brcs return_dividir_algarismos ; pula se o resultado da subtração for negativo
    rjmp dividir_algarismos_loop ; se nao, continua a contagem

return_dividir_algarismos:
    ; faz ajustes nos registradores de dezena e unidade
    dec r19
    subi r28, -10 

    ; seta os valores nas variáveis
    sts dezena, r19
    sts unidade, r28
    RET