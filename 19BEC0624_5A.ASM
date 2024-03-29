;Write an 8051Assembly level program to get your serial number as input data from port P0 and send it to port P1 continuously while an interrupt will do the 
;following: Timer 0 will toggle the P2.1 bit every 100 microseconds.

;label	mnemonics	Operands	comments		        	
		ORG 		0000H
		LJMP 		MAIN           ;Jump to main.
		ORG 		000BH          ; timer 0 Interrupt vector label
		CPL 		P2.1           ; Toggle P2.1 pin
		RETI                       ;Return from ISR
		ORG 		0030H          ;After Vector Table Space
MAIN:   MOV 		TMOD,#02H      ;set Timer 0 in mode 2
		MOV 		P0,#0FFH       ; Set P0  an I/P  port
		MOV 		TH0,#-184               // 
		MOV 		IE,#10000010B  ; enable Timer 0
	    SETB 		TR0            ; Start the Timer
BACK:   MOV 		A,P0           ; Get data from P0.
		MOV 		P1,A           ; move data P0 to P1
		SJMP 		BACK           ;Loop it Unless interrupted 
		END 
    
