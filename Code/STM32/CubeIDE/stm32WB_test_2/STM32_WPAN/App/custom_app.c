/* USER CODE BEGIN Header */
/**
 ******************************************************************************
 * File Name          : App/custom_app.c
 * Description        : Custom Example Application (Server)
 ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2022 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under Ultimate Liberty license
  * SLA0044, the "License"; You may not use this file except in compliance with
  * the License. You may obtain a copy of the License at:
  *                             www.st.com/SLA0044
  *
 ******************************************************************************
 */
/* USER CODE END Header */

/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "app_common.h"
#include "dbg_trace.h"
#include "ble.h"
#include "custom_app.h"
#include "custom_stm.h"
#include "stm32_seq.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
typedef struct
{
  /* sw_status */
  uint8_t               Sw_no_Notification_Status;
  /* update_sw */
  uint8_t               Pin_no_Notification_Status;
  uint8_t               Pin_no_Indication_Status;
/* USER CODE BEGIN CUSTOM_APP_Context_t */

/* USER CODE END CUSTOM_APP_Context_t */

  uint16_t              ConnectionHandle;
} Custom_App_Context_t;

/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private defines ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* Private macros -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
/**
 * START of Section BLE_APP_CONTEXT
 */

PLACE_IN_SECTION("BLE_APP_CONTEXT") static Custom_App_Context_t Custom_App_Context;

/**
 * END of Section BLE_APP_CONTEXT
 */

/* USER CODE BEGIN PV */
uint8_t UpdateCharData[247];
uint8_t NotifyCharData[247];

uint8_t SecureReadData;

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
  /* sw_status */
static void Custom_Sw_no_Update_Char(void);
static void Custom_Sw_no_Send_Notification(void);
  /* update_sw */
static void Custom_Pin_no_Update_Char(void);
static void Custom_Pin_no_Send_Notification(void);
static void Custom_Pin_no_Send_Indication(void);

/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Functions Definition ------------------------------------------------------*/
void Custom_STM_App_Notification(Custom_STM_App_Notification_evt_t *pNotification)
{
/* USER CODE BEGIN CUSTOM_STM_App_Notification_1 */

/* USER CODE END CUSTOM_STM_App_Notification_1 */
  switch(pNotification->Custom_Evt_Opcode)
  {
/* USER CODE BEGIN CUSTOM_STM_App_Notification_Custom_Evt_Opcode */

/* USER CODE END CUSTOM_STM_App_Notification_Custom_Evt_Opcode */

  /* sw_status */
    case CUSTOM_STM_SW_NO_READ_EVT:
/* USER CODE BEGIN CUSTOM_STM_SW_NO_READ_EVT */

/* USER CODE END CUSTOM_STM_SW_NO_READ_EVT */
      break;

    case CUSTOM_STM_SW_NO_NOTIFY_ENABLED_EVT:
/* USER CODE BEGIN CUSTOM_STM_SW_NO_NOTIFY_ENABLED_EVT */

/* USER CODE END CUSTOM_STM_SW_NO_NOTIFY_ENABLED_EVT */
      break;

    case CUSTOM_STM_SW_NO_NOTIFY_DISABLED_EVT:
/* USER CODE BEGIN CUSTOM_STM_SW_NO_NOTIFY_DISABLED_EVT */

/* USER CODE END CUSTOM_STM_SW_NO_NOTIFY_DISABLED_EVT */
      break;

  /* update_sw */
    case CUSTOM_STM_PIN_NO_READ_EVT:
/* USER CODE BEGIN CUSTOM_STM_PIN_NO_READ_EVT */

/* USER CODE END CUSTOM_STM_PIN_NO_READ_EVT */
      break;

    case CUSTOM_STM_PIN_NO_WRITE_EVT:
/* USER CODE BEGIN CUSTOM_STM_PIN_NO_WRITE_EVT */

/* USER CODE END CUSTOM_STM_PIN_NO_WRITE_EVT */
      break;

    case CUSTOM_STM_PIN_NO_NOTIFY_ENABLED_EVT:
/* USER CODE BEGIN CUSTOM_STM_PIN_NO_NOTIFY_ENABLED_EVT */

/* USER CODE END CUSTOM_STM_PIN_NO_NOTIFY_ENABLED_EVT */
      break;

    case CUSTOM_STM_PIN_NO_NOTIFY_DISABLED_EVT:
/* USER CODE BEGIN CUSTOM_STM_PIN_NO_NOTIFY_DISABLED_EVT */

/* USER CODE END CUSTOM_STM_PIN_NO_NOTIFY_DISABLED_EVT */
      break;

    case CUSTOM_STM_PIN_NO_INDICATE_ENABLED_EVT:
/* USER CODE BEGIN CUSTOM_STM_PIN_NO_INDICATE_ENABLED_EVT */

/* USER CODE END CUSTOM_STM_PIN_NO_INDICATE_ENABLED_EVT */
      break;

    case CUSTOM_STM_PIN_NO_INDICATE_DISABLED_EVT:
/* USER CODE BEGIN CUSTOM_STM_PIN_NO_INDICATE_DISABLED_EVT */

/* USER CODE END CUSTOM_STM_PIN_NO_INDICATE_DISABLED_EVT */
      break;

    default:
/* USER CODE BEGIN CUSTOM_STM_App_Notification_default */

/* USER CODE END CUSTOM_STM_App_Notification_default */
      break;
  }
/* USER CODE BEGIN CUSTOM_STM_App_Notification_2 */

/* USER CODE END CUSTOM_STM_App_Notification_2 */
  return;
}

void Custom_APP_Notification(Custom_App_ConnHandle_Not_evt_t *pNotification)
{
/* USER CODE BEGIN CUSTOM_APP_Notification_1 */

/* USER CODE END CUSTOM_APP_Notification_1 */

  switch(pNotification->Custom_Evt_Opcode)
  {
/* USER CODE BEGIN CUSTOM_APP_Notification_Custom_Evt_Opcode */

/* USER CODE END P2PS_CUSTOM_Notification_Custom_Evt_Opcode */
  case CUSTOM_CONN_HANDLE_EVT :
/* USER CODE BEGIN CUSTOM_CONN_HANDLE_EVT */

/* USER CODE END CUSTOM_CONN_HANDLE_EVT */
    break;

    case CUSTOM_DISCON_HANDLE_EVT :
/* USER CODE BEGIN CUSTOM_DISCON_HANDLE_EVT */

/* USER CODE END CUSTOM_DISCON_HANDLE_EVT */
    break;

    default:
/* USER CODE BEGIN CUSTOM_APP_Notification_default */

/* USER CODE END CUSTOM_APP_Notification_default */
      break;
  }

/* USER CODE BEGIN CUSTOM_APP_Notification_2 */

/* USER CODE END CUSTOM_APP_Notification_2 */

  return;
}

void Custom_APP_Init(void)
{
/* USER CODE BEGIN CUSTOM_APP_Init */

/* USER CODE END CUSTOM_APP_Init */
  return;
}

/* USER CODE BEGIN FD */

/* USER CODE END FD */

/*************************************************************
 *
 * LOCAL FUNCTIONS
 *
 *************************************************************/

  /* sw_status */
void Custom_Sw_no_Update_Char(void) /* Property Read */
{
  Custom_STM_App_Update_Char(CUSTOM_STM_SW_NO, (uint8_t *)UpdateCharData);
  /* USER CODE BEGIN Sw_no_UC*/
  HAL_GPIO_TogglePin (GPIOB, GPIO_PIN_0);
  //HAL_GPIO_WritePin(GPIOA, GPIO_PIN_8, GPIO_PIN_SET);
  HAL_Delay(500);

  /* USER CODE END Sw_no_UC*/
  return;
}

void Custom_Sw_no_Send_Notification(void) /* Property Notification */
 {
  if(Custom_App_Context.Sw_no_Notification_Status)
  {
    Custom_STM_App_Update_Char(CUSTOM_STM_SW_NO, (uint8_t *)NotifyCharData);
    /* USER CODE BEGIN Sw_no_NS*/
    HAL_GPIO_TogglePin (GPIOB, GPIO_PIN_0);
    //HAL_GPIO_WritePin(GPIOA, GPIO_PIN_8, GPIO_PIN_SET);
    HAL_Delay(500);

    /* USER CODE END Sw_no_NS*/
  }
  else
  {
    APP_DBG_MSG("-- CUSTOM APPLICATION : CAN'T INFORM CLIENT -  NOTIFICATION DISABLED\n ");
  }
  return;
}

  /* update_sw */
void Custom_Pin_no_Update_Char(void) /* Property Read */
{
  Custom_STM_App_Update_Char(CUSTOM_STM_PIN_NO, (uint8_t *)UpdateCharData);
  /* USER CODE BEGIN Pin_no_UC*/
  HAL_GPIO_TogglePin (GPIOB, GPIO_PIN_0);
  //HAL_GPIO_WritePin(GPIOA, GPIO_PIN_8, GPIO_PIN_SET);
  HAL_Delay(500);

  /* USER CODE END Pin_no_UC*/
  return;
}

void Custom_Pin_no_Send_Notification(void) /* Property Notification */
 {
  if(Custom_App_Context.Pin_no_Notification_Status)
  {
    Custom_STM_App_Update_Char(CUSTOM_STM_PIN_NO, (uint8_t *)NotifyCharData);
    /* USER CODE BEGIN Pin_no_NS*/
    HAL_GPIO_TogglePin (GPIOB, GPIO_PIN_0);
    //HAL_GPIO_WritePin(GPIOA, GPIO_PIN_8, GPIO_PIN_SET);
    HAL_Delay(500);
    /* USER CODE END Pin_no_NS*/
  }
  else
  {
    APP_DBG_MSG("-- CUSTOM APPLICATION : CAN'T INFORM CLIENT -  NOTIFICATION DISABLED\n ");
  }
  return;
}

void Custom_Pin_no_Send_Indication(void) /* Property Indication */
{
  if(Custom_App_Context.Pin_no_Indication_Status)
  {
    Custom_STM_App_Update_Char(CUSTOM_STM_PIN_NO, (uint8_t *)NotifyCharData);
    /* USER CODE BEGIN Pin_no_IS*/
    HAL_GPIO_TogglePin (GPIOB, GPIO_PIN_0);
    //HAL_GPIO_WritePin(GPIOA, GPIO_PIN_8, GPIO_PIN_SET);
    HAL_Delay(500);
    /* USER CODE END Pin_no_IS*/
  }
  else
  {
    APP_DBG_MSG("-- CUSTOM APPLICATION : CAN'T INFORM CLIENT -  NOTIFICATION DISABLED\n ");
  }
  return;
}

/* USER CODE BEGIN FD_LOCAL_FUNCTIONS*/

/* USER CODE END FD_LOCAL_FUNCTIONS*/

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/