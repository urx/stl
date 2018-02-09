//#include <regs.h>
#include <stm8s_gpio.h>

main()
{
    long d;
    GPIO_Init(GPIOA, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_SLOW);
    GPIO_Init(GPIOC, GPIO_PIN_7 | GPIO_PIN_6, GPIO_MODE_OUT_PP_LOW_SLOW);

    for(d = 0; d < 33333; d++) {}
    GPIO_WriteHigh(GPIOC, GPIO_PIN_7);
    for(d = 0; d < 33333; d++) {}
    GPIO_WriteHigh(GPIOC, GPIO_PIN_6);

    while (1) {
        GPIO_WriteReverse(GPIOA, GPIO_PIN_3);
        for(d = 0; d < 29000; d++){}
    }
}
