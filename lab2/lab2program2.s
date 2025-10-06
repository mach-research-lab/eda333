    .data
buf:    .word 1,2,3,4,5,6,7,8     # 8 words initialized to 0

    .text
    .globl _start
_start:
    lui   s0, %hi(buf)            # s0 = &buf
    nop
    nop
    addi  s0, s0, %lo(buf)
    addi t0, t0, 8
    nop
load_loop:
    lw    t3, 0(s0)               # load buf[i]
    add   t2, t2, t3              # Sum in t2 all the elements of the array
    addi  s0, s0, 4               # advance pointer
    addi  t0, t0, -1
    nop
    nop
    bne   t0, x0, load_loop

   # Exit
    li   a7, 10
    nop
    nop
    nop
    ecall
