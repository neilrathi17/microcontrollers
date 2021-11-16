;Assume 8051 is connected to the PC and observe the incoming characters. As you press a key representing the last numerical value of your registration 
;number on the PC's keyboard, the character is sent to the 8051 serially at 4800 baud rate and is displayed on LEDs. The characters displayed on LEDs are
;in ASCII (binary). Assume that the 8051 serial port is connected to the COM port of IBM PC,  P1 and P2 of the 8051 are connected to LEDs and switches, 
;respectively.

;label	mnemonics	Operands		comments			

		ORG         0000H        
		MOV         P2,#0FFH        ;set P2 as input
        MOV         TMOD,#20H  		;timer 1 in mode 2
		MOV         TH1,#-12    ;4800 baud rate    
		MOV         SCON,#50H      ; set SCOn  
		SETB        TR1            ;start timer 1
CONTINUE:MOV        A ,P2          ;serial data transfer.
H_2:    JNB         RI,H_2         ;stay here until last bit
        MOV         SBUF,A         ;load the data
		CLR         RI             ;get ready for next char
        MOV         P1,A      		;move data from acc to P1
		SJMP    	CONTINUE
        END
