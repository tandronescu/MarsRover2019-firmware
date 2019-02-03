# This file was automagically generated by mbed.org. For more information, 
# see http://mbed.org/handbook/Exporting-to-GCC-ARM-Embedded

BUILD_PATH   := build
APP_OUT_PATH := ../$(BUILD_PATH)/$(APP)
APP_PATH     := ../app/$(APP)
LIB_PATH     := ../lib
CONFIG_PATH  := ../config

###############################################################################

# Cross-platform directory manipulation
ifeq ($(shell echo $$OS),$$OS)
    MAKE_DIR = if not exist "$(1)" mkdir "$(1)"
    RM_DIR = rmdir /S /Q "$(1)"
    RM_FILE_TYPE = del /S /Q "$(1)" "$(2)"

else
    MAKE_DIR = '$(SHELL)' -c "mkdir -p \"$(1)\""
    RM_DIR = '$(SHELL)' -c "rm -rfv \"$(1)\""
    RM_FILE_TYPE = '$(SHELL)' -c "find $(1) -name \"$(2)\" -delete -print"
endif

# Move to the build directory
ifeq (,$(filter $(BUILD_PATH),$(notdir $(CURDIR))))
.SUFFIXES:
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
MAKETARGET = '$(MAKE)' --no-print-directory -C $(BUILD_PATH) -f '$(mkfile_path)' \
		'SRCDIR=$(CURDIR)' $(MAKECMDGOALS)
.PHONY: $(BUILD_PATH) clean
all:
ifeq ($(APP),)
	$(error APP is not set. Select an app to build with APP=app_name $(APP))
endif
	+@$(call MAKE_DIR,$(BUILD_PATH)/$(APP))
	+@$(MAKETARGET)
$(BUILD_PATH): all
Makefile : ;
% :: $(BUILD_PATH) ; :
makefile : ;
% :: $(BUILD_PATH) ; :
clean :
	$(call RM_DIR,$(BUILD_PATH))
	$(call RM_FILE_TYPE,app,*.o)
	$(call RM_FILE_TYPE,app,*.d)
clean-lib: 
	$(call RM_FILE_TYPE,lib/can,*.d)
	$(call RM_FILE_TYPE,lib/can,*.o)
	$(call RM_FILE_TYPE,lib/encoder,*.d)
	$(call RM_FILE_TYPE,lib/encoder,*.o)

else

# Trick rules into thinking we are in the root, when we are in the bulid dir
VPATH = ..

# Boiler-plate
###############################################################################
# Project settings

PROJECT := $(APP)

# Project settings
###############################################################################
# Objects and Paths

APP_SRC_C = $(wildcard $(APP_PATH)/src/*.c)
LIB_SRC_C = $(wildcard $(LIB_PATH)/*/src/*.c)

APP_SRC_CPP = $(wildcard $(APP_PATH)/src/*.cpp)
LIB_SRC_CPP = $(wildcard $(LIB_PATH)/*/src/*.cpp)

APP_INC = -I$(APP_PATH)/inc
LIB_INC = $(addprefix -I,$(wildcard $(LIB_PATH)/*/inc))

SRC_FILES_C   = $(APP_SRC_C)   $(LIB_SRC_C)
SRC_FILES_CPP = $(APP_SRC_CPP) $(LIB_SRC_CPP)

OBJECTS += $(SRC_FILES_C:.c=.o) $(SRC_FILES_CPP:.cpp=.o)

MBED_OBJECTS += $(wildcard $(LIB_PATH)/mbed/TARGET_NUCLEO_F091RC/TOOLCHAIN_GCC_ARM/*.o)

MBED_INC += -I$(LIB_PATH)/mbed
MBED_INC += -I$(LIB_PATH)/mbed/TARGET_NUCLEO_F091RC
MBED_INC += -I$(LIB_PATH)/mbed/TARGET_NUCLEO_F091RC/TARGET_STM
MBED_INC += -I$(LIB_PATH)/mbed/TARGET_NUCLEO_F091RC/TARGET_STM/TARGET_STM32F0
MBED_INC += -I$(LIB_PATH)/mbed/TARGET_NUCLEO_F091RC/TARGET_STM/TARGET_STM32F0/TARGET_NUCLEO_F091RC
MBED_INC += -I$(LIB_PATH)/mbed/TARGET_NUCLEO_F091RC/TARGET_STM/TARGET_STM32F0/TARGET_NUCLEO_F091RC/device
MBED_INC += -I$(LIB_PATH)/mbed/TARGET_NUCLEO_F091RC/TARGET_STM/TARGET_STM32F0/device
MBED_INC += -I$(LIB_PATH)/mbed/drivers
MBED_INC += -I$(LIB_PATH)/mbed/hal
MBED_INC += -I$(LIB_PATH)/mbed/platform

INCLUDE_PATHS += -I$(CONFIG_PATH)/.
INCLUDE_PATHS += -I$(LIB_PATH)/.
INCLUDE_PATHS += $(LIB_INC) $(MBED_INC)

LIBRARY_PATHS := -L$(LIB_PATH)/mbed/TARGET_NUCLEO_F091RC/TOOLCHAIN_GCC_ARM 
LIBRARIES := -lmbed 
LINKER_SCRIPT ?= $(LIB_PATH)/mbed/TARGET_NUCLEO_F091RC/TOOLCHAIN_GCC_ARM/STM32F091XC.ld

# Objects and Paths
###############################################################################
# Tools and Flags

AS      = arm-none-eabi-gcc
CC      = arm-none-eabi-gcc
CPP     = arm-none-eabi-g++
LD      = arm-none-eabi-gcc
ELF2BIN = arm-none-eabi-objcopy
PREPROC = arm-none-eabi-cpp -E -P -Wl,--gc-sections -Wl,--wrap,main -Wl,--wrap,_malloc_r -Wl,--wrap,_free_r -Wl,--wrap,_realloc_r -Wl,--wrap,_memalign_r -Wl,--wrap,_calloc_r -Wl,--wrap,exit -Wl,--wrap,atexit -Wl,-n -mcpu=cortex-m0 -mthumb

COMMON_FLAGS += -include
COMMON_FLAGS += ../$(CONFIG_PATH)/mbed_config.h
COMMON_FLAGS += -c
COMMON_FLAGS += -Wall
COMMON_FLAGS += -Wextra
COMMON_FLAGS += -Wno-unused-parameter
COMMON_FLAGS += -Wno-missing-field-initializers
COMMON_FLAGS += -fmessage-length=0
COMMON_FLAGS += -fno-exceptions
COMMON_FLAGS += -fno-builtin
COMMON_FLAGS += -ffunction-sections
COMMON_FLAGS += -fdata-sections
COMMON_FLAGS += -funsigned-char
COMMON_FLAGS += -MMD
COMMON_FLAGS += -fno-delete-null-pointer-checks
COMMON_FLAGS += -fomit-frame-pointer
COMMON_FLAGS += -Os
COMMON_FLAGS += -g1
COMMON_FLAGS += -mcpu=cortex-m0
COMMON_FLAGS += -mthumb

C_FLAGS += -std=gnu99
C_FLAGS += -DROVERBOARD_COMMON_PINMAP
C_FLAGS += -D__CORTEX_M0
C_FLAGS += -DMBED_BUILD_TIMESTAMP=1548889013.95
C_FLAGS += -DCMSIS_VECTAB_VIRTUAL
C_FLAGS += -D__MBED__=1
C_FLAGS += -DDEVICE_I2CSLAVE=1
C_FLAGS += -DTARGET_LIKE_MBED
C_FLAGS += -DDEVICE_PORTOUT=1
C_FLAGS += -DDEVICE_PORTINOUT=1
C_FLAGS += -D__MBED_CMSIS_RTOS_CM
C_FLAGS += -DTARGET_STM32F0
C_FLAGS += -DDEVICE_RTC=1
C_FLAGS += -DDEVICE_SERIAL_ASYNCH=1
C_FLAGS += -D__CMSIS_RTOS
C_FLAGS += -DTOOLCHAIN_GCC
C_FLAGS += -DDEVICE_CAN=1
C_FLAGS += -DTARGET_CORTEX_M
C_FLAGS += -DDEVICE_I2C_ASYNCH=1
C_FLAGS += -DARM_MATH_CM0
C_FLAGS += -DDEVICE_ANALOGOUT=1
C_FLAGS += -DTARGET_M0
C_FLAGS += -DTARGET_NUCLEO_F091RC
C_FLAGS += -DDEVICE_SPI_ASYNCH=1
C_FLAGS += -DDEVICE_LPTICKER=1
C_FLAGS += -DDEVICE_PWMOUT=1
C_FLAGS += -DDEVICE_INTERRUPTIN=1
C_FLAGS += -DTARGET_CORTEX
C_FLAGS += -DDEVICE_I2C=1
C_FLAGS += -DTRANSACTION_QUEUE_SIZE_SPI=2
C_FLAGS += -DDEVICE_STDIO_MESSAGES=1
C_FLAGS += -DTARGET_FF_MORPHO
C_FLAGS += -DTARGET_FAMILY_STM32
C_FLAGS += -DTARGET_FF_ARDUINO
C_FLAGS += -DTARGET_RELEASE
C_FLAGS += -DTARGET_STM
C_FLAGS += -DDEVICE_SERIAL_FC=1
C_FLAGS += -DDEVICE_USTICKER=1
C_FLAGS += -DDEVICE_PORTIN=1
C_FLAGS += -DDEVICE_SLEEP=1
C_FLAGS += -DTOOLCHAIN_GCC_ARM
C_FLAGS += -DDEVICE_CRC=1
C_FLAGS += -DDEVICE_SPI=1
C_FLAGS += -DCMSIS_VECTAB_VIRTUAL_HEADER_FILE=\"cmsis_nvic.h\"
C_FLAGS += -DDEVICE_SPISLAVE=1
C_FLAGS += -DDEVICE_ANALOGIN=1
C_FLAGS += -DDEVICE_SERIAL=1
C_FLAGS += -DTARGET_STM32F091RC
C_FLAGS += -DDEVICE_FLASH=1
C_FLAGS += -DTARGET_LIKE_CORTEX_M0
C_FLAGS += $(COMMON_FLAGS)

CXX_FLAGS += -std=gnu++98
CXX_FLAGS += -fno-rtti
CXX_FLAGS += -Wvla
CXX_FLAGS += -DROVERBOARD_COMMON_PINMAP
CXX_FLAGS += -D__CORTEX_M0
CXX_FLAGS += -DMBED_BUILD_TIMESTAMP=1548889013.95
CXX_FLAGS += -DCMSIS_VECTAB_VIRTUAL
CXX_FLAGS += -D__MBED__=1
CXX_FLAGS += -DDEVICE_I2CSLAVE=1
CXX_FLAGS += -DTARGET_LIKE_MBED
CXX_FLAGS += -DDEVICE_PORTOUT=1
CXX_FLAGS += -DDEVICE_PORTINOUT=1
CXX_FLAGS += -D__MBED_CMSIS_RTOS_CM
CXX_FLAGS += -DTARGET_STM32F0
CXX_FLAGS += -DDEVICE_RTC=1
CXX_FLAGS += -DDEVICE_SERIAL_ASYNCH=1
CXX_FLAGS += -D__CMSIS_RTOS
CXX_FLAGS += -DTOOLCHAIN_GCC
CXX_FLAGS += -DDEVICE_CAN=1
CXX_FLAGS += -DTARGET_CORTEX_M
CXX_FLAGS += -DDEVICE_I2C_ASYNCH=1
CXX_FLAGS += -DARM_MATH_CM0
CXX_FLAGS += -DDEVICE_ANALOGOUT=1
CXX_FLAGS += -DTARGET_M0
CXX_FLAGS += -DTARGET_NUCLEO_F091RC
CXX_FLAGS += -DDEVICE_SPI_ASYNCH=1
CXX_FLAGS += -DDEVICE_LPTICKER=1
CXX_FLAGS += -DDEVICE_PWMOUT=1
CXX_FLAGS += -DDEVICE_INTERRUPTIN=1
CXX_FLAGS += -DTARGET_CORTEX
CXX_FLAGS += -DDEVICE_I2C=1
CXX_FLAGS += -DTRANSACTION_QUEUE_SIZE_SPI=2
CXX_FLAGS += -DDEVICE_STDIO_MESSAGES=1
CXX_FLAGS += -DTARGET_FF_MORPHO
CXX_FLAGS += -DTARGET_FAMILY_STM32
CXX_FLAGS += -DTARGET_FF_ARDUINO
CXX_FLAGS += -DTARGET_RELEASE
CXX_FLAGS += -DTARGET_STM
CXX_FLAGS += -DDEVICE_SERIAL_FC=1
CXX_FLAGS += -DDEVICE_USTICKER=1
CXX_FLAGS += -DDEVICE_PORTIN=1
CXX_FLAGS += -DDEVICE_SLEEP=1
CXX_FLAGS += -DTOOLCHAIN_GCC_ARM
CXX_FLAGS += -DDEVICE_CRC=1
CXX_FLAGS += -DDEVICE_SPI=1
CXX_FLAGS += -DCMSIS_VECTAB_VIRTUAL_HEADER_FILE=\"cmsis_nvic.h\"
CXX_FLAGS += -DDEVICE_SPISLAVE=1
CXX_FLAGS += -DDEVICE_ANALOGIN=1
CXX_FLAGS += -DDEVICE_SERIAL=1
CXX_FLAGS += -DTARGET_STM32F091RC
CXX_FLAGS += -DDEVICE_FLASH=1
CXX_FLAGS += -DTARGET_LIKE_CORTEX_M0
CXX_FLAGS += -std=gnu++98
CXX_FLAGS += -fno-rtti
CXX_FLAGS += -Wvla
CXX_FLAGS += $(COMMON_FLAGS)

ASM_FLAGS += -x
ASM_FLAGS += assembler-with-cpp
ASM_FLAGS += -D__CORTEX_M0
ASM_FLAGS += -DTRANSACTION_QUEUE_SIZE_SPI=2
ASM_FLAGS += -DCMSIS_VECTAB_VIRTUAL
ASM_FLAGS += -DARM_MATH_CM0
ASM_FLAGS += -D__MBED_CMSIS_RTOS_CM
ASM_FLAGS += -DCMSIS_VECTAB_VIRTUAL_HEADER_FILE="cmsis_nvic.h"
ASM_FLAGS += -D__CMSIS_RTOS
ASM_FLAGS += INCLUDE_PATHS
ASM_FLAGS += $(COMMON_FLAGS)


LD_FLAGS := -Wl,--gc-sections -Wl,--wrap,main -Wl,--wrap,_malloc_r -Wl,--wrap,_free_r -Wl,--wrap,_realloc_r -Wl,--wrap,_memalign_r -Wl,--wrap,_calloc_r -Wl,--wrap,exit -Wl,--wrap,atexit -Wl,-n -mcpu=cortex-m0 -mthumb 
LD_SYS_LIBS := -Wl,--start-group -lstdc++ -lsupc++ -lm -lc -lgcc -lnosys -lmbed -Wl,--end-group

# Tools and Flags
###############################################################################
# Rules

.PHONY: all lst size


all: $(APP_OUT_PATH)/$(PROJECT).bin $(APP_OUT_PATH)/$(PROJECT).hex size


.s.o:
	+@$(call MAKE_DIR,$(dir $@))
	+@echo "Assemble: $(notdir $<)"
	@$(AS) -c $(ASM_FLAGS) -o $@ $<

.S.o:
	+@$(call MAKE_DIR,$(dir $@))
	+@echo "Assemble: $(notdir $<)"
	@$(AS) -c $(ASM_FLAGS) -o $@ $<

.c.o:
	+@$(call MAKE_DIR,$(dir $@))
	+@echo "Compile: $(notdir $<)"
	@$(CC) $(C_FLAGS) $(INCLUDE_PATHS) -o $@ $<

.cpp.o:
	+@$(call MAKE_DIR,$(dir $@))
	+@echo "Compile: $(notdir $<)"
	@$(CPP) $(CXX_FLAGS) $(INCLUDE_PATHS) -o $@ $<


$(APP_OUT_PATH)/$(PROJECT).link_script.ld: $(LINKER_SCRIPT)
	@$(PREPROC) $< -o $@



$(APP_OUT_PATH)/$(PROJECT).elf: $(OBJECTS) $(MBED_OBJECTS) $(APP_OUT_PATH)/$(PROJECT).link_script.ld 
	+@echo "link: $(notdir $@)"
	@$(LD) $(LD_FLAGS) -T $(filter-out %.o, $^) $(LIBRARY_PATHS) --output $@ $(filter %.o, $^) $(LIBRARIES) $(LD_SYS_LIBS)


$(APP_OUT_PATH)/$(PROJECT).bin: $(APP_OUT_PATH)/$(PROJECT).elf
	$(ELF2BIN) -O binary $< $@
	+@echo "===== bin file ready to flash: $(BUILD_PATH)/$@ =====" 

$(APP_OUT_PATH)/$(PROJECT).hex: $(APP_OUT_PATH)/$(PROJECT).elf
	$(ELF2BIN) -O ihex $< $@


# Rules
###############################################################################
# Dependencies

DEPS = $(OBJECTS:.o=.d) $(MBED_OBJECTS:.o=.d)
-include $(DEPS)
endif
