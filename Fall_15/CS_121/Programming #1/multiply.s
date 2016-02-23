# Initialize data
.data
times:		.asciiz " x "
sum_is:		.asciiz "\nProduct is: "
.text
.globl main

# Main function
main:
addi $t0, $zero, 8
addi $t1, $zero, 72
addi $t2, $t1, 0
addi $t3, $zero, 1

# Loop that does the actual multiplying
loop:
add $t2, $t2, $t1
addi $t3, $t3, 1
bne $t3, $t0, loop

# Print the first value
li $v0, 1
addi $a0, $t0, 0
syscall

# Print the symbol to show multiplying
li $v0, 4
la $a0, times
syscall

# Print the second value
li $v0, 1
addi $a0, $t1, 0
syscall

# Print the product
li $v0, 4
la $a0, sum_is
syscall

li $v0, 1
addi $a0, $t2, 0
syscall

li $v0 10
syscall
