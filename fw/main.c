#include <stm8s_gpio.h>

static unsigned char lamps_count = 0;

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
    GPIO_Init(GPIOD, GPIO_PIN_4 | GPIO_PIN_5 | GPIO_PIN_6, GPIO_MODE_IN_FL_NO_IT);
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

void toggle_lamp() 
{
    static unsigned char lamp = 0; 
    if ( lamp > lamps_count)
        return;

    switch(lamp) {
        default:
            break;
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
    toggle_lamp();
}


main()
{
    long d = 0;
    unsigned char i = 0;


    configure_clock();

    gpio_init_common();
    lamps_count = read_lamps_count();

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
    setup_timers(900/(lamps_count+1+1));
    enableInterrupts();


    while (1) {
        for (i = 0; i < lamps_count; i++) {
            GPIO_WriteHigh(GPIOA, GPIO_PIN_3);
            for(d = 0; d < 29000; d++){}
            GPIO_WriteLow(GPIOA, GPIO_PIN_3);
            for(d=0; d< 19000; d++){}
        }
        for (d = 0; d < 40000; d++) {}       
    }

}
