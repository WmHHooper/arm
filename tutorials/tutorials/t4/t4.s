@ CSC 2110, Computer Organization
@ Tutorial 4: Addressing Modes II
@ by William H. Hooper

@ CopyScores(int N, short int S[],
@            record R[]);
@ copies N scores from array R into array S

  .text
  .align  2
  .global CopyScores
  .type CopyScores,function

CopyScores: 
  sub   r2, r2, #8

loop:
  ldrh  r3, [r2, #16]!
  strh  r3, [r1], #2
  subs  r0, r0, #1
  bgt loop

  mov pc, lr

  .size CopyScores, . - CopyScores
  .ident  "CSC 2110, Tutorial 4 "
  .ident  "William H. Hooper"
