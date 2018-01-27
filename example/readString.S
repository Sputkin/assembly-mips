#	$zero 	|	 0 	|
#	$at 	|	 1	|
#	$v0-$v1	|	 2-3	|
#	$a0-$a3	|	 4-7	|
#	$t0-$t7	|	 8-15	|
#	$s0-$s7	|	 16-23	|
#	$t8-$t9	|	 24-25	|
#	$k0-$k1	|	 26-27	|
#	$gp	|	 28	|
#	$sp	|	 29	|
#	$fp	|	 30	|
#	$ra	|	 31	|
#
#    READ STRING FROM STDIN


.data

buffer:  .space 100
str1:	.asciiz "enter a string (max=100 char): "
str1_sz= . -str1

str2:	.asciiz "the string entered is: "
str2_sz= . -str2

.text
.globl __start

__start:

	
	### write(stdout,str1,str1_sz)
	li $4,0
	la $5,str1
	li $6,str1_sz
	li $2,4004
	syscall

	### read(stdin,buffer,100)
	li $4,1
        la $5,buffer
        li $6,100
        li $2,4003
        syscall

	addi $29,$29,-4 # space on stack
	sw $2,0($29)    # push read ret value

	### write(stdout,str2,str2_sz)
        li $4,0
        la $5,str2
        li $6,str2_sz
        li $2,4004
        syscall

	lw $8,0($29)	# pop read ret value in t0
	addi $29,$29,4	# free stack

	### write(stdout,buffer,buffer_sz)
        li $4,0
        la $5,buffer
        move $6,$8        
	li $2,4004
        syscall


	j exit


exit:
	li $4,1
	li $2,4001
	syscall
