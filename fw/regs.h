#ifndef _REGS__H_
#define _REGS__H_

#define SFR_MEM(x) (*(volatile unsigned char*)(0x5000 + (x)))

/* PORT A */
#define PA_ODR SFR_MEM(0)
#define PA_IDR SFR_MEM(1)
#define PA_DDR SFR_MEM(2)
#define PA_CR1 SFR_MEM(3)
#define PA_CR2 SFR_MEM(4)

/* TIM1 */
#define TIM1_CNTRH SFR_MEM(0x2BF)
#define TIM1_CNTRL SFR_MEM(0x2C0)

#endif // _REGS__H_
