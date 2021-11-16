;Write an 8051Assembly level program to get data from a single bit(last digit of your reg.no.) of P1.2 and send it to P1.7 continuously while an interrupt
;will do the following: A serial interrupt service routine will receive your initial (example for dhanabal R- initial is R ) as data from a PC and display 
;it on P2 ports.

;label	mnemonics	Operands		comments		          
		ORG 		0000H      
		LJMP 		MAIN
		ORG 		0023H        ; serial interrupt vector table             
		LJMP 		SERIAL			;jump to seria;
		ORG 		0030H        ; after vector table space
MAIN:   SETB 		P1.2   		 ; P1.2 made as input pin
		MOV 		TMOD,#20H  	 ;timer 1 mode 2
		MOV 		TH1,#-6      ;-- set baud rate 9600
		MOV 		SCON ,#50H   ; -- one stop bit
		MOV 		IE,#10010000B  ; -- serial  int. enabled.
		SETB 		TR1  		  ;-- Timer 1 stared.
BACK:   MOV 		C,P1.2			;shift carry to p2
		MOV 		P1.7,C		 ;shift p1.7 to carry
		SJMP 		BACK
SERIAL: JB 			TI,TRANS	 ;call transfer subroutine
		MOV 		A,SBUF		 ;send data from serial buffer to A
		MOV 		P2,A		 ;move data from p2 to A
		CLR 		RI			 ;clear for next input

		RETI
TRANS:  CLR 		TI			;clear trasnfer interrupt
		RETI					;return calling
		END
	