#
# Copyright (C) 2021 The Android Open Source Project
#           (C) 2022-2024 Paranoid Android
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm8450-common
$(call inherit-product, device/xiaomi/sm8450-common/common.mk)

# Camera
PRODUCT_SYSTEM_PROPERTIES += \
    ro.product.mod_device=cupid_global

# Characteristics
PRODUCT_CHARACTERISTICS := nosdcard

# Display - DC Dimming
PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.display.dc_dimming_supported=true

# Display - timers
PRODUCT_ODM_PROPERTIES += \
    ro.surface_flinger.set_idle_timer_ms=1000 \
    ro.surface_flinger.set_touch_timer_ms=200

# Fingerprint
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.fingerprint.type=udfps_optical \
    persist.vendor.fingerprint.sensor_location=540|2163|107 \
    persist.vendor.fingerprint.sensor_modules=goodix_fod

PRODUCT_PACKAGES += \
    vendor.xiaomi.hardware.fx.tunnel@1.0.vendor

# Init scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/bin/init.cupid.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.cupid.sh \
    $(LOCAL_PATH)/rootdir/etc/init.cupid.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.cupid.rc

# Kernel
KERNEL_PREBUILT_DIR := $(LOCAL_PATH)-kernel

# NFC
TARGET_NFC_SKU := cupid

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    persist.nfc.camera.pause_polling=true

# Namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Overlays
PRODUCT_PACKAGES += \
    AOSPACupidFrameworksOverlay \
    CupidApertureOverlay \
    CupidFrameworksOverlay \
    CupidSettingsProviderOverlay \
    CupidWifiOverlay \
    CupidWifiMainlineOverlay \
    CupidNfcOverlay \
    CupidSystemUIOverlay

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

# Shipping API
PRODUCT_SHIPPING_API_LEVEL := 33

# Vendor blobs
$(call inherit-product, vendor/xiaomi/cupid/cupid-vendor.mk)
