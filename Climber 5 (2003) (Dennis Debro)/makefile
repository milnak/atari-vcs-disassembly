#
# Makefile for Climber5
#

PROJ			:= climber5
INCLUDES		:= ./includes
ASM			:= dasm
SOURCE_DIR		:= ./source
RELEASE_BUILD_DIR	:= ./build/release
DEBUG_BUILD_DIR		:= ./build/debug
BUILD_NAME		:= $(PROJ)

#
# --- Defines ---
#
TRUE			:= 1
FALSE			:= 0

#
# --- Compile Region Variables ---
#
NTSC			:= 0
PAL50			:= 1
PAL60			:= 2

#
# --- Build Defines ---
#
ASMEXT			:= asm
LSTEXT			:= lst
BUILDEXT		:= bin

# --- Tool settings ---
ASMFLAGS		:= -f3 -v3 -I$(INCLUDES)

# --- Build Steps ---
build_ntsc: release_build region_ntsc buildproj
build_pal50: release_build region_pal50 buildproj
build_pal60: release_build region_pal60 buildproj

build_cheat_ntsc: debug_build region_ntsc buildproj
build_cheat_pal50: debug_build region_pal50 buildproj
build_cheat_pal60: debug_build region_pal60 buildproj

buildproj:
	$(ASM) $(SOURCE_DIR)/$(PROJ).$(ASMEXT) \
		$(ASMFLAGS) \
		-DCOMPILE_REGION=$(COMPILE_REGION) \
		-DCHEAT_ENABLE=$(CHEAT_ENABLED) \
		-l$(BUILD_DIR)/$(BUILD_NAME).$(LSTEXT) \
		-o$(BUILD_DIR)/$(BUILD_NAME).$(BUILDEXT)

#
# --- Publisher Configuration ---
#
release_build: | $(RELEASE_BUILD_DIR)
	$(eval BUILD_DIR := $(RELEASE_BUILD_DIR))
	$(eval CHEAT_ENABLED := $(FALSE))

debug_build: | $(DEBUG_BUILD_DIR)
	$(eval BUILD_DIR := $(DEBUG_BUILD_DIR))
	$(eval CHEAT_ENABLED := $(TRUE))

#
# --- Region Configuration ---
#
region_ntsc:
	$(eval COMPILE_REGION := $(NTSC))
	$(eval BUILD_NAME := $(BUILD_NAME)_ntsc)
region_pal50:
	$(eval COMPILE_REGION := $(PAL50))
	$(eval BUILD_NAME := $(BUILD_NAME)_pal50)
region_pal60:
	$(eval COMPILE_REGION := $(PAL60))
	$(eval BUILD_NAME := $(BUILD_NAME)_pal60)

$(RELEASE_BUILD_DIR):
	mkdir -p $(RELEASE_BUILD_DIR)
$(DEBUG_BUILD_DIR):
	mkdir -p $(DEBUG_BUILD_DIR)
