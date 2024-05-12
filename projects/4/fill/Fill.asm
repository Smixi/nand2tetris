// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Replace this comment with your code.

// Loop until kbd event happens.
(MAIN_LOOP)
  // the screen is 256*512, 8192 continuous 16 bits words (32 words per row)
  // Draw loop: increment the pixel index, set the pixel. Do that until we are at the end of the screen.
  // Reset PIXEL_INDEX to screen to start drawing again
  @SCREEN
  D=A
  @PIXEL_INDEX
  M=D
  // Check if kbd is pressed. If true, then we set the color to black, else to white
  @KBD
  D=M
  @WHITE
  D;JEQ

  @PIXEL_COLOR
  M=-1
  @DRAW_LOOP_FN
  0;JMP

(WHITE)
  @PIXEL_COLOR
  M=0
  @DRAW_LOOP_FN
  0;JMP

(DRAW_LOOP_FN)
(DRAW_LOOP)
  @PIXEL_INDEX
  //Check if we are done (PIXEL_INDEX = KBD)
  D=M

  // End of screen is 8192 (256*512) words.
  @SCREEN
  D=D-A
  @8192
  D=D-A
  @MAIN_LOOP
  D;JGE
  
  // Get the pixel color from the keyboard
  @PIXEL_COLOR
  D=M
  //Get pixel index
  @PIXEL_INDEX
  A=M
  //Draw the pixel with the color
  M=D
  @PIXEL_INDEX
  //Increment pixel index
  M=M+1
  
  @DRAW_LOOP
  0;JMP


