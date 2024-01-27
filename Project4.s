.data
    newline: .asciiz "\n"
    binaryMsg: .asciiz "the printed unsigned binary representation number is: "

.text
    main:
        # Prompt user for input
        li $v0, 4           
        la $a0, binaryMsg   
        syscall

        # Read integer input
        li $v0, 5           
        syscall
        move $t0, $v0       
        # Print binary representation
        li $t1, 32          
    print_binary_loop:
        srl $t2, $t0, 31   
        andi $t2, $t2, 1   
        addi $t1, $t1, -1  

        # Print the binary digit
        addi $t2, $t2, 48  
        li $v0, 11          
        move $a0, $t2       
        syscall

        sll $t0, $t0, 1    

        bnez $t1, print_binary_loop 

        # Print newline
        li $v0, 4           
        la $a0, newline     
        syscall

        # Exit program
        li $v0, 10          
        syscall
