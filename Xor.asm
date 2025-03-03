// Load x (R0) into D
@R0
D=M

// Store x OR y into R2
@R1
D=D|M
@R2
M=D

// Load x (R0) into D again
@R0
D=M

// Compute x AND y
@R1
D=D&M

// Negate x AND y (NOT (x AND y))
D=!D

// AND with (x OR y)
@R2
M=M&D
