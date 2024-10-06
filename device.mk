#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/tecno/LH8n

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    system_ext \
    vendor \
    vendor_dlkm \
    system \
    boot \
    vendor_boot \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    product \
    odm \
    odm_dlkm

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier \
    checkpoint_gc

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/mtk_plpath_utils \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=erofs \
    POSTINSTALL_OPTIONAL_vendor=true

# Bootctrl
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-mtkimpl \
    android.hardware.boot@1.2-mtkimpl.recovery

PRODUCT_PACKAGES_DEBUG += \
     bootctrl 

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# Drm
PRODUCT_PACKAGES += \
    android.hardware.drm@1.4

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@1.0 \
    android.hardware.health@2.0

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1

# Additional Libraries
TARGET_RECOVERY_DEVICE_MODULES += \
    libion \
    libxml2 \
    android.hardware.keymaster@4.1

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libxml2.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.keymaster@4.1

# Mtk plpath utils
PRODUCT_PACKAGES += \
    mtk_plpath_utils \
    mtk_plpath_utils.recovery

# Keystore2
PRODUCT_PACKAGES += \
    android.system.keystore2

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 31

# API
PRODUCT_SHIPPING_API_LEVEL := 34
