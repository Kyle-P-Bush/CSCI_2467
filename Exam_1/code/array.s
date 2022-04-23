	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0	sdk_version 12, 3
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ## -- Begin function main
LCPI0_0:
	.quad	0x412e848000000000              ## double 1.0E+6
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4
LCPI0_1:
	.long	1127219200                      ## 0x43300000
	.long	1160773632                      ## 0x45300000
	.long	0                               ## 0x0
	.long	0                               ## 0x0
LCPI0_2:
	.quad	0x4330000000000000              ## double 4503599627370496
	.quad	0x4530000000000000              ## double 1.9342813113834067E+25
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	$600128, %eax                   ## imm = 0x92840
	callq	____chkstk_darwin
	subq	%rax, %rsp
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movl	$0, -600020(%rbp)
	xorl	%eax, %eax
	movl	%eax, %edi
	callq	_time
	movl	%eax, %edi
	callq	_srand
	movq	$0, -600032(%rbp)
	movq	$0, -600040(%rbp)
	leaq	-200016(%rbp), %rdi
	movq	%rdi, -600120(%rbp)             ## 8-byte Spill
	movl	$10, %esi
	callq	_fill_random
	callq	_clock
	movq	-600120(%rbp), %rdi             ## 8-byte Reload
	movq	%rax, -600048(%rbp)
	leaq	-400016(%rbp), %rsi
	callq	_copyByRows
	callq	_clock
	movq	%rax, -600056(%rbp)
	movq	-600056(%rbp), %rax
	movq	-600048(%rbp), %rcx
	subq	%rcx, %rax
	movq	%rax, %xmm1
	movaps	LCPI0_1(%rip), %xmm0            ## xmm0 = [1127219200,1160773632,0,0]
	movaps	%xmm0, -600112(%rbp)            ## 16-byte Spill
	punpckldq	%xmm0, %xmm1            ## xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	movapd	LCPI0_2(%rip), %xmm0            ## xmm0 = [4.503599627370496E+15,1.9342813113834067E+25]
	movaps	%xmm0, -600096(%rbp)            ## 16-byte Spill
	subpd	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	unpckhpd	%xmm1, %xmm1                    ## xmm1 = xmm1[1,1]
	addsd	%xmm0, %xmm1
	movsd	LCPI0_0(%rip), %xmm0            ## xmm0 = mem[0],zero
	divsd	%xmm0, %xmm1
	movsd	-600032(%rbp), %xmm0            ## xmm0 = mem[0],zero
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -600032(%rbp)
	movsd	-600032(%rbp), %xmm0            ## xmm0 = mem[0],zero
	leaq	L_.str(%rip), %rdi
	movb	$1, %al
	callq	_printf
	callq	_clock
	movq	-600120(%rbp), %rdi             ## 8-byte Reload
	movq	%rax, -600064(%rbp)
	leaq	-600016(%rbp), %rsi
	callq	_copyByCols
	callq	_clock
	movaps	-600112(%rbp), %xmm2            ## 16-byte Reload
	movaps	-600096(%rbp), %xmm1            ## 16-byte Reload
	movq	%rax, -600072(%rbp)
	movq	-600072(%rbp), %rax
	movq	-600064(%rbp), %rcx
	subq	%rcx, %rax
	movq	%rax, %xmm0
	punpckldq	%xmm2, %xmm0            ## xmm0 = xmm0[0],xmm2[0],xmm0[1],xmm2[1]
	subpd	%xmm1, %xmm0
	movaps	%xmm0, %xmm1
	unpckhpd	%xmm0, %xmm0                    ## xmm0 = xmm0[1,1]
	addsd	%xmm1, %xmm0
	movsd	LCPI0_0(%rip), %xmm1            ## xmm1 = mem[0],zero
	divsd	%xmm1, %xmm0
	addsd	-600040(%rbp), %xmm0
	movsd	%xmm0, -600040(%rbp)
	movsd	-600040(%rbp), %xmm0            ## xmm0 = mem[0],zero
	leaq	L_.str.1(%rip), %rdi
	movb	$1, %al
	callq	_printf
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rcx
	cmpq	%rcx, %rax
	jne	LBB0_2
## %bb.1:
	xorl	%eax, %eax
	addq	$600128, %rsp                   ## imm = 0x92840
	popq	%rbp
	retq
LBB0_2:
	callq	___stack_chk_fail
	ud2
	.cfi_endproc
                                        ## -- End function
	.globl	_fill_random                    ## -- Begin function fill_random
	.p2align	4, 0x90
_fill_random:                           ## @fill_random
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	$0, -16(%rbp)
LBB1_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_3 Depth 2
	cmpl	$500, -16(%rbp)                 ## imm = 0x1F4
	jge	LBB1_8
## %bb.2:                               ##   in Loop: Header=BB1_1 Depth=1
	movl	$0, -20(%rbp)
LBB1_3:                                 ##   Parent Loop BB1_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	cmpl	$100, -20(%rbp)
	jge	LBB1_6
## %bb.4:                               ##   in Loop: Header=BB1_3 Depth=2
	callq	_rand
	cltd
	idivl	-12(%rbp)
	addl	$1, %edx
	movq	-8(%rbp), %rax
	movslq	-16(%rbp), %rcx
	imulq	$400, %rcx, %rcx                ## imm = 0x190
	addq	%rcx, %rax
	movslq	-20(%rbp), %rcx
	movl	%edx, (%rax,%rcx,4)
## %bb.5:                               ##   in Loop: Header=BB1_3 Depth=2
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	LBB1_3
LBB1_6:                                 ##   in Loop: Header=BB1_1 Depth=1
	jmp	LBB1_7
LBB1_7:                                 ##   in Loop: Header=BB1_1 Depth=1
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
	jmp	LBB1_1
LBB1_8:
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_copyByRows                     ## -- Begin function copyByRows
	.p2align	4, 0x90
_copyByRows:                            ## @copyByRows
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$0, -20(%rbp)
LBB2_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB2_3 Depth 2
	cmpl	$500, -20(%rbp)                 ## imm = 0x1F4
	jge	LBB2_8
## %bb.2:                               ##   in Loop: Header=BB2_1 Depth=1
	movl	$0, -24(%rbp)
LBB2_3:                                 ##   Parent Loop BB2_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	cmpl	$100, -24(%rbp)
	jge	LBB2_6
## %bb.4:                               ##   in Loop: Header=BB2_3 Depth=2
	movq	-8(%rbp), %rax
	movslq	-20(%rbp), %rcx
	imulq	$400, %rcx, %rcx                ## imm = 0x190
	addq	%rcx, %rax
	movslq	-24(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx
	movq	-16(%rbp), %rax
	movslq	-20(%rbp), %rcx
	imulq	$400, %rcx, %rcx                ## imm = 0x190
	addq	%rcx, %rax
	movslq	-24(%rbp), %rcx
	movl	%edx, (%rax,%rcx,4)
## %bb.5:                               ##   in Loop: Header=BB2_3 Depth=2
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	LBB2_3
LBB2_6:                                 ##   in Loop: Header=BB2_1 Depth=1
	jmp	LBB2_7
LBB2_7:                                 ##   in Loop: Header=BB2_1 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	LBB2_1
LBB2_8:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_copyByCols                     ## -- Begin function copyByCols
	.p2align	4, 0x90
_copyByCols:                            ## @copyByCols
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$0, -20(%rbp)
LBB3_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB3_3 Depth 2
	cmpl	$500, -20(%rbp)                 ## imm = 0x1F4
	jge	LBB3_8
## %bb.2:                               ##   in Loop: Header=BB3_1 Depth=1
	movl	$0, -24(%rbp)
LBB3_3:                                 ##   Parent Loop BB3_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	cmpl	$100, -24(%rbp)
	jge	LBB3_6
## %bb.4:                               ##   in Loop: Header=BB3_3 Depth=2
	movq	-8(%rbp), %rax
	movslq	-24(%rbp), %rcx
	imulq	$400, %rcx, %rcx                ## imm = 0x190
	addq	%rcx, %rax
	movslq	-20(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx
	movq	-16(%rbp), %rax
	movslq	-24(%rbp), %rcx
	imulq	$400, %rcx, %rcx                ## imm = 0x190
	addq	%rcx, %rax
	movslq	-20(%rbp), %rcx
	movl	%edx, (%rax,%rcx,4)
## %bb.5:                               ##   in Loop: Header=BB3_3 Depth=2
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	LBB3_3
LBB3_6:                                 ##   in Loop: Header=BB3_1 Depth=1
	jmp	LBB3_7
LBB3_7:                                 ##   in Loop: Header=BB3_1 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	LBB3_1
LBB3_8:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"It took %f seconds to copy row by row.\n"

L_.str.1:                               ## @.str.1
	.asciz	"It took %f seconds to copy column by column.\n"

.subsections_via_symbols
