;Write a program to send the message “I,<theory slot><theory sl.no.><your name>  assure you that I will answer all my ALP in tabular column with algorithm ,
;manual calculation and flowchart in CAT II and TERM END EXAM” to the serial port. Assume a SW is connected to pin P1.2.
;Monitor its status and set the baud rate as follows:
;SW = 0, 4800 baud rate SW = 1, 9600 baud rate Assume XTAL = 11.0592 MHz, 8-bit data, and 1 stop bit.

;label	mnemonics	Operands		comments			adressing mode			machine cycle 	Machine Byte	type of instruction
		SW BIT 		P1.2
		ORG 		0H				 ;starting position
MAIN:
		MOV 		TMOD,#20H
		MOV 		TH1,#-6       ;4800 baud rate (default)
		MOV 		SCON,#50H
		SETB 		TR1
		SETB 		SW             	;make SW an input
S1:     JNB 		SW,SLOWSP       ;check SW status
		MOV 		A,PCON         	;read PCON
		SETB		ACC.7         	;set SMOD high for 9600
		MOV 		PCON,A         	;write PCON
		SJMP 		OVER         	;send message
SLOWSP:
		MOV 		A,PCON         	;read PCON
		SETB 		ACC.7           ;set SMOD low for 4800
		MOV 		PCON,A         	;write PCON
OVER:   MOV 		DPTR,#MESS1     ;load address to message
FN:     CLR 		A
		MOVC 		A,@A+DPTR       ;read value
		JZ 			S1              ;check for end of line
		ACALL 		SENDCOM         ;send value to serial port
		INC 		DPTR            ;move to next value
		SJMP 		FN              ;repeat
;--------------------------------------------------------------------------------------------------------------------
SENDCOM:
		MOV 		SBUF,A          ;place value in buffer
HERE:   JNB 		TI,HERE         ;wait until transmitted
		CLR 		TI              ;clear
		RET                     	;return

MESS1:DB "I,22,19BEC0624,NEIL RATHI ,will draw CWF ,interface diagrams ,and calculate delay or count value for timer ,serial and interrupt programs in ECE3004 LAB and THEORY CAT and FAT Exam"
		END		