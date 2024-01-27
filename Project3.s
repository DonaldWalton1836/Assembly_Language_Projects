.data
    num1:   .float 2.33
    num2:   .float 4.55
    msgEqual: .asciiz "They are equal      "
    msgNequal: .asciiz "They are not equal. The sum is: "

    .text
    .globl main

main:
    #numbers
    lwc1 $f0, num1
    lwc1 $f1, num2

    #Compare
    c.eq.s $f0, $f1
    bc1t equal

    #If not equal
    li $v0, 4          
    la $a0, msgNequal    
    syscall

    add.s $f12, $f0, $f1   
    j print_result

equal:
    #if equal
    li $v0, 4       
    la $a0, msgEqual    
    syscall

    sub.s $f12, $f0, $f1   #subtract

print_result:
    #print 
    li $v0, 2         
    syscall

    #Exit
    li $v0, 10        
    syscall