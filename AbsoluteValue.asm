// Load R0 into D register for checking and operations
@R0
D=M

// Check if the value is the most negative number, -32768
@IS_MIN_INT
D;JEQ  // Jump if D equals -32768, which is 1000000000000000 in binary

// Process if not -32768
@IS_NEGATIVE
D;JLT  // Jump if negative to compute absolute value

// Store the positive value or zero directly in R2
@R2
M=D     // Store D in R2 since it's already positive or zero
@R1
M=0     // Set R1 to 0, computation successful
@END
0;JMP

// Label for handling the minimum integer case
(IS_MIN_INT)
    @R1
    M=1     // Set R1 to 1, indicating error in absolute value computation
    @R2
    M=0     // Optionally set R2 to 0 or any error indicating value
    @END
    0;JMP

// Label for handling negative non-minimum integers
(IS_NEGATIVE)
    @R0
    D=M     // Reload R0 to D
    D=-D    // Negate D to get the absolute value
    @R2
    M=D     // Store the absolute value in R2
    @R1
    M=0     // Set R1 to 0, computation successful
    @END
    0;JMP

// Label for ending the program
(END)
    @END
    0;JMP
