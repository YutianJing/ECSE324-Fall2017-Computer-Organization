			.text
			.global _start
_start:
			LDR R4, =RESULT			// R4 points to the result location
			LDR R2, [R4, #4]		// R2 holds the number of elements in the list
			ADD R3, R4, #8			// R3 points to the first number

			LDR R5, [R4]
			LDR R0, [R3]			// R0 holds the first number in the list

COUNTERLOOP:
			LSR  R2, R2, #1
			BEQ A1
			CMP R2, #1
			ADD R5, R5, #1
			B COUNTERLOOP

A1: 			
			LDR R2, [R4, #4]		// R2 holds the number of elements in the list

			
LOOP:    							//sum
			SUBS R2, R2, #1			// decrement the loop counter
			BEQ AVERAGE				// end loop if counter has reached 0
			ADD R3, R3, #4			// R3 points to next number in the list
			LDR R1, [R3]			// R1 holds the next number in the list
			ADD R0, R0, R1	
			B LOOP



AVERAGE:

			LSR R0, R0, R5
			STR R0, [R4]
			ADD R3, R4, #8			//INITIAL R3
			
			LDR R2, [R4, #4]		// R2 holds the number of elements in the list
			ADD R2, R2, #1
SUBTRACTION: 
			SUBS R2, R2, #1
			BEQ END
			LDR R9,[R3]
            SUBS R9 ,R9, R0  		// SUBTRACT AVE FROM NUMBER
			STR R9, [R3]
			ADD R3, R3, #4  		//COUNTER
			B SUBTRACTION


END:		
			B END

RESULT:		.word 0				      // memory assigned for result location
N:			.word 8				     // number of entries in the list
NUMBERS:	.word 4, 5, 3, 6 		// the list data
			.word 1, 8, 2, 7
