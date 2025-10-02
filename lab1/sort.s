    .data
nums:   .word   1, 6, 0, 8, 2, 3, 8, 9, 7, 1, 3   # 11 numbers

    .text
    .globl main
main:
    mv   t0, zero           # outer loop counter i = 0

outer:
    slli t1, t0, 2          # t1 = i * 4 (offset for nums[i])
    addi t2, t0, 1          # inner loop counter j = i+1

inner:
    slli t3, t2, 2          # t3 = j * 4 (offset for nums[j])

    # load nums[i]
    la   t4, nums
    add  t5, t4, t1         # address of nums[i]
    lw   t6, 0(t5)          # t6 = nums[i]

    # load nums[j]
    la   t4, nums
    add  t5, t4, t3         # address of nums[j]
    lw   t4, 0(t5)          # t4 = nums[j]

    # compare and maybe swap
    bge  t4, t6, noswap     # if nums[j] >= nums[i], skip swap

    sw   t6, 0(t5)          # nums[j] = nums[i]
    la   t5, nums
    add  t5, t5, t1         # address of nums[i]
    sw   t4, 0(t5)          # nums[i] = nums[j]

noswap:
    addi t2, t2, 1
    li   t4, 11
    bne  t2, t4, inner      # loop j < 11

    addi t0, t0, 1
    li   t4, 10
    bne  t0, t4, outer      # loop i < 10

     # Exit
    li   a7, 10
    ecall