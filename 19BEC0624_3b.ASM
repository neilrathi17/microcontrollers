;Write a 8051 Assembly level program using timer 0 mode 1 to generate a 500Hz square wave frequency on one of the pins of P1. Then examine the
;frequency using the oscilloscope in the keil simulator.
;Repeat 1 and 2 for the multiplication of your reg.no. digits excluding 0 with class serial no. micro hz frequency. Eg.  19BEC0624=9*9*11*14*12*6*2*4 =   
;798336 micro Hz= 1.252ms
;TL0,#0BEH TH0,#0FDH
;label	mnemonics	Operands		comments		          			
		ORG			0000H	
		MOV			TMOD,#01H  		;initialise timer 0 into mode 1
HERE:   MOV			TL0,#066H		;load lower bits into TL0
		MOV			TH0,#0FCH		;timer 0=FC66H=64614
		CPL			P1.0			;alternating value of p1.0 for square wave
		ACALL		DELAY			;call delay subroutine
		SJMP		HERE			;repeat infintely
DELAY:  SETB		TR0				;start timer 0
AGAIN:  JNB			TF0,AGAIN		;check for overflow into TF0
		CLR			TR0				;clear TR0
		CLR			TF0				;clear TF0 so timer can be re used
		RET							;return to calling line
		END							;end of ALP
			
			
		

