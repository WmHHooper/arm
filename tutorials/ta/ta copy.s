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
  fldd  d1, [r0]
  fcvtsd  s4, d1
  fsts  s4, [r1]
  mov pc, lr

  .size DoubleToSingle, .-DoubleToSingle
  .ident  "GCC: (GNU) 4.7.2"
  .section  .note.GNU-stack,"",%progbits
