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
    
    ldi r17, 0x78
    out PINC, r17
    out PORTC, r17

    ; Although can be intialized directly, it is just to keep them as a reference to indicate change
    ldi r16,0
    ldi r18,0
    
    ldi r16, 0x7f
    in r18, PORTC
    sub r16, r18

    out DDRB, r16
    out PORTB, r16

    cpi r16, 0x7
    brlo branch

mainloop: rjmp mainloop

branch :
    ldi r17, 0xf
    out DDRB, r17
    out PORTB, r17
