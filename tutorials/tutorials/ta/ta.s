@ CSC 2110, Computer Organization
@ Tutorial A: Floating-Point Formats
@ by William H. Hooper

@ void DoubleToSingle(double * D, float * F);
@ converts the double-precision value at D,
@ to single-precision, storing it at F.

  .text
  .align  2
  .global DoubleToSingle
  .type DoubleToSingle, %function

DoubleToSingle:
  fmrrd r1, r2, d0
  
  ldr   r3, mantissa
  and   r3, r3, r2, lsl #3
  orr   r0, r3, r1, lsr #29
  
  ldr   r3, exponent
  and   r3, r3, r2, lsr #20
  sub   r3, r3, #896
  orr   r0, r0, r3, lsl #23
  
  mov   r3, r2, lsr #31
  orr   r0, r0, r3, lsl #31
  
  fmsr  s0, r0
  mov   pc, lr

mantissa:
  .word 0x007FFFFF
exponent:
  .word 0x7ff
  .size DoubleToSingle, .-DoubleToSingle
  .ident  "GCC: (GNU) 4.7.2"
  .section  .note.GNU-stack,"",%progbits
