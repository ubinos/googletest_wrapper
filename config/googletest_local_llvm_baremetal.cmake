#
# Copyright (c) 2023 Sung Ho Park and CSOS
#
# SPDX-License-Identifier: Apache-2.0
#

# ubinos_config_info {"name_base": "googletest", "build_type": "cmake_ubinos"}

include(${PROJECT_UBINOS_DIR}/config/ubinos_local_llvm_baremetal.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/googletest.cmake)
