#include <regs.h>

//unsigned int clock(void)
//{
//	unsigned char h = TIM1_CNTRH;
//	unsigned char l = TIM1_CNTRL;
//	return ((unsigned int)(h) << 8 | l);
//}

main()
{
	int d;
	PA_DDR=0x8;
	PA_CR1=0x8;

//	while(1) {
//		PA_ODR = (clock() % 1000 < 500 ) << 3;
//	}
	do {
		PA_ODR ^= 0x8;
		for(d = 0; d < 29000; d++) {
		}
	} while (1);
}

