.include "tn2313def.inc"
.list
.def temp = R16

.cseg
.org 0
   
      ldi temp, RAMEND
	  out SPL, temp

	  ldi temp, 0x80
	  out ACSR, temp

	  ldi temp, 0
	  out DDRD, temp
	  ldi temp, 0xff
	  out PORTD, temp

	  out DDRB, temp
	  out PORTB, temp

main: in temp, PIND
      sbrc temp,0
	  rjmp main

	  in temp, PINB
	  sbrc temp,0
      rjmp m1

	  sbi PORTB, 0
	  rjmp m2

m1:   cbi PORTB, 0

m2:   in temp, PIND
      sbrs temp, 0
	  rjmp m2
	  rjmp main
