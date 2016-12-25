	.data
buf:	.space	100
msg:	.asciiz	"podaj ciag znakow \n"
counter:.word	0

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
	la	$t1, counter
	lb	$t2, ($t1)
nextchar:
	
	lb	$t1, ($t0)
	addiu	$t0, $t0,1
	beq	$t1, 'a', count
	beqz	$t1, end
	
	b	nextchar
	
count:
	addiu	$t2, $t2,1
	b	nextchar
end:
	li	$a0, 'a'
	li	$v0, 11
	syscall
	
	li	$a0, ':'
	li	$v0, 11
	syscall
	
	move	$a0, $t2
	li	$v0, 1
	syscall
	
	li	$v0, 10
	syscall