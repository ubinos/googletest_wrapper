if(INCLUDE__GOOGLETEST)

    get_filename_component(_tmp_lib_src_dir "${GOOGLETEST__BASE_DIR}" ABSOLUTE)

    include_directories(${_tmp_lib_src_dir})
    include_directories(${_tmp_lib_src_dir}/googletest)
    include_directories(${_tmp_lib_src_dir}/googletest/include)

    set(PROJECT_SOURCES ${PROJECT_SOURCES} "${_tmp_lib_src_dir}/googletest/src/gtest-all.cc")

    get_filename_component(_tmp_source_dir "${CMAKE_CURRENT_LIST_DIR}" ABSOLUTE)
    file(GLOB_RECURSE _tmp_sources
        "${_tmp_source_dir}/*.c"
        "${_tmp_source_dir}/*.cpp"
        "${_tmp_source_dir}/*.cc"
        "${_tmp_source_dir}/*.S")
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_sources})

endif(INCLUDE__GOOGLETEST)
