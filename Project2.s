.data
array: .word 1,2,3,4,5,6,7,8,9
ARR_LENGTH: .word 9
PROMPT: .asciiz "Enter the target number: "
NUM_FOUND: .asciiz "Target is found"
NUM_NOT_FOUND: .asciiz "Target is not available."

.text
main:

li $v0, 4
la $a0, PROMPT
syscall

li $v0, 5
syscall
move $s0, $v0

li $s1, 0

lw $s2, ARR_LENGTH
sub $s2, $s2, 1

Loop:

ble $s1, $s2, search

j not_found

search: 

    add $s3, $s1, $s2
    div $s3, $s3, 2

    mul $s4, $s3, 4

    la $s5, array

    add $s6, $s5, $s4

    lw $s7, 0($s6)

    beq $s7, $s0, equal

    blt $s7, $s0, lower_than

    sub $s2, $s3, 1

    j Loop


lower_than:
    add $s1, $s3, 1

    j Loop

not_found:
    li $v0, 4
    la $a0, NUM_NOT_FOUND
    syscall

    j Exit

equal:
    li $v0, 4
    la $a0, NUM_FOUND
    syscall

    li $v0, 1
    add $a0, $zero, $s3
    syscall

Exit:
    li $v0, 10
    syscall
