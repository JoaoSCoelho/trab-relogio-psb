.INCLUDE "m328Pdef.inc"

.dseg ; define variáveis
; horas, minutos e segundos são setadas pelo extrator
horas: .byte 1 ; 0-24
minutos: .byte 1 ; 0-60
segundos: .byte 1 ; 0-60
; dezena e unidade são setadas pelo dividir_algarismos
dezena: .byte 1 ; 0-9
unidade: .byte 1 ; 0-9
; mostrar_horas_e_minutos é setada pelo interrupcao_int0
mostrar_horas_e_minutos: .byte 1 ; booleano 0 ou 1 (em todos os bits)
temporizador: .byte 1 ; booleano 0 ou 1 (em todos os bits)

.cseg ; código

.org 0x00 
rjmp reset

.org INT0addr
rjmp interrupcao_int0

.org PCI2addr
rjmp interrupcao_pci2

reset: ; faz as configurações iniciais
    ; define os pinos de entrada/saida
    ldi r16, 0xff
    out ddrc, r16 ; porta C todos os pinos sao saida
    out ddrb, r16 ; porta B todos os pinos sao saida
    ldi r16, 0b11000000
    out ddrd, r16 ; porta D os dois últimos pinos sao entrada e o restante é saída

    ldi r16, 0b00111111
    out portd, r16 ; ativa pull-up nos 6 primeiros pinos da porta D

    ; configura interrupção por mudança de bit
    ldi r16, 0b00000100
    sts PCICR, r16 ; habilita interrupção na porta D (PCIE2)
    ldi r16, 0b00000010
    sts PCMSK2, r16 ; habilita interrupção no pino PD1 (PCINT17)

    ; configura a interrupção externa INT0
    ldi r16, 2 
    sts EICRA, r16 ; Habilita para borda de descida 00000010 (ICS01 = 1, ICS00 = 0)
    ldi r16, 1 
    out EIMSK, r16 ; Habilita interrupção INT0
    
    sei ; Habilita interrupção global

    ; limpa as variáveis
    clr r16
    sts mostrar_horas_e_minutos, r16
    sts temporizador, r16

    rjmp main

main:
    ; Os três registradores serão usados para contar os segundos de um dia inteiro
    ldi r31, 0 ; menos significativo
    ldi r30, 0 ; medio significativo
    ldi r29, 0 ; mais significativo

loop: ; loop de contagem de segundos
    rcall mostrar_min_e_seg ; mostra os minutos e os segundos por um período de 1s

    lds r26, temporizador ; verifica se o temporizador está ativado
    sbrc r26, 0
    rjmp loop_temporizador ; se o temporizador estiver ativado, executa loop_temporizador
    sbrs r26, 0
    rjmp loop_relogio ; se o temporizador estiver desativado, executa loop_relogio

loop_temporizador:
    dec r31
    cpi r31, 255
    breq dec_r30 ; se r31 diminuiu para além de 0, decrementa do byte mais significativo (r30)
    rjmp loop ; se não, continua a contagem

dec_r30:
    dec r30
    cpi r30, 255
    breq dec_r29 ; se r30 diminuiu para além de 0, decrementa do byte menos significativo (r29)
    rjmp loop ; se não, continua a contagem

dec_r29:
    dec r29
    cpi r29, 255
    breq main ; se r29 diminuiu para além de 0, volta ao inicio e o temporizador fica travado em 0
    rjmp loop ; se não, continua a contagem

loop_relogio:
    inc r31
    breq inc_r30 ; se r31 aumentou para além de 255, incrementa do byte mais significativo (r30)
    cpi r31, 128
    breq verifica_r30 ; sabemos que exatamente em 24h, o r31 está em 128, por isso, verificamos se os outros registradores estão em seus respectivos valores para 24h e se eles estiverem, zeramos a contagem
    rjmp loop

inc_r30:
    inc r30
    breq inc_r29 ; se o byte mais significativo (r30) aumentou para além de 255, incrementa o byte menos significativo (r29)
    rjmp loop

inc_r29:
    inc r29
    rjmp loop

verifica_r30:
    cpi r30, 81
    breq verifica_r29 ; se os outros registradores estiverem em seus respectivos valores para 24h, zeramos a contagem
    rjmp loop

verifica_r29:
    cpi r29, 1
    breq main ; zera a contagem, pq atingiu 24h
    rjmp loop ; se não atingiu 24h, continua a contagem normalmente

.INCLUDE "7segm.asm"
.INCLUDE "delay.asm"
.INCLUDE "extrator.asm"
.INCLUDE "dividiremdoisnegocios.asm"
.INCLUDE "jogarpro7segm.asm"
.INCLUDE "interrupcao_int0.asm"
.INCLUDE "interrupcao_pci2.asm"