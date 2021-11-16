    RS EQU P2.7
    RW EQU P2.6
    E  EQU P2.5
    ORG 00H
MOV DPTR,#LUT 
SETB P3.5 
CLR P2.0
MAIN: MOV R6,#22D
      MOV TMOD,#01100001B  
      MOV TL1,#00000000B   
      MOV TH1,#00000000B   
      SETB TR1             
BACK: MOV TH0,#00000000B   
      MOV TL0,#00000000B   
      SETB TR0             
HERE: JNB TF0,HERE         
      CLR TR0              
      CLR TF0              
      DJNZ R6,BACK
      CLR TR1              
      CLR TF0              
      CLR TF1
      MOV A,TL1
      CJNE A,#75D,SKIP 
SKIP: JC SKIP1
      SETB P2.0
SKIP1:JNC CONT
      CLR P2.0
CONT: CLR PSW.7
      MOV B,#100D    
      DIV AB
      MOV R0,A
      MOV A,B
      MOV B,#10D
      DIV AB
      MOV R1,A
      MOV R2,B
      
      MOV A,R2
      MOV B,#4D
      MUL AB
      MOV B,#10D
      DIV AB
      MOV R4,B
      MOV R2,A
      MOV A,R1
      MOV B,#4D
      MUL AB
      ADD A,R2
      MOV B,#10D
      DIV AB
      MOV R5,B
      MOV R2,A
      MOV A,R0
      MOV B,#4D
      MUL AB
      ADD A,R2
      MOV B,#10D
      DIV AB
      MOV R6,B
      MOV R7,A
     
      
      ACALL DINT
      ACALL TEXT1
      ACALL LINE2
      ACALL TEXT2
      ACALL NUM
      
      LJMP MAIN    
   
   
   
 DINT: ACALL CMD 
    MOV A,#0FH 
    ACALL CMD
    MOV A,#01H 
    ACALL CMD
    MOV A,#06H 
    ACALL CMD
    MOV A,#83H 
    ACALL CMD
    MOV A,#3CH 
    ACALL CMD
    RET
    
TEXT1: MOV A,#84D
    ACALL DISPLAY
    MOV A,#65D 
    ACALL DISPLAY
    MOV A,#67D
    ACALL DISPLAY
    MOV A,#72D
    ACALL DISPLAY
    MOV A,#79D
    ACALL DISPLAY
    MOV A,#77D
    ACALL DISPLAY
    MOV A,#69D
    ACALL DISPLAY
    MOV A,#84D
    ACALL DISPLAY
    MOV A,#69D
    ACALL DISPLAY
    MOV A,#82D
    ACALL DISPLAY
    RET

TEXT2:MOV A,#82D
      ACALL DISPLAY
      MOV A,#80D
      ACALL DISPLAY
      MOV A,#77D
      ACALL DISPLAY
      MOV A,#32D
      ACALL DISPLAY
      RET
    
LINE2:MOV A,#0C0H 
    ACALL CMD
    RET

    
   
NUM:MOV A,R7
    ACALL ASCII
    ACALL DISPLAY
    MOV A,R6
    ACALL ASCII
    ACALL DISPLAY
    MOV A,R5
    ACALL ASCII
    ACALL DISPLAY
    MOV A,R4
    ACALL ASCII
    ACALL DISPLAY
    MOV A,#0D
    ACALL ASCII
    ACALL DISPLAY
    RET
    
   
    
CMD: MOV P0,A
    CLR RS
    CLR RW
    SETB E
    CLR E
    ACALL DELAY
    RET

DISPLAY:MOV P0,A
    SETB RS
    CLR RW
    SETB E
    CLR E
    ACALL DELAY
    RET

DELAY:CLR E
    CLR RS
    SETB RW
    MOV P0,#0FFh
    SETB E
    MOV A,P0
    JB ACC.7,DELAY
    CLR E
    CLR RW
    RET

ASCII: MOVC A,@A+DPTR
       RET
    
LUT: DB  48D
     DB  49D
     DB  50D
     DB  51D
     DB  52D
     DB  53D
     DB  54D
     DB  55D
     DB  56D
     DB  57D
   
    END

