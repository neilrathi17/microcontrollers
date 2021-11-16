;Develop an 8051 ALP with comments which finds (FFFF)16+(FFFF)16   and give the result in BCD format.  

;label	mnemonics	Operands	comments		          			adressing mode		machine cycle 		memory byte 		type of instruction

								
		ORG			0000H		;assembler directive					
		MOV			A,#0FFH		;lower part of first number			immediate				1					2					data transfer
		MOV			B,#0FFH		;lower part of second number		immediate				1					2					data transfer
		ADD			A,B			;add lower parts of both numbers	direct					1					2					arithmetic
		DA			A			;convert to BCD												1					1					arithmetic
		MOV			R1,A		;store result in r1					direct					1					2					data transfer
		MOV			A,#0FFH		;higher part of first number		immediate				1					2					data transfer
		MOV			B,#0FFH		;higher part of second number		immediate				1					2					data transfer
		ADDC		A,B			;adding lower parts of both numbers	direct					1					2					arithmetic	
		DA			A			;convert to BCD												1					1					airthmetic
		MOV			R2,A		;move result into R2				direct					1					2					data transfer	
HERE:	SJMP		HERE		;end														2					2					program branching
		END							