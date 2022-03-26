.equ SREG, 0x3f
.equ PORTB, 0x05
.equ DDRB, 0x04
.equ PINC, 0x06
.equ PORTC, 0x08
.org 0

main :
    ldi r16,0
    out SREG, r16

    ldi r17, 0xf
    out DDRB, r17
    out PORTB, r17

mainloop: rjmp mainloop