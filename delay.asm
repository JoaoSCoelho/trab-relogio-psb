delay:
	rcall delay0
	ret

delay0:
	ldi r21, 1      

delay1:
	ldi r22, 162

delay2:
	ldi r23, 98

delay3:
	dec r23
	brne delay3
	dec r22
	brne delay2
	dec r21
	brne delay1
	RET
