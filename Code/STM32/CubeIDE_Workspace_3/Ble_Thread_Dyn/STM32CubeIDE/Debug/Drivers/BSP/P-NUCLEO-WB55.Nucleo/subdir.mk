################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/home/sarbjeet/github/IoT/Code/STM32/CubeIDE_Workspace_3/Ble_Thread_Dyn/Drivers/BSP/P-NUCLEO-WB55.Nucleo/stm32wbxx_nucleo.c 

C_DEPS += \
./Drivers/BSP/P-NUCLEO-WB55.Nucleo/stm32wbxx_nucleo.d 

OBJS += \
./Drivers/BSP/P-NUCLEO-WB55.Nucleo/stm32wbxx_nucleo.o 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/P-NUCLEO-WB55.Nucleo/stm32wbxx_nucleo.o: /home/sarbjeet/github/IoT/Code/STM32/CubeIDE_Workspace_3/Ble_Thread_Dyn/Drivers/BSP/P-NUCLEO-WB55.Nucleo/stm32wbxx_nucleo.c Drivers/BSP/P-NUCLEO-WB55.Nucleo/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DST_OT_DEBUG -DUSE_HAL_DRIVER -DDYNAMIC_MODE -DUSE_STM32WBXX_NUCLEO '-DOPENTHREAD_CONFIG_FILE=<openthread_api_config_concurrent.h>' -DCORE_CM4 -DTHREAD_WB -DDEBUG -DSTM32WB55xx -c -I../../Drivers/STM32WBxx_HAL_Driver/Inc -I../../Drivers/CMSIS/Include -I../../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../../Drivers/BSP/P-NUCLEO-WB55.Nucleo -I../../Core/Inc -I../../STM32_WPAN/App -I../../STM32_WPAN/Target -I../../Middlewares/ST/STM32_WPAN -I../../Middlewares/ST/STM32_WPAN/ble/core/template -I../../Middlewares/ST/STM32_WPAN/ble/core/auto -I../../Middlewares/ST/STM32_WPAN/ble/core -I../../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../../Middlewares/ST/STM32_WPAN/ble -I../../Middlewares/ST/STM32_WPAN/utilities -I../../Utilities/lpm/tiny_lpm -I../../Utilities/sequencer -I../../Middlewares/ST/STM32_WPAN/thread/openthread/stack/include -I../../Middlewares/ST/STM32_WPAN/thread/openthread/stack/include/openthread -I../../Middlewares/ST/STM32_WPAN/thread/openthread/core/openthread_api -I../../Middlewares/ST/STM32_WPAN/thread/openthread -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-BSP-2f-P-2d-NUCLEO-2d-WB55-2e-Nucleo

clean-Drivers-2f-BSP-2f-P-2d-NUCLEO-2d-WB55-2e-Nucleo:
	-$(RM) ./Drivers/BSP/P-NUCLEO-WB55.Nucleo/stm32wbxx_nucleo.d ./Drivers/BSP/P-NUCLEO-WB55.Nucleo/stm32wbxx_nucleo.o

.PHONY: clean-Drivers-2f-BSP-2f-P-2d-NUCLEO-2d-WB55-2e-Nucleo
