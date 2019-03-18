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
PRODUCT_RELEASE_NAME := Pixel2XL
export TARGET_DEVICE := taimen

# Boot animation
TARGET_SCREEN_HEIGHT := 2880
TARGET_SCREEN_WIDTH := 1440

# Include common PixelDust stuff
include vendor/pixeldust/configs/pixeldust_phone.mk

# Include optional stuff (e.g. prebuilt apps)
include vendor/pixeldust/configs/system_optional.mk

# Include pixel ambient sense (Now playing)
include vendor/pixeldust/configs/ambientsense.mk

# Google Apps
$(call inherit-product, vendor/googleapps/googleapps.mk)

# Inherit device configuration
$(call inherit-product, device/google/taimen/aosp_taimen.mk)

# Inherit vendor configuration
$(call inherit-product-if-exists, vendor/google/taimen/taimen-vendor.mk)

# Device identifier. This must come after all inclusions
PRODUCT_NAME := pixeldust_taimen
PRODUCT_DEVICE := taimen
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 2 XL
TARGET_MANUFACTURER := LGE
PRODUCT_RESTRICT_VENDOR_FILES := false

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=taimen \
    BUILD_FINGERPRINT=google/taimen/taimen:9/PQ2A.190305.002/5240760:user/release-keys \
    PRIVATE_BUILD_DESC="taimen-user 9 PQ2A.190305.002 5240760 release-keys"

PRODUCT_PROPERTY_OVERRIDES += \
    ro.pixeldust.maintainer="nitin1438"

# Use SDCLANG
TARGET_USE_SDCLANG := false

# Google VR
PRODUCT_PACKAGES += \
    libdvr_loader \
    com.google.vr.platform \
    com.google.vr.platform.xml
