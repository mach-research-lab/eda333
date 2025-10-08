    .data
fib: .word 0,0,0,0,0,0,0,0,0,0
    .text
    .globl _start
_start:
    addi  t0, x0, 0          # i = 0
    addi  t1, x0, 0          # fib(0) = 0
    addi  t2, x0, 1          # fib(1) = 1
    la   t3, fib        # base = 0x00001000
    sw    t1, 0(t3)          # store fib[0]
    sw    t2, 4(t3)          # store fib[1]
    addi  t0, x0, 2          # i = 2
    addi  a0, x0, 10         # limit = 10 

loop:
    beq   t0, a0, done       # if i == 10, stop
    add   t4, t1, t2         # next = fib(i-1) + fib(i-2)
    slli  t5, t0, 2          # offset = i * 4
    add   t6, t3, t5         # addr = base + offset
    sw    t4, 0(t6)          # store fib[i]
    addi  t1, t2, 0          # fib(i-2) = fib(i-1)
    addi  t2, t4, 0          # fib(i-1) = next
    addi  t0, t0, 1          # i++
    jal   x0, loop           # continue

done:
    jal   x0, done           # hang here
