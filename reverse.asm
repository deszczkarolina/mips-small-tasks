	.data
buf:	.space 	100
newbuf:	.space 	100
	.align	0
msg:	.asciiz	"podaj ciag znakow \n"

	.text
	.globl main
	
main: 	
	la	$a0, msg	#wyswietlanie prosby o wpisanie danych
	li	$v0, 4
	syscall
	
	la	$a0, buf	#wczytywanie ciagu znakow
	li	$a1, 100
	li	$v0, 8
	syscall
	
	la 	$t3, newbuf
	la	$t0, buf
	la 	$t7, buf
find_end:			#szukanie konca ciagu

	lb	$t1, ($t7)
	beqz	$t1, end_of_finding_end
	addiu	$t7, $t7,1
	b	find_end
	
end_of_finding_end: 
	subiu	$t7, $t7,2  #$t7 - \n
	sb	$zero, filename($t7)
	lbu 	$t1, ($t7)
	sb	$t1, ($t3)
	addiu	$t3, $t3,1
	beq	$t7, $t0, end
	b	end_of_finding_end
end:
	sb	$zero, ($t3)
	la	$a0, newbuf
	li	$v0, 4
	syscall 
	
	li	$v0, 10
	syscall
		
	
		
