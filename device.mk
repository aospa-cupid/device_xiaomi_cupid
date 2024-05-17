# Copyright (C) 2024 Paranoid Android
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Inherit from sm8450-common
$(call inherit-product, device/xiaomi/sm8450-common/common.mk)

# Call the proprietary setup
$(call inherit-product, vendor/xiaomi/cupid/cupid-vendor.mk)

# Camera
PRODUCT_SYSTEM_PROPERTIES += \
    ro.product.mod_device=cupid_global

# Display - timers
PRODUCT_ODM_PROPERTIES += \
    ro.surface_flinger.set_idle_timer_ms?=1000 \
    ro.surface_flinger.set_touch_timer_ms?=200

# Display - DC Dimming
PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.display.dc_dimming_supported=true

# Graphics
PRODUCT_VENDOR_PROPERTIES += \
    ro.gfx.driver.1=com.qualcomm.qti.gpudrivers.taro.api31

# Kernel
KERNEL_PREBUILT_DIR := $(LOCAL_PATH)-kernel

# Overlays
PRODUCT_PACKAGES += \
    AOSPACupidFrameworksOverlay \
    CupidFrameworksOverlay \
    CupidNfcOverlay \
    CupidSettingsOverlay \
    CupidSettingsProviderOverlay \
    CupidSystemUIOverlay \
    CupidWifiOverlay \
    CupidWifiMainlineOverlay

# NFC
TARGET_NFC_SKU := cupid

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    persist.nfc.camera.pause_polling=true

# Powershare
PRODUCT_PACKAGES += \
    vendor.aospa.powershare-service

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.cupid.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.cupid.rc

# Sensors
PRODUCT_PACKAGES += \
    sensors.xiaomi

PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.audio.us.proximity=true \
    ro.vendor.audio.us.proximity_waitfornegative_feature=true \
    vendor.audio.ultrasound.stoplatency=60 \
    vendor.audio.ultrasound.usync=1000

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
