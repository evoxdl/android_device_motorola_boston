#
# Copyright (C) 2022 The LineageOS Project
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
#

DEVICE_PATH := device/motorola/boston

# Inherit from motorola sm6450-common
include device/motorola/sm6450-common/BoardConfigCommon.mk

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := boston

# Kernel
TARGET_KERNEL_CONFIG += \
	vendor/ext_config/moto-parrot-boston.config

# Kernel Modules
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load))
BOARD_VENDOR_KERNEL_MODULES_BLOCKLIST_FILE := $(TARGET_KERNEL_SOURCE)/modules.vendor_blocklist.msm.parrot
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load.vendor_boot))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_BLOCKLIST_FILE := $(BOARD_VENDOR_KERNEL_MODULES_BLOCKLIST_FILE)
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load.recovery))
BOOT_KERNEL_MODULES := $(BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD)

TARGET_KERNEL_EXT_MODULES := \
    qcom/opensource/mmrm-driver \
    qcom/opensource/audio-kernel \
    qcom/opensource/camera-kernel \
    qcom/opensource/cvp-kernel \
    qcom/opensource/dataipa/drivers/platform/msm \
    qcom/opensource/datarmnet/core \
    qcom/opensource/datarmnet-ext/aps \
    qcom/opensource/datarmnet-ext/offload \
    qcom/opensource/datarmnet-ext/shs \
    qcom/opensource/datarmnet-ext/perf \
    qcom/opensource/datarmnet-ext/perf_tether \
    qcom/opensource/datarmnet-ext/sch \
    qcom/opensource/datarmnet-ext/wlan \
    qcom/opensource/display-drivers/msm \
    qcom/opensource/eva-kernel \
    qcom/opensource/video-driver \
    qcom/opensource/wlan/qcacld-3.0/.adrastea

TARGET_KERNEL_EXT_MODULES += \
    motorola/drivers/mmi_annotate \
    motorola/drivers/mmi_info \
    motorola/drivers/backlight/aw99703 \
    motorola/drivers/backlight/ktd3136 \
    motorola/drivers/power/bm_adsp_ulog \
    motorola/drivers/power/mmi_charger \
    motorola/drivers/power/qti_glink_charger \
    motorola/drivers/power/qpnp_adaptive_charge \
    motorola/drivers/power/bq27426_fg_mmi \
    motorola/drivers/power/sgm4154x_charger_lite \
    motorola/drivers/misc/utag \
    motorola/drivers/misc/mmi_stow \
    motorola/drivers/mmi_relay \
    motorola/drivers/misc/mmi_sys_temp \
    motorola/drivers/regulator/wl2864c \
    motorola/drivers/regulator/slg5bm43670 \
    motorola/drivers/sensors \
    motorola/drivers/misc/sx937x \
    motorola/drivers/misc/hall \
    motorola/drivers/input/touchscreen/touchscreen_mmi \
    motorola/drivers/input/touchscreen/goodix_berlin_mmi \
    motorola/drivers/input/misc/anc_fps_mmi \
    motorola/drivers/input/misc/goodix_fod_mmi \
    motorola/drivers/moto_netopt/con_dfpar \
    motorola/drivers/nfc/st21nfc \
    motorola/drivers/wlan_antenna

# Partitions
BOARD_MOT_DP_GROUP_SIZE := 7813988352  # ( BOARD_SUPER_PARTITION_SIZE - 4MB )
BOARD_SUPER_PARTITION_SIZE := 7818182656

# Properties
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/system_ext.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 90
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/init/fstab.qcom

# Security
BOOT_SECURITY_PATCH := 2026-06-01
VENDOR_SECURITY_PATCH := $(BOOT_SECURITY_PATCH)

# Verified Boot
BOARD_AVB_ROLLBACK_INDEX := 26
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := 26

# inherit from the proprietary version
include vendor/motorola/boston/BoardConfigVendor.mk
