		.data
x:		.word	10,9,8,7,6,5,4,3,2,1
y:		.word	 0,0,0,0,0,0,0,0,0,0

		.text
		.globl	start				# The label should be globally known

start:
		li		t0,9				# Initialize outer loop
		addi      t1,t0,0
outer:
		la		t2,x+40	 			# Load adress of the last element
inner:
		lw		t4,-4(t2)			# Load Array[t1-1]
		lw		t5,-8(t2)           # Load Array[t1-2]
		
		nop							# (Delayed Load Slot t5)
		
		slt		t6,t4,t5			# Compare Array[t1-1] with Array[t1-2]
		beq		t6,zero,not_less
		addi	t1,t1,-1			# Decrease inner loop counter (Delayed Branch Slot)
		
		sw		t4,-8(t2)			# If less, swap places
		sw		t5,-4(t2)
		
not_less:
		
		bne		t1,zero,inner		# Continue inner loop if t0 < t1
		addi	t2,t2,-4			# Decrease address pointer (Delayed Branch Slot)
		
		addi	t0,t0,-1			# Increase outer loop counter
		bne		t0,zero,outer		# Continue outer loop if t1 < 10
		addi	t1,t0, 0				# Initialize inner loop (Delayed Branch Slot)
		
		addi	t2,t2,-36			# Load adress of first element
		la		t6,y				# Load adress of first element
		
		li		t1,222
		sw		t1,36(s6)

		li		t0,9				# Initialize outer loop
outer2:
		lw		t1,0(t2)
		addi	t2,t2,4				# Increase address pointer (Delayed Load Slot t1)
		sw		t1,0(t6)
		addi	t6,t6,4				# Increase address pointer
		
		bne		t0,zero,outer2		# Continue outer loop if t0 <= 10
		addi	t0,t0,-1			# Increase inner loop counter
				
exit:
        li   a7, 10
        ecall
