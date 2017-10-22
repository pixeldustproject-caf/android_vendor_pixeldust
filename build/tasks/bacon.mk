# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017 The LineageOS Project
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

PIXELDUST_TARGET_PACKAGE := $(PRODUCT_OUT)/$(PIXELDUST_VERSION).zip

.PHONY: bacon pixeldust
bacon: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(PIXELDUST_TARGET_PACKAGE)
	$(hide) $(MD5SUM) $(PIXELDUST_TARGET_PACKAGE) > $(PIXELDUST_TARGET_PACKAGE).md5sum
	$(hide) ./vendor/pixeldust/tools/pd.sh
	@echo ""
	@echo -e ${CL_CYN}"════════════════════════════════════════════════════════════════════════════════"${CL_RST}
	@echo -e ${CL_CYN}"Package zip: "${CL_MAG} $(PIXELDUST_TARGET_PACKAGE)                                 ${CL_RST}
	@echo -e ${CL_CYN}"Package md5: "${CL_MAG}" `cat $(PIXELDUST_TARGET_PACKAGE).md5sum | cut -d ' ' -f 1`"${CL_RST}
	@echo -e ${CL_CYN}"Package size:"${CL_MAG}" `du -h $(PIXELDUST_TARGET_PACKAGE) | cut -f 1`            "${CL_RST}
	@echo -e ${CL_CYN}"════════════════════════════════════════════════════════════════════════════════"${CL_RST}
