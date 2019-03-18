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

# Use the default language for output
export LC_ALL=C

# Set default Java File Encoding to UTF-8
export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8

# Include overlays
DEVICE_PACKAGE_OVERLAYS += vendor/pixeldust/overlay/common

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/pixeldust/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/pixeldust/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/pixeldust/prebuilt/common/bin/50-pixeldust.sh:system/addon.d/50-pixeldust.sh \
    vendor/pixeldust/prebuilt/common/bin/blacklist:system/addon.d/blacklist

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/pixeldust/prebuilt/common/bin/backuptool_ab.sh:system/bin/backuptool_ab.sh \
    vendor/pixeldust/prebuilt/common/bin/backuptool_ab.functions:system/bin/backuptool_ab.functions \
    vendor/pixeldust/prebuilt/common/bin/backuptool_postinstall.sh:system/bin/backuptool_postinstall.sh
endif

# Extra tools
PRODUCT_PACKAGES += \
    7z \
    awk \
    bash \
    bzip2 \
    curl \
    htop \
    lib7z \
    libsepol \
    pigz \
    powertop \
    unrar \
    unzip \
    vim \
    wget \
    zip

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# Filesystems tools
PRODUCT_PACKAGES += \
    fsck.exfat \
    fsck.ntfs \
    mke2fs \
    mkfs.exfat \
    mkfs.ntfs \
    mount.ntfs

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# rsync
PRODUCT_PACKAGES += \
    rsync

# Storage manager
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.storage_manager.enabled=true

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

# These packages are excluded from user builds
PRODUCT_PACKAGES_DEBUG += \
    micro_bench \
    procmem \
    procrank \
    strace

-include $(WORKSPACE)/build_env/image-auto-bits.mk
