#
# Makefile - game_demo.elf
#


all: game_demo.elf


# makfile configuration
COMMON_OBJECTS         =  lcd_backend.o lcd_utils.o sr.o
CPU             = msp430g2553 
CFLAGS          = -mmcu=${CPU} -Os -g 

#switch the compiler (for the internal make rules)
CC              = msp430-gcc
AS              = msp430-as

#additional rules for files

game_demo.elf: game_demo.o drawShip.o drawBullet.o drawComet.o checkCollision.o lcd_char.o screens.o ${COMMON_OBJECTS} 
	msp430-gcc -mmcu=${CPU} -g  -Os -o $@ $^

install_game: game_demo.elf
	mspdebug rf2500 "prog $^"

clean:
	rm -f *.o *.elf



