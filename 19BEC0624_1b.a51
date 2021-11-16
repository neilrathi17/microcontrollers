;Write and assemble an 8051 Assembly level program to load values into each of registers R0 - R4 and then push each of these registers onto the stack. 
;Single-step the program, and examine the stack and the SP register after the execution of each instruction.
;label	mnemonics	Operands     comments		 		adressing mode		machine cycle required		memory byte required		type of instruction

		ORG			0000H															
		MOV 		R0,#01H		;loading value into R0		immediate				1						3						Data transfer	
		MOV 		R1,#9BH		;loading value into R1		immediate				1						3						Data transfer
		MOV 		R2,#0ECH	;loading value into R2  	immediate				1						3						Data transfer					
		MOV 		R3,#06H		;loading value into R3		immediate				1						3						Data transfer							
		MOV 		R4,#24H		;loading value into R4		immediate				1						3						Data transfer					
		PUSH		0			;push R0											2						2						Data transfer
		PUSH		1			;push R1											2						2						Data transfer
		PUSH		2			;push R2											2						2						Data transfer
		PUSH		3			;push R3											2						2						Data transfer
		PUSH		4			;push R4											2						2						Data transfer
HERE:   SJMP      HERE		     ;transfers execution							    2						2						Program branching
		END  