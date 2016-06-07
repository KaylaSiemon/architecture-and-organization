################
#Kayla M Siemon#
################
 
 .data	
 
 .align 2
 string: .space 50

.globl main
.text
main:

    li $s0, '\n'
    la $s1, string
    
    li $t0, 0xffff0000
	
waitKey:
	
    lw      $t1, 0($t0)
    andi    $t1, $t1, 1  
    beqz   $t1,  waitKey

    lb     $a0, 4($t0)
    sb     $a0, 0($s1)    
	
    addi $s1, $s1, 1
    bne $a0, $s0, waitKey 
    sw $s3, 0($s1)
    
    addi $s3, $0, 0
    
    li $t0, 0xffff0008
    la $s1, string
	
print:

    lw      $t1, 0($t0)
    andi    $t1, $t1, 1 
    beqz   $t1,  print
    
    lb $s2, 0($s1)
    sb $s2, 4($t0)
   
    addi $s1, $s1, 1
    bne $s2, $zero, print

    jr      $ra