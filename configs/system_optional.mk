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

# Build PixelDust Walls
PRODUCT_PACKAGES += \
    PixelDustWallpapers \
    Browser

# Copy hiddenapi whitelist
PRODUCT_COPY_FILES += \
    vendor/pixeldust/prebuilt/common/etc/sysconfig/pixeldust-hiddenapi-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/pixeldust-hiddenapi-whitelist.xml

# Additional goodies
PRODUCT_PACKAGES += \
    Browser
