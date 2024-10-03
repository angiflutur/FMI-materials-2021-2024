// strtok in assembly 
// "Sir de caractere"
// Sir 
// de 
// caractere


.data
	x: .long 0
	y: .long 0
	sir: .space 100
	
	res: .space 100
	atoires: .space 100 
	
	chDelim: .asciz " "
	formatScanf: .asciz "%[^\n]s"
	formatPrintf: .asciz "%s\n"
	formatPrintfnr: .asciz "%d\n"
.text

.global main

main:

	pushl $sir
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx
	
	pushl $chDelim
	pushl $sir
	call strtok 
	popl %ebx
	popl %ebx
	
	movl %eax, res
	
et_for:
	cmp $0, res
	je exit
	pushl res
	pushl res
	call atoi
	popl %ebx
	popl res
	
	movl %eax, atoires
	
	cmp $0, atoires
	je operatie
	
	cmp $0, atoires
	jne numar
		
cont:
	pushl $chDelim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx 
	movl %eax, res
	jmp et_for

operatie:
	movl res, %edi
	xorl %ecx, %ecx
	movb (%edi, %ecx, 1), %al
	
	cmp $97, %al
	je op_add
	
	cmp $115, %al
	je op_sub
	
	cmp $109, %al
	je op_mul
	
	cmp $100, %al
	je op_div
	
op_add:
	popl x
	popl y
	movl x, %eax
	addl y, %eax
	pushl %eax
	jmp cont
op_sub:
	popl x
	popl y
	movl y, %eax
	subl x, %eax
	pushl %eax
	jmp cont
op_mul:
	popl x
	popl y
	movl x, %eax
	mull y
	pushl %eax
	jmp cont
op_div:
	popl x
	popl y
	movl $0, %edx
	movl y, %eax
	divl x
	pushl %eax
	jmp cont
numar:
	pushl atoires
	jmp cont

exit:
	popl %eax
	
	pushl %eax
	pushl $formatPrintfnr
	call printf
	popl %ebx
	popl %ebx
	
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80
