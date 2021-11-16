;Assume there are ten bytes of data stored in External RAM starting from 2000H onwards. Write an 8051 ALP with comments which checks the data bytes are 
;odd/even. If the data byte is odd then store the same starting from 30H address location of internal RAM else store the data byte starting from 50H in
;the internal RAM. 
;label	mnemonics	Operands		comments		          				adressing mode			machine cycle 		memory byte 		type of instruction
		ORG			000H			;assembler directive
		MOV 		DPTR,#2000H		;set DPTR to data location
		MOV			R3,#0AH			;R0 count is 10
		MOV			R1,#30H			;pointer for odd data
		MOV 		R0,#50H			;pointer for even data
LOOP:	CLR			A				;clear accumulator
		MOVC		A,@A+DPTR		;get data from code memory
		MOV			B,#02H			;for division
		MOV			R4,A			;store the data temporarily
		DIV			AB				;divide A and B
		MOV 		R2,B			;move the remainder
		MOV 		A,R4			;move data back to accumulator
		CJNE		R2,#00H,ODD		;check for remainder =1
		MOV			@R0,A			;Move odd data to 30H
		INC			R0				;increase pointer
		INC			DPTR			;increase source pointer
		DJNZ		R3,LOOP			;loop back
ODD:	MOV			@R1,A			;Move odd data to 30H
		INC			R1				;increase pointer
		INC			DPTR			;increase source pointer
		DJNZ		R3,LOOP			;loop back
HERE:	SJMP		HERE			;end ALP
;------------------------------------------------------------------------------------------
		ORG			2000H
		DB			00H,01H,09H,0BH,0EH,0CH,00H,06H,02H,04H
		END
		
		
		