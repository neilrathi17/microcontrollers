;Write and assemble an 8051 Assembly level program to add the following data and then use the simulator to examine the CY flag. 
;INPUT DATA  REG NO:  Example     01 9B EC 06 24.    Five max 8BIT NUMBERS (FF ,FF,FF,FF,FF)
;label	mnemonics	Operands	comments		adressing mode		machine cycle required		memory byte required		type of instruction

		org			0000h
		MOV			A,#0FFH		;loading first number into acc          immediate 1						2						Data transfer
		MOV			B,#0FFH		;loading second number into B			immediate 1						2						Data transfer
		ADD			A,B			;adding A<- A+B=9C						direct    1						2						Arithmetic
		JNC			L1			;jump if carry is produced              -		  2						2						Boolean
		INC			R0			;icrement R0 for carry count			-		  1						1						Arithmetic	
L1:		MOV			B,A			;b<- A =9C								direct	  1						2						Data Transfer
		MOV			A,#0FFH		;load third number into A				immediate 1						2						Data transfer
		ADD			A,B			;adding A<-A+B = EC + 9C =188			direct	  1						2						Arithmetic	
		JNC			L2			;jump if carry is produced				-		  2						2						Boolean	
		INC			R0			;increment for carry count				-		  1						1						Arithmetic
L2:		MOV			B,A			;B<-A=88								direct    1						2						Data transfer
		MOV			A,#0FFH		;load 4th number into A					immediate 1						2						Data transfer
		ADD			A,B			;A-<A+B=88H+06H=8E						direct    2						2						Arithmetic	
		JNC			L3			;jump if carry is produced				-		  2						2						Boolean
		INC			R0			;increment R0 for carry count			-		  1						1						Arithmetic
L3:		MOV			B,A			;B<-A=8E								direct	  1						2						Data transfer
		MOV			A,#0FFH		;loading 5th number	 into A				immediate 1						2						Data transfer		
		ADD			A,B			;A<-A+B=8EH+24H=B2						direct	  1						2						Arithmetic
		JNC			L4			;jump if carry is produced				-		  2						2						Boolean
		INC			R0			;increment R0 for carry count			-		  1						1						Arithmetic
L4:		
HERE:	SJMP		HERE		;												  2 					2							Program branching
		END
		
