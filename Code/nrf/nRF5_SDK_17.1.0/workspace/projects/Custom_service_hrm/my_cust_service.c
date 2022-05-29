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

#include "sdk_common.h"
#include <stdint.h>
#include <string.h>
#include "ble_gatts.h"
#include "ble_srv_common.h"
#include "my_cust_service.h"
#include "app_error.h"


#define MAX_CRED_LEN      NRF_SDH_BLE_GATT_MAX_MTU_SIZE  /**< Maximum size of a Credentials. */
//static uint16_t                 service_handle;

/**@brief Function for handling the Connect event.
 *
 * @param[in]   p_my_cust_service       My Custom Service structure.
 * @param[in]   p_ble_evt               Event received from the BLE stack.
 */
static void on_connect(ble_my_cust_service_t * p_my_cust_service, ble_evt_t const * p_ble_evt)
{
    p_my_cust_service->conn_handle = p_ble_evt->evt.gap_evt.conn_handle;
}


/**@brief Function for handling the Disconnect event.
 *
 * @param[in]   p_hrs       Heart Rate Service structure.
 * @param[in]   p_ble_evt   Event received from the BLE stack.
 */
static void on_disconnect(ble_my_cust_service_t * p_my_cust_service, ble_evt_t const * p_ble_evt)
{
    UNUSED_PARAMETER(p_ble_evt);
    p_my_cust_service->conn_handle = BLE_CONN_HANDLE_INVALID;
}

/**
 * Generalise Function to add character in service
 */
/*
static uint32_t char_add(uint16_t                        uuid,
                         ble_my_cust_service_t         * p_my_cust_service,
                         uint8_t                       * p_char_value,
                         uint16_t                        char_len,
                         security_req_t const            rd_sec,
                         ble_gatts_char_handles_t      * p_handles)
{
    ble_add_char_params_t add_char_params;
    
    
    APP_ERROR_CHECK_BOOL(char_len > 0);

    memset(&add_char_params, 0, sizeof(add_char_params));

    add_char_params.uuid            = uuid;
    add_char_params.max_len         = char_len;
    add_char_params.init_len        = char_len;
    add_char_params.p_init_value    = p_char_value;
    add_char_params.char_props.read = 1;
    add_char_params.read_access     = rd_sec;

    return characteristic_add(p_my_cust_service->service_handle, &add_char_params, &(p_my_cust_service->cred_value_char_handles));
}
*/
/**@brief Function for initiating our new service.
 *
 * @param[in]   p_our_service        Our Service structure.
 */

uint32_t ble_my_cust_service_init(ble_my_cust_service_t * p_my_cust_service, ble_my_cust_service_init_t * p_my_cust_service_init)
{
    if (p_my_cust_service == NULL || p_my_cust_service_init == NULL)
    {
        return NRF_ERROR_NULL;
    }
    uint32_t err_code;
    ble_uuid_t ble_uuid;

     // Initialize service structure
    p_my_cust_service->evt_handler    = p_my_cust_service_init->evt_handler;
    p_my_cust_service->cred_value     = p_my_cust_service_init->cred_initial_value;
    p_my_cust_service->cred_status    = p_my_cust_service_init->cred_value_status;
    p_my_cust_service->conn_handle    = BLE_CONN_HANDLE_INVALID;

    // Add service
    BLE_UUID_BLE_ASSIGN(ble_uuid, BLE_UUID_MY_CUST_SERVICE_UUID);

    err_code = sd_ble_gatts_service_add(BLE_GATTS_SRVC_TYPE_PRIMARY,
                                        &ble_uuid,
                                        &p_my_cust_service->service_handle);

    if (err_code != NRF_SUCCESS)
    {
        return err_code;
    }
    /* 
    // Add characteristics for Credentials
    if (p_my_cust_service_init->cred_initial_value.length > 0)
    {
        err_code = char_add(BLE_UUID_CRED_VALUE_CHAR__UUID,
                            p_my_cust_service,
                            p_my_cust_service_init->cred_initial_value.p_str,
                            p_my_cust_service_init->cred_initial_value.length,
                            p_my_cust_service_init->cred_rd_sec,
                            &(p_my_cust_service->cred_value_char_handles));

        if (err_code != NRF_SUCCESS)
        {
            return err_code;
        }
    }
    
   //   Add another character for status

        err_code = char_add(BLE_UUID_CRED_VALUE_CHAR__UUID,
                            p_my_cust_service,
                            p_my_cust_service_init->cred_initial_value.p_str,
                            p_my_cust_service_init->cred_initial_value.length,
                            p_my_cust_service_init->cred_status_rd_sec,
                            &(p_my_cust_service->cred_status_char_handles));
     */
    return NRF_SUCCESS;
}

/*
  Function to handle any ble event of my_cust_service.
*/
void ble_my_cust_service_on_ble_evt(ble_evt_t const * p_ble_evt, void * p_context) 
{
    ble_my_cust_service_t * p_my_cust_service = (ble_my_cust_service_t *) p_context;
     switch (p_ble_evt->header.evt_id)
    {
        case BLE_GAP_EVT_CONNECTED:
            on_connect(p_my_cust_service, p_ble_evt);
            break;

        case BLE_GAP_EVT_DISCONNECTED:
            on_disconnect(p_my_cust_service, p_ble_evt);
            break;

        case BLE_GATTS_EVT_WRITE:
//            on_write(p_my_cust_service, p_ble_evt);
            break;

        default:
            // No implementation needed.
            break;
    }
}


/*
   function to get credential status
*/
void ble_get_cred_state_char(ble_my_cust_service_t * p_my_cust_service, uint16_t conn_handle)
{
    
}

/*
   function to uead the credentials
*/
void ble_cred_char_update(ble_my_cust_service_t * p_my_cust_service, uint16_t conn_handle)
{
    
}
