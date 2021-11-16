;PROJECT CODE FOR GROUP 7
; Ananya Anil Tirumala , Ishita Kethireddy, Neil Rathi
;label	mnemonics	Operands				comments	
		  ORG 		000H
		  MOV 		DPTR,#LOOKUP            ; moves the addres of LUT to DPTR		
		  MOV 		P1,#00000000B           ;Sets P1 as an output port
		  MOV 		P0,#00000000B           ; Sets P0 as an output port
	MAIN: MOV 		R6,#0EH					; set R6 to 14
		  SETB 		P3.5					;set reciever port for timer1
		  MOV 		TMOD,#01100001B  		;Sets Timer1 as Mode2 counter & Timer0 as Mode1 timer
		  MOV 		TL1,#00H   				;loads initial value to TL1
		  MOV 		TH1,#00H   				;loads initial value to TH1
		  SETB 		TR1             		; starts timer(counter) 1
	BACK: MOV 		TH0,#00H   				;loads initial value to TH0
		  MOV 		TL0,#00H   				;loads initial value to TL0
		  SETB 		TR0             		;starts timer 0
	HERE: JNB 		TF0,HERE         		; checks for Timer 0 roll over
		  CLR 		TR0             		; stops Timer0
		  CLR 		TF0              		; clears Timer Flag 0
		  DJNZ		R6,BACK					;repeat timer 0 to FFFFH 14 times for 1 second
		  CLR 		TR1              		; stops Timer(counter)1
		  CLR 		TF0              		; clears Timer Flag 0
		  CLR 		TF1              		; clears Timer Flag 1
		  ACALL 	DLOOP          			; Calls subroutine DLOOP for displaying the count
		  SJMP 		MAIN           			; jumps back to the main loop
	DLOOP: MOV 		R5,#64H					;repeat 100 times
	BACK1: MOV 		A,TL1           		; loads the current count to the accumulator
		   MOV 		B,#100D					; move 100 to B to divide A by
		   DIV 		AB              		; isolates the first digit of the count
		   SETB 	P1.0					;set p1.0 to high to trigger first display
		   ACALL 	DISPLAY       			; converts the 1st digit to 7 seg pattern
		   MOV 		P0,A            		; puts the pattern to Port 0
		   ACALL 	DELAY         			; 1mS delay
		   ACALL 	DELAY					
		   MOV 		A,B						;move remainder to A to extract second digit
		   MOV 		B,#10D					;divide A by 10 to get second digit
		   DIV 		AB              		;isolates the secong digit of the count
		   CLR 		P1.0					;remove p1.0 trigger
		   SETB 	P1.1					;trigger p1.1 trigger
		   ACALL 	DISPLAY       			;converts the 2nd digit to 7 seg pattern
		   MOV 		P0,A					;send second digit to port 0
		   ACALL 	DELAY					;0.5ms delay
		   ACALL 	DELAY					;0.5ms delay
		   MOV 		A,B             		; moves the last digit of the count to accumulator
		   CLR 		P1.1					;remove trigger from p1.1
		   SETB 	P1.2					;trigger p1.2 for third digit
		   ACALL 	DISPLAY       			; converts the 3rd digit to 7 seg pattern
		   MOV 		P0,A					;move third digit to p0
		   ACALL 	DELAY					;0.5ms delay
		   ACALL 	DELAY					;0.5ms delay
		   CLR 		P1.2					;clear p1.2 trigger
		   DJNZ 	R5,BACK1       			; repeats the subroutine DLOOP 100 times
		   RET								;return to calling function

DELAY: 	   MOV 		R7,#0FAH        		; 1mS delay
 DEL1:     DJNZ 	R7,DEL1
           RET

DISPLAY:   MOVC 	A,@A+DPTR    			; gets 7 seg digit drive pattern for current value in A
                  							
           RET
LOOkUP:    	 ;DB 0C0H,0F9H,0A4H,0B0H,99H,92H,82H,0F8H,80H,90H			;english lookup table
			 DB 40H,79H,24H,30H,19H,12H,20H,78H,00H,10H
			;DB 0C0H,098H,0A4H,0B0H,081H,091H,086H,083H,0c3H,84H		; hindi lookup table
			END