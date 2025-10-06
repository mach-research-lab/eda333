    addi t1, zero, 9     # t1 ← 9
    add  t2, zero, zero  # t2 ← 0
    add  t3, zero, zero  # t3 ← 0
    add  t4, zero, zero  # t4 ← 0
    add  t5, zero, zero  # t5 ← 0
    add  t6, zero, zero  # t6 ← 0

loop: 
    addi t1, t1, -1   # t1 ← t1 - 1
    addi t2, t2, 1    # t2 ← t2 + 1
    addi t6, t6, 2    # t6 ← t6 + 2
    bne  zero, t1, loop  # If t1 ≠ 0 then goto loop
    add  t3, t3, t2   # t3 ← t3 + t2
    add  t4, t4, t2   # t4 ← t4 + t2
    add  t5, t5, t2   # t5 ← t5 + t2

   # Exit
    li   a7, 10
    nop
    nop
    nop
    ecall
