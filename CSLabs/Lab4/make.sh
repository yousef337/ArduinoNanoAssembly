#!/bin/bash
avr-as -g -mmcu=atmega328p -o main.o main.s
avr-ld -o main.elf main.o
avr-objcopy -O ihex -R .eeprom main.elf main.hex
avrdude -C ./../../avrdude.conf -p atmega328p -c arduino -P /dev/cu.usbserial-A104WQ4G \
-b 57600 -D -U flash:w:main.hex:i