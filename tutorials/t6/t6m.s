	.arch armv6
	.eabi_attribute 27, 3
	.eabi_attribute 28, 1
	.fpu vfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	""
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,4
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Fibonacci calculator, F(n)\000"
	.align	2
.LC1:
	.ascii	"Please enter whole numbers, 'q' to quit.\000"
	.align	2
.LC2:
	.ascii	"n> \000"
	.align	2
.LC3:
	.ascii	"Fib(\000"
	.align	2
.LC4:
	.ascii	") = \000"
	.align	2
.LC5:
	.ascii	" computed in \000"
	.align	2
.LC6:
	.ascii	" seconds \000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	.fnstart
.LFB989:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #40
	sub	sp, sp, #40
	ldr	r0, .L8+8
	ldr	r1, .L8+12
.LEHB0:
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	r3, r0
	mov	r0, r3
	ldr	r1, .L8+16
	bl	_ZNSolsEPFRSoS_E
	mov	r3, r0
	mov	r0, r3
	ldr	r1, .L8+20
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	r3, r0
	mov	r0, r3
	ldr	r1, .L8+16
	bl	_ZNSolsEPFRSoS_E
	mov	r3, r0
	mov	r0, r3
	ldr	r1, .L8+16
	bl	_ZNSolsEPFRSoS_E
	mov	r3, r0
	mov	r0, r3
	ldr	r1, .L8+24
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	b	.L2
.L3:
	sub	r3, fp, #32
	mov	r0, #2
	mov	r1, r3
	bl	clock_gettime
	ldr	r3, [fp, #-24]
	mov	r0, r3
	bl	Fib
	mov	r3, r0
	str	r3, [fp, #-8]
	sub	r3, fp, #40
	mov	r0, #2
	mov	r1, r3
	bl	clock_gettime
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-32]
	rsb	r3, r3, r2
	fmsr	s15, r3	@ int
	fsitod	d6, s15
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-28]
	rsb	r3, r3, r2
	fmsr	s15, r3	@ int
	fsitod	d5, s15
	fldd	d7, .L8
	fmuld	d7, d5, d7
	faddd	d7, d6, d7
	fstd	d7, [fp, #-20]
	ldr	r0, .L8+8
	ldr	r1, .L8+28
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-24]
	mov	r0, r2
	mov	r1, r3
	bl	_ZNSolsEi
	mov	r3, r0
	mov	r0, r3
	ldr	r1, .L8+32
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	r3, r0
	mov	r0, r3
	ldr	r1, [fp, #-8]
	bl	_ZNSolsEi
	mov	r3, r0
	mov	r0, r3
	ldr	r1, .L8+36
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	r3, r0
	mov	r0, r3
	fldd	d0, [fp, #-20]
	bl	_ZNSolsEd
	mov	r3, r0
	mov	r0, r3
	ldr	r1, .L8+40
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	r3, r0
	mov	r0, r3
	ldr	r1, .L8+16
	bl	_ZNSolsEPFRSoS_E
	mov	r3, r0
	mov	r0, r3
	ldr	r1, .L8+24
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
.L2:
	sub	r3, fp, #24
	ldr	r0, .L8+44
	mov	r1, r3
	bl	_ZNSirsERi
	mov	r3, r0
	ldr	r2, [r3, #0]
	sub	r2, r2, #12
	ldr	r2, [r2, #0]
	add	r3, r3, r2
	mov	r0, r3
	bl	_ZNKSt9basic_iosIcSt11char_traitsIcEEcvPvEv
.LEHE0:
	mov	r3, r0
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L3
	mov	r3, #0
	b	.L7
.L6:
.LEHB1:
	bl	__cxa_end_cleanup
.LEHE1:
.L7:
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L9:
	.align	3
.L8:
	.word	-400107883
	.word	1041313291
	.word	_ZSt4cout
	.word	.LC0
	.word	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	_ZSt3cin
	.global	__gxx_personality_v0
	.personality	__gxx_personality_v0
	.handlerdata
.LLSDA989:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE989-.LLSDACSB989
.LLSDACSB989:
	.uleb128 .LEHB0-.LFB989
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L6-.LFB989
	.uleb128 0
	.uleb128 .LEHB1-.LFB989
	.uleb128 .LEHE1-.LEHB1
	.uleb128 0
	.uleb128 0
.LLSDACSE989:
	.text
	.fnend
	.size	main, .-main
	.align	2
	.type	_Z41__static_initialization_and_destruction_0ii, %function
_Z41__static_initialization_and_destruction_0ii:
	.fnstart
.LFB1001:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r3, [fp, #-8]
	cmp	r3, #1
	bne	.L10
	ldr	r2, [fp, #-12]
	ldr	r3, .L12
	cmp	r2, r3
	bne	.L10
	ldr	r0, .L12+4
	bl	_ZNSt8ios_base4InitC1Ev
	ldr	r0, .L12+4
	ldr	r1, .L12+8
	ldr	r2, .L12+12
	bl	__aeabi_atexit
.L10:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L13:
	.align	2
.L12:
	.word	65535
	.word	_ZStL8__ioinit
	.word	_ZNSt8ios_base4InitD1Ev
	.word	__dso_handle
	.cantunwind
	.fnend
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.align	2
	.type	_GLOBAL__sub_I_main, %function
_GLOBAL__sub_I_main:
	.fnstart
.LFB1002:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	mov	r0, #1
	ldr	r1, .L15
	bl	_Z41__static_initialization_and_destruction_0ii
	ldmfd	sp!, {fp, pc}
.L16:
	.align	2
.L15:
	.word	65535
	.cantunwind
	.fnend
	.size	_GLOBAL__sub_I_main, .-_GLOBAL__sub_I_main
	.section	.init_array,"aw"
	.align	2
	.word	_GLOBAL__sub_I_main
	.hidden	__dso_handle
	.ident	"GCC: (GNU) 4.7.2"
	.section	.note.GNU-stack,"",%progbits
