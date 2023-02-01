#
# Copyright (c) 2023 Sung Ho Park and CSOS
#
# SPDX-License-Identifier: Apache-2.0
#

# ubinos_config_info {"name_base": "googletest_sample1_unittest", "build_type": "cmake_ubinos", "app": true}

set_cache(PROJECT_TOOLCHAIN_C_STD "GNU11" STRING)
set_cache(PROJECT_TOOLCHAIN_CXX_STD "GNU++14" STRING)
set_cache(PROJECT_TOOLCHAIN_CXX_W_NO_CXX14_COMPAT FALSE BOOL)

set_cache(UBINOS__UBICLIB__USE_DUMMY_MKDIR TRUE BOOL)

set_cache(UBINOS__UBIK__TICK_TYPE "RTC" STRING)
set_cache(UBINOS__UBIK__TICK_PER_SEC 1024 STRING)

set_cache(UBINOS__UBICLIB__EXCLUDE_CLI FALSE BOOL)

set_cache(NRF5SDK__BSP_DEFINES_ONLY TRUE BOOL)
set_cache(NRF5SDK__NRFX_POWER_ENABLED FALSE BOOL)

set_cache(UBINOS__BSP__DTTY_TYPE "EXTERNAL" STRING)
set_cache(NRF5SDK__UART_ENABLED TRUE BOOL)

set_cache(NRF5SDK__DTTY_NRF_UART_ENABLE TRUE BOOL)
set_cache(NRF5SDK__NRFX_UARTE0_ENABLED TRUE BOOL)

include(${PROJECT_UBINOS_DIR}/config/ubinos_nrf52840dk.cmake)
include(${PROJECT_LIBRARY_DIR}/nrf5sdk_wrapper/config/nrf5sdk.cmake)
include(${PROJECT_LIBRARY_DIR}/nrf5sdk_extension/config/nrf5sdk_extension.cmake)
include(${PROJECT_LIBRARY_DIR}/googletest_wrapper/config/googletest.cmake)

####

set(INCLUDE__APP TRUE)
set(APP__NAME "googletest_sample1_unittest")

get_filename_component(_tmp_source_dir "${GOOGLETEST__BASE_DIR}/googletest/samples" ABSOLUTE)

set(PROJECT_APP_SOURCES ${PROJECT_APP_SOURCES} ${_tmp_source_dir}/sample1.cc)
set(PROJECT_APP_SOURCES ${PROJECT_APP_SOURCES} ${_tmp_source_dir}/sample1_unittest.cc)

get_filename_component(_tmp_source_dir "${CMAKE_CURRENT_LIST_DIR}/${APP__NAME}" ABSOLUTE)
string(TOLOWER ${UBINOS__BSP__BOARD_VARIATION_NAME} _temp_board_model)
set(_temp_softdevice_name "blank")

include_directories(${_tmp_source_dir}/arch/arm/cortexm/${_temp_board_model}/${_temp_softdevice_name}/config)
include_directories(${_tmp_source_dir}/arch/arm/cortexm/${_temp_board_model})
include_directories(${_tmp_source_dir})

file(GLOB_RECURSE _tmp_sources
    "${_tmp_source_dir}/*.c"
    "${_tmp_source_dir}/*.cpp"
    "${_tmp_source_dir}/*.cc"
    "${_tmp_source_dir}/*.S")

set(PROJECT_APP_SOURCES ${PROJECT_APP_SOURCES} ${_tmp_sources})
