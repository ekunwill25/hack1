// Check if the input is -32768, the smallest negative number
@R0
D=M          // Load R0 into D
@NEG_MAX     // Address of the value -32768
M=-32768     // Set -32768 to memory for comparison
D;JEQ        // Jump if D is exactly -32768

// Calculate Absolute Value if not -32768
@POSITIVE
D;JGE        // If the number is already positive, jump to POSITIVE

// If negative and not -32768
D=-D          // Negate the number
@R2
M=D           // Store the absolute value in R2
@R1
M=0           // Set R1 to 0 indicating successful computation
@END
0;JMP         // Jump to end

(NEG_MAX)
    @R2
    M=0        // Cannot compute absolute value, set R2 to 0 or appropriate error code
    @R1
    M=1        // Set R1 to 1 indicating computation failure
    @END
    0;JMP

(POSITIVE)
    @R2
    M=D        // D is already non-negative, just store it in R2
    @R1
    M=0        // Set R1 to 0 indicating successful computation
    @END
    0;JMP

(END)
    @END
    0;JMP
