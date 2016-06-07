##Kayla M Siemon
##April 26, 2016

.data
array0: .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
length: .word 11
array1: .space 44
nl: .asciiz " "
label: .asciiz "Values: "

.text
.globl main
main:

    li  $s0, 0     
    lw $t4, length    
    la $s1,array1      
    la $s2,array0       

la $a0, label
li $v0, 4

FOR_LOOP:  
    bge	$s3, $t4, END_FOR
    lw $t1,($s2)             
    addi $t0, $zero, 1
    move $s0, $t1
    and $t1, $t0, $s0 
    beqz $s0, IFZERO
    beq $t1, $zero, EVEN
    addi $s2, $s2,4          
    addi $s3, $s3, 1       
    j FOR_LOOP              

IFZERO:
	addi $s2, $s2, 4
	addi $s3, $s3, 1
	j FOR_LOOP  

EVEN:
	sw $s0, 0($s1)
	addi $s1, $s1, 4
	addi $s2, $s2, 4
	addi $s3, $s3, 1
	j FOR_LOOP
END_FOR:           
    addi $s3, $s0, -1
    addi $s1, $s1,-4
    addi $s2, $s2,-4     

syscall

end:
lw $a0, array1($t6)
li $v0, 1
syscall

la $a0, nl
la $v0, 4
syscall

addi $t6, $t6, 4
bne $t6, 20, end
li $v0, 10
syscall

.end main
