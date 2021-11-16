;1.    Write a 8051 Assembly level program to transfer a string of data from code space 
;starting at address 200H to RAM locations starting at 40H. The data is as shown below: 
                     ;0200H: DB    "L33L34 22 19BEC0624 VIT UNIVERSITY" 
;Using the simulator, single-step through the program and examine the data transfer and registers. 
;label	mnemonics	Operands	comments		          adressing mode		machine cycle 		memory byte 		type of instruction
		ORG			000H
		MOV			A,#00H;		initialize acc=0	       immediate				1					3				data transfer
		MOV			DPTR,#0200H	;dptr=200=source	       immediate				1					3				data transfer	
		MOV			R1,#22H     ;R1=22H=length of string   immediate				1					3				data transfer
		MOV			R0,#40H     ;destination is 40H		   immediate				1					3				data trasnfer
LOOP:	CLR 		A			;clear acc											1					1				boolean
		MOVC		A,@A+DPTR	;movc to access memory code							1					2				data trasnfer
		MOV			@R0,A		;data moved to memort								1					1				data transfer
		INC			DPTR		;increase memory location							1					1				arithmetic
		INC			R0			;increase location poiner							1					1				arithmetic
		DJNZ		R1,LOOP		;cont decreased,loop again							2					2				program branching
HERE:   SJMP		HERE        ; ALP completed																			program branching
;---------------------------------------------------------------------------------------------------------------------------------
		ORG			0200H
		DB			"L33L34 22 19BEC0624 VIT UNIVERSITY"
		END