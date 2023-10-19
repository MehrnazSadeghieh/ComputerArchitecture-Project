.text 

# print String
la $a0, msg
addi $v0, $zero, 4
syscall

# read integer
addi $v0,$zero, 5
syscall

#log

addi $t0, $v0, 0
addi $t1, $zero, 2
addi $t3, $zero, 0	# (i)

Loop:
	slt $t2, $t0, $t1
	beq $t2, 1, Exit
	sll $t1, $t1,1
	addi $t3, $t3, 1
	j Loop

Exit:
	
	la $a0, res
	addi $v0, $zero, 4
	syscall
	
	addi $a0, $t3, 0
	addi $v0, $zero, 1
	syscall
	
	addi $v0, $zero, 10
	syscall

.data

msg:	.asciiz   "Enter x: "
res:	.asciiz   "result = "
