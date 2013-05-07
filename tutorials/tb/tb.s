@ CSC 2110, Computer Organization
@ Tutorial B: Floating Point Exceptions
@ by William H. Hooper

@ void oops(int sig);
@ handles Division by Zero and Invalid Operation
@ exceptions from main()

  .text
  .align  2
  .global oops
  .type oops, %function

oops:
  ldr r3, pointers
  str r0, [r3]

  ldr r1, [r3, #4]
  add r2, r1, #1
  str r2, [r3, #4]

  vmrs r2,fpscr
  str r2, [r3, #8]

  fldd d7, zero
  
  mov pc, lr
.L3:
  .align  2

pointers:
  .word last_signal
zero:
  .word 0x00000000
  .word 0x00000000
  .size oops, .-oops
  .ident  "GCC: (GNU) 4.7.2"
  .section  .note.GNU-stack,"",%progbits
