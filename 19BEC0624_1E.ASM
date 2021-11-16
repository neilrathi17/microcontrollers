;Write a 8051 Assembly level program to add 10 bytes of BCD data and store the result in R2 and R3. The bytes are stored in ROM space starting at 300H. 
;The data would look as follows:
;MYDATA:	DB		;pick your data. ( 10  DATA  )
;EX: 22H,43H,23H,34H,31H,77H,91H,33H,43H,07H  
;Notice that you must first bring the data from ROM space into the CPU's RAM, then add them together. Use a simulator to single-step the program and examine the data. 
;label	mnemonics	Operands	     comments		                    adressing mode		machine cycle   memory byte 		type of instruction

		ORG			000H		
		MOV			DPTR,#300H	;set initial value of dptr				 immediate				1				3					data transfer	
		MOV			R0,#10		;R0 count is 10							 immediate				1				3					data transfer
LOOP:	CLR			A			;clr Acc register												1				1					boolean
		MOVC		A,@A+DPTR   ;code memory accumulator				 indexed				1				3					data transfer
		ADD			A,R2		;initiall R2=0,else R2=sum				 direct					1				2					arithmetic
		DA			A			;decimal adjust acc												1				1					arithmetic
		JNC			NEXT		;check for carry						 						1				1					boolean	
		INC			R3			;carry count													1				1					arithmetic
NEXT:	INC			DPTR 		;data pointer is incremented to the								1				1					arithmetic
								;next data location
		MOV			R2,A		;result of addition is moved to			 direct					1				3					data transfer
		DJNZ		R0,LOOP		;count is decremented for next itteration 						2				2					program branching
HERE:	SJMP		HERE		;Result in R2 and R3					 relative													program branching
;--------------------------------------------------------------------------------------------------------------------------------------------
		ORG			300H
		DB			00H,01H,09H,0BH,0EH,0CH,00H,06H,02H,04H
		END

		