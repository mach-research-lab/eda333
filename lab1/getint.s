    .data
prompt: 
    .asciz "Gimme an integer: "
answer: 
    .asciz "Minus 1 = "
inbuf:
    .zero 16                   # buffer for user input (enough for integer text)

    .text
    .globl main
main:
    # Print prompt
    li   a7, 64                # write
    li   a0, 1                 # fd = stdout
    la   a1, prompt
    li   a2, 18                # length of string
    ecall

    # Read input into buffer
    li   a7, 63                # read
    li   a0, 0                 # fd = stdin
    la   a1, inbuf
    li   a2, 16
    ecall

    # Convert ASCII in inbuf → integer in t0
    la   t1, inbuf             # pointer to buffer
    li   t0, 0                 # accumulator = 0

parse_loop:
    lbu  t2, 0(t1)             # load next byte
    beqz t2, parse_done        # stop if NUL
    li   t3, 10
    beq  t2, t3, parse_done    # stop at newline '\n'
    addi t2, t2, -48           # char → digit
    li   t3, 10
    mul  t0, t0, t3            # acc *= 10
    add  t0, t0, t2            # acc += digit
    addi t1, t1, 1
    j    parse_loop

parse_done:
    addi t0, t0, -1            # subtract one

    # Print answer label
    li   a7, 64
    li   a0, 1
    la   a1, answer
    li   a2, 10                # length of string
    ecall

    # Print result integer
    mv   a0, t0
    li   a7, 1
    ecall

    # Exit
    li   a7, 10
    ecall
