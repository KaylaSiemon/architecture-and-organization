.data
str1: .asciiz "Sum = "
str0: .asciiz "Diff = "
cr: .asciiz "\n"
p: .asciiz "Enter Integer One: "
p1: .asciiz "Enter Integer Two: "

.text
main:

        li $v0, 4
        la $a0, p
        syscall

        li $v0, 5
        syscall
        move $t0, $v0

    li $v0, 4
    la $a0, p1
    syscall

    li $v0, 5
    syscall
    move $t1,$v0

    li $v0, 4
    la $a0, str1
    syscall

    add $a0, $t1, $t0
    li $v0, 1
    syscall

li $v0, 4
la $a0, cr
syscall

li $v0, 4
la $a0, str0
syscall

sub $a0, $t1, $t0
li $v0, 1
syscall

    li $v0, 10
    syscall
