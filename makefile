build: a.hex
a.out: main.c
	avr-gcc -mmcu=atmega128rfa1 -DF-CPU=16000000 -Os -Wall -o $@ $^
a.hex: a.out
	avr-objcopy -j .text -j .data -O ihex $^ $@
clean:
	rm -rf a.hex a.out
