	.data
buf:	.space	100

	.text
	.globl	main
	
main:	
	la	$a0,buf
	li	$a1, 100
	li	$v0,8
	syscall
	 t1, $t0
	
nextchr:
	lbu	$t2, ($t0)
	addiu	$t0, $t0, 1
	bltu	$t2, ' ', fin
	beq	$t2, ' ', nextchr
	sb	$t2, ($t1)
	addiu	$t1, $t1, 1
	b	nextchr
	
fin: 	sb	$zero, ($t1)
	la	$a0, buf
	li	$v0, 4
	syscall

	li 	$v0, 10
	syscall