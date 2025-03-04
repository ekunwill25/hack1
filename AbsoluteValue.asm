 // Load x from R0
@R0
D=M        // D = x

// Check if x is negative (D < 0)
@NEGATIVE
D;JLT      // If x < 0, jump to NEGATIVE

//store x in R1
@R1
M=D        // R1 = x (unchanged)
@R2
M=0        // R2 = 0 (not negative)
@R3
M=0        // R3 = 0 (valid absolute value)
@END
0;JMP      // Jump to end

(NEGATIVE)
// x is negative,|x| = -x
D=-D       // D = -x
@R1
M=D        // Store |x| in R1
@R2
M=1        // R2 = 1

@END
0;JMP      //