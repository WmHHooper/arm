@ CSC 2110, Computer Organization
@ Tutorial C: Pipelines and Optimization
@ Version 3: Reduce Stalls
@ by William H. Hooper

@ double DotProd(double X[], double Y[], int N);
@ This function computes the dot product of two vectors
@ X and Y, each of length N.

  .text
  .align  2
  .global DotProd
  .type DotProd, %function
  
DotProd:
  fldd  d0, data

loop:
  fldd  d1, [r0]
  fldd  d2, [r0, #8]
  fldd  d3, [r1]
  fldd  d4, [r1, #8]
  add   r0, r0, #16
  add   r1, r1, #16
  subs  r2, r2, #2
  fmuld d5, d1, d3
  fmuld d6, d2, d4
  faddd d7, d0, d5
  faddd d0, d7, d6
  bgt   loop

  mov pc, lr

data:
  .double 0.0
  .size DotProd, .-DotProd
  .ident  "CSC 2110, Tutorial C, Version 3 "
  .ident  "William H. Hooper"
