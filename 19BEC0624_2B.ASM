;Add  the  following  subroutine  to  the  8051  Assembly  level  program  1,    single-step through the subroutine and examine the RAM locations.
;After data has been transferred from ROM space into RAM, the subroutine should copy the data from RAM locations starting  at 40H to RAM locations starting at 60H.
		;label	mnemonics	Operands	comments		          adressing mode		machine cycle 		memory byte 		type of instruction
				ORG			000H
				MOV			A,#00H;		initialize acc=0	       immediate				1					3				data transfer
				MOV			DPTR,#0200H	;dptr=200=source	       immediate				1					3				data transfer	
				MOV			R0,#22H     ;R1=22H=length of string   immediate				1					3				data transfer
				MOV			R1,#40H     ;destination is 40H		   immediate				1					3				data trasnfer
		LOOP:	CLR 		A			;clear acc											1					1				boolean
				MOVC		A,@A+DPTR	;movc to access memory code	index					1					2				data trasnfer
				MOV			@R1,A		;data moved to memort		direct					1					1				data transfer
				INC			DPTR		;increase memory location							1					1				arithmetic
				INC			R1			;increase location poiner							1					1				arithmetic
				DJNZ		R0,LOOP		;cont decreased,loop again							2					2				program branching
		;----------------------------------------------------------------------------------------------
				MOV 		R0,#40H    ;source pointer set			immediate				1					3				data transfer
				MOV         R1,#60H	   ;destination pointer set		immediate				1					3				data transfer
				MOV			R3,#22H	    ;length for string			immediate				1					3				data transfer
		LOOP2:	MOV			A,@R0		;load from source to ACC
				MOV      	@R1,A		;load from ACC to destination direct
				INC			R1			;increase destination pointer						1					1				arithmetic
				INC			R0			;increase source pointer							1					1				arithmetic
				DJNZ		R3,LOOP2    ;decrement count and begin loop						2					2				program branch
				HERE:	SJMP		HERE		;ALP Ended
		;----------------------------------------------------------------------------------------------
				ORG			0200H
				DB			"L33L34 22 19BEC0624 Neil Rathi"
				END