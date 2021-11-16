;Develop an Assembly Language Program (ALP) using 8051 microcontroller instructions to find the 
;largest number of an array of N 8 bit unsigned numbers (N is an 8 bit data). The starting address of the 
;array is at 2000H and stores the result in 2500H. 
;Send the largest number of the given array to serial window at 4800 baud rate. 


		 ORG 		0000H 		; Set program counter 0000H
		TEMP		EQU	40H
		 N 			EQU 04H ; Array count
		 MOV 		R4,#N-1 ; Load N-1 to R4
		 MOV 		DPTR,#2000H ; Store the starting address of the array in DPTR
		 MOVC		A,@A+DPTR ; Copy fi rst number to A
 LOOP1:  MOV 		R1,A ; Copy contents of A to R1
 again:  INC 		DPTR ; Increment DPTR
		 MOV 		A,#00H
		 MOVC 		A,@A+DPTR ; Get the next number to A
		 MOV 		TEMP,A ; Copy the next number to TEMP
		 MOV 		A,R1 
		 CJNE 		A,TEMP, LOOP2 ; (A)?(TEMP) branch to LOOP2
		 SJMP 		LOOP3 ; (A)=(TEMP) branch to LOOP3
 LOOP2:  JC 		LOOP3 ; (A)<(TEMP) branch to LOOP3
		 MOV 		A,TEMP ; (A)>(TEMP) copy contents of TEMP to A
 LOOP3:  DJNZ 		R4,LOOP1 ; Repeat until R4 is zero
		MOV			R0,50H
		MOVX		@R0,A
		ORG 2000H
		DB 1,2,3,4
		END
