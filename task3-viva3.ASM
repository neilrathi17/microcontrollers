;Assume string of data is stored in code space starting at address 200 H as shown below MYDATA: “VIT VELLORE”. Write an 8051 ALP with comments to transfer
;this string of data in reverse order -“EROLLEV TIV” to RAM locations inside the CPU starting at 40H.

;label	mnemonics	Operands	comments		          adressing mode		machine cycle 		memory byte 		type of instruction
		ORG			000H
		MOV			A,#00H;		initialize acc=0	       immediate				1					3				data transfer
		MOV			DPTR,#020AH	;dptr=200=source	       immediate				1					3				data transfer	
		MOV			R1,#0BH     ;R1=22H=length of string   immediate				1					3				data transfer
		MOV			R0,#40H     ;destination is 40H		   immediate				1					3				data trasnfer
LOOP:	CLR 		A			;clear acc											1					1				boolean
		MOVC		A,@A+DPTR	;movc to access memory code							1					2				data trasnfer
		MOV			@R0,A		;data moved to memory		direct					1					1				data transfer
		ACALL		DECREMENT	;decrease memory location							1					1				arithmetic
		INC			R0			;increase location poiner							1					1				arithmetic
		DJNZ		R1,LOOP		;cont decreased,loop again							2					2				program branching
HERE:   SJMP		HERE        ; ALP completed 									2				 	2				program branching
DECREMENT:MOV 		A, DPL		;move lower nibble to A		direct					1					2				data transfer 
        SUBB 		A, #01 		;decrement A				immediate				2					1				arithmetic	
        JNC 		SKIP_DEC_DPTR; DPL is not zero									2					2				program branching
        MOV 		A, #0XFF 	;check is dpl=0				immediate				1					2				data transfer
        DEC 		DPH 		;decrement dph										1					1				arithmetic	parity			
SKIP_DEC_DPTR:
		MOV 		DPL, A 		;move decrement A to dpl	direct					1					2				data transfer
        RET 					;return to calling line								2					1				program branching
;---------------------------------------------------------------------------------------------------------------------------------
		ORG			0200H
		DB			"VIT VELLORE"
		END