.data
buf: .space 21
buf1: .space 20
msg1: .asciiz "enter please a string "
msg2: .asciiz "\nyour result is:\n "
msg3: .asciiz "\nand the number of identical chars in row was: "
.text
.globl main
main:
li $v0,4
la $a0,msg1
 syscall

la $t3,buf1 
 li $t4, '='
 li $t5, '-'
li $t6, '+'
move $s0,$zero 
la $a0,buf
li $a1,21
li $v0,8
 syscall 
 move $s1,$a0
 loop: 
 	lb $t0, 0($s1)   # buf[i]
    	addi $s1, $s1, 1 # ++i
    	lb $t1, 0($s1)   # buf[i+1]
    	beq $t1,$zero,endl
 	beq $t1,$t0,equal #if buf[i]==buf[i+1] go to equal 
 	blt $t0,$t1,less_than
 	bgt $t0,$t1,greater_than
 	equal:
 		sb $t4, ($t3)
 		addi $t3,$t3,1#
		addi $s0,$s0,1
		j loop
 	less_than:
 		sb $t5, ($t3)
 		addi $t3,$t3,1#
		j loop
 	greater_than:
 		sb $t6, ($t3)
 		addi $t3,$t3,1#
		j loop
 endl:
    la $a0, msg2
    li $v0, 4
    syscall  
     sb $zero, ($t3)  # add zero terminator to output string
        la $a0, buf1     # output string address
    li $v0, 4
    syscall
    # output number of identical neighbour chars
    la $a0, msg3
    li $v0, 4
    syscall          # label outputted
    move $a0, $s0
    li $v0, 1
    syscall          # counter outputted
    # Exit program
    li $v0, 10
    syscall

