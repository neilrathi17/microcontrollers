;Write a 8051 Assembly Language program to get your class serial number lab/theory ) data from the PC and display the sum of both on P1.  

;label	mnemonics	Operands		comments			

		ORG			0000H			;assembler directive
		MOV			TMOD,#20H		;timer 1 mode 2
		MOV			TH1,#-6			;set baud rate=4800
		MOV			P1,#00H
		MOV			SCON,#50H		;set TCON
		MOV			R6,4
		SETB		TR1				;start timer 1
HERE:  	JNB			RI,HERE			;check for buffer input
		MOV			A,SBUF			;move lab sl number from Serial buffer to A
		MOV			R1,A			;store temp value of A in R1
		MOV			P2,A			;display sl number on p2
		ADD			A,R1			; ADD sL numbers
		MOV			P1,A			;display sum on p1
		CLR			RI				;clear buffer for next input
		SJMP		HERE			;repeat 
		END		
