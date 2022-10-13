cmake_minimum_required(VERSION 3.20 FATAL_ERROR)

project(mpu_experiment)

# Use "sx" as a case-insensitive identifier for assembler-with-cpp.
# This is recognized by gcc.
set(CMAKE_ASM_SOURCE_FILE_EXTENSIONS s;sx)

enable_language(C ASM)
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_COMPILER arm-none-eabi-gcc)
set(CMAKE_ASM_COMPILER arm-none-eabi-gcc)

if(NOT DEFINED BOARD)
  message(FATAL_ERROR "Must define BOARD.")
endif()

if(NOT DEFINED APP)
  message(FATAL_ERROR "Must define APP.")
endif()

set(COMMON_FLAGS
  "$<$<CONFIG:DEBUG>:-g>"
  "$<$<CONFIG:DEBUG>:-O0>"
  -Wall
  -mcpu=cortex-m33
  -mthumb
  -mapcs
)

set(SOURCES
  src/apps/${APP}.c
)

if(BOARD STREQUAL "qemu-mps2-an505")
  set(SOURCES ${SOURCES}
    src/boards/${BOARD}/Source/GCC/startup_AN505.S
    src/boards/${BOARD}/Source/system_AN505.c
    src/drivers/uart_cmsdk_drv.c
    src/drivers/uart_simple_cmsdk.c
  )
endif()

add_executable(kernel.elf)

target_sources(kernel.elf PRIVATE ${SOURCES})

include_directories(
  src/boards/${BOARD}/Include
  vendor/CMSIS_5/CMSIS/Core/Include
  src/drivers
)

target_compile_options(kernel.elf PRIVATE
  ${COMMON_FLAGS}
  -ffunction-sections
  -fdata-sections
)

set(LINKER_SCRIPT ${CMAKE_SOURCE_DIR}/src/boards/${BOARD}/Source/GCC/gcc_arm.ld)

set_target_properties(kernel.elf PROPERTIES LINK_DEPENDS ${LINKER_SCRIPT})

target_link_options(kernel.elf PRIVATE
  ${COMMON_FLAGS}
  -T${LINKER_SCRIPT}
  -Wl,--gc-sections
  --specs=nano.specs
  --specs=nosys.specs
)
