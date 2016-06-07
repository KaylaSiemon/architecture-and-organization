#Kayla M Siemon
#Reverse Name
#prints myName and then prints it in reverse.

.data
  myName: .asciiz "Kayla Siemon"
  nline: .asciiz "\n"

.text
  .globl main

  main:
    la $a1, myName                 

    la $a0, 0($a1)                
    addi $v0, $0, 4               
    syscall                      

    la $a0, nline               
    syscall                       

    addi $sp, $sp, -4             
    sw $a1, 0($sp)               

    jal PRINT_NAME             

    addi $sp, $sp 4              

    li $v0, 4
    la $a0, nline              
    syscall                     

    jal EXIT                      

  PRINT_NAME:
    lw $t0, 0($sp)                
    lb $t1, 0($t0)               
    beq $t1, $0, DONE           

    addi $t2, $t0, 1              
    addi $sp, $sp, -12         

    sw $t0, 8($sp)               
    sw $ra, 4($sp)               
    sw $t2, 0($sp)               

    jal PRINT_NAME                

    lw $t0, 8($sp)               
    lw $ra, 4($sp)                
    addi $sp, $sp, 12           

  DONE:
    lb $a0, 0($t0)                
    addi $v0, $0, 11     
    syscall                      
    jr $ra                       

  EXIT:
    addi $v0, $0, 10            
    syscall                       