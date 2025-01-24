.INCLUDE "m328Pdef.inc"

.org 0x00 
rjmp reset

reset:
    ldi r16, 0xff
    out ddrc, r16
    rjmp main

main:
    ldi r31, 0b00011100
    ldi r30, 0b00000010
    ldi r29, 0

loop:
    rcall extrator_hora
    mov r28, r24
    rcall converter_r28
    rcall delay
    
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

verifica_r29:
    cpi r29, 1
    breq main

.INCLUDE "7segm.asm"
.INCLUDE "delay.asm"