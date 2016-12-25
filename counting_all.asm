	.data
msg:	.asciiz	"podaj ciag znakow \n"
buf:	.space	100
counter	.space	96

	.text
	.globl main

main:
	la	$a0, msg
	li	$v0, 4
	syscall
	
	la	$a0, buf
	li	$a1, 100
	li	$v0, 8
	syscall
	
	la	$t0, buf
	li	$t9, 'a'

nextchar:
	lb	$t1, ($t0)
	addiu	$t0, $t0,1
	beqz	$t1, end
	
	
end:
	li	$a0, 10
	syscall
	