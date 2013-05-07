@ CSC 2110, Computer Organization
@ Tutorial 8: Exceptions I
@ by William H. Hooper

@ void bouncer(int sig);
@ handles SIGSEGV exceptions from main()

  .text
  .align  2
  .global bouncer
  .type bouncer, %function

bouncer:
  ldr r1, data
  str r0, [r1]
  
  ldr r2, [r1, #4]
  add r2, r2, #1
  str r2, [r1, #4]
  
  ldr r3, [sp, #0x5c]
  add r3, r3, #4
  str r3, [sp, #0x5c]

  mov r3, #-1
  str r3, [sp, #0x2c]
  
  mov pc, lr

data:
  .word last_signal

  .size bouncer, .-bouncer
  .ident  "GCC: (GNU) 4.7.2"
  .section  .note.GNU-stack,"",%progbits
