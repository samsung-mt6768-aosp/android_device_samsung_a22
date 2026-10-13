#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit common tree
include device/samsung/mt6768-common/BoardConfigCommon.mk

DEVICE_PATH := device/samsung/a22

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Bootanimation
TARGET_BOOT_ANIMATION_RES := 720
TARGET_SCREEN_HEIGHT := 1600
TARGET_SCREEN_WIDTH := 720
TARGET_RECOVERY_DENSITY := xhdpi

# Inherit the proprietary files
include vendor/samsung/a22/BoardConfigVendor.mk
