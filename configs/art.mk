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

# Don't build debug for host or device
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true
ART_BUILD_TARGET_NDEBUG := true
ART_BUILD_TARGET_DEBUG := false
ART_BUILD_HOST_NDEBUG := true
ART_BUILD_HOST_DEBUG := false

# Dex pre-opt
WITH_DEXPREOPT := true
WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := false

# Preopt apks like GMS chimara modules
PRODUCT_ALWAYS_PREOPT_EXTRACTED_APK := true

# Create profile for boot image
# Outputs to /system/etc/boot-image.prof
PRODUCT_USE_PROFILE_FOR_BOOT_IMAGE := true

# Speed apps
PRODUCT_DEXPREOPT_SPEED_APPS += \
  GoogleCamera \
  NexusLauncherPrebuilt \
  SystemUI \
  Settings

# Dex pre-opt profiles
PRODUCT_DEX_PREOPT_DEFAULT_COMPILER_FILTER := speed-profile 
PRODUCT_DEX_PREOPT_DEFAULT_COMPILER_FILTER := speed-profile

# Boot options
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    pm.dexopt.first-boot=quicken \
    pm.dexopt.boot=verify

# Filters
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    pm.dexopt.install=speed-profile \
    pm.dexopt.bg-dexopt=speed-profile \
    pm.dexopt.ab-ota=speed-profile \
    pm.dexopt.inactive=verify \
    pm.dexopt.shared=speed

