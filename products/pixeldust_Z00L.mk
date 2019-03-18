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

# Inherit AOSP device configuration for marlin.
$(call inherit-product, device/asus/Z00L/aosp_Z00L.mk)

# Include common PixelDust stuff
include vendor/pixeldust/configs/pixeldust_phone.mk

# Setup device specific product configuration.
PRODUCT_NAME := pixeldust_Z00L
PRODUCT_BRAND := asus
PRODUCT_DEVICE := Z00L
PRODUCT_MODEL := Zenfone_2_Laser
PRODUCT_MANUFACTURER := Asus

PRODUCT_PROPERTY_OVERRIDES += \
    ro.pixeldust.maintainer="mg712702"

# Use SDCLANG
TARGET_USE_SDCLANG := false
