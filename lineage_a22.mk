#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from device makefile.
$(call inherit-product, device/samsung/a22/device.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_a22
PRODUCT_DEVICE := a22
PRODUCT_MANUFACTURER := samsung
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-A225F
PRODUCT_SHIPPING_API_LEVEL := 30

PRODUCT_GMS_CLIENTID_BASE := android-samsung-ss

PRODUCT_BUILD_DESCRIPTION := a22nsxx-user 13 TP1A.220624.014 A225FXXSBDYE1 release-keys

PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.device=a22

BUILD_FINGERPRINT := samsung/a22nsxx/a22:13/TP1A.220624.014/A225FXXSBDYE1:user/release-keys

