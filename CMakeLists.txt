cmake_minimum_required(VERSION 3.21.0)
project(umba-template VERSION 0.1.0 LANGUAGES C CXX)

# set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)


set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_VERBOSE_MAKEFILE ON)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)


set(UMBA_STATIC_RUNTIME ON)
set(UMBA_USE_BOOST      ON)

include(${CMAKE_CURRENT_LIST_DIR}/.cmake/umba.cmake)


include_directories(${LIB_ROOT})

# Import libraries here
# add_subdirectory(${LIB_ROOT}/encoding)
# add_subdirectory(${LIB_ROOT}/marty_cpp)
# add_subdirectory(${LIB_ROOT}/marty_pugixml)
# add_subdirectory(${LIB_ROOT}/marty_tr)
# add_subdirectory(${LIB_ROOT}/marty_yaml_toml_json)
# add_subdirectory(${LIB_ROOT}/nlohmann)    # https://json.nlohmann.me/integration/cmake/#external
# add_subdirectory(${LIB_ROOT}/pugixml)
# add_subdirectory(${LIB_ROOT}/sfmt)
# add_subdirectory(${LIB_ROOT}/umba)
# add_subdirectory(${LIB_ROOT}/yaml-cpp)

# umba_configure_boost("STATIC_LIBS" "MULTITHREADED" "${STATIC_RUNTIME}")

# add_compile_definitions("YAML_CPP_STATIC_DEFINE")
# add_compile_definitions("USE_UMBA_LOUT_COUT")
# add_compile_definitions("UMBA_TOKENIZER_DISABLE_UMBA_TOKENIZER_GET_CHAR_CLASS_FUNCTION")
# add_compile_definitions("UMBA_TOKEN_TRIE_FIND_NEXT_BINARY_SEARCH_DISABLED")


# Configure libraries here
# set(COMMON_LIBS encoding::encoding marty_cpp::marty_cpp sfmt::sfmt umba::umba)
# set(PUGIXML_LIB pugixml::pugixml marty_pugixml::marty_pugixml)
# set(JSON_YAML_LIB nlohmann_json::nlohmann_json yaml-cpp::yaml-cpp)


file(GLOB_RECURSE sources   "${SRC_ROOT}/*.cpp")
file(GLOB_RECURSE headers   "${SRC_ROOT}/*.h")
file(GLOB_RECURSE resources "${SRC_ROOT}/*.rc")
umba_make_sources_tree("${SRC_ROOT}" "${sources}" "${headers}" "${resources}")


set(PLATFORM_LIBS)
if(WIN32) # Всё нормально, это про таргет
    list(APPEND PLATFORM_LIBS ws2_32 iphlpapi shell32)
endif()


set(COMMON_UMBA_OPTIONS "BIGOBJ" "UTF8" "PEDANTIC" "WERR") # "PEDANTIC"/"WALL" "WERR"


set(TARGET umba-template)
add_executable(${TARGET} "${SRC_ROOT}/umba-template/umba-template.cpp" "${headers}")
umba_add_target_options(${TARGET} ${COMMON_UMBA_OPTIONS} "CONSOLE") 
target_link_libraries(${TARGET} PRIVATE "${PLATFORM_LIBS}" "${COMMON_LIBS}")

