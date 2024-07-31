#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

# Include scripts from the bin directory
define include_bin_script
include $(CLEAR_VARS)
LOCAL_MODULE       := $(1)
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := bin/$(1).sh
LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR_EXECUTABLES)
include $(BUILD_PREBUILT)
endef

$(foreach script, \
    hardware_revisions \
    init.class_main \
    init.crda \
    init.gbmods \
    init.kernel.post_boot-blair \
    init.kernel.post_boot-holi \
    init.kernel.post_boot \
    init.mdm \
    init.mmi.block_perm \
    init.mmi.boot \
    init.mmi.mdlog-getlogs \
    init.mmi.modules \
    init.mmi.shutdown \
    init.mmi.touch \
    init.mmi.usb \
    init.mmi.wlan-getlogs \
    init.oem.fingerprint2 \
    init.oem.hw \
    init.qcom.class_core \
    init.qcom.coex \
    init.qcom.early_boot \
    init.qcom.efs.sync \
    init.qcom.post_boot \
    init.qcom.sdio \
    init.qcom.sensors \
    init.qcom \
    init.qcom.usb \
    init.qti.chg_policy \
    init.qti.display_boot \
    init.qti.early_init \
    init.qti.kernel.debug-blair \
    init.qti.kernel.debug-holi \
    init.qti.kernel.debug \
    init.qti.kernel \
    init.qti.media \
    init.qti.qcv, \
    $(eval $(call include_bin_script,$(script))) \
)

# Include rc files from the etc directory
define include_rc_file
include $(CLEAR_VARS)
LOCAL_MODULE       := $(1)
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := etc/$(1).rc
LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR_ETC)/init/hw
include $(BUILD_PREBUILT)
endef

# Use different path for recovery-specific .rc files
define include_recovery_rc_file
include $(CLEAR_VARS)
LOCAL_MODULE       := $(1)
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := etc/$(1).rc
LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)
endef

$(foreach rcfile, \
    init.mmi.charge_only \
    init.mmi.chipset \
    init.mmi.debug \
    init.mmi.diag_mdlog \
    init.mmi.diag \
    init.mmi.overlay \
    init.mmi \
    init.mmi.tcmd \
    init.mmi.usb \
    init.mmi.wlan \
    init.qcom.factory \
    init.qcom \
    init.qcom.usb \
    init.qti.kernel \
    init.target, \
    $(eval $(call include_rc_file,$(rcfile))) \
)

# Handle recovery-specific rc files
$(foreach recovery_rcfile, \
    init.recovery.qcom \
    init.recovery.usb, \
    $(eval $(call include_recovery_rc_file,$(recovery_rcfile))) \
)


# Specific handling for fstab files
include $(CLEAR_VARS)
LOCAL_MODULE       := fstab.qcom
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := etc/fstab.qcom
LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR_ETC)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := fstab.qcom_ramdisk
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := etc/fstab.qcom_ramdisk
LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR_ETC)
include $(BUILD_PREBUILT)

# Specific handling for ueventd file
include $(CLEAR_VARS)
LOCAL_MODULE       := ueventd.qcom.rc
LOCAL_MODULE_STEM  := ueventd.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := etc/ueventd.qcom.rc
LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR)
include $(BUILD_PREBUILT)

