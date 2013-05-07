@ CSC 2110, Computer Organization
@ Tutorial 3: Addressing Modes I
@ by William H. Hooper

@ extern "C" void NoCaps(char s[ ]);
@ This procedure converts all the letters 
@ in string s to lowercase.

  .text
  .align  2
  .global NoCaps
  .type NoCaps,function

NoCaps:
  mov r2, lr
  ldrb r3, data
  b test

loop:
  cmp r1, r3
  blle  lower
  add r0, r0, #1

test:
  ldrb  r1, [r0]
  cmp r1, #0
  bne loop

  mov pc, r2

lower:  
  orr r1, r1, #0x20
  strb  r1, [r0]
  mov pc, lr

data:
  .byte 'Z'
  .size NoCaps, . - NoCaps
  .ident  "CSC 2110, Tutorial 3 "
  .ident  "William H. Hooper"
