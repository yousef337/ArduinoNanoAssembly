.equ SREG, 0x3f
.equ PORTB, 0x05
.equ DDRB, 0x04
.equ PINC, 0x06
.equ PORTC, 0x08
.org 0

turnOn :
    ldi r16,0
    out SREG, r16

    ldi r17, 0xf
    out DDRB, r17
    out PORTB, r17

    ldi r23, 1
    ldi r22, 10
    rjmp loopC

mainloop: rjmp mainloop

turnRecieved:

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

    ldi r23, 0
    ldi r22, 10
    rjmp loopC

onTrue:
    rjmp turnRecieved

onTrueB:
    rjmp turnOn

    
loopC:
    nop

    ldi r20, 255

    dec r22

    cpi r22, 0
    brne loopB

    cpi r23, 0
        brne onTrue
    rjmp onTrueB    

loopB:
    nop

    ldi r21, 255

    dec r20

    cpi r20, 0
    brne loopA

    rjmp loopC

loopA:
    nop
    dec r21
    cpi r21, 0
    brne loopA
    rjmp loopB
