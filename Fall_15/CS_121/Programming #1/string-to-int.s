.data
	userPrompt: .asciiz "Please enter a string:\n"	#prompts the user for a string
	userOutput: .asciiz "We doubled your input:\n"	#text to indicate output 
	userString: .word 4								#init for userString variable
				
.text
.globl main
main:
	li $v0, 4										#loads sys call with print
	la $a0, userPrompt								#loads userPrompt into a0
	syscall											#print userPrompt

	la $a0, userString								#loads userString into a0
	la $a1, userString								#loads size of userString into a1
	li $v0, 8										#loads sys call with read string
	syscall											#reads string   

	li $v0, 4										#loads sys call with print
	la $a0, userOutput								#loads userOutput into a0
	syscall											#print userOutput             				

	str2int: 										#convert string to integer
		li $v0, 0 									#initialize $v0 = 0
		la $t0, userString 							#$t0 = pointer to string
		lb $t1, ($t0) 								#load $t1 = digit character 

	LOOP:
		blt $t1, 0x31, PRINT      					#check if char is not a digit (ascii<'0')
    	bgt $t1, 0x39, PRINT      					#check if char is not a digit (ascii>'9')		
		subu $t1, $t1, 0x30 						#convert char to integer
		mul $t2, $t2, 10 							#multiply by 10 (to move tens place)
		add $t2, $t2, $t1 							#$t2 = $t2 * 10 + digit
		addiu $t0, $t0, 1 							#point to next char
		lb $t1, ($t0) 								#load $t1 = next digit
		bne $t1, $0, LOOP 							#restart loop if not end of string

	PRINT:

		sll $t2, $t2, 1 							#doubles $t2 (our integer)
		move $a0, $t2								#move $t2 to a0 so we can print
		li $v0, 1 									#print integer
		syscall 

	li $v0, 10										#loads sys call with exit
	syscall											#exit program