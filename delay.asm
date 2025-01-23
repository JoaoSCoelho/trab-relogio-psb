delay:
	ldi r21, 100          	
delay1:
	ldi r22, 120
delay2:
	ldi r23, 200
delay3:
	dec r23
	brne delay3
	dec r22
	brne delay2
	dec r21
	brne delay1
	RET
