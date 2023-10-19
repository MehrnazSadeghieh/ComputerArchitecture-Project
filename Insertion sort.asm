.text
	la $t0, n
	lw $t0, 0($t0)          # t0 = n
	
	la $t1, items
	
	addi $t2, $zero, 1	# $t2 = 1 (i = 1)
	addi $t3, $zero, 0 	# $t3 = 0 (j = 0)
	
Loop:
	beq $t2, $t0,Exit	# if $t2 == n
	
	lw $t4,4($t1)		# key = arr[i]
	addi $t3, $t2, -1
	addi $t7, $t1, 0
	
condition1:
	slti $t6, $t3, 0
	beq $t6, 0, condition2
	
	j EndLoop
	
			
condition2:
	lw $t5, 0($t7)
	slt $t6, $t4,$t5
	beq $t6, 1, loop1
	
	j EndLoop

loop1:
	lw $t5,0($t7)
	sw $t5,4($t7)
	addi $t3, $t3, -1
	addi $t7, $t7, -4
	j condition1
	
EndLoop:
	sw $t4,4($t7)
	addi $t2, $t2,1
	addi $t1, $t1, 4
	j Loop
	

Exit:
	addi $v0, $zero, 10
	syscall

	

.data
n:            .word    5
items:        .word    7,3,-1,4,2 

