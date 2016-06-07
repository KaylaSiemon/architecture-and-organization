.data ## Data declaration section
x: .word 6
y: .word 1
c: .asciiz "a"
s: .space 50

.text 
lw $t0, x
lw $t1, y
main: 
addi $sp, $sp, -8	#allocate memory
jal printchar
jal printx
jal printy
addu $sp, $sp, 8	#deallocate memory
li $v0, 10 # terminate program
syscall

printchar:
li $v0, 4	#allocate memory for char
la $a0, c
syscall

printx:
li $v0, 1	#allocate memory for integer
move $a0, $t0
syscall  

printy:
li $v0, 1	#allocate memory for integer
move $a0, $t1
syscall  