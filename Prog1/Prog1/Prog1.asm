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
      out PORTB, temp
	  rjmp main
	  
