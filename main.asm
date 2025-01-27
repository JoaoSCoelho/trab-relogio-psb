.INCLUDE "m328Pdef.inc"

.dseg
horas: .byte 1
minutos: .byte 1
segundos: .byte 1
dezena: .byte 1
unidade: .byte 1
mostrar_horas_e_minutos: .byte 1
temporizador: .byte 1

.cseg

.org 0x00 
rjmp reset

.org INT0addr
rjmp interrupcao_int0

.org PCI2addr
rjmp interrupcao_pci2

reset:
    ldi r16, 0xff
    out ddrc, r16
    out ddrb, r16
    ldi r16, 0b11000000
    out ddrd, r16

    ldi r16, 0b00111111
    out portd, r16

    ldi r16, 0b00000100
    sts PCICR, r16
    ldi r16, 0b00000010
    sts PCMSK2, r16

    ldi r16, 2 ; Habilita para borda de descida 00000010
    sts EICRA, r16
    ldi r16, 1 ; Habilita INT0
    out EIMSK, r16
    sei

    clr r16
    sts mostrar_horas_e_minutos, r16
    sts temporizador, r16

    rjmp main

main:
    ldi r31, 0
    ldi r30, 0
    ldi r29, 0

loop:
    rcall mostrar_min_e_seg

    lds r26, temporizador
    sbrc r26, 0
    rjmp loop_temporizador
    sbrs r26, 0
    rjmp loop_relogio

loop_temporizador:
    dec r31
    cpi r31, 255
    breq dec_r30
    rjmp loop

dec_r30:
    dec r30
    cpi r30, 255
    breq dec_r29
    rjmp loop

dec_r29:
    dec r29
    cpi r29, 255
    breq main
    rjmp loop

loop_relogio:
    inc r31
    breq inc_r30
    cpi r31, 128
    breq verifica_r30
    rjmp loop

inc_r30:
    inc r30
    breq inc_r29
    rjmp loop

inc_r29:
    inc r29
    rjmp loop

verifica_r30:
    cpi r30, 81
    breq verifica_r29
    rjmp loop

verifica_r29:
    cpi r29, 1
    breq main
    rjmp loop

.INCLUDE "7segm.asm"
.INCLUDE "delay.asm"
.INCLUDE "extrator.asm"
.INCLUDE "dividiremdoisnegocios.asm"
.INCLUDE "jogarpro7segm.asm"
.INCLUDE "interrupcao_int0.asm"
.INCLUDE "interrupcao_pci2.asm"