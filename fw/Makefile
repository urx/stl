MCU=stm8
DEVICE=stm8s003?3
FLASHER=stlinkv2
CC=sdcc

OS=$(shell uname)

ifeq (Darwin,$(OS))
LFLAGS= -mstm8 -L/usr//local/Cellar/sdcc/3.6.0/share/sdcc/lib/stm8/ -lstm8 -L../../stm8spl/sysroot/lib -lstm8spl
else
LFLAGS=-l$(MCU) -lstm8spl -L../../stm8spl/sysroot/lib/ 
endif

CFLAGS=-m$(MCU) -I. --std-c11 -I../../stm8spl/sysroot/include -DSDCC -DSTM8S003




SRCS:=main.c
OBJS:=$(SRCS:.c=.rel)
FW=fw

all: $(FW)

%.rel: %.c
	$(CC) $(CFLAGS) -c $<

$(FW): $(OBJS)
	$(CC) $(LFLAGS) -o $(FW).ihx $(OBJS)

flash:
	stm8flash -c $(FLASHER) -p $(DEVICE) -w $(FW).ihx

clean:
	@rm -f *.sym *.asm *.lst *.rel *.ihx *lk* *.rst *.cdb *.map
