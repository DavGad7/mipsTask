 .data
 panda: .word 0x00000011
 .text
.globl main

main:
lui $1,(0xffffff00 )
 addi $12,$1,0x0000ffff
  srl $t2,$t4,16
  and $t0,$t4,$t2
