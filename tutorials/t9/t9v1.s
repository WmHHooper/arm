@ CSC 2110, Computer Organization
@ Tutorial 9: Floating-Point Instructions
@ Version 1: Eliminate unnecessary moves
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
@ fsubd d0, d1, d1

loop:
  fldd  d2, [r0]
  fldd  d3, [r1]
@ fldd  d2, [r0], #8
@ fldd  d3, [r1], #8
  fmuld d4, d2, d3
  faddd d0, d0, d4
  add   r0, r0, #8
  add   r1, r1, #8
  subs  r2, r2, #1
  bgt   loop

  mov pc, lr

data:
  .double 0.0
  .size DotProd, .-DotProd
  .ident  "CSC 2110, Tutorial B, Mod 1 "
  .ident  "William H. Hooper"
