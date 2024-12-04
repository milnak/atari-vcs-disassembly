#
# Makefile for Pacman4K
#

PROJ			    := pacman4K
INCLUDES		    := ./includes
ASM			  	    := dasm
SOURCE_DIR		    := ./source
SELF_BUILD_DIR		:= ./build/release/self
SELF_DEBUG_DIR		:= ./build/debug/self
ATARIAGE_BUILD_DIR	:= ./build/release/atariage
ATARIAGE_DEBUG_DIR	:= ./build/debug/atariage
BUILD_NAME		    := $(PROJ)

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
# --- Publisher Variables ---
#
ATARIAGE		:= 0
SELF			:= 1

#
# --- Build Defines ---
#
ASMEXT			:= asm
LSTEXT			:= lst
BUILDEXT		:= bin

# --- Tool settings ---
ASMFLAGS		:= -f3 -v3 -I$(INCLUDES)

# --- Build Steps ---
build_self_slow_ntsc: self_publisher slow_speed region_ntsc buildproj
build_self_slow_pal50: self_publisher slow_speed region_pal50 buildproj
build_self_slow_pal60: self_publisher slow_speed region_pal60 buildproj
build_self_fast_ntsc: self_publisher fast_speed region_ntsc buildproj
build_self_fast_pal50: self_publisher fast_speed region_pal50 buildproj
build_self_fast_pal60: self_publisher fast_speed region_pal60 buildproj
build_atariage_slow_ntsc: atariage_publisher slow_speed region_ntsc buildproj
build_atariage_slow_pal50: atariage_publisher slow_speed region_pal50 buildproj
build_atariage_slow_pal60: atariage_publisher slow_speed region_pal60 buildproj
build_atariage_fast_ntsc: atariage_publisher fast_speed region_ntsc buildproj
build_atariage_fast_pal50: atariage_publisher fast_speed region_pal50 buildproj
build_atariage_fast_pal60: atariage_publisher fast_speed region_pal60 buildproj

build_self_cheat_slow_ntsc: self_publisher_cheat slow_speed region_ntsc buildproj
build_self_cheat_slow_pal50: self_publisher_cheat slow_speed region_pal50 buildproj
build_self_cheat_slow_pal60: self_publisher_cheat slow_speed region_pal60 buildproj
build_self_cheat_fast_ntsc: self_publisher_cheat fast_speed region_ntsc buildproj
build_self_cheat_fast_pal50: self_publisher_cheat fast_speed region_pal50 buildproj
build_self_cheat_fast_pal60: self_publisher_cheat fast_speed region_pal60 buildproj
build_atariage_cheat_slow_ntsc: atariage_publisher_cheat slow_speed region_ntsc buildproj
build_atariage_cheat_slow_pal50: atariage_publisher_cheat slow_speed region_pal50 buildproj
build_atariage_cheat_slow_pal60: atariage_publisher_cheat slow_speed region_pal60 buildproj
build_atariage_cheat_fast_ntsc: atariage_publisher_cheat fast_speed region_ntsc buildproj
build_atariage_cheat_fast_pal50: atariage_publisher_cheat fast_speed region_pal50 buildproj
build_atariage_cheat_fast_pal60: atariage_publisher_cheat fast_speed region_pal60 buildproj

buildproj:
	$(ASM) $(SOURCE_DIR)/$(PROJ).$(ASMEXT) \
		$(ASMFLAGS) \
		-DCOMPILE_REGION=$(COMPILE_REGION) \
		-DPUBLISHER=$(PUBLISHER) \
		-DCHEAT_ENABLED=$(CHEAT_ENABLED) \
		-DFASTER_SPEED=$(SPEEDUP_ENABLED) \
		-l$(BUILD_DIR)/$(BUILD_NAME).$(LSTEXT) \
		-o$(BUILD_DIR)/$(BUILD_NAME).$(BUILDEXT)

#
# --- Publisher Configuration ---
#
self_publisher: | $(SELF_BUILD_DIR)
	$(eval PUBLISHER := $(SELF))
	$(eval BUILD_DIR := $(SELF_BUILD_DIR))
	$(eval CHEAT_ENABLED := $(FALSE))

atariage_publisher: | $(ATARIAGE_BUILD_DIR)
	$(eval PUBLISHER := $(ATARIAGE))
	$(eval BUILD_DIR := $(ATARIAGE_BUILD_DIR))
	$(eval CHEAT_ENABLED := $(FALSE))

self_publisher_cheat: | $(SELF_DEBUG_DIR)
	$(eval PUBLISHER := $(SELF))
	$(eval BUILD_DIR := $(SELF_DEBUG_DIR))
	$(eval CHEAT_ENABLED := $(TRUE))

atariage_publisher_cheat: | $(ATARIAGE_DEBUG_DIR)
	$(eval PUBLISHER := $(ATARIAGE))
	$(eval BUILD_DIR := $(ATARIAGE_DEBUG_DIR))
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
#
# --- Speed Configuration ---
#
fast_speed:
	$(eval SPEEDUP_ENABLED := $(TRUE))
	$(eval BUILD_NAME := $(BUILD_NAME)_fast)
slow_speed:
	$(eval SPEEDUP_ENABLED := $(FALSE))
	$(eval BUILD_NAME := $(BUILD_NAME)_slow)

$(SELF_BUILD_DIR):
	mkdir -p $(SELF_BUILD_DIR)
$(SELF_DEBUG_DIR):
	mkdir -p $(SELF_DEBUG_DIR)

$(ATARIAGE_BUILD_DIR):
	mkdir -p $(ATARIAGE_BUILD_DIR)
$(ATARIAGE_DEBUG_DIR):
	mkdir -p $(ATARIAGE_DEBUG_DIR)
