.data
nums:	.word 0x7fffffff,0x6fffffff
.text
.globl main
main:
la $a0,nums`
lw $t1,0($a0)
lw $t2,4($a0)
add $t0,$t1,$t2
#addu $t0,$t1,$t2
mul $t0,$t1,$t2

