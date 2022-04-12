// Where is the LED connected
// LED Blue : PB5
// LED Green : PB0
// LED Red : PB1
#include <stdint.h>

#define AHB2_PERIPH_BASE		(0x48000000UL)
#define AHB4_PERIPH_BASE		(0x58000000UL)

#define GPIOB_PERIPH_OFFSET		(0x00000400UL)
#define GPIOD_PERIPH_OFFSET		(0x00000C00UL)

#define GPIOB_BASE				(AHB2_PERIPH_BASE + GPIOB_PERIPH_OFFSET)
#define GPIOD_BASE				(AHB2_PERIPH_BASE + GPIOD_PERIPH_OFFSET)

#define RCC_OFFSET				(0x0000UL)

#define RCC_BASE				(AHB4_PERIPH_BASE + RCC_OFFSET)

#define RCC_AHB2_OFFSET			(0x04CUL)

#define RCC_AHB2_EN_R			(*(volatile unsigned int *)(RCC_BASE + RCC_AHB2_OFFSET))

#define MODE_R_OFFSET			(0X00UL)
#define GPIOB_MODE_R			(*(volatile unsigned int *)(GPIOB_BASE + MODE_R_OFFSET))
#define GPIOD_MODE_R			(*(volatile unsigned int *)(GPIOD_BASE + MODE_R_OFFSET))

#define GPIOB_EN 				(1U<<1)
#define GPIOD_EN				(1U<<3)

#define OD_R_OFFSET				(0x14UL)
#define ID_R_OFFSET				(0x10UL)

#define GPIOB_OD_R				(*(volatile unsigned int *)(GPIOB_BASE + OD_R_OFFSET))
#define GPIOD_ID_R				(*(volatile unsigned int *)(GPIOD_BASE + ID_R_OFFSET))

#define LED_BLUE_PIN			(1U<<5)
#define LED_GREEN_PIN			(1U<<0)
#define LED_RED_PIN				(1U<<1)

#define SW2						(0x00000001UL)
#define SW3						(0x00000010UL)

typedef struct
{
	volatile uint32_t DUMMY[19];     /* Reserved for other addresses*/
	volatile uint32_t AHB2ENR;       /*RCC AHB2 peripheral clock enable register ,        Address offset:   0x04C */
} RCC_TypeDef;

typedef struct
{
	volatile uint32_t MODER;            /*GPIO port Mode register ,        Address offset:   0x00 */
	volatile uint32_t DUMMY[4];         /*Dummy to occupy the offset value to maintain the address offset*/
	volatile uint32_t ODR;              /*GPIO port Output Data Register,   Address offset:  0x14  */
} GPIO_TypeDef;

#define RCC		  ((RCC_TypeDef*)RCC_BASE)
#define GPIOB	  ((GPIO_TypeDef*)GPIOB_BASE)
#define GPIOD	  ((GPIO_TypeDef*)GPIOD_BASE)
/*
 * (1U<<10)      // Set bit 10 to 1
 * &=~(1U<<11)   // Set bit 11 to 0
 */

int main(void)
{
   /*
     1.   Enable clock access to GPIOB & GPIOD */
	//RCC_AHB2_EN_R |= GPIOB_EN ;
    RCC->AHB2ENR |= GPIOB_EN ;
   /* 2.   Set LED_BLUE, LED_GREEN, LED_RED as output pin   */

	//GPIOB_MODE_R |= (1U<<10);    // Set bit 10 to 1
	//GPIOB_MODE_R &=~(1U<<11);   // Set bit 11 to 0
    GPIOB->MODER |= (1U<<10);
    GPIOB->MODER &=~(1U<<11);

    GPIOB->MODER |= (1U<<0);
    GPIOB->MODER &=~(1U<<1);



	// SW2 = PD0
	// SW3 = PD1

	while(1) {

	//  1.    Toggle pin PB0 to high
		//GPIOB_OD_R ^= (1U<<5);
		GPIOB->ODR ^= (1U<<5);
		//GPIOB->ODR ^= (1U<<1);
		for (int i=0;i<100000;i++) {

		}

	//	GPIOB_OD_R ^= (1U<<0);
	//	GPIOB_OD_R ^= (1U<<1);
	}
}




