.include "tn2313def.inc"
.list
.def temp = R16
.def loop1 = R17
.def loop2 = R18
.def loop3 = R19

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

main:    in temp, PIND
         sbrs temp, 0
		 rjmp label_3
         sbi PORTB, 0
	     rjmp main

label_3: in temp, PINB
	     sbrc temp, 0
         rjmp label_1

         sbi PORTB, 0
	     rcall delay
	     rjmp label_2

label_1: cbi PORTB, 0
         rcall delay

label_2: in temp, PIND
         sbrs temp, 0
         rjmp label_3
		 rjmp main

delay:   push loop1
		 push loop2
		 push loop3

		 ldi loop1, 15
d1:		 dec loop1
		 breq exit

         ldi loop2, 100
d2:      dec loop2
		 breq d1
		 
		 ldi loop3, 255
d3:		 dec loop3
		 brne d3
		 rjmp d2
         
exit:    pop loop3
         pop loop2
		 pop loop1  
		 ret         
