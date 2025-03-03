// Load R0 into D register for comparison and manipulation
@R0
D=M

// Preserve R0 by storing it back immediately if needed
@R0
M=D

// Check if the value is the most negative number, -32768
@IS_MIN_INT
D;JEQ  // Jump if D equals -32768

// Check if the number is non-negative
@STORE_POSITIVE
D;JGE  // Jump to store positive value directly

// Compute the absolute value for negative numbers
@NEGATIVE_VALUE
0;JMP  // Jump to compute absolute for a negative number

(IS_MIN_INT)
    // Handle -32768: set R1 to 1, and do not change R2 or R0
    @R1
    M=1     // Indicate error as we cannot compute the absolute
    @END
    0;JMP

(STORE_POSITIVE)
    // Non-negative number: Copy R0 to R2, R1 remains as R0
    @R0
    D=M
    @R2
    M=D
    @R1
    M=D     // Set R1 to R0 as computation is successful
    @END
    0;JMP

(NEGATIVE_VALUE)
    // Negative number: Compute the absolute value
    @R0
    D=M
    D=-D    // Negate the number to get the absolute value
    @R2
    M=D
    @R0
    D=M     // Reload R0 to set it back into R1
    @R1
    M=D     // Set R1 to R0 as computation is successful
    @END
    0;JMP

(END)
    @END
    0;JMP
