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

include vendor/pixeldust/configs/aosp_fixes.mk
include vendor/pixeldust/configs/art.mk
include vendor/pixeldust/configs/bootanimation.mk
include vendor/pixeldust/configs/pixeldust_main.mk
include vendor/pixeldust/configs/pixeldust_optimizations.mk
include vendor/pixeldust/configs/system_additions.mk
include vendor/pixeldust/configs/version.mk

# World APN list
PRODUCT_PACKAGES += \
    apns-conf.xml

# Telephony packages
PRODUCT_PACKAGES += \
    Stk \
    messaging \
    CellBroadcastReceiver

# CAF Telephony packages
PRODUCT_PACKAGES += \
    ims-ext-common \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# Enable tethering
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.dun.override=0

# Enable WiFi display
PRODUCT_PROPERTY_OVERRIDES += \
    persist.debug.wfd.enable=1 \
    persist.sys.wfd.virtual=0

# Sensitive Phone Numbers list
PRODUCT_COPY_FILES += \
    vendor/pixeldust/prebuilt/common/etc/sensitive_pn.xml:system/etc/sensitive_pn.xml
