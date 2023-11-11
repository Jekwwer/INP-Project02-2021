; Vernam cipher on the DLX architecture
; Evgenii Shiliaev xshili00

	.data 0x04          ; start of the data segment in memory
login:  .asciiz "xshili00"  ; <-- replace with your login
cipher: .space 9 ; store encrypted characters here (don't forget to append 0 at the end)

	.align 2            ; further align on quadruples (2^2) bytes
laddr:  .word login         ; 4B address of the input text (for printing)
caddr:  .word cipher        ; 4B address of the encrypted string (for printing)

	.text 0x40          ; address of the program start in memory
	.global main        ; 

main:   ; insert here the solution of the Vernam cipher according to the task specification

initialization:	
	addi r7, r0, 0		; r7 = (plus/minus flag) and character counter in the array
	lb r1, login(r7)	; r1 = login[i]
	lb r11, caddr		; r11 = cipher

while:
	slti r16, r1, 97	; r16 = r1 < 'a' (checking if it's a letter)
	bnez r16, end		; if(r16 = 1) it's not a letter on input, jump to END 
	nop

	sgti r16, r1, 122	; r16 = r1 > 'z' (checking if it's a letter)
	bnez r16, end		; if(r16 = 1) it's not a letter on input, jump to END 
	nop
	
	add r16, r0, r7		; r16 = r7, storing the value of the counter

	; we need the remainder after division by two (to decide about adding/subtracting)
	slli r7, r7, 31		; left shift by 31 bits
	nop
	nop
	nop
	nop
	srli r7, r7, 31		; right shift by 31 bits (to get the remainder)
	nop
	nop
	nop
	nop
	bnez r7, minus		; if(r7 = 1), jump to subtraction from the symbol
	nop

plus:
	add r7, r0, r16		; r7 = r16 restoring the value of the counter
	addi r29, r1, 19	; r29 = r1 + 19('s') adding value to the original symbol 
						; into a helper register
	addi r7, r7, 1		; r7++ incrementing counter value

	slei r16, r29, 122	; r16 = r29 <= 'z' (checking if the symbol is within a-z)
	bnez r16, write		; if(r16 = 1), it's within the range, jump to WRITE
	nop
	
	; symbol is outside the range
	subi r29, r29, 122	; r29 = r29 - 'z'
	addi r29, r29, 96	; r29 = r29 + symbol before 'a' (for correct looping)
	j write				; jump to WRITE
	nop

minus:
	add r7, r0, r16		; r7 = r16 restoring counter value
	subi r29, r1, 8		; r29 = r1 - 8('h') subtracting value from the original symbol
	addi r7, r7, 1		; r7++ incrementing counter value

	sgei r16, r29, 97	; r16 = r29 >= 'a' (checking if the symbol is within a-z)
	bnez r16, write		; if(r16 = 1), it's within the range, jump to WRITE
	nop

	; symbol is outside the range
	subi r29, r29, 96	; r29 = r29 - symbol before 'a' (for correct looping)
	addi r29, r29, 122	; r29 = r29 + 'z'

write:
	; store the modified symbol
	; there was an issue with r7 :(
	sb 0(r11), r29		; r11 = r29 / cipher[i] = r29

	; advancing the output address
	addi r11, r11, 1	; r11++ / cipher[++i]		

	; load next symbol from input
	lb r1, login(r7)	; r1 = login[r7]
	
	j while				; jump to WHILE (start of the loop)
	nop
	
	addi r29, r0, 0	; r29 = 0 end symbol
	sb 0(r11), r29		; r11 = r29 / cipher[i] = r29 = 0

end:    addi r14, r0, caddr ; <-- for printing the cipher, replace laddr with caddr address
	trap 5  ; print text string (its address is expected in r14)
	trap 0  ; end of simulation
