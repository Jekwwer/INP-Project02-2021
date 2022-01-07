; Vernamova sifra na architekture DLX
; Evgenii Shiliaev xshili00

	.data 0x04          ; zacatek data segmentu v pameti
login:  .asciiz "xshili00"  ; <-- nahradte vasim loginem
cipher: .space 9 ; sem ukladejte sifrovane znaky (za posledni nezapomente dat 0)

	.align 2            ; dale zarovnavej na ctverice (2^2) bajtu
laddr:  .word login         ; 4B adresa vstupniho textu (pro vypis)
caddr:  .word cipher        ; 4B adresa sifrovaneho retezce (pro vypis)

	.text 0x40          ; adresa zacatku programu v pameti
	.global main        ; 

main:   ; sem doplnte reseni Vernamovy sifry dle specifikace v zadani

inicialization:	
	addi r7, r0, 0		; r7 = if(plus/minus) a pocitadlo v poli znaku
	lb r1, login(r7)	; r1 = login[i]
	lb r11, caddr		; r11 = cipher

while:
	slti r16, r1, 97	; r16 = r1 < 'a'(je-li na vstupu pismeno)
	bnez r16, end		; if(r16 = 1)	na vstupu neni pismeno, skoc na END 
	nop
	nop
	sgti r16, r1, 122	; r16 = r1 > 'z'(je-li na vstupu pismeno)
	bnez r16, end		; if(r16 = 1)	na vstupu neni pismeno, skoc na END 
	nop
	nop
	
	add r16, r0, r7		; r16 = r7, 	uchovani hodnoty pocitadla)

	; potrebujeme zbytek po deleni dvema(pro rozhodnuti o scitani/odecitani)
	slli r7, r7, 31		; shift doleva o 31 bit
	nop
	nop
	nop
	nop
	srli r7, r7, 31		; shift doprava o 31 bit (dostaneme zbytek)
	nop
	nop
	nop
	nop
	bnez r7, minus		; if(r7 = 1),	skoc na odecitani hodnoty ze symbolu
	nop
	nop

plus:
	add r7, r0, r16		; r7 = r16				vracime hodnotu pocitadla
	addi r29, r1, 19	; r29 = r1 + 19('s')	pricteni hodnoty k puvodnimu symbolu
						;                       do pomocneho registru
	addi r7, r7, 1		; r7++					zvyseni hodnoty pocitadla

	slei r16, r29, 122	; r16 = r29 <= 'z'	(je-li symbol v intervalu a-z)
	bnez r16, write		; if(r16 = 1),		je v intervalu, skoc na WRITE
	nop
	nop
	
	; symbol je mimo intervalu
	subi r29, r29, 122	; r29 = r29 - 'z'
	addi r29, r29, 96	; r29 = r29 + symbol pred 'a'(pro spravne cyklovani)
	j write				; skoc na WRITE
	nop
	nop

minus:
	add r7, r0, r16		; r7 = r16		vracime hodnotu pocitadla
	subi r29, r1, 8		; r29 = r1 - 8('h')	odecteni hodnoty od puvodniho symbolu
	addi r7, r7, 1		; r7++			zvyseni hodnoty pocitadla

	sgei r16, r29, 97	; r16 = r29 >= 'a'	(je-li symbol v intervalu a-z)
	bnez r16, write		; if(r16 = 1),		je v intervalu, skoc na WRITE
	nop
	nop

	; symbol je mimo intervalu
	subi r29, r29, 96	; r29 = r29 - symbol pred 'a' (pro spravne cyklovani)
	addi r29, r29, 122	; r29 = r29 + 'z'

write:
	; ulozeni modifikovaneho symbolu
	; nefungovalo to s r7 :(
	sb 0(r11), r29		; r11 = r29		/	cipher[i] = r29

	; posouvame adresu vystupu
	addi r11, r11, 1	; r11++			/	cipher[++i]		

	; load dalsiho symbolu ze vstupu
	lb r1, login(r7)	; r1 = login[r7]
	
	j while				; skoc na WHILE (zacatek cyklu)
	nop
	nop
	
	addi r29, r0, 0	; r29 = 0	ukoncovaci symbol
	sb 0(r11), r29		; r11 = r29		/	cipher[i] = r29 = 0

end:    addi r14, r0, caddr ; <-- pro vypis sifry nahradte laddr adresou caddr
	trap 5  ; vypis textoveho retezce (jeho adresa se ocekava v r14)
	trap 0  ; ukonceni simulace
