#
# Copyright (C) 2012 The CyanogenMod Project
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

DEVICE_PATH := device/samsung/grandppltedx

# assert
TARGET_OTA_ASSERT_DEVICE := grandpplte,grandppltedx,grandpplteub,grandpplteser
#                           common    | G532G~G/DS | G532M~M/DS | G532F~F/DS

# CFLAG
BOARD_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
BOARD_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK
BOARD_GLOBAL_CFLAGS += -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL

# Headers
TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

# Project Configs
MTK_PROJECT_CONFIG ?= $(DEVICE_PATH)/ProjectConfig.mk
include $(MTK_PROJECT_CONFIG)

# Display
USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
PRESENT_TIME_OFFSET_FROM_VSYNC_NS := 0
BOARD_EGL_CFG := $(DEVICE_PATH)/configs/egl.cfg
MTK_HWC_SUPPORT := yes
MTK_HWC_VERSION := 1.4.1

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := mt6737t

# Platform
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_BOARD_PLATFORM := mt6737t
TARGET_NO_BOOTLOADER := true
TARGET_NO_FACTORYIMAGE := true
TARGET_BOARD_PLATFORM_GPU := mali-T720mp2
MTK_GPU_VERSION := mali midgard m7p0

BOARD_HAS_MTK_HARDWARE := true
BOARD_USES_MTK_HARDWARE := true
MTK_HARDWARE := true
BOARD_USES_MTK_MEDIA_PROFILES := true

TARGET_PROVIDES_LIBLIGHT := true

USE_CAMERA_STUB := true

TARGET_OMX_LEGACY_RESCALING := true

# Backlight
# is at is ktd3102-bl (not /class/leds/...)
# #samsung-troll
BACKLIGHT_PATH := /sys/devices/ktd3102-bl/backlight/panel/brightness

# Architecture
# is 32-bit
TARGET_ARCH         := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI      := armeabi-v7a
TARGET_CPU_ABI2     := armeabi
TARGET_CPU_VARIANT  := cortex-a53
TARGET_CPU_SMP      := true

TARGET_2ND_ARCH         := 
TARGET_2ND_ARCH_VARIANT := 
TARGET_2ND_CPU_ABI      := 
TARGET_2ND_CPU_ABI2     :=  
TARGET_2ND_CPU_VARIANT  := 

# Block
BOARD_BOOTIMAGE_PARTITION_SIZE        := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE    := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE      := 3229614080
BOARD_CACHEIMAGE_PARTITION_SIZE       := 419430400
BOARD_FLASH_BLOCK_SIZE                := 4096

# seen 16 GB variant (ShaDis)
# Probably:
# Dual SIM + 8GB | Single SIM + 16 GB
# so TODO: add 16gig config
ifeq ($(TARGET_DEVICE),grandppltedx)
BOARD_USERDATAIMAGE_PARTITION_SIZE    := 3900702720
endif

# need /proc/partitions on running machine!
#ifeq $(TARGET_DEVICE),grandppltedx16)
#BOARD_USERDATAIMAGE_PARTITION_SIZE    := 3900702720
#endif

BOARD_USERDATAIMAGES_FILE_SYSTEM_TYPE := ext4 
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE    := ext4
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE     := ext4

TARGET_USERIMAGES_USE_EXT4 := true

# Audio
USE_CUSTOM_AUDIO_POLICY := 1
BOARD_USES_MTK_AUDIO := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_HCILP_INCLUDED := 0
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# CMHW
BOARD_USES_CYANOGEN_HARDWARE := true
BOARD_HARDWARE_CLASS += $(DEVICE_PATH)/cmhw

# GPS
BOARD_GPS_LIBRARIES := true
BOARD_CONNECTIVITY_MODULE := MT6625
BOARD_MEDIATEK_USES_GPS := true

# RIL
BOARD_RIL_CLASS := ../../../device/samsung/grandppltedx/ril

# Power HAL
TARGET_POWERHAL_VARIANT := mtk
TARGET_POWERHAL_SET_INTERACTIVE_EXT := $(LOCAL_PATH)/power/power.c

# Wifi
BOARD_WLAN_DEVICE := MediaTek
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM := /dev/wmtWifi
WIFI_DRIVER_FW_PATH_AP := AP
WIFI_DRIVER_FW_PATH_STA := STA
WIFI_DRIVER_FW_PATH_P2P := P2P
WIFI_DRIVER_STATE_CTRL_PARAM := /dev/wmtWifi
WIFI_DRIVER_STATE_ON := 1
WIFI_DRIVER_STATE_OFF := 0

# Kernel
BOARD_CUSTOM_BOOTIMG := true

BOARD_KERNEL_IMAGE_NAME := zImage
TARGET_KERNEL_SOURCE    := kernel/samsung/grandppltedx
TARGET_KERNEL_CONFIG    := mt6737t-grandpplte_defconfig

BOARD_KERNEL_CMDLINE  := bootopt=64S3,32N2,32N2 androidboot.selinux=permissive androidboot.selinux=disabled

BOARD_KERNEL_BASE     := 0x3fffc000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET  := 0x04004000
BOARD_SECOND_OFFSET   := 0x00f04000
BOARD_TAGS_OFFSET     := 0x0e004000
BOARD_KERNEL_OFFSET   := 0x00008000
BOARD_KERNEL_BOARD    := SRPPI01A000KU
BOARD_DT_SIZE         := 485376
BOARD_HASH_TYPE       := sha1


BOARD_MKBOOTIMG_ARGS := --base $(BOARD_KERNEL_BASE) --pagesize $(BOARD_KERNEL_PAGESIZE) --kernel_offset $(BOARD_KERNEL_OFFSET) --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --second_offset $(BOARD_SECOND_OFFSET) --tags_offset $(BOARD_TAGS_OFFSET) --board $(BOARD_KERNEL_BOARD) 
# --dt $(DEVICE_PATH)/dt.img
# --dt $(DEVICE_PATH)/bootimage-dtb

#--- Use custom init.rc
# Combination of stock bootimg
# and SEC-common + services
TARGET_PROVIDES_INIT_RC := true

# Recovery
# twrp doesnt like me

TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/fstab.mt6735
#RECOVERY_VARIANT := twrp
BOARD_HAS_NO_SELECT_BUTTON := true

ifeq ($(RECOVERY_VARIANT), twrp)

#-- common
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/mt_usb/musb-hdrc.0.auto/gadget/lun%d/file
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/devices/ktd3102-bl/lcd-backlight/brightness\"
TW_NO_REBOOT_BOOTLOADER := true
TW_THEME := portrait_hdpi
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone1/temp
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_MAX_BRIGHTNESS := 255
BOARD_SUPPRESS_SECURE_ERASE := true
TW_INCLUDE_CRYPTO := true
TW_BRIGHTNESS_PATH := /sys/devices/ktd3102-bl/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 255
TW_NO_USB_STORAGE := true
BOARD_USE_FRAMEBUFFER_ALPHA_CHANNEL := true
TARGET_DISABLE_TRIPLE_BUFFERING := false
TW_USE_TOOLBOX := true

#-- device
DEVICE_RESOLUTION := 540x960
DEVICE_SCREEN_WIDTH := 540
DEVICE_SCREEN_HEIGHT := 960
RECOVERY_SDCARD_ON_DATA := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_DEFAULT_EXTERNAL_STORAGE := true
endif

# system properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# SEAndroid
include $(DEVICE_PATH)/sepolicy/sepolicy.mk
BOARD_SECCOMP_POLICY += $(DEVICE_PATH)/seccomp

# Misc
EXTENDED_FONT_FOOTPRINT := true


# Inherit from mt6735-common
#FORCE_32_BIT := true
#include device/cyanogen/mt6735-common/BoardConfigCommon.mk
