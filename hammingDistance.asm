.data
	intpr1:		.asciiz "Enter first integer: "
	intpr2:		.asciiz "Enter second integer: "
	space:		.asciiz "\n"
	int1:		.space 4
	int2:		.space 4
	
.text 

hamming: 
	# Prints "Enter first integer: "
	li $v0, 4
	la $a0, intpr1
	syscall
	# Gets input as a string
	li $v0, 8 
	la $a0, int1
	li $a1, 4
	syscall
	
	# Prints "Enter second integer: "
	li $v0, 4
	la $a0, intpr2
	syscall
	# Gets second input as a string
	li $v0, 8 
	la $a0, int2
	li $a1, 4
	syscall
	
	# $t2 = the first character of the first input 
	la $t0, int1
	lb $t2, 0($t0)	
	# $t3 = the second character of the second input
	la $t0, int1
	lb $t3, 1($t0)
	# $t4 = the frist character of the second input
	la $t0, int2
	lb $t4, 0($t0)
	# $t5 = the second character of the second input
	la $t0, int2
	lb $t5, 1($t0)
	
	# Sets $t6 to 0 
	add $t6, $0, $0 
	# tests if the first chars of the inputs are equal
	beq $t2, $t4, equal
	# If they are different, add 1 to $t6
	loop: 
		addi $t6, $t6, 1
	# If the are equal, add 0 to $t6
	equal:
		add $t6, $t6, $0
	# tests if the second chars of the inputs are equal
	beq $t3, $t5, equal2
	# If they are different, add 1 to $t6
	loop2:
		addi $t6, $t6, 1
	# If the are equal, add 0 to $t6
	equal2:
		add $t6,$t6,$0
			
	# Prints the value of $t6	
	li $v0, 1
	move $a0, $t6
	syscall
	# prints a blank space
	li $v0, 4
	la $a0, space
	syscall	
	
	j hamming
	
	
