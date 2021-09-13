  // WHITE = 0
  // BLACK = -1
  //
  // while
  //   if KBD == 0
  //     color = WHITE
  //   else
  //     color = BLACK
  //   end
  //
  //   for (i = 0; i < 32*256; i++)
  //     SCREEN[i] = color
  //   end
  // end

(HEAD)
    // if KBD -= 0
    @KBD
    D=M
    @BLACK
    D;JNE

    // then
(WHITE)
    @color
    M=0

    // else
(BLACK)
    @color
    M=-1

    // i = 0
    @i
    M=0

    // addr = SCREEN
    @SCREEN
    D=A
    @addr
    M=D

(LOOP)
    // M[addr] = color
    @color
    D=M
    @addr
    A=M
    M=D

    // addr += 1
    @addr
    M=M+1

    // i += 1
    @i
    MD=M+1

    // Jump (LOOP) if i != 8192
    @8192
    D=D-A
    @LOOP
    D;JNE

    @HEAD
    0;JMP
