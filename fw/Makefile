MCU=stm8
DEVICE=stm8s003?3
FLASHER=stlinkv2
CC=sdcc
CFLAGS=-mstm8 -I. --std-c11
LFLAGS=-lstm8

SRCS:=main.c
OBJS:=$(SRCS:.c=.rel)
FW=fw

all: $(FW)

%.rel: %.c
	$(CC) -m$(MCU) $(CFLAGS) $<

$(FW): $(OBJS)
	$(CC) $(LDFLAGS)  -m$(MCU) -o $(FW).ihx $(OBJS)

flash:
	stm8flash -c $(FLASHER) -p $(DEVICE) -w $(FW).ihx

clean:
	@rm -v *.sym *.asm *.lst *.rel *.ihx *lk* *.rst *.cdb *.map
