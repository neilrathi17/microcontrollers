; Develop an 8051 ALP with comments which checks the contents of 20H. If it is a negative number, then find its two’s complement value and store it in the
;same location.             
;label	mnemonics	Operands	comments		          			adressing mode		machine cycle 		memory byte 		type of instruction

		ORG			0000H		;assembler directive
		MOV			A,#00H		;clear accumulator
		MOV 		DPTR,#20H		;setting destination pointer
		MOV			R1,#20H
		MOVC		A,@A+DPTR		;loading value from memory into A
		CLR			C			;clear carry flag
		MOV 		R2,A		;store temp value
		RLC			A			;rotate left content of A
		JNC			POSTIVE		;jump if carry=1
		MOV			A,R2			;load original value into A
		CPL			A			;find complement of A if negative
		ADD			A,#01B		;add one to find 2's complement
		MOV			@R1,A		;move result to destination
POSTIVE:NOP						;no operation
HERE:	SJMP		HERE		;end
		

		ORG			20H
		DB			0FCH
		END