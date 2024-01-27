    .data
prompt: .asciiz "Enter a number less than or equal to 20: "
output: .asciiz "Fibonacci numbers are: \n"
comma:  .asciiz ", "
    .text
    .globl main

main:
    
    li $v0, 4
    la $a0, prompt
    syscall

    
    li $v0, 5
    syscall
    move $t0, $v0 

   
    li $t1, 1 
    li $t2, 1 
    move $t3, $t0 

   
    li $v0, 4
    la $a0, output
    syscall

print_fibonacci:
    
    move $a0, $t1 
    li $v0, 1
    syscall

    
    addi $t3, $t3, -1
    bnez $t3, print_comma

    
    li $v0, 10
    syscall

print_comma:
    
    li $v0, 4
    la $a0, comma
    syscall

    
    add $t4, $t1, $t2
    move $t1, $t2
    move $t2, $t4

    
    j print_fibonacci
