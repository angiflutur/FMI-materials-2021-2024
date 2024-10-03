// cerinta 3

.data
	lit: .space 1
	nr1: .space 4
	nr2: .space 4
	sir: .space 100
	
	res: .space 100
	atoires: .space 100
	
	
	a: .space 4
 	b: .space 4 
	c: .space 4 
	d: .space 4
	e: .space 4
	f: .space 4
	g: .space 4
	h: .space 4
	i: .space 4
	j: .space 4
	k: .space 4
	l: .space 4
	m: .space 4
	n: .space 4
	o: .space 4
	p: .space 4
	q: .space 4
	r: .space 4
	s: .space 4
	t: .space 4
	u: .space 4
	v: .space 4
	w: .space 4
	x: .space 4
	y: .space 4
	z: .space 4
	
	
	let: .asciz "let"
	add: .asciz "add"
	sub: .asciz "sub"
	mul: .asciz "mul"
	div: .asciz "div"
	
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
	
	movl $-1, a
	movl $-2, b
	movl $-3, c
	movl $-4, d
	movl $-5, e
	movl $-6, f
	movl $-7, g
	movl $-8, h
	movl $-9, i
	movl $-10, j
	movl $-11, k
	movl $-12, l
	movl $-13, m
	movl $-14, n
	movl $-15, o
	movl $-16, p
	movl $-17, q
	movl $-18, r
	movl $-19, s
	movl $-20, t
	movl $-21, u
	movl $-22, v
	movl $-23, w
	movl $-24, x
	movl $-25, y
	movl $-26, z
	
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
	je cuvant
	
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
cuvant:
	
	pushl res
	pushl $let
	call strcmp
	popl %ebx
	popl %ebx
	cmp $0, %eax
	je op_let
	
	pushl res
	pushl $add
	call strcmp
	popl %ebx
	popl %ebx
	cmp $0, %eax
	je op_add
	
	pushl res
	pushl $sub
	call strcmp
	popl %ebx
	popl %ebx
	cmp $0, %eax
	je op_sub
	
	pushl res
	pushl $mul
	call strcmp
	popl %ebx
	popl %ebx
	cmp $0, %eax
	je op_mul
	
	pushl res
	pushl $div
	call strcmp
	popl %ebx
	popl %ebx
	cmp $0, %eax
	je op_div
	
	jmp litera
	
litera:
	movl res, %edi
	xorl %ecx, %ecx
	movb (%edi, %ecx, 1), %al
	
	cmp $97, %al
	je lit_a
	cmp $98, %al
	je lit_b
	cmp $99, %al
	je lit_c
	cmp $100, %al
	je lit_d
	cmp $101, %al
	je lit_e
	cmp $102, %al
	je lit_f
	cmp $103, %al
	je lit_g
	cmp $104, %al
	je lit_h
	cmp $105, %al
	je lit_i
	cmp $106, %al
	je lit_j
	cmp $107, %al
	je lit_k
	cmp $108, %al
	je lit_l
	cmp $109, %al
	je lit_m
	cmp $110, %al
	je lit_n
	cmp $111, %al
	je lit_o
	cmp $112, %al
	je lit_p
	cmp $113, %al
	je lit_q
	cmp $114, %al
	je lit_r
	cmp $115, %al
	je lit_s
	cmp $116, %al
	je lit_t
	cmp $117, %al
	je lit_u
	cmp $118, %al
	je lit_v
	cmp $119, %al
	je lit_w
	cmp $120, %al
	je lit_x
	cmp $121, %al
	je lit_y
	cmp $122, %al
	je lit_z
lit_a:
	pushl a
	jmp cont
lit_b:
	pushl b
	jmp cont
lit_c:
	pushl c
	jmp cont
lit_d:
	pushl d
	jmp cont
lit_e:
	pushl e
	jmp cont
lit_f:
	pushl f
	jmp cont
lit_g:
	pushl g
	jmp cont
lit_h:
	pushl h
	jmp cont
lit_i:
	pushl i
	jmp cont
lit_j:
	pushl j
	jmp cont
lit_k:
	pushl k
	jmp cont
lit_l:
	pushl l
	jmp cont
lit_m:
	pushl m
	jmp cont
lit_n:
	pushl n
	jmp cont
lit_o:
	pushl o
	jmp cont
lit_p:
	pushl p
	jmp cont
lit_q:
	pushl q
	jmp cont
lit_r:
	pushl r
	jmp cont
lit_s:
	pushl s
	jmp cont
lit_t:
	pushl t
	jmp cont
lit_u:
	pushl u
	jmp cont
lit_v:
	pushl v
	jmp cont
lit_w:
	pushl w
	jmp cont
lit_x:
	pushl x
	jmp cont
lit_y:
	pushl y
	jmp cont
lit_z:
	pushl z
	jmp cont
atribuire:
	
	cmp $-1, nr2
	je atribuire_a
	cmp $-2, nr2
	je atribuire_b
	cmp $-3, nr2
	je atribuire_c
	cmp $-4, nr2
	je atribuire_d
	cmp $-5, nr2
	je atribuire_e
	cmp $-6, nr2
	je atribuire_f
	cmp $-7, nr2
	je atribuire_g
	cmp $-8, nr2
	je atribuire_h
	cmp $-9, nr2
	je atribuire_i
	cmp $-10, nr2
	je atribuire_j
	cmp $-11, nr2
	je atribuire_k
	cmp $-12, nr2
	je atribuire_l
	cmp $-13, nr2
	je atribuire_m
	cmp $-14, nr2
	je atribuire_n
	cmp $-15, nr2
	je atribuire_o
	cmp $-16, nr2
	je atribuire_p
	cmp $-17, nr2
	je atribuire_q
	cmp $-18, nr2
	je atribuire_r
	cmp $-19, nr2
	je atribuire_s
	cmp $-20, nr2
	je atribuire_t
	cmp $-21, nr2
	je atribuire_u
	cmp $-22, nr2
	je atribuire_v
	cmp $-23, nr2
	je atribuire_w
	cmp $-24, nr2
	je atribuire_x
	cmp $-25, nr2
	je atribuire_y
	cmp $-26, nr2
	je atribuire_z
atribuire_a:
	movl %ebx, a
	jmp cont
atribuire_b:
	movl %ebx, b
	jmp cont
atribuire_c:
	movl %ebx, c
	jmp cont
atribuire_d:
	movl %ebx, d
	jmp cont
atribuire_e:
	movl %ebx, e
	jmp cont
atribuire_f:
	movl %ebx, f
	jmp cont
atribuire_g:
	movl %ebx, g
	jmp cont
atribuire_h:
	movl %ebx, h
	jmp cont
atribuire_i:
	movl %ebx, i
	jmp cont
atribuire_j:
	movl %ebx, j
	jmp cont
atribuire_k:
	movl %ebx, k
	jmp cont
atribuire_l:
	movl %ebx, l
	jmp cont
atribuire_m:
	movl %ebx, m
	jmp cont
atribuire_n:
	movl %ebx, n
	jmp cont
atribuire_o:
	movl %ebx, o
	jmp cont
atribuire_p:
	movl %ebx, p
	jmp cont
atribuire_q:
	movl %ebx, q
	jmp cont
atribuire_r:
	movl %ebx, r
	jmp cont
atribuire_s:
	movl %ebx, s
	jmp cont
atribuire_t:
	movl %ebx, t
	jmp cont
atribuire_u:
	movl %ebx, u
	jmp cont
atribuire_v:
	movl %ebx, v
	jmp cont
atribuire_w:
	movl %ebx, w
	jmp cont
atribuire_x:
	movl %ebx, x	
	jmp cont
atribuire_y:
	movl %ebx, y
	jmp cont
atribuire_z:
	movl %ebx, z
	jmp cont
op_let:
	popl nr1
	popl nr2
	movl nr1, %ebx
	movl nr2, %eax
	jmp atribuire

op_add:
	popl nr1
	popl nr2
	movl nr1, %eax
	addl nr2, %eax
	pushl %eax
	jmp cont
op_sub:
	popl nr1
	popl nr2
	movl nr2, %eax
	subl nr1, %eax
	pushl %eax
	jmp cont
op_mul:
	popl nr1
	popl nr2
	movl nr1, %eax
	mull nr2
	pushl %eax
	jmp cont
op_div:
	popl nr1
	popl nr2
	movl $0, %edx
	movl nr2, %eax
	divl nr1
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
