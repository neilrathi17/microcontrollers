;    Write an 8051Assembly level program using interrupts to do the following: (a) Receive starting letter of your name as input data serially and sent it to P0,
;    (b) Have P1 port read and transmitted serially, and a copy given to P2,
;    (c) Make timer 0 generate a square wave of 5 kHz frequency on P3.2. 
;          Assume that XTAL-11.0592. Set the baud rate at 4800.

; label		mnemonics		Operands		comments
			ORG 			0
			LJMP 			MAIN
			ORG 			000BH        ;ISR for timer 0
			CPL 			P3.2         ;toggle P3.2
			RETI                         ;return from ISR
			ORG 			23H ;
			LJMP 			SERIAL       ;jump to serial interrupt ISR
			
			ORG 			30H
MAIN:       MOV 			P1,#0FFH             ;make P1 an input port
           ;MOV P0,#00H                                 ;make P0 an output port
			MOV 			TMOD,#22H            ;timer 0 and 1,mode 2(auto reload)
			MOV 			TH1,#-12           ;4800 baud rate
			MOV 			SCON,#50H            ;8-bit, 1 stop, ren enabled
			MOV 			TH0,#-184             ;for 5kHZ wave
			MOV 			IE,#10010010B          ;92H-enable serial int. & timer int.
			SETB 			TR1                  ;start timer 1
			SETB 			TR0                  ;start timer 0
BACK:       MOV 		    A,P1                    ;read data from port 1
			MOV 			SBUF,A         ;give a copy to SBUF			
			MOV 			P2,A             ;send it to P2
			SJMP 			BACK         ;stay in loop indefinitely
;-----------------SERIAL PORT ISR
			ORG 			100H
SERIAL:     JB 				TI,TRANS        ;jump if TI is high
			MOV 			A,SBUF         ;otherwise due to receive
			MOV 			P0,A             ;send serial data to P0
			CLR 			RI             ;clear RI since CPU doesn’t
			                 		;return from ISR
TRANS:      CLR 			TI             ;clear TI since CPU doesn’t
			RETI                 			;return from ISR
			END
