;Write an 8051 assembly level program to transfer your sl.no.,reg.no.,name as data serially at baud rate 9600 with 8 bit data, one stop bit and observe
;the transmitted data in the serial window of the simulator.

;label	mnemonics	Operands		comments			
		ORG			0000H			;assembler directive
	XX:	MOV			DPTR,#MYDATA	;initialise DPTR
		MOV			TMOD,#20H		;Set timer to mode 2 
		MOV			TH1,#-3		;Set Baude rate=9600
		MOV			SCON,#50H	;	Set serial port specifier
		SETB		TR1				;Start Timer 1
		MOV			R1,#19H			;set loop counter
AGAIN:	CLR			A				;clear accumulator for next letter
		MOVC		A,@A+DPTR		;move data from memory to A
		MOV			SBUF,A			;move data from A to serial buffer
HERE:	JNB			TI,HERE			;check for overflow
		CLR			TI				;reset serial buffer
		INC			DPTR			;increase DPTR for next value
		DJNZ		R1,AGAIN		;repeat for next valye
		SJMP		XX				;repeat infintelely 
MYDATA: DB "I,22,19BEC0624,NEIL RATHI ,will draw CWF ,interface diagrams ,and calculate delay or count value for timer ,serial and interrupt programs in ECE3004 LAB and THEORY CAT and FAT Exam"
END  
