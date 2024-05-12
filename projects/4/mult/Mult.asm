// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

//// Replace this comment with your code.

  @2 // Load 0 in RAM 2 and set D to 0
  M=0
  @i // Loop variable
  M=0
(LOOP)
  @i
  D=M
  @0 // We will loop R0 times
  D=D-M
  @END
  D;JGE // (finished looping)

  @1 // by adding R1 ot it
  D=M
  @2
  M=D+M
  @i
  M=M+1
  @LOOP
  0;JMP
(END)
  @END
  0;JMP


