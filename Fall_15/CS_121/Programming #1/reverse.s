.data
	newline: .asciiz "\n"				#sets the escape char
	getString: .asciiz "Please enter a string: "	#prompts the user for a string
	strInput: .word 4				
.text
.globl main
main:
	# Ask for input
	li $v0, 4
	la $a0, getString	
	syscall	

	# Get String
	li $v0, 8 
	la $a0, strInput
	la $a1, strInput
	syscall

	li $v0, 4
	la $a0, newline
	syscall

	length:      
	  # Get string length
	  li $v0, 11 
	  lb $t0, strInput($t2)
	  add $t2, $t2, 1
	  bne $t0, $zero, length
	
	loop:
	  sub $t2, $t2, 1
	  la $t0, strInput($t2) 
	  lb $a0, ($t0)
	  syscall
	  bnez $t2, loop


	li $v0, 10
	syscall	