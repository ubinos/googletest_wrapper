#
# Copyright (c) 2023 Sung Ho Park and CSOS
#
# SPDX-License-Identifier: Apache-2.0
#

set(INCLUDE__GOOGLETEST TRUE)
set(PROJECT_UBINOS_LIBRARIES ${PROJECT_UBINOS_LIBRARIES} googletest_wrapper)

set_cache_default(GOOGLETEST__BASE_DIR "${PROJECT_LIBRARY_DIR}/googletest" STRING "googletest project base dir")
