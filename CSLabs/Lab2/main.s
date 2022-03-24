.equ SREG, 0x3f
.equ PORTB, 0x05
.equ DDRB, 0x04
.equ PINC, 0x06
.equ PORTC, 0x08
.org 0

main :
    ldi r16,0
    out SREG, r16

    ldi r17, 0xe
    out DDRB, r17
    out PORTB, r17
    
    ldi r17, 0x70
    out PINC, r17
    out PORTC, r17

    ldi r16,0
    ldi r18,0
    
    ldi r16, 0xf
    in r18, PINC
    sub r16, PINC

    out DDRB, r16
    out PORTB, r16

mainloop: rjmp mainloop