@ CSC 2110, Computer Organization
@ Tutorial D: Vector Operations
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
  vldmia.f64  r0!, {d4, d5, d6, d7}
  vldmia.f64  r1!, {d8, d9, d10, d11}
  subs        r2, r2, #4
  vmla.f64    d0, d4, d8
  vmla.f64    d0, d5, d9
  vmla.f64    d0, d6, d10
  vmla.f64    d0, d7, d11
  bgt   loop

  mov pc, lr

data:
  .double 0.0
  .size DotProd, .-DotProd
  .ident  "CSC 2110, Tutorial C, Version 3 "
  .ident  "William H. Hooper"
