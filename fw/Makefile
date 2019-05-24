MCU=stm8
DEVICE=stm8s003?3
FLASHER=stlinkv2
CC=sdcc

OS=$(shell uname)

ifeq (Darwin,$(OS))
LFLAGS= -mstm8 -L/usr/local/share/sdcc/lib/stm8/ -lstm8 -L./stm8spl/ -lstm8spl
#LFLAGS= -mstm8 -L/usr//local/Cellar/sdcc/3.6.0/share/sdcc/lib/stm8/ -lstm8 -L../../stm8spl/sysroot/lib -lstm8spl
else
LFLAGS=-l$(MCU) -lstm8spl -L../../stm8spl/sysroot/lib/
endif

CFLAGS=-m$(MCU) -I. --std-c11 -I./stm8spl/include -DSDCC -DSTM8S003

ifeq (y,$(DEBUG))
CFLAGS=-m$(MCU) -I. --std-c11 -I./stm8spl/include -DSDCC -DSTM8S003 --all-callee-saves --debug --verbose --stack-auto --fverbose-asm  --float-reent --no-peep

LFLAGS+=--out-fmt-elf -o $(FW).elf
else
LFLAGS+= -o $(FW).ihx
endif


SRCS:=main.c
OBJS:=$(SRCS:.c=.rel)
FW=fw

all: stm8spl $(FW)

stm8spl:
	$(MAKE) -C ./stm8spl DEBUG=$(DEBUG)

.PHONY: stm8spl

%.rel: %.c
	$(CC) $(CFLAGS) -c $<

$(FW): $(OBJS)
	$(CC) $(LFLAGS) $(OBJS)

flash:
	stm8flash -c $(FLASHER) -p $(DEVICE) -w $(FW).ihx

clean:
	@rm -f *.sym *.asm *.lst *.rel *.ihx *lk* *.rst *.cdb *.map
	@make -C ./stm8spl clean
