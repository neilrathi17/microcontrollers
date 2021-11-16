;Write and assemble a 8051 Assembly level program to Get the Data(your sl.no.) From Port P1 and swap and  Send it to Port P2.
;then swap and send it to p4 again
;Note:P1 as input Port and P2 as Output Port.

;label	mnemonics	Operands	comments		          	adressing mode		machine cycle 		memory byte 		type of instruction
								
		ORG			0H			;assembler directive			
		MOV			A,#0FFh     ;A=FFH to be loaded later	immediate				1					2					data transfer	
		MOV			P1,A      	;make P1 an input port		direct					1					2					data transfer
HERE:  	MOV			A,P1       	;get data from P1			direct					1					2					data transfer
		SWAP		A			;swap upper and lower nibble						1					1					logical	
		MOV			P2,A       	;send it to P2				direct					1					2					data transfer
		SJMP		HERE      	;keep doing this									2					2					program branching
		END						;end of ALP					
