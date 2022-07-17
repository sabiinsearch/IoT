/*
 *
 *    Copyright (c) 2022 Project CHIP Authors
 *
 *    Licensed under the Apache License, Version 2.0 (the "License");
 *    you may not use this file except in compliance with the License.
 *    You may obtain a copy of the License at
 *
 *        http://www.apache.org/licenses/LICENSE-2.0
 *
 *    Unless required by applicable law or agreed to in writing, software
 *    distributed under the License is distributed on an "AS IS" BASIS,
 *    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *    See the License for the specific language governing permissions and
 *    limitations under the License.
 */

// THIS FILE IS GENERATED BY ZAP

// Prevent multiple inclusion
#pragma once

// Global, non-cluster-specific commands
#define ZCL_READ_ATTRIBUTES_COMMAND_ID (0x00)
#define ZCL_READ_ATTRIBUTES_RESPONSE_COMMAND_ID (0x01)
#define ZCL_WRITE_ATTRIBUTES_COMMAND_ID (0x02)
#define ZCL_WRITE_ATTRIBUTES_UNDIVIDED_COMMAND_ID (0x03)
#define ZCL_WRITE_ATTRIBUTES_RESPONSE_COMMAND_ID (0x04)
#define ZCL_WRITE_ATTRIBUTES_NO_RESPONSE_COMMAND_ID (0x05)
#define ZCL_DEFAULT_RESPONSE_COMMAND_ID (0x0B)
#define ZCL_READ_ATTRIBUTES_STRUCTURED_COMMAND_ID (0x0E)
#define ZCL_WRITE_ATTRIBUTES_STRUCTURED_COMMAND_ID (0x0F)
#define ZCL_WRITE_ATTRIBUTES_STRUCTURED_RESPONSE_COMMAND_ID (0x10)

// Commands for cluster: Identify
#define ZCL_IDENTIFY_COMMAND_ID (0x00)
#define ZCL_TRIGGER_EFFECT_COMMAND_ID (0x40)

// Commands for cluster: Groups
#define ZCL_ADD_GROUP_COMMAND_ID (0x00)
#define ZCL_ADD_GROUP_RESPONSE_COMMAND_ID (0x00)
#define ZCL_VIEW_GROUP_COMMAND_ID (0x01)
#define ZCL_VIEW_GROUP_RESPONSE_COMMAND_ID (0x01)
#define ZCL_GET_GROUP_MEMBERSHIP_COMMAND_ID (0x02)
#define ZCL_GET_GROUP_MEMBERSHIP_RESPONSE_COMMAND_ID (0x02)
#define ZCL_REMOVE_GROUP_COMMAND_ID (0x03)
#define ZCL_REMOVE_GROUP_RESPONSE_COMMAND_ID (0x03)
#define ZCL_REMOVE_ALL_GROUPS_COMMAND_ID (0x04)
#define ZCL_ADD_GROUP_IF_IDENTIFYING_COMMAND_ID (0x05)

// Commands for cluster: Scenes
#define ZCL_ADD_SCENE_COMMAND_ID (0x00)
#define ZCL_ADD_SCENE_RESPONSE_COMMAND_ID (0x00)
#define ZCL_VIEW_SCENE_COMMAND_ID (0x01)
#define ZCL_VIEW_SCENE_RESPONSE_COMMAND_ID (0x01)
#define ZCL_REMOVE_SCENE_COMMAND_ID (0x02)
#define ZCL_REMOVE_SCENE_RESPONSE_COMMAND_ID (0x02)
#define ZCL_REMOVE_ALL_SCENES_COMMAND_ID (0x03)
#define ZCL_REMOVE_ALL_SCENES_RESPONSE_COMMAND_ID (0x03)
#define ZCL_STORE_SCENE_COMMAND_ID (0x04)
#define ZCL_STORE_SCENE_RESPONSE_COMMAND_ID (0x04)
#define ZCL_RECALL_SCENE_COMMAND_ID (0x05)
#define ZCL_GET_SCENE_MEMBERSHIP_COMMAND_ID (0x06)
#define ZCL_GET_SCENE_MEMBERSHIP_RESPONSE_COMMAND_ID (0x06)
#define ZCL_ENHANCED_ADD_SCENE_COMMAND_ID (0x40)
#define ZCL_ENHANCED_ADD_SCENE_RESPONSE_COMMAND_ID (0x40)
#define ZCL_ENHANCED_VIEW_SCENE_COMMAND_ID (0x41)
#define ZCL_ENHANCED_VIEW_SCENE_RESPONSE_COMMAND_ID (0x41)
#define ZCL_COPY_SCENE_COMMAND_ID (0x42)
#define ZCL_COPY_SCENE_RESPONSE_COMMAND_ID (0x42)

// Commands for cluster: On/Off
#define ZCL_OFF_COMMAND_ID (0x00)
#define ZCL_ON_COMMAND_ID (0x01)
#define ZCL_TOGGLE_COMMAND_ID (0x02)
#define ZCL_OFF_WITH_EFFECT_COMMAND_ID (0x40)
#define ZCL_ON_WITH_RECALL_GLOBAL_SCENE_COMMAND_ID (0x41)
#define ZCL_ON_WITH_TIMED_OFF_COMMAND_ID (0x42)

// Commands for cluster: Level Control
#define ZCL_MOVE_TO_LEVEL_COMMAND_ID (0x00)
#define ZCL_MOVE_COMMAND_ID (0x01)
#define ZCL_STEP_COMMAND_ID (0x02)
#define ZCL_STOP_COMMAND_ID (0x03)
#define ZCL_MOVE_TO_LEVEL_WITH_ON_OFF_COMMAND_ID (0x04)
#define ZCL_MOVE_WITH_ON_OFF_COMMAND_ID (0x05)
#define ZCL_STEP_WITH_ON_OFF_COMMAND_ID (0x06)
#define ZCL_STOP_WITH_ON_OFF_COMMAND_ID (0x07)
#define ZCL_MOVE_TO_CLOSEST_FREQUENCY_COMMAND_ID (0x08)

// Commands for cluster: Bridged Actions
#define ZCL_INSTANT_ACTION_COMMAND_ID (0x00)
#define ZCL_INSTANT_ACTION_WITH_TRANSITION_COMMAND_ID (0x01)
#define ZCL_START_ACTION_COMMAND_ID (0x02)
#define ZCL_START_ACTION_WITH_DURATION_COMMAND_ID (0x03)
#define ZCL_STOP_ACTION_COMMAND_ID (0x04)
#define ZCL_PAUSE_ACTION_COMMAND_ID (0x05)
#define ZCL_PAUSE_ACTION_WITH_DURATION_COMMAND_ID (0x06)
#define ZCL_RESUME_ACTION_COMMAND_ID (0x07)
#define ZCL_ENABLE_ACTION_COMMAND_ID (0x08)
#define ZCL_ENABLE_ACTION_WITH_DURATION_COMMAND_ID (0x09)
#define ZCL_DISABLE_ACTION_COMMAND_ID (0x0A)
#define ZCL_DISABLE_ACTION_WITH_DURATION_COMMAND_ID (0x0B)

// Commands for cluster: Basic
#define ZCL_MFG_SPECIFIC_PING_COMMAND_ID (0x00)

// Commands for cluster: OTA Software Update Provider
#define ZCL_QUERY_IMAGE_COMMAND_ID (0x00)
#define ZCL_QUERY_IMAGE_RESPONSE_COMMAND_ID (0x01)
#define ZCL_APPLY_UPDATE_REQUEST_COMMAND_ID (0x02)
#define ZCL_APPLY_UPDATE_RESPONSE_COMMAND_ID (0x03)
#define ZCL_NOTIFY_UPDATE_APPLIED_COMMAND_ID (0x04)

// Commands for cluster: OTA Software Update Requestor
#define ZCL_ANNOUNCE_OTA_PROVIDER_COMMAND_ID (0x00)

// Commands for cluster: General Commissioning
#define ZCL_ARM_FAIL_SAFE_COMMAND_ID (0x00)
#define ZCL_ARM_FAIL_SAFE_RESPONSE_COMMAND_ID (0x01)
#define ZCL_SET_REGULATORY_CONFIG_COMMAND_ID (0x02)
#define ZCL_SET_REGULATORY_CONFIG_RESPONSE_COMMAND_ID (0x03)
#define ZCL_COMMISSIONING_COMPLETE_COMMAND_ID (0x04)
#define ZCL_COMMISSIONING_COMPLETE_RESPONSE_COMMAND_ID (0x05)

// Commands for cluster: Network Commissioning
#define ZCL_SCAN_NETWORKS_COMMAND_ID (0x00)
#define ZCL_SCAN_NETWORKS_RESPONSE_COMMAND_ID (0x01)
#define ZCL_ADD_OR_UPDATE_WI_FI_NETWORK_COMMAND_ID (0x02)
#define ZCL_ADD_OR_UPDATE_THREAD_NETWORK_COMMAND_ID (0x03)
#define ZCL_REMOVE_NETWORK_COMMAND_ID (0x04)
#define ZCL_NETWORK_CONFIG_RESPONSE_COMMAND_ID (0x05)
#define ZCL_CONNECT_NETWORK_COMMAND_ID (0x06)
#define ZCL_CONNECT_NETWORK_RESPONSE_COMMAND_ID (0x07)
#define ZCL_REORDER_NETWORK_COMMAND_ID (0x08)

// Commands for cluster: Diagnostic Logs
#define ZCL_RETRIEVE_LOGS_REQUEST_COMMAND_ID (0x00)
#define ZCL_RETRIEVE_LOGS_RESPONSE_COMMAND_ID (0x01)

// Commands for cluster: General Diagnostics
#define ZCL_TEST_EVENT_TRIGGER_COMMAND_ID (0x00)

// Commands for cluster: Software Diagnostics
#define ZCL_RESET_WATERMARKS_COMMAND_ID (0x00)

// Commands for cluster: Thread Network Diagnostics
#define ZCL_RESET_COUNTS_COMMAND_ID (0x00)

// Commands for cluster: WiFi Network Diagnostics
#define ZCL_RESET_COUNTS_COMMAND_ID (0x00)

// Commands for cluster: Ethernet Network Diagnostics
#define ZCL_RESET_COUNTS_COMMAND_ID (0x00)

// Commands for cluster: AdministratorCommissioning
#define ZCL_OPEN_COMMISSIONING_WINDOW_COMMAND_ID (0x00)
#define ZCL_OPEN_BASIC_COMMISSIONING_WINDOW_COMMAND_ID (0x01)
#define ZCL_REVOKE_COMMISSIONING_COMMAND_ID (0x02)

// Commands for cluster: Operational Credentials
#define ZCL_ATTESTATION_REQUEST_COMMAND_ID (0x00)
#define ZCL_ATTESTATION_RESPONSE_COMMAND_ID (0x01)
#define ZCL_CERTIFICATE_CHAIN_REQUEST_COMMAND_ID (0x02)
#define ZCL_CERTIFICATE_CHAIN_RESPONSE_COMMAND_ID (0x03)
#define ZCL_CSR_REQUEST_COMMAND_ID (0x04)
#define ZCL_CSR_RESPONSE_COMMAND_ID (0x05)
#define ZCL_ADD_NOC_COMMAND_ID (0x06)
#define ZCL_UPDATE_NOC_COMMAND_ID (0x07)
#define ZCL_NOC_RESPONSE_COMMAND_ID (0x08)
#define ZCL_UPDATE_FABRIC_LABEL_COMMAND_ID (0x09)
#define ZCL_REMOVE_FABRIC_COMMAND_ID (0x0A)
#define ZCL_ADD_TRUSTED_ROOT_CERTIFICATE_COMMAND_ID (0x0B)

// Commands for cluster: Group Key Management
#define ZCL_KEY_SET_WRITE_COMMAND_ID (0x00)
#define ZCL_KEY_SET_READ_COMMAND_ID (0x01)
#define ZCL_KEY_SET_READ_RESPONSE_COMMAND_ID (0x02)
#define ZCL_KEY_SET_REMOVE_COMMAND_ID (0x03)
#define ZCL_KEY_SET_READ_ALL_INDICES_COMMAND_ID (0x04)
#define ZCL_KEY_SET_READ_ALL_INDICES_RESPONSE_COMMAND_ID (0x05)

// Commands for cluster: Mode Select
#define ZCL_CHANGE_TO_MODE_COMMAND_ID (0x00)

// Commands for cluster: Door Lock
#define ZCL_LOCK_DOOR_COMMAND_ID (0x00)
#define ZCL_UNLOCK_DOOR_COMMAND_ID (0x01)
#define ZCL_UNLOCK_WITH_TIMEOUT_COMMAND_ID (0x03)
#define ZCL_SET_WEEK_DAY_SCHEDULE_COMMAND_ID (0x0B)
#define ZCL_GET_WEEK_DAY_SCHEDULE_COMMAND_ID (0x0C)
#define ZCL_GET_WEEK_DAY_SCHEDULE_RESPONSE_COMMAND_ID (0x0C)
#define ZCL_CLEAR_WEEK_DAY_SCHEDULE_COMMAND_ID (0x0D)
#define ZCL_SET_YEAR_DAY_SCHEDULE_COMMAND_ID (0x0E)
#define ZCL_GET_YEAR_DAY_SCHEDULE_COMMAND_ID (0x0F)
#define ZCL_GET_YEAR_DAY_SCHEDULE_RESPONSE_COMMAND_ID (0x0F)
#define ZCL_CLEAR_YEAR_DAY_SCHEDULE_COMMAND_ID (0x10)
#define ZCL_SET_HOLIDAY_SCHEDULE_COMMAND_ID (0x11)
#define ZCL_GET_HOLIDAY_SCHEDULE_COMMAND_ID (0x12)
#define ZCL_GET_HOLIDAY_SCHEDULE_RESPONSE_COMMAND_ID (0x12)
#define ZCL_CLEAR_HOLIDAY_SCHEDULE_COMMAND_ID (0x13)
#define ZCL_SET_USER_COMMAND_ID (0x1A)
#define ZCL_GET_USER_COMMAND_ID (0x1B)
#define ZCL_GET_USER_RESPONSE_COMMAND_ID (0x1C)
#define ZCL_CLEAR_USER_COMMAND_ID (0x1D)
#define ZCL_SET_CREDENTIAL_COMMAND_ID (0x22)
#define ZCL_SET_CREDENTIAL_RESPONSE_COMMAND_ID (0x23)
#define ZCL_GET_CREDENTIAL_STATUS_COMMAND_ID (0x24)
#define ZCL_GET_CREDENTIAL_STATUS_RESPONSE_COMMAND_ID (0x25)
#define ZCL_CLEAR_CREDENTIAL_COMMAND_ID (0x26)

// Commands for cluster: Window Covering
#define ZCL_UP_OR_OPEN_COMMAND_ID (0x00)
#define ZCL_DOWN_OR_CLOSE_COMMAND_ID (0x01)
#define ZCL_STOP_MOTION_COMMAND_ID (0x02)
#define ZCL_GO_TO_LIFT_VALUE_COMMAND_ID (0x04)
#define ZCL_GO_TO_LIFT_PERCENTAGE_COMMAND_ID (0x05)
#define ZCL_GO_TO_TILT_VALUE_COMMAND_ID (0x07)
#define ZCL_GO_TO_TILT_PERCENTAGE_COMMAND_ID (0x08)

// Commands for cluster: Barrier Control
#define ZCL_BARRIER_CONTROL_GO_TO_PERCENT_COMMAND_ID (0x00)
#define ZCL_BARRIER_CONTROL_STOP_COMMAND_ID (0x01)

// Commands for cluster: Thermostat
#define ZCL_SETPOINT_RAISE_LOWER_COMMAND_ID (0x00)
#define ZCL_GET_WEEKLY_SCHEDULE_RESPONSE_COMMAND_ID (0x00)
#define ZCL_SET_WEEKLY_SCHEDULE_COMMAND_ID (0x01)
#define ZCL_GET_WEEKLY_SCHEDULE_COMMAND_ID (0x02)
#define ZCL_CLEAR_WEEKLY_SCHEDULE_COMMAND_ID (0x03)

// Commands for cluster: Color Control
#define ZCL_MOVE_TO_HUE_COMMAND_ID (0x00)
#define ZCL_MOVE_HUE_COMMAND_ID (0x01)
#define ZCL_STEP_HUE_COMMAND_ID (0x02)
#define ZCL_MOVE_TO_SATURATION_COMMAND_ID (0x03)
#define ZCL_MOVE_SATURATION_COMMAND_ID (0x04)
#define ZCL_STEP_SATURATION_COMMAND_ID (0x05)
#define ZCL_MOVE_TO_HUE_AND_SATURATION_COMMAND_ID (0x06)
#define ZCL_MOVE_TO_COLOR_COMMAND_ID (0x07)
#define ZCL_MOVE_COLOR_COMMAND_ID (0x08)
#define ZCL_STEP_COLOR_COMMAND_ID (0x09)
#define ZCL_MOVE_TO_COLOR_TEMPERATURE_COMMAND_ID (0x0A)
#define ZCL_ENHANCED_MOVE_TO_HUE_COMMAND_ID (0x40)
#define ZCL_ENHANCED_MOVE_HUE_COMMAND_ID (0x41)
#define ZCL_ENHANCED_STEP_HUE_COMMAND_ID (0x42)
#define ZCL_ENHANCED_MOVE_TO_HUE_AND_SATURATION_COMMAND_ID (0x43)
#define ZCL_COLOR_LOOP_SET_COMMAND_ID (0x44)
#define ZCL_STOP_MOVE_STEP_COMMAND_ID (0x47)
#define ZCL_MOVE_COLOR_TEMPERATURE_COMMAND_ID (0x4B)
#define ZCL_STEP_COLOR_TEMPERATURE_COMMAND_ID (0x4C)

// Commands for cluster: Channel
#define ZCL_CHANGE_CHANNEL_COMMAND_ID (0x00)
#define ZCL_CHANGE_CHANNEL_RESPONSE_COMMAND_ID (0x01)
#define ZCL_CHANGE_CHANNEL_BY_NUMBER_COMMAND_ID (0x02)
#define ZCL_SKIP_CHANNEL_COMMAND_ID (0x03)

// Commands for cluster: Target Navigator
#define ZCL_NAVIGATE_TARGET_COMMAND_ID (0x00)
#define ZCL_NAVIGATE_TARGET_RESPONSE_COMMAND_ID (0x01)

// Commands for cluster: Media Playback
#define ZCL_PLAY_COMMAND_ID (0x00)
#define ZCL_PAUSE_COMMAND_ID (0x01)
#define ZCL_STOP_PLAYBACK_COMMAND_ID (0x02)
#define ZCL_START_OVER_COMMAND_ID (0x03)
#define ZCL_PREVIOUS_COMMAND_ID (0x04)
#define ZCL_NEXT_COMMAND_ID (0x05)
#define ZCL_REWIND_COMMAND_ID (0x06)
#define ZCL_FAST_FORWARD_COMMAND_ID (0x07)
#define ZCL_SKIP_FORWARD_COMMAND_ID (0x08)
#define ZCL_SKIP_BACKWARD_COMMAND_ID (0x09)
#define ZCL_PLAYBACK_RESPONSE_COMMAND_ID (0x0A)
#define ZCL_SEEK_COMMAND_ID (0x0B)

// Commands for cluster: Media Input
#define ZCL_SELECT_INPUT_COMMAND_ID (0x00)
#define ZCL_SHOW_INPUT_STATUS_COMMAND_ID (0x01)
#define ZCL_HIDE_INPUT_STATUS_COMMAND_ID (0x02)
#define ZCL_RENAME_INPUT_COMMAND_ID (0x03)

// Commands for cluster: Low Power
#define ZCL_SLEEP_COMMAND_ID (0x00)

// Commands for cluster: Keypad Input
#define ZCL_SEND_KEY_COMMAND_ID (0x00)
#define ZCL_SEND_KEY_RESPONSE_COMMAND_ID (0x01)

// Commands for cluster: Content Launcher
#define ZCL_LAUNCH_CONTENT_COMMAND_ID (0x00)
#define ZCL_LAUNCH_URL_COMMAND_ID (0x01)
#define ZCL_LAUNCH_RESPONSE_COMMAND_ID (0x02)

// Commands for cluster: Audio Output
#define ZCL_SELECT_OUTPUT_COMMAND_ID (0x00)
#define ZCL_RENAME_OUTPUT_COMMAND_ID (0x01)

// Commands for cluster: Application Launcher
#define ZCL_LAUNCH_APP_COMMAND_ID (0x00)
#define ZCL_STOP_APP_COMMAND_ID (0x01)
#define ZCL_HIDE_APP_COMMAND_ID (0x02)
#define ZCL_LAUNCHER_RESPONSE_COMMAND_ID (0x03)

// Commands for cluster: Account Login
#define ZCL_GET_SETUP_PIN_COMMAND_ID (0x00)
#define ZCL_GET_SETUP_PIN_RESPONSE_COMMAND_ID (0x01)
#define ZCL_LOGIN_COMMAND_ID (0x02)
#define ZCL_LOGOUT_COMMAND_ID (0x03)

// Commands for cluster: Electrical Measurement
#define ZCL_GET_PROFILE_INFO_RESPONSE_COMMAND_COMMAND_ID (0x00)
#define ZCL_GET_PROFILE_INFO_COMMAND_COMMAND_ID (0x00)
#define ZCL_GET_MEASUREMENT_PROFILE_RESPONSE_COMMAND_COMMAND_ID (0x01)
#define ZCL_GET_MEASUREMENT_PROFILE_COMMAND_COMMAND_ID (0x01)

// Commands for cluster: Test Cluster
#define ZCL_TEST_COMMAND_ID (0x00)
#define ZCL_TEST_SPECIFIC_RESPONSE_COMMAND_ID (0x00)
#define ZCL_TEST_NOT_HANDLED_COMMAND_ID (0x01)
#define ZCL_TEST_ADD_ARGUMENTS_RESPONSE_COMMAND_ID (0x01)
#define ZCL_TEST_SPECIFIC_COMMAND_ID (0x02)
#define ZCL_TEST_SIMPLE_ARGUMENT_RESPONSE_COMMAND_ID (0x02)
#define ZCL_TEST_UNKNOWN_COMMAND_COMMAND_ID (0x03)
#define ZCL_TEST_STRUCT_ARRAY_ARGUMENT_RESPONSE_COMMAND_ID (0x03)
#define ZCL_TEST_ADD_ARGUMENTS_COMMAND_ID (0x04)
#define ZCL_TEST_LIST_INT8_U_REVERSE_RESPONSE_COMMAND_ID (0x04)
#define ZCL_TEST_SIMPLE_ARGUMENT_REQUEST_COMMAND_ID (0x05)
#define ZCL_TEST_ENUMS_RESPONSE_COMMAND_ID (0x05)
#define ZCL_TEST_STRUCT_ARRAY_ARGUMENT_REQUEST_COMMAND_ID (0x06)
#define ZCL_TEST_NULLABLE_OPTIONAL_RESPONSE_COMMAND_ID (0x06)
#define ZCL_TEST_STRUCT_ARGUMENT_REQUEST_COMMAND_ID (0x07)
#define ZCL_TEST_COMPLEX_NULLABLE_OPTIONAL_RESPONSE_COMMAND_ID (0x07)
#define ZCL_TEST_NESTED_STRUCT_ARGUMENT_REQUEST_COMMAND_ID (0x08)
#define ZCL_BOOLEAN_RESPONSE_COMMAND_ID (0x08)
#define ZCL_TEST_LIST_STRUCT_ARGUMENT_REQUEST_COMMAND_ID (0x09)
#define ZCL_SIMPLE_STRUCT_RESPONSE_COMMAND_ID (0x09)
#define ZCL_TEST_LIST_INT8_U_ARGUMENT_REQUEST_COMMAND_ID (0x0A)
#define ZCL_TEST_EMIT_TEST_EVENT_RESPONSE_COMMAND_ID (0x0A)
#define ZCL_TEST_NESTED_STRUCT_LIST_ARGUMENT_REQUEST_COMMAND_ID (0x0B)
#define ZCL_TEST_EMIT_TEST_FABRIC_SCOPED_EVENT_RESPONSE_COMMAND_ID (0x0B)
#define ZCL_TEST_LIST_NESTED_STRUCT_LIST_ARGUMENT_REQUEST_COMMAND_ID (0x0C)
#define ZCL_TEST_LIST_INT8_U_REVERSE_REQUEST_COMMAND_ID (0x0D)
#define ZCL_TEST_ENUMS_REQUEST_COMMAND_ID (0x0E)
#define ZCL_TEST_NULLABLE_OPTIONAL_REQUEST_COMMAND_ID (0x0F)
#define ZCL_TEST_COMPLEX_NULLABLE_OPTIONAL_REQUEST_COMMAND_ID (0x10)
#define ZCL_SIMPLE_STRUCT_ECHO_REQUEST_COMMAND_ID (0x11)
#define ZCL_TIMED_INVOKE_REQUEST_COMMAND_ID (0x12)
#define ZCL_TEST_SIMPLE_OPTIONAL_ARGUMENT_REQUEST_COMMAND_ID (0x13)
#define ZCL_TEST_EMIT_TEST_EVENT_REQUEST_COMMAND_ID (0x14)
#define ZCL_TEST_EMIT_TEST_FABRIC_SCOPED_EVENT_REQUEST_COMMAND_ID (0x15)
