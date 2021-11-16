;Write a program to get a byte of hex data from P1, convert it to decimal, and then to ASCII. For example, if P1 has FBH, which is equal to 251 in decimal, 
;after conversion we will have 32H, 35H, and 31H. Place the ASCII result in RAM locations starting at 40H. 
;Using a simulator, single-step the program and examine the data.

;label	mnemonics	Operands	comments		          adressing mode		machine cycle 		memory byte 		type of instruction

							
		ORG			0000H					
		MOV			P1,#0ECH	;move value to port 1		direct					1					2					data transfer
		MOV			R0,#40H		;set pointer				direct					1					2					data transfer
		MOV			A,P1		;move data to accumulator	direct					1					2					data transfer
LOOP:	MOV			B,#10		;store 10 in B				direct					1					2					data transfer
		DIV			AB			;divide A and B to extract digit					4					1					arithmetic
		XCH			A,B			;swap 												1					1					boolean
		ADD			A,#30H		;convert to ascii			direct					1					2					arithmetic
		MOV			@R0,A		;move ascii to RAM location	register direct			1					2					data transfer
		XCH			A,B			;swap 												1					1					boolean
		INC			R0			;increase pointer									1					1					arithmetic
		JNZ			LOOP		;repeat												2					2					program branching
HERE:	SJMP		HERE		;alp ended											2					2					program branching
		END						