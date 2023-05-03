/* 
 * toggle the onboard LED on the Blue pill
 * the LED is connect to PC13
 *
 */

/*
 * port C is connected to the clocks using the APB2 Bus	
 */

#define PERIPH_BASE			(0x40000000UL)	// base address of the periphirals memory block
#define APB2_periph_OFFSET	(0x00010000UL)	// the offset between the base of the periph and the APB2 bus
#define APB2_BASE   		(0x40010000UL)	// base address of the APB2 Bus
/*
note: the APB2 Bus base address can also be defined using the base of the periphiral memory block and the offset between the bases. example below:

#define APB2_BASE 			(periph_BASE + APB2_periph_OFFSET)

*/
#define GPIOC_OFFSET		(0x00001000UL)	//
#define GPIOC_BASE			(0x40011000UL)	// base address of GPIO C port
/*
or 
#define GPIOC_BASE			(GPIOAPB2_BASE + GPIOC_BASE)

*/
#define RCC_OFFSET			(0x00011000UL)
#define RCC_BASE 			(0x40021000UL)
/*
or
#define RCC_BASE 			(APB2_BASE + RCC_OFFSET)
*/
#define APB2EN_R_OFFSET		(0x18UL)		// offset from enable register to RCC base register
#define RCC_APB2EN_R		(RCC_BASE + APB2EN_R_OFFSET) // address of the APB2 enable register

#define MODE_R_OFFSET		(0x04UL)
#define MODE_R				(GPIOC_BASE + MODE_R_OFFSET)

#define IOPCEN				(1U << 4)		// this set the bit in position 4 as 1


/*
for later
to make pin 13 an output (check page 172 on the stm32 reference manual)

*/

static
int main(void)
{
    while(1)
    {
        scanf(GPIOC, pin13);
        delay(100);
    }

    return 0;
}

