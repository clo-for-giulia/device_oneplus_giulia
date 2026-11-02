#
# Copyright (C) 2021-2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

BUILD_BROKEN_VENDOR_PROPERTY_NAMESPACE := true

# Partitions
BOARD_SUPER_PARTITION_SIZE := 14266433536

# Include the common OEM chipset BoardConfig.
include device/oneplus/sm8650-common/BoardConfigCommon.mk

DEVICE_PATH := device/oneplus/giulia

# Assert
TARGET_OTA_ASSERT_DEVICE := OP5D3BL1

# Display
TARGET_SCREEN_DENSITY := 520

# Kernel
KERNEL_LTO := thin
TARGET_KERNEL_ADDITIONAL_FLAGS += \
    CONFIG_GIULIA_DTB=y \
    CONFIG_GIULIAC_DTB=y \
    KCFLAGS="-mtune=cortex-a720 -mllvm -inline-threshold=350" \
    KLDFLAGS="-mllvm -polly -mllvm -polly-ast-use-context -mllvm -polly-invariant-load-hoisting -mllvm -polly-loopfusion-greedy -mllvm -polly-run-inliner -mllvm -polly-run-dce -mllvm -inline-threshold=350"

# Power
TARGET_POWERHAL_MODE_EXT := $(DEVICE_PATH)/power/power-mode.cpp

# Properties
TARGET_ODM_PROP += $(DEVICE_PATH)/properties/odm.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/properties/system_ext.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/properties/vendor.prop
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/properties/system.prop

# SEPolicy
include hardware/oplus/sepolicy/common/SEPolicy.mk
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/private

# Recovery
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 103

# Include the proprietary files BoardConfig.
include vendor/oneplus/giulia/BoardConfigVendor.mk
