
         .data

hellow: .ascii "hello world\n"
str_size = . - hellow

         .text
         .global __start

 __start:


	 ########  write(stdout,hellow,12) ####

         li $4, 1		# li $a0,2 -> stdout
	 la $5,hellow		# la $a1,hellow
         li $6,str_size		# li $a2,stringSz
         li $2, 4004		# li $v0,4004
         syscall


  	 j exit


exit:

         #######  exit(1)  ####################

         li $4, 1      # li $a0,1
         li $2, 4001   # li $v0,4001
         syscall

