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
#	PRINT VECT OF CHAR
#

.data

vect: .byte '0','1','2','3','4','5','6','7','8','9'
vect_sz: .word 10;

endl: .ascii "\n"

.text
.globl __start

__start:

	la $16,vect # s0 = &vect

	lw $9,vect_sz


		add $17,$0,$0
	for_loop:
		slt $8,$17,$9
		beqz $8,end_loop

		add $18,$16,$17


		## PRINT CHAR
		li $4,0
		move $5,$18
		li $6,1
		li $2,4004
		syscall

		## PRINT END LINE
                li $4,0
                la $5,endl
                li $6,1
                li $2,4004
                syscall

		addi $17,$17,1

		j for_loop

	end_loop:


	j exit

exit:
	li $4,1
	li $2,4001
	syscall
