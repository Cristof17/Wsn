build: a.hex
a.out: main.c
	avr-gcc -mmcu=atmega128rfa1 -DF-CPU=16000000 -Os -Wall -o $@ $^
a.hex: a.out
	avr-objcopy -j .text -j .data -O ihex $^ $@
flash:
	avrdude -b 57600 -P /dev/ttyUSB0 -c arduino -p m128rfa1 -D -U flash:w:a.hex:a
clean:
	rm -rf a.hex a.out
