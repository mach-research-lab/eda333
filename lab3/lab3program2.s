        .data
x:      .word   10,9,8,7,6,5,4,3,2,1
y:      .word   0,0,0,0,0,0,0,0,0,0

        .text
        .globl  start

start:
        li      t0,9               # Initialize outer loop
        addi    t1,t0,0

outer:
        la      t2,x
        addi    t2,t2,40           # Load address just past last element

inner:
        lw      t4,-4(t2)          # Load Array[t1-1]
        lw      t5,-8(t2)          # Load Array[t1-2]

        nop

        slt     t6,t4,t5           # Compare Array[t1-1] with Array[t1-2]
        beq     t6,zero,not_less

        sw      t4,-8(t2)          # If less, swap places
        sw      t5,-4(t2)

not_less:
        addi    t1,t1,-1           # Decrease inner loop counter
        addi    t2,t2,-4           # Decrease address pointer
        bne     t1,zero,inner      # Continue inner loop if t1 != 0

        addi    t0,t0,-1           # Decrease outer loop counter
        addi    t1,t0,0            # Initialize inner loop
        bne     t0,zero,outer      # Continue outer loop if t0 != 0

        addi    t2,t2,-36          # Load address of first element
        la      t6,y               # Load address of first element

        li      t1,222
        sw      t1,36(t6)

        li      t0,9               # Initialize loop counter
outer2:
        lw      t1,0(t2)
        addi    t2,t2,4
        sw      t1,0(t6)
        addi    t6,t6,4
        addi    t0,t0,-1
        bge     t0,zero,outer2

exit:
        li      a7,10
        ecall
