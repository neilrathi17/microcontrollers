; Write a 8051 Assembly level program using timer 1 mode 1 to generate a 1 kHz square wave frequency on one of the pins of P1. Then examine the 
;frequency using the oscilloscope in the keil simulator.    

;label	mnemonics	Operands	comments		          adressing mode		machine cycle 		memory byte 		type of instruction
		ORG			0000H						
		MOV			TMOD,#01H  	;initialise timer 0 into mode 1	direct				1						2				data transfer	
HERE:   MOV			TL0,#33H	;load lower bits into TL0		direct				1						2				data transfer
		MOV			TH0,#0FEH	;timer 0=FE33H=64614			direct				1						2				data transfer
		CPL			P1.0		;lternating value of p1.0 for square wave			1						1				boolean	
		ACALL		DELAY		;call delay subroutine								2						2				program branching	
		SJMP		HERE		;repeat infintely									2						2				program branching	
DELAY:  SETB		TR0			;start timer 0										1						1				boolean	
AGAIN:  JNB			TF0,AGAIN	;check for overflow into TF0						2						3				boolean	
		CLR			TR0			;clear TR0											1						1				boolean	parity flag
		CLR			TF0			;clear TF0 so timer can be re used					1						1				boolean	parity flag
		RET						;return to calling line								2						1				program branching	
		END						;end of ALP					