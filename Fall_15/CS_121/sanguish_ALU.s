.data
num1: .word 10
num2: .word 10

# Set to 0 for BEQ
input: .word 0

str0: .asciiz "Change 'input' in the .data header to switch between BEQ and ADD\n------------------------------------------------------------------\n"
str1: .asciiz "Number 1: "
str2: .asciiz "Number 2: "
str3: .asciiz "sum : "
str4: .asciiz "Overflow!"
space: .asciiz "\n"
jaddy: .asciiz "Successful Branch!"
fail: .asciiz "The jump didn't happen. Sorry :("

.text
.globl main
main:

li $v0, 4
la $a0, str0
syscall

#Print Number 1
li $v0, 4
la $a0, str1
syscall

#Print actual number
li $v0, 1
lw $a0, num1
syscall

#Print new line
li $v0, 4
la $a0, space
syscall

#Print Number 2
li $v0, 4
la $a0, str2
syscall

#Print actual number
li $v0, 1
lw $a0, num2
syscall

#Print new line
li $v0, 4
la $a0, space
syscall

# testing beq code
lw $t0, input #Load mask value to 1 
li $t1, 0 #Start loop counter at 0
li $t2, 0 #Start carry at 0
li $s4, 0 #Start sum bit at 0

lw $s0, num1
lw $s1, num2

beqz $t0, breq

loop:
	addi $t1, $t1, 1 # Increment loop
	and $t3, $s0, $t0 #Mask first num
	and $t4, $s1, $t0 #Mask second num
	xor $t5, $t3, $t4 #XOR nums
	xor $t6, $t5, $t2 #XOR above with carry
	or $s4, $t6, $s4 #Or with sumbit
	and $t7, $t3, $t4 #And the two nums
	and $t8, $t3, $t2 #And first with the carry
	and $t9, $t3, $t2 #And second with the carry
	or $s2, $t7, $t8 #Result and result 2
	or $t2, $s2, $t9 #reults s2 with result to get new carry
	sll $t2, $t2, 1 # shift the carry
	sll $t0, $t0, 1 # shift the mask
	bne $t1, 32, loop #

end:
	bltz $s4, overflow #Check if sum < 0

	#Print sum
	li $v0, 4
	la $a0, str3
	syscall

	li $v0, 1
	move $a0, $s4
	syscall

	li $v0, 10
	syscall

overflow:
	#Print overflow message
	li $v0, 4
	la $a0, str4
	syscall

	j $ra

breq:
	#testing beq code
	nor $s1, $s1, $0

breqloop:
	addi $t1, $t1, 1 # Increment loop
	and $t3, $s0, $t0 #Mask first num
	and $t4, $s1, $t0 #Mask second num
	xor $t5, $t3, $t4 #XOR nums
	xor $t6, $t5, $t2 #XOR above with carry
	or $s4, $t6, $s4 #Or with sumbit
	and $t7, $t3, $t4 #And the two nums
	and $t8, $t3, $t2 #And first with the carry
	and $t9, $t3, $t2 #And second with the carry
	or $s2, $t7, $t8 #Result and result 2
	or $t2, $s2, $t9 #reults s2 with result to get new carry
	sll $t2, $t2, 1 # shift the carry
	sll $t0, $t0, 1 # shift the mask
	bne $t1, 32, breqloop #

breqend:
	# branch on equal
	beqz $s4, breqpass

	#Print new line
	li $v0, 4
	la $a0, space
	syscall

	li $v0, 4
	la $a0, fail
	syscall

	li $v0, 10
	syscall

breqpass:
	#Print new line
	li $v0, 4
	la $a0, space
	syscall
	
	li $v0, 4
	la $a0, jaddy
	syscall

	li $v0, 10
	syscall