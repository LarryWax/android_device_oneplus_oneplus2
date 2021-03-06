# Copyright (C) 2015 The CyanogenMod Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# Inherit CAF msm8994 Board Config
-include device/qcom/msm8994/BoardConfig.mk

TARGET_OTA_ASSERT_DEVICE := OnePlus2,oneplus2

BOARD_VENDOR := oneplus

# Bootloader
TARGET_NO_RADIOIMAGE := true

# Platform
TARGET_BOARD_PLATFORM_GPU := qcom-adreno430

# Architecture
TARGET_USES_64_BIT_BINDER := true

# Cpusets
ENABLE_CPUSETS := true

# Kernel
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 boot_cpus=0-7
BOARD_MKBOOTIMG_ARGS := --dt out/target/product/oneplus2/dt.img --ramdisk_offset 0x01000000 --tags_offset 0x00000100
TARGET_USES_UNCOMPRESSED_KERNEL := true

# Audio
AUDIO_FEATURE_ENABLED_ACDB_LICENSE := true
AUDIO_FEATURE_ENABLED_COMPRESS_CAPTURE := true
AUDIO_FEATURE_ENABLED_DS2_DOLBY_DAP := true
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
BOARD_USES_ALSA_AUDIO := true
USE_CUSTOM_AUDIO_POLICY := 1

# Bluetooth
#BOARD_HAVE_BLUETOOTH_QCOM := true
BOARD_HAS_QCA_BT_ROME := true
QCOM_BT_USE_BTNV := true
#BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/oneplus/oneplus2/bluetooth

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true

# Graphics
TARGET_USES_C2D_COMPOSITION := true
HAVE_ADRENO_SOURCE:= false
OVERRIDE_RS_DRIVER:= libRSDriver_adreno.so

# Charger
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BOARD_HEALTHD_CUSTOM_CHARGER_RES := device/oneplus/oneplus2/charger/images

# Font
EXTENDED_FONT_FOOTPRINT := true

# Include path
TARGET_SPECIFIC_HEADER_PATH := device/oneplus/oneplus2/include

# Init
TARGET_UNIFIED_DEVICE := true
TARGET_LIBINIT_DEFINES_FILE := device/oneplus/oneplus2/init/init_oneplus2.cpp

# Keystore
TARGET_PROVIDES_KEYMASTER := true

# Power
TARGET_POWERHAL_VARIANT := qcom

# Ramdisk
TARGET_VENDOR_RAMDISK := true

# RPC
TARGET_NO_RPC := true

# Sensors
USE_SENSOR_MULTI_HAL := true

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := false
BOARD_USES_QC_TIME_SERVICES := true

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Enable dexpreopt to speed boot time
ifeq ($(HOST_OS),linux)
  ifeq ($(call match-word-in-list,$(TARGET_BUILD_VARIANT),user),true)
    ifeq ($(WITH_DEXPREOPT_BOOT_IMG_ONLY),)
      WITH_DEXPREOPT_BOOT_IMG_ONLY := true
    endif
  endif
endif

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_HAS_QCOM_WLAN_SDK := true
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
TARGET_USES_WCNSS_CTRL := true
TARGET_USES_QCOM_WCNSS_QMI := true
WIFI_DRIVER_FW_PATH_AP := "ap"
WIFI_DRIVER_FW_PATH_STA := "sta"
WPA_SUPPLICANT_VERSION := VER_0_8_X

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2684354560
BOARD_USERDATAIMAGE_PARTITION_SIZE := 59047394304
BOARD_FLASH_BLOCK_SIZE := 262144

# Recovery
TARGET_RECOVERY_FSTAB := device/qcom/msm8994/recovery.fstab

# SELinux
#include device/qcom/sepolicy/sepolicy.mk
#BOARD_SEPOLICY_DIRS += device/oneplus/oneplus2/sepolicy

# CM hardware
#BOARD_HARDWARE_CLASS += device/oneplus/oneplus2/cmhw

# Tap to wake
#TARGET_TAP_TO_WAKE_NODE := "/proc/touchpanel/double_tap_enable"

# inherit from the proprietary version
-include vendor/oneplus/oneplus2/BoardConfigVendor.mk
