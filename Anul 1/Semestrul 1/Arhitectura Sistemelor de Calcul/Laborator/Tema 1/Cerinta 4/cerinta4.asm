// 				cerinta 4

// nume matrice
// nr linii
// nr coloane
// n*m elemente
// let
// nume matrice (optional)
// operand    (doar la add, sub, mul, div, nu si la rot90d)
// operatia (add, sub, mul, div, rot90d)

.data
	operand: .space 4
	matrix: .space 1600
	nr_linii: .space 4
	nr_coloane: .space 4
	nr_elem: .space 4
	indexLinie: .space 4
	indexColoana: .space 4
	
	sir: .space 100
	res: .space 100
	atoires: .space 4
	
	let: .asciz "let"
	add: .asciz "add"
	sub: .asciz "sub"
	mul: .asciz "mul"
	div: .asciz "div"
	space: .asciz " "
	enter: .asciz "\n"
	chDelim: .asciz " "
	formatScanf: .asciz "%[^\n]s"
	formatPrintf: .asciz "%s"
	formatPrintfnr: .asciz "%d"
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
	/*numele matricei*/

	pushl $chDelim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx 
	movl %eax, res         

	pushl res
	call atoi
	popl %ebx
	
	movl %eax, nr_linii   
	/* am nr linii */
	
	pushl $chDelim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx 
	movl %eax, res         

	pushl res
	call atoi
	popl %ebx
	
	movl %eax, nr_coloane          
	/* am nr coloane */
	
	movl nr_linii, %eax
	mull nr_coloane
	movl %eax, nr_elem             
	/* am nr elemente */
	
	pushl $chDelim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx 
	movl %eax, res
	
	pushl res
	call atoi
	popl %ebx
	
	xorl %ecx, %ecx    
	/*pe post de i*/
	movl $matrix, %edi
	
	jmp incarcare_matrice
	
incarcare_matrice:
	cmp %ecx, nr_elem
	je continuare_citire
	
	pushl %ecx
	movl %eax, (%edi, %ecx, 4)
	
	pushl $chDelim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx 
	movl %eax, res
	
	pushl res
	call atoi
	popl %ebx
	
	popl %ecx
	incl %ecx
	jmp incarcare_matrice

continuare_citire:

	pushl $chDelim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx                     
	/*  x  */
	movl %eax, res         


	pushl $chDelim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx                     
	/*  operand sau rot90d  */
	movl %eax, res        
	
	pushl res
	call atoi
	popl %ebx
	movl %eax, atoires
	
	xorl %ecx, %ecx
	
	cmp $0, atoires
	je rotire
	
	movl %eax, operand
	cmp $0, atoires
	jne operatie
	
rotire:
	pushl nr_coloane
	pushl $formatPrintfnr
	call printf
	popl %ebx
	popl %ebx
	
	pushl $0
	call fflush
	popl %ebx
	
	pushl $space
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	pushl $0
	call fflush
	popl %ebx
	
	pushl nr_linii
	pushl $formatPrintfnr
	call printf
	popl %ebx
	popl %ebx
	
	pushl $0
	call fflush
	popl %ebx
	
	pushl $space
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	pushl $0
	call fflush
	popl %ebx

	movl $0, indexColoana

for_coloana:
	movl indexColoana, %ecx
	cmp %ecx, nr_coloane
	je exit
	
	// incepe al doilea for
	movl nr_linii, %ebx
	addl $-1, %ebx
	movl %ebx, indexLinie
	for_linie:
		movl indexLinie, %ecx
		cmp $-1, %ecx
		je cont_for_coloana
		
		movl indexLinie, %eax

		mull nr_coloane

		addl indexColoana, %eax
		
		movl (%edi, %eax, 4), %ebx
		
		pushl %ebx 
		push $formatPrintfnr
		call printf 
		pop %ebx 
		pop %ebx
		
		pushl $0
		call fflush
		pop %ebx
		
		pushl $space
		pushl $formatPrintf
		call printf
		popl %ebx
		popl %ebx
	
		pushl $0
		call fflush
		popl %ebx
		
		addl $-1, indexLinie
		jmp for_linie
	
cont_for_coloana:

	addl $1, indexColoana
	jmp for_coloana


operatie:
	xorl %ecx, %ecx
	
	pushl $chDelim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx                     
	/* operatie  */
	movl %eax, res         
	
	pushl res
	pushl $add
	call strcmp
	popl %ebx
	popl %ebx                     
	/*add*/
	cmp $0, %eax
	je op_add
	
	pushl res
	pushl $sub
	call strcmp
	popl %ebx
	popl %ebx                      
	/*sub*/
	cmp $0, %eax
	je op_sub
	
	pushl res
	pushl $mul
	call strcmp
	popl %ebx
	popl %ebx                      
	/*mul*/
	cmp $0, %eax
	je op_mul
	
	pushl res
	pushl $div
	call strcmp
	popl %ebx
	popl %ebx                      
	/*div*/
	cmp $0, %eax
	je op_div
	
op_add:
	cmp %ecx, nr_elem
	je restaurare_ecx
	
	pushl %ecx
	
	movl (%edi, %ecx, 4), %eax
	addl operand, %eax
	movl %eax, (%edi, %ecx, 4)
	
	popl %ecx
	
	incl %ecx
	jmp op_add

op_sub:
	cmp %ecx, nr_elem
	je restaurare_ecx
	
	pushl %ecx
	
	movl (%edi, %ecx, 4), %eax
	subl operand, %eax
	movl %eax, (%edi, %ecx, 4)
	
	popl %ecx
	
	incl %ecx
	jmp op_sub

op_mul:
	cmp %ecx, nr_elem
	je restaurare_ecx
	
	pushl %ecx
	
	movl (%edi, %ecx, 4), %eax
	imull operand
	movl %eax, (%edi, %ecx, 4)
	
	popl %ecx
	
	incl %ecx
	jmp op_mul

op_div:
	cmp %ecx, nr_elem
	je restaurare_ecx
	
	xorl %edx, %edx
	pushl %ecx
	
	movl (%edi, %ecx, 4), %eax
	cmp $0, %eax
	jl schimbare_semn
	
	idivl operand
	movl %eax, (%edi, %ecx, 4)
	
	popl %ecx
	
	incl %ecx
	jmp op_div
schimbare_semn:
	movl $-1, %ebx
	imull %ebx, %eax
	
	idivl operand
	
	movl $-1, %ebx
	imull %ebx, %eax
	
	movl %eax, (%edi, %ecx, 4)
	
	popl %ecx
	incl %ecx
	jmp op_div
	
restaurare_ecx:
	pushl nr_linii
	pushl $formatPrintfnr
	call printf
	popl %ebx
	popl %ebx
	
	pushl $0
	call fflush
	popl %ebx
	
	pushl $space
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	pushl $0
	call fflush
	popl %ebx
	
	pushl nr_coloane
	pushl $formatPrintfnr
	call printf
	popl %ebx
	popl %ebx
	
	pushl $0
	call fflush
	popl %ebx
	
	pushl $space
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	pushl $0
	call fflush
	popl %ebx
	
	xorl %ecx, %ecx
	jmp afisare_matrice
	
afisare_matrice:
	cmp %ecx, nr_elem
	je exit
	
	pushl %ecx
	
	movl (%edi, %ecx, 4), %ebx
	
	pushl %ebx 
	pushl $formatPrintfnr
	call printf 
	popl %ebx 
	popl %ebx
	
	pushl $0
	call fflush
	popl %ebx
	
	pushl $space
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	pushl $0
	call fflush
	popl %ebx
	
	popl %ecx
	
	incl %ecx
	jmp afisare_matrice

	
exit:
	pushl $enter
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80
	
