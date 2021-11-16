;3.	Write an 8051 assembly language program to:
;(a) Set SP = 0D, 
;(b) Load a different value in each of RAM locations 0D, 0C, 0B, 0A, 09, and 08,
;(c) POP each stack location into registers R0 - R4. Use the simulator to single-step and examine the registers, the stack, and the stack pointer.

 ;Label	Mnemonics	Operands	Addressing mode used	Machine cycle/Memory Byte 	Type of Instruction	Comments	Flags getting affected by the Instruction.
;-------------------------------------------------------------------------------------------------------------------------------------	
			ORG  	0000H			;Assembler Directive to indicate  begining of the program	
			MOV 	SP,#0DH			;Immediate					1	3				Data Transfer 	Move immediate data to accumulator	no flags affected
			MOV	    08H, #01H		;Immediate					1	3				Data Transfer 	Move immediate data to accumulator	no flags affected
			MOV 	09H, #9BH		;Immediate					1	3				Data Transfer 	Move immediate data to accumulator	no flags affected
			MOV	    0AH, #0ECH		;Immediate					1	3				Data Transfer 	Move immediate data to accumulator	no flags affected
			MOV 	0BH, #06H		;Immediate					1	3				Data Transfer 	Move immediate data to accumulator	no flags affected
			MOV 	0CH,#24H		;Immediate					1	3				Data Transfer 	Move immediate data to accumulator	no flags affected
			MOV 	0DH,#21H		;Immediate					1	3				Data Transfer 	Move immediate data to accumulator	no flags affected
			POP 	0				;Direct						2	2				Data Transfer 	POP direct byte from stack	no flags affected
			POP 	1				;Direct						2	2				Data Transfer 	POP direct byte from stack	no flags affected
			POP 	2				;Direct						2	2				Data Transfer 	POP direct byte from stack	no flags affected
			POP 	3				;Direct						2	2				Data Transfer 	POP direct byte from stack	no flags affected
			POP 	4				;Direct						2	2				Data Transfer 	POP direct byte from stack	no flags affected
HERE:		SJMP	HERE			;Relative					2	2	B			ranching or program control	Short jump unconditionally to label HERE	no flags affected
			END									;	Assembler Directive to end the program	
				;Total	3	19	33	2		