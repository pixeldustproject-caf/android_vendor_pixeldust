# Copyright (C) 2019 The Pixel Dust Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Release name
PRODUCT_RELEASE_NAME := PixelXL
export TARGET_DEVICE := marlin

# Inherit AOSP device configuration for marlin.
$(call inherit-product, device/google/marlin/aosp_marlin.mk)

# Include common PixelDust stuff
include vendor/pixeldust/config/pixeldust_phone.mk

# Include optional stuff (e.g. prebuilt apps)
include vendor/pixeldust/config/system_optional.mk

# Google Apps
$(call inherit-product, vendor/googleapps/googleapps.mk)

# Setup device specific product configuration.
PRODUCT_NAME := pixeldust_marlin
PRODUCT_BRAND := google
PRODUCT_DEVICE := marlin
PRODUCT_MODEL := Pixel XL
PRODUCT_MANUFACTURER := Google

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=marlin \
    PRIVATE_BUILD_DESC="marlin-user 9 PQ2A.190305.002 5240760 release-keys"

BUILD_FINGERPRINT="google/marlin/marlin:9/PQ2A.190305.002/5240760:user/release-keys"
BUILD_THUMBPRINT="9/PQ2A.190305.002/5240760:user/release-keys"

PRODUCT_PROPERTY_OVERRIDES += \
    ro.pixeldust.maintainer="spezi77"

# Copy device specific prebuilt files.
PRODUCT_COPY_FILES += \
    vendor/pixeldust/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml

# Use SDCLANG
TARGET_USE_SDCLANG := true

# Google VR
PRODUCT_PACKAGES += \
    libdvr_loader \
    com.google.vr.platform \
    com.google.vr.platform.xml

