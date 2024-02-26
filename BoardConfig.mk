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

# Partitions
BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 9122611200 # (BOARD_SUPER_PARTITION_SIZE - 4MB overhead)

# Powershare
TARGET_POWERSHARE_NODE := /sys/class/qcom-battery/reverse_chg_mode

# Screen density
TARGET_SCREEN_DENSITY := 440

# Sensors
SOONG_CONFIG_NAMESPACES += SENSORS_XIAOMI
SOONG_CONFIG_SENSORS_XIAOMI += USES_UDFPS_SENSOR
SOONG_CONFIG_SENSORS_XIAOMI_USES_UDFPS_SENSOR := true

# Sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor