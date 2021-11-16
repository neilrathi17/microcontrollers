;4  Write and assemble a 8051 Assembly level program to load values into each of registers R0 - R4 and then push each of these registers onto 
;the stack and pop them back.  Single-step the program, and examine the stack  and the SP register after the execution of each instruction.
;label	mnemonics	Operands	comments			adressing mode		machine cycle memory Byte  	type of instruction		Flags affected

			ORG  	0000H		;Assembler Directive to indicate  begining of the program
				
			MOV	    R0, #01H	;Move data to register Immediate			1			3				Data Transfer 		no flags affected
			MOV 	R1, #9BH	;Move data to register Immediate			1			3				Data Transfer 		no flags affected
			MOV	    R2, #0ECH	;Move data to register Immediate			1			3				Data Transfer 		no flags affected
			MOV 	R3, #06H	;Move data to register Immediate			1			3				Data Transfer 		no flags affected
			MOV 	R4, #24H	;Move data to register Immediate			1			3				Data Transfer 		no flags affected
			PUSH	0			;push to R0									2			2				data transfer		no flags affected
			PUSH	1			;push to R1									2			2				data transfer		no flags affected
			PUSH	2			;pop to R2									2			2				data transfer		no flags affected
			PUSH	3			;pop to R3									2			2				data transfer		no flags affected
			PUSH	4			;pop t0 R4									2			2				data transfer		no flags affected
			POP		0			;pop from R0								2			2				data transfer		no flags affected
			POP		1			;pop from R1								2			2				data transfer		no flags affected
			POP		2			;pop from R2								2			2				data transfer		no flags affected
			POP		3			;pop from R3								2			2				data transfer		no flags affected
			POP		4			;pop from R4								2			2				data transfer		no flags affected
HERE:		SJMP	HERE		;ALP ENDED																program branching	no flags affected
			END