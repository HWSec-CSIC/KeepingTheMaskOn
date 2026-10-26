#include <stdint.h>

/* Prototipos de handlers débiles */
void Reset_Handler(void);
void Default_Handler(void);
void EXTI0_IRQHandler(void);

extern int main(void);

/* Direcciones de memoria exportadas por el linker */
extern uint32_t _sidata; /* inicio data en Flash */
extern uint32_t _sdata;  /* inicio data en RAM   */
extern uint32_t _edata;  /* fin data en RAM     */
extern uint32_t _sbss;   /* inicio bss          */
extern uint32_t _ebss;   /* fin bss             */

/* Vector de interrupciones */
__attribute__((section(".isr_vector")))
const void* vector_table[] = {
    (void*)0x2000A000,       /* Top of Stack (40 KB RAM: 0x2000A000) */
    Reset_Handler,           /* Reset */
    Default_Handler,         /* NMI */
    Default_Handler,         /* HardFault */
    Default_Handler,         /* MemManage */
    Default_Handler,         /* BusFault */
    Default_Handler,         /* UsageFault */
    0, 0, 0, 0,              /* Reservados */
    Default_Handler,         /* SVC */
    Default_Handler,         /* DebugMon */
    0,                        /* Reserved */
    Default_Handler,         /* PendSV */
    Default_Handler,         /* SysTick */
    /* Interrupciones externas (IRQ 0..n) */
    Default_Handler,         /* WWDG */
    Default_Handler,         /* PVD */
    Default_Handler,         /* TAMP_STAMP */
    Default_Handler,         /* RTC_WKUP */
    Default_Handler,         /* FLASH */
    Default_Handler,         /* RCC */
    EXTI0_IRQHandler,        /* EXTI0 -> nuestro */
    /* ... el resto puedes dejarlos como Default_Handler */
};

/* Reset Handler: copia .data, limpia .bss y llama a main */
void Reset_Handler(void)
{
    uint32_t *src = &_sidata;
    uint32_t *dst = &_sdata;
    while (dst < &_edata) *dst++ = *src++;

    for (dst = &_sbss; dst < &_ebss;) *dst++ = 0;

    main();
    while (1);
}

void Default_Handler(void)
{
    while (1);
}
