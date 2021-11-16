;Write and assemble a 8051 Assembly level program to toggle all the bits of P0, P1,P2 and P3 continuously by sending 55H and AAH to these ports. Put a time 
;delay 
;label	mnemonics	Operands			comments		          			
		ORG 		0000H				;assembler directive
HERE:   MOV 		P0,#55H				;send 1010101 to p0
		MOV 		P1,#55H				;send 1010101 to p1
		MOV 		P2,#55H				;send 1010101 to p2
		MOV 		P3,#55H				;send 1010101 to p3
		ACALL 		DELAY				;call delay subroutine
		MOV 		P0,#0AAH			;send 0101010 to p0
		MOV 		P1,#0AAH			;send 0101010 to p1
		MOV 		P2,#0AAH			;send 0101010 to p2
		MOV 		P3,#0AAH			;send 0101010 to p3
		ACALL 		DELAY				;call delay subroutine
		SJMP 		HERE				;repeat infinetely 
DELAY:  MOV 		R1,#06H    			; roll number =0624
BACK:   MOV 		R2,#24H    
AGAIN:  DJNZ 		R2,AGAIN			;repeat inner loop
		DJNZ 		R1,BACK				;repeat outter loop
		RET								;return to calling line
		END
