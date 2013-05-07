@ CSC 2110, Computer Organization
@ Tutorial 5: Shift Operations
@ by William H. Hooper

@ int OctToInt(char *S);
@ converts String S to an integer,
@ assuming the characters in S are
@ octal digits.

  .text
  .align  2
  .global OctToInt
  .type   OctToInt, function

OctToInt:
  mov     r1, #0
  ldrb    r2, [r0]
  b       test

loop:
  and     r2, r2, #7
  orr     r1, r2, r1, lsl #3
  ldrb    r2, [r0, #1]!

test:
  teq     r2, #0
  bne     loop

  mov     r0, r1
  mov     pc, lr

  .size   OctToInt, . - OctToInt
  .ident  "CSC 2110, Tutorial 5 "
  .ident  "William H. Hooper"
