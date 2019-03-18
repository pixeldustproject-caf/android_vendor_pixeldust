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

# DL Audio
PRODUCT_PROPERTY_OVERRIDES += \
    aaudio.dl_scheduler=true

# Tuning props
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1 \
    ro.actionable_compatible_property.enabled=false \
    ro.com.android.prov_mobiledata=false \
    debug.performance.tuning=1

# SystemUITests
EXCLUDE_SYSTEMUI_TESTS := true

# init.d support
PRODUCT_COPY_FILES += \
    vendor/pixeldust/prebuilt/common/bin/sysinit:system/bin/sysinit

# Copy all init rc files
$(foreach f,$(wildcard vendor/pixeldust/prebuilt/common/etc/init/*.rc),\
	$(eval PRODUCT_COPY_FILES += $(f):system/etc/init/$(notdir $f)))

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/pixeldust/prebuilt/common/lib/content-types.properties:system/lib/content-types.properties
