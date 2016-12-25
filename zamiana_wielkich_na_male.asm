	.data
buf:	.space	100
message:.asciiz	"podaj ciag znakow zawierajacy male i duze litery \n"

	.text
	.globl	main

main:	

	la	$a0, message
	li	$v0, 4
	syscall
	
	
	la	$a0, buf
	li	$a1,100
	li	$v0, 8
	syscall
	
	la	$t0, buf
	move 	$t1, $t0

nextchar:
	
	lbu	$t2, ($t0)
	addiu	$t0, $t0, 1
	beqz	$t2, end
	bltu	$t2, 'A', no_changes
	bgtu	$t2,  'Z', no_changes
	addiu	$t2, $t2,32

no_changes:
	sb	$t2, ($t1)
	addiu	$t1, $t1, 1
	b	nextchar

end:	
	sb	$zero, ($t1)
	la	$a0, buf
	li	$v0, 4
	syscall 
	
	li	$v0, 10
	syscall