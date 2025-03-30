#
# Copyright (C) 2021 The Android Open Source Project
#           (C) 2022-2024 Paranoid Android
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/cupid

# Inherit from sm8450-common
include device/xiaomi/sm8450-common/BoardConfigCommon.mk

# Bootloader
TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/configs/board/board-info.txt
TARGET_BOOTLOADER_BOARD_NAME := taro

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_cupid
TARGET_RECOVERY_DEVICE_MODULES := libinit_cupid

# OTA
TARGET_OTA_ASSERT_DEVICE := cupid|22011223G

# Screen density
TARGET_SCREEN_DENSITY := 440

# Vibrator
$(call soong_config_set, XIAOMI_VIBRATOR, USE_EFFECT_STREAM, true)
