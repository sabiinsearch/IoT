#include "boards.h"


/**@brief Function for application main entry.
 */

int main(void)
{
    // Initialize.
    bsp_board_init(BSP_INIT_LEDS|BSP_INIT_BUTTONS);
    while(true) {
        if(bsp_board_button_state_get(BSP_BOARD_BUTTON_0)){
            bsp_board_led_on(BSP_BOARD_LED_3);
        } else  {
            bsp_board_led_off(BSP_BOARD_LED_3);
        }
    }
}


/**
 * @}
 */
