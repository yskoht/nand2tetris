    // 乗算: R2 = R0 * R1

    // R2 = 0
    //
    // if R0 == 0 || R1 == 0
    //   goto END
    // end
    //
    // b = 1
    //
    // while b != 512
    //   if R1 & b != 0
    //     R2 += R0
    //   end
    //   R0 <<= 1 // R0 = R0 + R0
    //   b <<= 1  // b = b + b
    // end
    //
    // END:

    // R2 = 0
    @R2
    M=0

    // Jump (END) if R0 == 0
    @R0
    D=M
    @END
    D;JEQ

    // Jump (END) if R1 == 0
    @R1
    D=M
    @END
    D;JEQ

    // b = 1
    @b
    M=1

(IF)
    // D = R1 & b
    @R1
    D=M
    @b
    D=D&M

    // Jump (UPDATE) if D == 0
    @UPDATE
    D;JEQ

    // R2 += R0
    @R0
    D=M
    @R2
    M=D+M

(UPDATE)
    // R0 <<= 1
    @R0
    D=M
    M=D+M

    // b <<= 1
    @b
    D=M
    MD=D+M

    // Jump (IF) if b != 512
    @512
    D=D-A
    @IF
    D;JNE

(END)
    @END
    0;JMP
