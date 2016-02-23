# Initialize data
.data
array: .float 3.65,6.35

approachOne: .asciiz "Approach 1:\n"
approachTwo: .asciiz "\n\nApproach 2:\n"

sum: .asciiz " + "
equals: .asciiz " = "
.text
.globl main

# Main function
main:
# —————— Start approach 1 ——————
li $v0, 4
la $a0, approachOne
syscall

#load the array
la $a0, array

#load each word into float registers
lwc1 $f1, 0($a0)
lwc1 $f2, 4($a0)

#Add them
add.s $f0, $f1, $f2

#display all pretty like
li $v0, 2
mov.s $f12, $f1
syscall

li $v0, 4
la $a0, sum
syscall

li $v0, 2
mov.s $f12, $f2
syscall

li $v0, 4
la $a0, equals
syscall

#Print the resulting answer
li $v0, 2
mov.s $f12, $f0
syscall

# —————— Start approach 2 ——————
li $v0, 4
la $a0, approachTwo
syscall

la $a0, array		#load float array
lwc1 $f2,0($a0)	#load first float
lwc1 $f4,4($a0)	#load second float, may be wrong

mfc1 $t1,$f2	#move first value to general purpose register
mfc1 $t2,$f4	#move second value to general puropse register

sll $t5,$t1,9  # get mantissa bits
srl $t5,$t5,9

sll $t6,$t2,9  # get mantissa bits
srl $t6,$t6,9

srl $t3, $t1, 23  # Shift for exponent of value 1 
srl $t4, $t2, 23  # Shift for exponent of value 2

FirstLower:
	beq $t3, $t4, AddMantissas
	# While exponents are !=
	srl $t5, $t5, 1
	# srl $t4, $t4, 1
 	
	# Increment Counter
	addi $t7, $t7, 1

	# Increment Exponent
	addi $t3, $t3, 1

	bne $t3, $t4, FirstLower

AddMantissas:

	# add the mantissas
	add $t0, $t5, $t6

	beqz $t7, ShowAnswers

	loop:
		# Shift left one
		srl $t0, $t0, 1

		#decrement 
		addi $t7, $t7, -1
		bgtz $t7, loop
ShowAnswers:
	addi $t7, $0, 2
	add $t3, $t3, $t7

	add $t3, $t3, $t4

	sll $t3, $t3, 22

	# Add in the one bit for the sign (0, so we can shift)
	srl $t0, $t0, 1

	add $t0, $t0, $t3

	li $v0, 4
	la $a0, equals
	syscall

	mtc1 $t0, $f12

	li $v0, 2
	syscall


#exit
li $v0, 10
syscall
