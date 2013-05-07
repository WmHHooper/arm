@ CSC 2110, Computer Organization
@ Tutorial 1: Introduction to Assembly
@ by William H. Hooper

@ extern "C" int ftoc(int f);
@ This function takes temperature f in
@ degrees Fahrenheit and returns the
@ equivalent degrees Centigrade

  .text
  .align  2
  .global ftoc
  .type  ftoc,function

ftoc:
  sub r1, r0, #32
  mov r2, #0x8F
  mul r3, r2, r1
  mov r0, r3, asr #8

  mov pc, lr

  .size  ftoc, . - ftoc
  .ident  "CSC 2110, Tutorial 1 "
  .ident  "William H. Hooper"
