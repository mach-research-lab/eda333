# t2 ← 0x80020000, t4 ← 0x80020000
  lui   t2, 0x80020
  lui   t4, 0x80020
  addi  t4, t4, 20          # t4 ← t4 + 20

Loop:
  lw    t3, 2(t2)         # t3 ← Mem[t2 + 2]   (unaligned address)
  nop
  add   t1, t1, t3        # t1 ← t1 + t3
  addi  t2, t2, 4         # t2 ← t2 + 4
  addi  t5, t5, 1         # t5 ← t5 + 1
  addi  t6, t6, 1         # t6 ← t6 + 1
  bne   t4, t2, Loop      # if t2 ≠ t4, loop
  nop


# Exit
  li   a7, 10
  nop
  nop
  nop
  ecall