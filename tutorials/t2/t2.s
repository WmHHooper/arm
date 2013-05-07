@ CSC 2110, Computer Organization
@ Tutorial 2: Labels & Branch Instructions
@ by William H. Hooper

@ extern "C" void exponent(int a, int b);
@ This function raises a to the b power,
@ returning a^b.  If b < 0, it returns
@ zero.

  .text
  .align  2
  .global exponent
  .type   exponent,function
  
exponent:
  cmp r1, #0
  mov r2, #1
  movlt r2, #0
  ble return

loop: 
  subs  r1, r1, #1
  mul r2, r0, r2
  bgt loop
  
return:
  mov r0, r2
  mov pc, lr
  
  .size  exponent, . - exponent
  .ident  "CSC 2110, Tutorial 2 "
  .ident  "William H. Hooper"
