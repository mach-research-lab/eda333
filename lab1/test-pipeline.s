addi  t1, t2, 0x20     # t1 = t2 + 0x20
sw    t1, -24(sp)      # M[sp-24] = t1
lw    t2, -24(sp)      # t2 = M[sp-24]
beq   x0, x0, exit     # always branch to exit
exit:
li   a7, 10             # Exit
ecall
