// cerinta 1
/cerinta1/
// exemplu: input = A78801C00A7890EC04
//         output = x 1 let x -14 div
.data
	sirb16: .space 100
	sirb2: .space 500
	sirinstr: .space 70
	
	
	indexSb2: .long 0
	nr: .long 0
	
	let: .asciz "let"
	add: .asciz "add"
	sub: .asciz "sub"
	mul: .asciz "mul"
	div: .asciz "div"
	enter: .asciz "\n"
	space: .asciz " "
	minus: .asciz "-"
	
	formatScanf: .asciz "%s"
	formatPrintf: .asciz "%s\n"
	formatPrintfsir: .asciz "%s"
	formatPrintfnr: .asciz "%d"
	formatPrintflitera: .asciz "%c"

.text

.global main

main:

    // scanf ("%s", &sirb16)
    pushl $sirb16
    pushl $formatScanf
    call scanf
    popl %ebx
    popl %ebx
    
    movl $sirb16, %edi   #dest. index
    movl $sirb2, %esi   #source index
    xorl %ecx, %ecx
    
et_for:

    movb (%edi, %ecx, 1), %al
    cmp $0, %al
    je main2
    
    // instructiuni
    cmp $48, %al
    je cif0                #0
    
    cmp $49, %al
    je cif1                #1
    
    cmp $50, %al
    je cif2                #2
    
    cmp $51, %al
    je cif3                #3
    
    cmp $52, %al
    je cif4                #4
    
    cmp $53, %al
    je cif5                #5

    cmp $54, %al
    je cif6                #6
    
    cmp $55, %al
    je cif7                #7
    
    cmp $56, %al
    je cif8                #8
    
    cmp $57, %al
    je cif9                #9
    
    cmp $65, %al
    je cifA                #10
    
    cmp $66, %al
    je cifB                #11
    
    cmp $67, %al
    je cifC                #12
    
    cmp $68, %al
    je cifD                #13
    
    cmp $69, %al
    je cifE                #14
    
    cmp $70, %al
    je cifF                #15
    
cont:
    incl %ecx
    jmp et_for
    
cif0:
    #0000
    pushl %ecx
    
    movl indexSb2, %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    
    addl $4, indexSb2
    
    popl %ecx
    jmp cont

cif1:
    #0001
    pushl %ecx
    
    movl indexSb2, %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    
    addl $4, indexSb2
    
    popl %ecx
    jmp cont

cif2:
    #0010
    pushl %ecx
    
    movl indexSb2, %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    
    addl $4, indexSb2
    
    popl %ecx
    jmp cont

cif3:
    #0011
    pushl %ecx
    
    movl indexSb2, %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    
    addl $4, indexSb2
    
    popl %ecx
    jmp cont

cif4:
    #0100
    pushl %ecx
    
    movl indexSb2, %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    
    addl $4, indexSb2
    
    popl %ecx
    jmp cont

cif5:
    #0101
    pushl %ecx
    
    movl indexSb2, %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    
    addl $4, indexSb2
    
    popl %ecx
    jmp cont

cif6:
    #0110
    pushl %ecx
    
    movl indexSb2, %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    
    addl $4, indexSb2
    
    popl %ecx
    jmp cont

cif7:
    #0111
    pushl %ecx
    
    movl indexSb2, %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    
    addl $4, indexSb2
    
    popl %ecx
    jmp cont

cif8:
    #1000
    pushl %ecx
    
    movl indexSb2, %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    
    addl $4, indexSb2
    
    popl %ecx
    jmp cont

cif9:
    #1001
    pushl %ecx
    
    movl indexSb2, %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    
    addl $4, indexSb2
    
    popl %ecx
    jmp cont
    
cifA:
    #1010
    pushl %ecx
    
    movl indexSb2, %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    
    addl $4, indexSb2
    
    popl %ecx
    jmp cont

cifB:
    #1011
    pushl %ecx
    
    movl indexSb2, %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    
    addl $4, indexSb2
    
    popl %ecx
    jmp cont
    
cifC:
    #1100
    pushl %ecx
    
    movl indexSb2, %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    
    addl $4, indexSb2
    
    popl %ecx
    jmp cont
    
cifD:
    #1101
    pushl %ecx
    
    movl indexSb2, %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    
    addl $4, indexSb2
    
    popl %ecx
    jmp cont
    
cifE:
    #1110
    pushl %ecx
    
    movl indexSb2, %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    
    addl $4, indexSb2
    
    popl %ecx
    jmp cont
    
cifF:
    #1111
    pushl %ecx
    
    movl indexSb2, %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    
    addl $4, indexSb2
    
    popl %ecx
    jmp cont
    
main2:
      
      movl $sirb2, %edi
      xorl %ecx, %ecx             
      /*pe post de i*/
      
et_for2:
      movb (%edi, %ecx, 1), %al
      cmp $0, %al
      je exit
      
      pushl %ecx
      pushl $0
      call fflush
      popl %ebx
      popl %ecx
      
      incl %ecx                   
      /*sunt pe b1*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je b1_0
      cmp $49, %al
      je b1_1
cont2:
      incl %ecx       
      /*sunt pe b0*/
      
      movb (%edi, %ecx, 1), %al
      cmp $0, %al
      jne et_space
      
      jmp et_for2
      
et_space:
      pushl %ecx
      pushl $space
      pushl $formatPrintfsir
      call printf
      popl %ebx
      popl %ebx
      popl %ecx
      
      jmp et_for2

b1_0:
      // NUMAR INTREG SAU VARIABILA
      incl %ecx                   
      /*sunt pe b2*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je b1_0_b2_0
      cmp $49, %al
      je b1_0_b2_1
b1_0_b2_0:
      // NUMAR INTREG
      pushl %ecx             
      /*ii dau lui nr val 0*/
      movl $0, %eax
      movl nr, %ebx
      mull %ebx
      movl %eax, nr
      popl %ecx
      incl %ecx                  
      /*sunt pe b3*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je nrpoz
      cmp $49, %al
      je nrneg
nrpoz:
      incl %ecx                  
      /*sunt pe b4*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je nrpoz_b4_0
      cmp $49, %al
      je nrpoz_b4_1
      
nrpoz_b4_0:
      incl %ecx                 
      /*sunt pe b5*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je nrpoz_b5_0
      cmp $49, %al
      je nrpoz_b5_1
nrpoz_b4_1:
      addl $128, nr
      incl %ecx                 
      /*sunt pe b5*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je nrpoz_b5_0
      cmp $49, %al
      je nrpoz_b5_1
            
nrpoz_b5_0:
      incl %ecx                 
      /*sunt pe b6*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je nrpoz_b6_0
      cmp $49, %al
      je nrpoz_b6_1
nrpoz_b5_1:
      addl $64, nr
      incl %ecx                 
      /*sunt pe b6*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je nrpoz_b6_0
      cmp $49, %al
      je nrpoz_b6_1
      
nrpoz_b6_0:
      incl %ecx                 
      /*sunt pe b7*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je nrpoz_b7_0
      cmp $49, %al
      je nrpoz_b7_1
nrpoz_b6_1:
      addl $32, nr
      incl %ecx                 
      /*sunt pe b7*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je nrpoz_b7_0
      cmp $49, %al
      je nrpoz_b7_1        
   
nrpoz_b7_0:
      incl %ecx                 
      /*sunt pe b8*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je nrpoz_b8_0
      cmp $49, %al
      je nrpoz_b8_1
nrpoz_b7_1:
      addl $16, nr
      incl %ecx                 
      /*sunt pe b8*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je nrpoz_b8_0
      cmp $49, %al
      je nrpoz_b8_1
       
nrpoz_b8_0:
      incl %ecx                 
      /*sunt pe b9*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je nrpoz_b9_0
      cmp $49, %al
      je nrpoz_b9_1
nrpoz_b8_1:
      addl $8, nr
      incl %ecx                 
      /*sunt pe b9*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je nrpoz_b9_0
      cmp $49, %al
      je nrpoz_b9_1

nrpoz_b9_0:
      incl %ecx                 
      /*sunt pe b10*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je nrpoz_b10_0
      cmp $49, %al
      je nrpoz_b10_1
nrpoz_b9_1:
      addl $4, nr
      incl %ecx                 
      /*sunt pe b10*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je nrpoz_b10_0
      cmp $49, %al
      je nrpoz_b10_1
      
nrpoz_b10_0:
      incl %ecx                 
      /*sunt pe b11*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je nrpoz_b11_0
      cmp $49, %al
      je nrpoz_b11_1
nrpoz_b10_1:
      addl $2, nr
      incl %ecx                 
      /*sunt pe b11*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je nrpoz_b11_0
      cmp $49, %al
      je nrpoz_b11_1
      
nrpoz_b11_0:
      pushl %ecx
      
      pushl nr
      pushl $formatPrintfnr
      call printf
      popl %ebx
      popl %ebx
      
      pushl %ecx
      pushl $0
      call fflush
      popl %ebx
      popl %ecx
      
      popl %ecx
      jmp cont2
nrpoz_b11_1:
      addl $1, nr
      pushl %ecx
      
      pushl nr
      pushl $formatPrintfnr
      call printf
      popl %ebx
      popl %ebx
      
      pushl %ecx
      pushl $0
      call fflush
      popl %ebx
      popl %ecx
      
      popl %ecx
      jmp cont2
      
nrneg:
      incl %ecx                  
      /*sunt pe b4*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je nrneg_b4_0
      cmp $49, %al
      je nrneg_b4_1
      
nrneg_b4_0:
      incl %ecx                 
      /*sunt pe b5*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je nrneg_b5_0
      cmp $49, %al
      je nrneg_b5_1
nrneg_b4_1:
      subl $128, nr
      incl %ecx                 
      /*sunt pe b5*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je nrneg_b5_0
      cmp $49, %al
      je nrneg_b5_1
            
nrneg_b5_0:
      incl %ecx                 
      /*sunt pe b6*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je nrneg_b6_0
      cmp $49, %al
      je nrneg_b6_1
nrneg_b5_1:
      subl $64, nr
      incl %ecx                 
      /*sunt pe b6*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je nrneg_b6_0
      cmp $49, %al
      je nrneg_b6_1
      
nrneg_b6_0:
      incl %ecx                 
      /*sunt pe b7*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je nrneg_b7_0
      cmp $49, %al
      je nrneg_b7_1
nrneg_b6_1:
      subl $32, nr
      incl %ecx                 
      /*sunt pe b7*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je nrneg_b7_0
      cmp $49, %al
      je nrneg_b7_1        
   
nrneg_b7_0:
      incl %ecx                 
      /*sunt pe b8*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je nrneg_b8_0
      cmp $49, %al
      je nrneg_b8_1
nrneg_b7_1:
      subl $16, nr
      incl %ecx                 
      /*sunt pe b8*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je nrneg_b8_0
      cmp $49, %al
      je nrneg_b8_1
       
nrneg_b8_0:
      incl %ecx                 
      /*sunt pe b9*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je nrneg_b9_0
      cmp $49, %al
      je nrneg_b9_1
nrneg_b8_1:
      subl $8, nr
      incl %ecx                 
      /*sunt pe b9*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je nrneg_b9_0
      cmp $49, %al
      je nrneg_b9_1

nrneg_b9_0:
      incl %ecx                 
      /*sunt pe b10*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je nrneg_b10_0
      cmp $49, %al
      je nrneg_b10_1
nrneg_b9_1:
      subl $4, nr
      incl %ecx                 
      /*sunt pe b10*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je nrneg_b10_0
      cmp $49, %al
      je nrneg_b10_1
      
nrneg_b10_0:
      incl %ecx                 
      /*sunt pe b11*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je nrneg_b11_0
      cmp $49, %al
      je nrneg_b11_1
nrneg_b10_1:
      subl $2, nr
      incl %ecx                 
      /*sunt pe b11*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je nrneg_b11_0
      cmp $49, %al
      je nrneg_b11_1
      
nrneg_b11_0:
	cmp $0, nr
	je minus_zero
	
      pushl %ecx
      
      pushl nr
      pushl $formatPrintfnr
      call printf
      popl %ebx
      popl %ebx
      
      pushl %ecx
      pushl $0
      call fflush
      popl %ebx
      popl %ecx
      
      popl %ecx
      jmp cont2
      
minus_zero:
	pushl %ecx
	pushl $minus
	pushl $formatPrintfsir
	call printf
	popl %ebx
	popl %ebx
	
	pushl nr
	pushl $formatPrintfnr
	call printf
	popl %ebx
	popl %ebx
	popl %ecx
	jmp cont2
nrneg_b11_1:
      subl $1, nr
      pushl %ecx

      pushl nr
      pushl $formatPrintfnr
      call printf
      popl %ebx
      popl %ebx
      
      pushl %ecx
      pushl $0
      call fflush
      popl %ebx
      popl %ecx
      
      popl %ecx
      jmp cont2

b1_0_b2_1:
      // VARIABILA
      pushl %ecx             
      /*ii dau lui nr val 0*/
      movl $0, %eax
      movl nr, %ebx
      mull %ebx
      movl %eax, nr
      popl %ecx
      incl %ecx                  
      /*sunt pe b3*/
      incl %ecx                  
      /*sunt pe b4*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je var_b4_0
      cmp $49, %al
      je var_b4_1

var_b4_0:
      incl %ecx                 
      /*sunt pe b5*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je var_b5_0
      cmp $49, %al
      je var_b5_1
var_b4_1:
      addl $128, nr
      incl %ecx                 
      /*sunt pe b5*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je var_b5_0
      cmp $49, %al
      je var_b5_1
            
var_b5_0:
      incl %ecx                 
      /*sunt pe b6*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je var_b6_0
      cmp $49, %al
      je var_b6_1
var_b5_1:
      addl $64, nr
      incl %ecx                 
      /*sunt pe b6*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je var_b6_0
      cmp $49, %al
      je var_b6_1
      
var_b6_0:
      incl %ecx                 
      /*sunt pe b7*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je var_b7_0
      cmp $49, %al
      je var_b7_1
var_b6_1:
      addl $32, nr
      incl %ecx                 
      /*sunt pe b7*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je var_b7_0
      cmp $49, %al
      je var_b7_1        
   
var_b7_0:
      incl %ecx                 
      /*sunt pe b8*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je var_b8_0
      cmp $49, %al
      je var_b8_1
var_b7_1:
      addl $16, nr
      incl %ecx                 
      /*sunt pe b8*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je var_b8_0
      cmp $49, %al
      je var_b8_1
       
var_b8_0:
      incl %ecx                 
      /*sunt pe b9*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je var_b9_0
      cmp $49, %al
      je var_b9_1
var_b8_1:
      addl $8, nr
      incl %ecx                 
      /*sunt pe b9*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je var_b9_0
      cmp $49, %al
      je var_b9_1

var_b9_0:
      incl %ecx                 
      /*sunt pe b10*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je var_b10_0
      cmp $49, %al
      je var_b10_1
var_b9_1:
      addl $4, nr
      incl %ecx                 
      /*sunt pe b10*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je var_b10_0
      cmp $49, %al
      je var_b10_1
      
var_b10_0:
      incl %ecx                 
      /*sunt pe b11*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je var_b11_0
      cmp $49, %al
      je var_b11_1
var_b10_1:
      addl $2, nr
      incl %ecx                 
      /*sunt pe b11*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je var_b11_0
      cmp $49, %al
      je var_b11_1
      
var_b11_0:
      pushl %ecx
      
      pushl nr
      pushl $formatPrintflitera
      call printf
      popl %ebx
      popl %ebx
      
      pushl %ecx
      pushl $0
      call fflush
      popl %ebx
      popl %ecx
      
      popl %ecx
      
      jmp cont2
var_b11_1:
      addl $1, nr
      pushl %ecx
      
      pushl nr
      pushl $formatPrintflitera
      call printf
      popl %ebx
      popl %ebx
      
      pushl %ecx
      pushl $0
      call fflush
      popl %ebx
      popl %ecx
      
      popl %ecx
      
      jmp cont2


b1_1:
      // OPERATIE
      
      incl %ecx                  
      /*sunt pe b2*/
      incl %ecx                  
      /*sunt pe b3*/
      incl %ecx                  
      /*sunt pe b4*/
      incl %ecx                  
      /*sunt pe b5*/
      incl %ecx                  
      /*sunt pe b6*/
      incl %ecx                  
      /*sunt pe b7*/
      incl %ecx                  
      /*sunt pe b8*/
      incl %ecx                  
      /*sunt pe b9*/
      
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je operatie_b9_0
      cmp $49, %al
      je operatie_b9_1           
      /*DIV*/
      
operatie_b9_0:
      incl %ecx          
      /*sunt pe b10*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je operatie_b10_0
      cmp $49, %al
      je operatie_b10_1
      
operatie_b10_0:
      incl %ecx          
      /*sunt pe b11*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je operatie_b10_0_b11_0
      cmp $49, %al
      je operatie_b10_0_b11_1
operatie_b10_0_b11_0:

      //sunt pe cazul 000  LET
      pushl %ecx
      
      pushl $let
      pushl $formatPrintfsir
      call printf
      popl %ebx
      popl %ebx
      
      pushl %ecx
      pushl $0
      call fflush
      popl %ebx
      popl %ecx
      
      popl %ecx
      jmp cont2
operatie_b10_0_b11_1:
      //sunt pe cazul 001 ADD
      pushl %ecx
      
      pushl $add
      pushl $formatPrintfsir
      call printf
      popl %ebx
      popl %ebx
      
      pushl %ecx
      pushl $0
      call fflush
      popl %ebx
      popl %ecx
      
      popl %ecx
      jmp cont2
operatie_b10_1:                 
      incl %ecx          /*sunt pe b11*/
      movb (%edi, %ecx, 1), %al
      cmp $48, %al
      je operatie_b10_1_b11_0
      cmp $49, %al
      je operatie_b10_1_b11_1
operatie_b10_1_b11_0:

      //sunt pe cazul 010  SUB
      pushl %ecx
      
      pushl $sub
      pushl $formatPrintfsir
      call printf
      popl %ebx
      popl %ebx
      
      pushl %ecx
      pushl $0
      call fflush
      popl %ebx
      popl %ecx
      
      popl %ecx
      jmp cont2
operatie_b10_1_b11_1:
      //sunt pe cazul 011 MUL
      pushl %ecx
      
      pushl $mul
      pushl $formatPrintfsir
      call printf
      popl %ebx
      popl %ebx
      
      pushl %ecx
      pushl $0
      call fflush
      popl %ebx
      popl %ecx
      
      popl %ecx
      jmp cont2

operatie_b9_1:

      //sunt pe cazul 100 DIV
      incl %ecx    
      /*sunt pe b10*/
      incl %ecx    
      /*sunt pe b11*/
      
      pushl %ecx
      
      pushl $div
      pushl $formatPrintfsir
      call printf
      popl %ebx
      popl %ebx
      
      pushl %ecx
      pushl $0
      call fflush
      popl %ebx
      popl %ecx
      
      popl %ecx
      jmp cont2
exit:
	pushl $enter
	pushl $formatPrintfsir
	call printf
	popl %ebx
	popl %ebx
      movl $1, %eax
      xorl %ebx, %ebx
      int $0x80
