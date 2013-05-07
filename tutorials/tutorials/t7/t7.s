@ CSC 2110, Computer Organization
@ Tutorial 8: Optimization
@ by William H. Hooper

@ This program improves on the compiler
@ output of the previous tutorial,
@ by removing unnecessary stack transfers
@ and compressing the arithmetic.  It
@ is still truly recursive, and shows
@ the minimal code necessary to save
@ registers and call subroutines.

  .text
  .align  2
  .global Fib
  .type  Fib, %function

Fib:
  subs  r0, r0, #1
  bgt   recursion
  mov   r0, #1
  mov   pc, lr

recursion:
	stmfd	sp!, {r0, fp, lr}
  add   fp, sp, #8
  sub   sp, sp, #4
  bl    Fib

  str   r0, [fp, #-12]
  ldr   r2, [fp, #-8]
  sub   r0, r2, #1
  bl    Fib

  ldr   r3, [fp, #-12]
  add   r0, r3, r0
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}

  .size  Fib, . - Fib
  .ident  "CSC 2110, Tutorial 8 "
  .ident  "William H. Hooper"
