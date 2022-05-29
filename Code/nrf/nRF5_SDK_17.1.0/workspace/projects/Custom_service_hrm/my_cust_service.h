/**
 * Copyright (c) 2021 - 2022, Hukam Technologies 
 * 
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 * 
 * 1. Redistributions of source code must retain the above copyright notice, this
 *    list of conditions and the following disclaimer.
 * 
 * 2. Redistributions in binary form, except as embedded into a Hukam Technologies
 *    integrated circuit in a product or a software update for
 *    such product, must reproduce the above copyright notice, this list of
 *    conditions and the following disclaimer in the documentation and/or other
 *    materials provided with the distribution.
 * 
 * 3. Neither the name of Hukam Technologies nor the names of its
 *    contributors may be used to endorse or promote products derived from this
 *    software without specific prior written permission.
 * 
 * 4. This software, with or without modification, must only be used with a
 *    Hukam Technologies.
 * 
 * 5. Any software provided in binary form under this license must not be reverse
 *    engineered, decompiled, modified and/or disassembled.
 * 
 * THIS SOFTWARE IS PROVIDED BY HUKAM TECHNOLOGIES "AS IS" AND ANY EXPRESS
 * OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY, NONINFRINGEMENT, AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL HUKAM TECHNOLOGIES OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
 * GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
 * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * 
 */
 
#ifndef MY_CUST_SERVICE_H__
#define MY_CUST_SERVICE_H__

#include <stdint.h>
#include "ble.h"
#include "ble_srv_common.h"
#include "app_error.h"

// Auto-Generated Base UUID: FA840000-C9E8-4B59-8BC7-790BFB3199BD
#define BLE_UUID_MY_CUST_SERVICE_BASE_UUID      {0xBD, 0x99, 0x31, 0xFB, 0x0B, 0x79, 0xC7, 0x8B, 0x59, 0x4B, 0xE8, 0xC9, 0x00, 0x00, 0x84, 0xFA} // 128-bit base UUID


// My_Cust_Service & Char UUIDs
#define BLE_UUID_MY_CUST_SERVICE_UUID           0x0001 

#define BLE_UUID_CRED_STATUS_CHAR__UUID         0x0002
#define BLE_UUID_CRED_VALUE_CHAR__UUID          0x0003


#define BLE_MY_CUST_SERVICE_OBSERVER_PRIO 2

#define BLE_MY_CUST_SERVICE_DEF(_name)                          \
    static ble_my_cust_service_t _name;                         \
    NRF_SDH_BLE_OBSERVER(_name ## _obs,             \
                         BLE_MY_CUST_SERVICE_OBSERVER_PRIO, \
                         ble_my_cust_service_on_ble_evt,        \
                         &_name)

/**@brief Simple Service event type. */
typedef enum
{
    BLE_MY_CUST_SERVICE_EVT_CRED_UPDATE, /**< Cred value notification enabled event. */
} ble_my_cust_service_evt_type_t;

/**
 * @brief This structure contains various status information for our service. 
 * It only holds one entry now, but will be populated with more items as we go.
 * The name is based on the naming convention used in Nordic's SDKs. 
 * 'ble� indicates that it is a Bluetooth Low Energy relevant structure and). 
 */
typedef struct
{
    ble_my_cust_service_evt_type_t    evt_type;       /**< Type of event. */
    uint16_t                          conn_handle;    /**< Connection handle. */
} ble_my_cust_service_evt_t;

// Forward declaration of the my_cust_service_t type.
typedef struct ble_my_cust_service_s ble_my_cust_service_t;

/**@brief My Custom Service event handler type. */
typedef void (* ble_my_cust_service_evt_handler_t) (ble_my_cust_service_t * p_my_cust_service, ble_my_cust_service_evt_t * p_evt);

/**@brief My Custom Service init structure. This contains all options and data needed for
 *  initialization of the service.*/
typedef struct
{
    ble_my_cust_service_evt_handler_t  evt_handler;                 /**< Event handler to be called for handling events in the Simple Service. */
    ble_srv_utf8_str_t                 cred_initial_value;          /**< Credential Value */ 
    bool                               cred_value_status;           /**< Initial Credential status */
    security_req_t                     cred_rd_sec;                 /**< Security requirement for reading the Credentials characteristic value. */
    security_req_t                     cred_status_rd_sec;          /**< Security requirement for reading the status of Credential characteristic. */
 } ble_my_cust_service_init_t;

/**@brief My Custom Service structure.
 *        This contains various status information
 *        for the service.
 */
struct ble_my_cust_service_s
{
    uint16_t                           conn_handle;
    uint16_t                           service_handle;
    ble_my_cust_service_evt_handler_t  evt_handler;
    ble_srv_utf8_str_t                 cred_value;                  /**< Credential Value */
    bool                               cred_status;
    ble_gatts_char_handles_t           cred_status_char_handles;
    ble_gatts_char_handles_t           cred_value_char_handles;    
};

/*
   Function to intitialize my_cust_service.
*/
uint32_t ble_my_cust_service_init(ble_my_cust_service_t * p_my_cust_service, ble_my_cust_service_init_t * p_my_cust_service_init);

/*
  Function to handle any ble event of my_cust_service.
*/
void ble_my_cust_service_on_ble_evt(ble_evt_t const * p_ble_evt, void * p_context);

/*
   function to get credential status
*/
void ble_get_cred_state_char(ble_my_cust_service_t * p_my_cust_service, uint16_t conn_handle);

/*
   function to uead the credentials
*/
void ble_cred_char_update(ble_my_cust_service_t * p_my_cust_service, uint16_t conn_handle);

#endif  /* _MY_CUST_SERVICE_H__ */
