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

# Add Pixel Dust ROM bootanimation based on device
ifneq ($(filter pixeldust_angler pixeldust_marlin pixeldust_sailfish pixeldust_taimen,$(TARGET_PRODUCT)),)
    PRODUCT_COPY_FILES += \
        vendor/pixeldust/prebuilt/common/bootanimation/1440x2560.zip:system/media/bootanimation.zip
endif
ifneq ($(filter pixeldust_bullhead pixeldust_mako pixeldust_Z00L pixeldust_mido,$(TARGET_PRODUCT)),)
    PRODUCT_COPY_FILES += \
        vendor/pixeldust/prebuilt/common/bootanimation/1080x1920.zip:system/media/bootanimation.zip
endif
ifneq ($(filter pixeldust_blueline,$(TARGET_PRODUCT)),)
    PRODUCT_COPY_FILES += \
        vendor/pixeldust/prebuilt/common/bootanimation/1440x2960.zip:system/media/bootanimation.zip
endif
