#include <stm8s.h>
#include <stm8s_gpio.h>
#include <stm8s_flash.h>

static unsigned char lamps_count;
static volatile unsigned char learning_on;
static unsigned char need_update_uptime;

static unsigned char lamp; // lamp counter


volatile unsigned int uptime; // = 800; //default value

//#define TESTBUILD 1

#define LEARN 1

void configure_clock()
{
    CLK_DeInit();
    CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV8);
    CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE,
                          CLK_CURRENTCLOCKSTATE_DISABLE);    
}


/* 
    Fm = 2000000 Hz
    Ft = 2000000 / 128 = 15625 Hz => Tt = 0,000064 (64 us), approx 15.6 periodes per 1 ms
*/
void setup_timers(unsigned int timeout)
{
    TIM2_DeInit();
    TIM2_TimeBaseInit(TIM2_PRESCALER_128, timeout * 15.6);
    TIM2_ClearFlag(TIM2_FLAG_UPDATE);
    TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);
    TIM2_Cmd(ENABLE);
}

void gpio_init_common()
{
    GPIO_Init(GPIOD, GPIO_PIN_3 | GPIO_PIN_4 | GPIO_PIN_5 | GPIO_PIN_6, GPIO_MODE_IN_FL_NO_IT);
    GPIO_Init(GPIOA, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_SLOW);
}

void gpio_init_output(unsigned char count)
{
    unsigned char port_b_mask = 0;
    unsigned char port_c_mask = 0;
    switch (count) {
        case 7:
            port_b_mask |= GPIO_PIN_5;
        case 6:
            port_b_mask |= GPIO_PIN_4;
        case 5:
            port_c_mask |= GPIO_PIN_3;
        case 4:
            port_c_mask |= GPIO_PIN_4;
        case 3:
            port_c_mask |= GPIO_PIN_5;
        case 2:
            port_c_mask |= GPIO_PIN_6;
        case 1:
            port_c_mask |= GPIO_PIN_7;
            break;
    }

    if (port_c_mask) GPIO_Init(GPIOC, port_c_mask, GPIO_MODE_OUT_PP_LOW_SLOW);

    if (port_b_mask) GPIO_Init(GPIOB, port_b_mask, GPIO_MODE_OUT_PP_LOW_SLOW);
}

unsigned char read_lamps_count()
{
    volatile unsigned char cnt = 0;
    cnt = !!GPIO_ReadInputPin(GPIOD, GPIO_PIN_4) 
          | (!!GPIO_ReadInputPin(GPIOD, GPIO_PIN_5) << 1)
          | (!!GPIO_ReadInputPin(GPIOD, GPIO_PIN_6) << 2);

    if (cnt > 7)
        return 0;

    return cnt;
}


#if defined(LEARN)
unsigned char learn_mode()
{
    return GPIO_ReadInputPin(GPIOD, GPIO_PIN_3);
}

void FLASH_PW(uint32_t Address, uint32_t Data)
{
  /* Check parameters */
  assert_param(IS_FLASH_ADDRESS_OK(Address));

  /* Enable Word Write Once */
  FLASH->CR2 |= FLASH_CR2_WPRG;
  FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);

  /* Write one byte - from lowest address*/
  *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));
  /* Write one byte*/
  *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data)+1);
  /* Write one byte*/
  *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data)+2);
  /* Write one byte - from higher address*/
  *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data)+3);
}

void learn()
{
    int d = 0;
    uptime = 0;
    learning_on = 1;
    FLASH_DeInit();
    FLASH_ITConfig(ENABLE);
    FLASH_Unlock(FLASH_MEMTYPE_DATA);
    setup_timers(50);
    enableInterrupts();
    
    for(;;) {
        if (need_update_uptime) {
            disableInterrupts();
            FLASH_PW(FLASH_DATA_START_PHYSICAL_ADDRESS, uptime);
            uptime += 6;
            need_update_uptime = 0;
            enableInterrupts();
        }

    }
    for(;;) {
        GPIO_WriteHigh(GPIOA, GPIO_PIN_3);
        for(d = 0; d < 10000; d++){}
        GPIO_WriteLow(GPIOA, GPIO_PIN_3);
        for(d = 0; d < 10000; d++){}
    }
}

void update_uptime()
{
    /* 4000ms = 256, so each 50ms interval = 3*/
    if (uptime < 80) {
        uptime += 1;
        need_update_uptime = 1;
    } else {
        GPIO_WriteHigh(GPIOA, GPIO_PIN_3);
    }
}


void read_stored_config()
{
    unsigned long timeout;
    FLASH_DeInit();
 
    FLASH_ITConfig(ENABLE);
    FLASH_Unlock(FLASH_MEMTYPE_DATA);

    timeout = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS+3);
    timeout |= (timeout << 8) | FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS+2);
    timeout |= (timeout << 16) | FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS+1);
    timeout |= (timeout << 24) | FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS+0);

    if (timeout != 0) {
        uptime = timeout;
        return;
    }

    GPIO_WriteHigh(GPIOA, GPIO_PIN_3);
    while (1) {
        if (need_update_uptime) {
            disableInterrupts();
            if (timeout < 4000) {
                FLASH_ProgramWord(FLASH_DATA_START_PHYSICAL_ADDRESS, timeout);
		        while (!(FLASH->IAPSR & (1 << FLASH_IAPSR_EOP)));
                
		        timeout += 6;
            }
            need_update_uptime = 0;
            enableInterrupts();
        }
    }

}
#endif

void toggle_lamp() 
{
    if ( lamp > lamps_count)
        return;

    switch(lamp) {
        case 1:
            GPIO_WriteHigh(GPIOC, GPIO_PIN_7);
            break;
        case 2:
            GPIO_WriteHigh(GPIOC, GPIO_PIN_6);
            break;
        case 3:
            GPIO_WriteHigh(GPIOC, GPIO_PIN_5);
            break;
        case 4:
            GPIO_WriteHigh(GPIOC, GPIO_PIN_4);
            break;
        case 5:
            GPIO_WriteHigh(GPIOC, GPIO_PIN_3);
            break;
        case 6:
            GPIO_WriteHigh(GPIOB, GPIO_PIN_4);
            break;
        case 7:
            GPIO_WriteHigh(GPIOB, GPIO_PIN_5);
            break;
    }
    lamp ++;
}

INTERRUPT_HANDLER(TIM2_handler, ITC_IRQ_TIM2_OVF)
{

    TIM2_ClearFlag(TIM2_FLAG_UPDATE);
#if defined(LEARN)
    if (learning_on) {
        update_uptime();

#endif

#ifndef TESTBUILD
        toggle_lamp();
#else
        GPIO_WriteReverse(GPIOA, GPIO_PIN_3);
#endif

#if defined(LEARN)
    }
#endif
}


main()
{
    learning_on = 0;
    need_update_uptime = 0;
    uptime = 800;
    lamp = 0;
    long d = 0;
    unsigned char i = 0;

    configure_clock();

    gpio_init_common();

#if defined(LEARN)
    if (learn_mode())
        learn(); //function with no return
#endif

    lamps_count = read_lamps_count();

#if defined(LEARN)
    read_stored_config();
#endif

    gpio_init_output(lamps_count);


    /* we have uptime approx 1000ms when we running in a hazard signal mode. 
     one bulb bright on right at the moment then supply feeded to us
     and one bulb_timeout we must bright all connected lamps simulateously

     so let it be controlled lamps - X, total lamps X+1, uptime=1000ms.
     so we one lamp interval equals to 1000/(X+1)

     let's assume that we have 2 controlled bulbs + 1 permanent + 1 for 'all on' state: 4 steps. 
     so 1000/4 = 250ms per step:

     b0 1   1   1   1
     b1 0   1   1   1
     b2 0   0   1   1
       s1  s2  s3  s4

    s1: 0-250ms, s2: 250-500ms, s3: 500-750ms, s4: 750-1000ms
    */
    setup_timers(uptime/(lamps_count+1+1));
    enableInterrupts();


    while (1) {
#ifdef TESTBUILD
        for (d = 0; d < 40000; d++) {}
#else       
        for (i = 0; i < lamps_count; i++) {
            GPIO_WriteHigh(GPIOA, GPIO_PIN_3);
            for(d = 0; d < 29000; d++){}
            GPIO_WriteLow(GPIOA, GPIO_PIN_3);
            for(d=0; d< 19000; d++){}
        }
        for (d = 0; d < 40000; d++) {}
#endif       
    }

}
