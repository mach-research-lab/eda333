    .data
buffer:
    .zero 101                  # buffer for input string
prompt:
    .asciz "Input string (max 100 characters): "
answer:
    .asciz "Index of first 'b' is "

    .text
    .globl main
main:
    addi sp, sp, -32
    sw   ra, 28(sp)
    sw   s0, 24(sp)
    addi s0, sp, 32

    # Print prompt
    li   a7, 64             # write syscall
    li   a0, 1              # fd = stdout
    la   a1, prompt         # buffer
    li   a2, 36             # length of string
    ecall

    # Read string from stdin
    li   a7, 63             # read syscall
    li   a0, 0              # fd = stdin
    la   a1, buffer
    li   a2, 101
    ecall

    # Call bfind(buffer)
    la   a0, buffer
    jal  ra, bfind

    # Compute index = return - buffer
    la   t1, buffer
    sub  t0, a0, t1

    # Print answer message
    li   a7, 64
    li   a0, 1
    la   a1, answer
    li   a2, 24             # length of string
    ecall

    # Print index
    li   a7, 1
    mv   a0, t0
    ecall

    # Exit
    li   a7, 10             # Exit
    ecall

#--------------------------------
# bfind: returns pointer to first 'b' or null terminator
# a0 = pointer to string
# return in a0
#--------------------------------
bfind:
    mv   a0, a0             # return pointer
    li   t0, 98             # 'b'

loop:
    lbu  t1, 0(a0)          # load char
    beq  t1, t0, ret        # if 'b'
    beqz t1, ret            # if '\0'
    addi a0, a0, 1
    j    loop

ret:
    jr   ra
