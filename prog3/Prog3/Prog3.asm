.include "tn2313def.inc"
.list
.def temp = R16
.def loop = R17

.cseg
.org 0

       ldi temp, RAMEND
	   out SPL, temp

	   ldi temp, 0x80
	   out ACSR, temp

	   ldi temp, 0
	   out DDRD, temp
	   ldi temp, 0x7f
	   out PORTD, temp

	   ldi temp, 0xff
	   out DDRB, temp
	   out PORTB, temp

main:  in temp, PIND
       sbrc temp, 0
	   rjmp main

	   rcall delay

	   in temp, PINB
	   sbrc temp, 0
	   rjmp m1

	   sbi PORTB, 0
	   rjmp m2
	   
m1:	   cbi PORTB, 0
              
m2:    in temp, PIND
       sbrs temp, 0
	   rjmp m2
	   rcall delay
	   rjmp main 

delay: push loop
       
       ldi loop, 200
m3:    dec loop
       brne m3

	   pop loop
	   ret






