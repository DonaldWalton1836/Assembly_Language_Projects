.data
A:      .word 2, 4, 8, 16, 32, 64, 65, 130
length: .word 8
result: .word 1  # Assume true by default

.text
main:
    la $t0, A         # Load the address of the array A
    lw $t1, length    # Load the length of the array
    lw $t2, result    # Load the result flag

    li $t3, 1         # Set a variable for the previous value
    li $t4, 1         # Set a variable for the current value
    li $t5, 1         # Set a variable for the difference

loop:
    lw $t4, 0($t0)    # Load the current value from A
    sub $t5, $t4, $t3  # Calculate the difference between current and previous

    bgez $t5, check   # Branch if the difference is greater than or equal to zero

    # If the difference is negative, set the result to false and exit the loop
    li $t2, 0
    j end_loop

check:
    move $t3, $t4     # Set the previous value to the current value

end_loop:
    addi $t0, $t0, 4  # Move to the next element in the array
    addi $t1, $t1, -1  # Decrease the counter

    bnez $t1, loop    # Branch back to the loop if the counter is not zero

    # Print the result
    li $v0, 1
    lw $a0, result
    syscall

    # Exit the program
    li $v0, 10
    syscall
