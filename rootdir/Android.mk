LOCAL_PATH := $(call my-dir)

# Bin scripts
$(foreach f,$(wildcard $(LOCAL_PATH)/bin/*.sh),\
  $(eval include $(CLEAR_VARS))\
  $(eval LOCAL_MODULE       := $(notdir $(f)))\
  $(eval LOCAL_MODULE_TAGS  := optional)\
  $(eval LOCAL_MODULE_CLASS := ETC)\
  $(eval LOCAL_SRC_FILES    := bin/$(notdir $(f)))\
  $(eval LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR_EXECUTABLES))\
  $(eval include $(BUILD_PREBUILT))\
)

# Etc files (excluding special cases)
$(foreach f,$(filter-out init.recovery.qcom.rc ueventd.qcom.rc fstab.qcom fstab.qcom_ramdisk,$(notdir $(wildcard $(LOCAL_PATH)/etc/*.rc))),\
  $(eval include $(CLEAR_VARS))\
  $(eval LOCAL_MODULE       := $(f))\
  $(eval LOCAL_MODULE_TAGS  := optional)\
  $(eval LOCAL_MODULE_CLASS := ETC)\
  $(eval LOCAL_SRC_FILES    := etc/$(f))\
  $(eval LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR_ETC)/init/hw)\
  $(eval include $(BUILD_PREBUILT))\
)

# Special cases
include $(CLEAR_VARS)
LOCAL_MODULE       := init.recovery.qcom.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := etc/init.recovery.qcom.rc
LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := ueventd.qcom.rc
LOCAL_MODULE_STEM  := ueventd.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := etc/ueventd.qcom.rc
LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR_ETC)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := fstab.qcom
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := etc/fstab.qcom
LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR_ETC)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := fstab.qcom_ramdisk
LOCAL_MODULE_STEM  := fstab.qcom
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := etc/fstab.qcom_ramdisk
LOCAL_MODULE_PATH  := $(TARGET_RAMDISK_OUT)
include $(BUILD_PREBUILT)

