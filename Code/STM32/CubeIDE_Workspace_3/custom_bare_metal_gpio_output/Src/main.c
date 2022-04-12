#include "stm32wb55xx.h"



#define GPIOB_EN 			(1U<<1)
#define GPIOD_EN 			(1U<<3)
//#define GPIOD_Reset			(0xFFFFFFFFUL)


int main(void) {

// Enable clock
   RCC->AHB2ENR |= GPIOB_EN;
   RCC->AHB2ENR |= GPIOD_EN;

// Set PB5 as output
   GPIOB->MODER |= (1U<<10);
   GPIOB->MODER &=~(1U<<11);

//set PD1 as input
  // GPIOD->MODER = GPIOD_Reset;

   GPIOD->MODER &=~(1U<<2);
   GPIOD->MODER &=~(1U<<3);

	while(1) {


		if(GPIOD->IDR & (1U<<1)) {
     		GPIOB->BSRR = (1U<<5);    //  Setting LED_BLUE on
		}
		else {
			GPIOB->BSRR = (1U<<21);    // Resetting LED_BLUE off
		}
	}
}
