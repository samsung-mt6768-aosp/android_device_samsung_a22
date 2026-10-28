#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit common makefile
$(call inherit-product, device/samsung/mt6768-common/common.mk)

# Inherit 4gb dalvik vm
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

DEVICE_PATH := device/samsung/a22

# Configs
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/audio,$(TARGET_COPY_OUT_VENDOR)/etc) \
    $(LOCAL_PATH)/configs/nfc/libnfc-nxp_RF.conf:$(TARGET_COPY_OUT_VENDOR)/etc/nfc/libnfc-nxp_RF.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-nxp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf

PRODUCT_ENFORCE_RRO_TARGETS := *

PRODUCT_PACKAGES += \
    FrameworksResOverlayA22 \
    SettingsProviderOverlayA22 \
    SystemUIOverlayA22 \
    WifiOverlayA22

# Power
TARGET_TAP_TO_WAKE_NODE := /sys/touchpanel/double_tap
$(call soong_config_set,mediatek_power,double_tap_to_wake_node,$(TARGET_TAP_TO_WAKE_NODE))

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)

PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false

# AAPT Configuration for high-density assets
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi
TARGET_SCREEN_DENSITY := 300

# Inherit the proprietary files
$(call inherit-product, vendor/samsung/a22/a22-vendor.mk)
