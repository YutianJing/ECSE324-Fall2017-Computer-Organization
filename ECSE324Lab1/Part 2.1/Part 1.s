		.text
		.global _start
 
_start:
			LDR R4, =RESULT			// R4 points to the result location
			LDR R2, [R4, #4]		// R2 holds the number of elements in the list
			ADD R3, R4, #8			// R3 points to the first number
			LDR R0, [R3]			// R0 holds the first number in the list
			LDR R5, [R3]			// R5 holds the first number in the list

LOOP:		SUBS R2, R2, #1			// decrement the loop counter
			BEQ DONE				// end loop if counter has reached 0
			ADD R3, R3, #4			// R3 points to next number in the list
			LDR R1, [R3]			// R1 holds the next number in the list
			LDR R6, [R3]			// R1 holds the next number in the list
		
			CMP R0, R1				// check if it is greater than the maximum
			BLE Maximum				// if no, branch back to the loop
		
			CMP R5, R6				// check if it is smaller than the minimun
			BGE Minimum				// if no, branch back to the loop
		
			B LOOP
		
Maximum:	MOV R0, R1				// if yes, update the current max
			B LOOP
		
		
Minimum:	MOV R5, R6				// if yes, update the current min
			B LOOP


DONE:		SUBS R0, R0, R5
			LSR R0, R0, #2
			STR R0, [R4]			// store the result to the memory location
		
		
END:		B END					// infinite loop!
		
RESULT:		.word 0					// memory assigned for result location
N:			.word 7					// number of entries in the list
NUMBERS:	.word 4, 5, 3, 6 		// the list data
			.word 1, 8, 2
