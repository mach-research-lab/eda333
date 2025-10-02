        .data
thing:  .asciz "I can't stop!\n"   # Null-terminated string

        .text
        .globl main
main:
loop:
        la      a0, thing     # load address of the string
        li      a7, 4         # syscall code: print_string
        ecall                 # make syscall

        j       loop          # jump back to loop