cmake_minimum_required(VERSION 3.5)
project(prog)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Copy compile_commands.json to project root after build
file(GLOB SOURCES "src/*.cpp")

add_executable(${PROJECT_NAME} ${SOURCES})

target_include_directories(${PROJECT_NAME} PRIVATE include)

target_compile_options(${PROJECT_NAME} PRIVATE -pedantic-errors -Wall -Wextra -Wconversion -Wsign-conversion -Werror)

add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND python3 ${CMAKE_SOURCE_DIR}/fix_compile_commands.py 
        ${CMAKE_BINARY_DIR}/compile_commands.json 
        ${CMAKE_SOURCE_DIR}/compile_commands.json 
        ${CMAKE_SOURCE_DIR}
    COMMENT "Fixing compile_commands.json paths"
)
