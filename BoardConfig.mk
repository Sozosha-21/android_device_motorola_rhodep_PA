#
# Copyright (C) 2023 Paranoid Android
#
# SPDX-License-Identifier: Apache-2.0
#

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a-dotprod
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a76

# AVB - Disable Verification
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# AVB - Recovery
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# AVB - VBMeta System
BOARD_AVB_VBMETA_SYSTEM := system system_ext product
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 2

# Boot
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_BOOT_HEADER_VERSION := 3
BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOT_HEADER_VERSION)

# Build
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_VENDOR_PROPERTY_NAMESPACE := true

# DTBO
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_INCLUDE_RECOVERY_DTBO := true

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_rhodep

# Kernel
BOARD_DO_NOT_STRIP_VENDOR_MODULES := true
BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_CMDLINE := \
    androidboot.console=ttyMSM0 \
    androidboot.hab.cid=50 \
    androidboot.hab.csv=11 \
    androidboot.hab.product=rhodep \
    androidboot.hardware=qcom \
    androidboot.memcg=1 \
    androidboot.usbcontroller=4e00000.dwc3 \
    cgroup.memory=nokmem,nosocket \
    console=ttyMSM0,115200n8 \
    earlycon=msm_geni_serial,0x04C8C000 \
    firmware_class.path=/vendor/firmware_mnt/image \
    iptable_raw.raw_before_defrag=1 ip6table_raw.raw_before_defrag=1 \
    lpm_levels.sleep_disabled=1 loop.max_part=7 \
    msm_rtb.filter=0x237 service_locator.enable=1 swiotlb=0 
#BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_PAGESIZE    := 4096
BOARD_RAMDISK_USE_LZ4 := true
KERNEL_CUSTOM_LLVM := true
KERNEL_FULL_LLVM := true
KERNEL_DEFCONFIG := rhodep_defconfig

BOARD_VENDOR_KERNEL_MODULES := \
	$(KERNEL_MODULES_OUT)/wcd9xxx_dlkm.ko \
	$(KERNEL_MODULES_OUT)/aw882xx_acf.ko \
	$(KERNEL_MODULES_OUT)/wsa881x_analog_dlkm.ko \
	$(KERNEL_MODULES_OUT)/btpower.ko \
	$(KERNEL_MODULES_OUT)/q6_pdr_dlkm.ko \
	$(KERNEL_MODULES_OUT)/machine_dlkm.ko \
	$(KERNEL_MODULES_OUT)/swr_ctrl_dlkm.ko \
	$(KERNEL_MODULES_OUT)/wcd938x_slave_dlkm.ko \
	$(KERNEL_MODULES_OUT)/q6_notifier_dlkm.ko \
	$(KERNEL_MODULES_OUT)/wcd_core_dlkm.ko \
	$(KERNEL_MODULES_OUT)/wcd937x_slave_dlkm.ko \
	$(KERNEL_MODULES_OUT)/wcd937x_dlkm.ko \
	$(KERNEL_MODULES_OUT)/rx_macro_dlkm.ko \
	$(KERNEL_MODULES_OUT)/platform_dlkm.ko \
	$(KERNEL_MODULES_OUT)/camera.ko \
	$(KERNEL_MODULES_OUT)/pinctrl_lpi_dlkm.ko \
	$(KERNEL_MODULES_OUT)/wcd938x_dlkm.ko \
	$(KERNEL_MODULES_OUT)/stub_dlkm.ko \
	$(KERNEL_MODULES_OUT)/bt_fm_slim.ko \
	$(KERNEL_MODULES_OUT)/adsp_loader_dlkm.ko \
	$(KERNEL_MODULES_OUT)/mbhc_dlkm.ko \
	$(KERNEL_MODULES_OUT)/va_macro_dlkm.ko \
	$(KERNEL_MODULES_OUT)/native_dlkm.ko \
	$(KERNEL_MODULES_OUT)/snd_event_dlkm.ko \
	$(KERNEL_MODULES_OUT)/rdbg.ko \
	$(KERNEL_MODULES_OUT)/bolero_cdc_dlkm.ko \
	$(KERNEL_MODULES_OUT)/q6_dlkm.ko \
	$(KERNEL_MODULES_OUT)/aw882xx_k419.ko \
	$(KERNEL_MODULES_OUT)/apr_dlkm.ko \
	$(KERNEL_MODULES_OUT)/swr_dlkm.ko \
	$(KERNEL_MODULES_OUT)/tx_macro_dlkm.ko \
	$(KERNEL_MODULES_OUT)/wlan.ko \
	$(KERNEL_MODULES_OUT)/rmnet_core.ko \
	$(KERNEL_MODULES_OUT)/rmnet_ctl.ko \
	$(KERNEL_MODULES_OUT)/rmnet_offload.ko \
	$(KERNEL_MODULES_OUT)/rmnet_shs.ko \
	$(KERNEL_MODULES_OUT)/utags.ko \
	$(KERNEL_MODULES_OUT)/mmi_relay.ko \
	$(KERNEL_MODULES_OUT)/mmi_info.ko \
	$(KERNEL_MODULES_OUT)/mmi_annotate.ko \
	$(KERNEL_MODULES_OUT)/sensors_class.ko \
	$(KERNEL_MODULES_OUT)/exfat.ko \
	$(KERNEL_MODULES_OUT)/moto_f_usbnet.ko \
	$(KERNEL_MODULES_OUT)/watchdogtest.ko \
	$(KERNEL_MODULES_OUT)/rbs_fps_mmi.ko \
	$(KERNEL_MODULES_OUT)/focal_fps_mmi.ko \
	$(KERNEL_MODULES_OUT)/ldo_vibrator_mmi.ko \
	$(KERNEL_MODULES_OUT)/wl2868c.ko \
	$(KERNEL_MODULES_OUT)/cci_intf.ko \
	$(KERNEL_MODULES_OUT)/sensors_class.ko \
	$(KERNEL_MODULES_OUT)/mmi_relay.ko \
	$(KERNEL_MODULES_OUT)/touchscreen_mmi.ko \
	$(KERNEL_MODULES_OUT)/goodix_brl_mmi.ko \
	$(KERNEL_MODULES_OUT)/sec_nfc.ko \
	$(KERNEL_MODULES_OUT)/sx937x_sar.ko \
	$(KERNEL_MODULES_OUT)/mmi_sys_temp.ko \
	$(KERNEL_MODULES_OUT)/cw2217b_fg.ko \
	$(KERNEL_MODULES_OUT)/sm5602_fg_mmi.ko \
	$(KERNEL_MODULES_OUT)/tcpc_class.ko \
	$(KERNEL_MODULES_OUT)/tcpc_rt1711h.ko \
	$(KERNEL_MODULES_OUT)/tcpc_sgm7220.ko \
	$(KERNEL_MODULES_OUT)/adapter_class.ko \
	$(KERNEL_MODULES_OUT)/rt_pd_manager.ko \
	$(KERNEL_MODULES_OUT)/sgm4154x_charger.ko \
	$(KERNEL_MODULES_OUT)/bq2589x_charger.ko \
	$(KERNEL_MODULES_OUT)/bq2597x_mmi_iio.ko \
	$(KERNEL_MODULES_OUT)/mmi_charger.ko \
	$(KERNEL_MODULES_OUT)/mmi_discrete_charger_class.ko \
	$(KERNEL_MODULES_OUT)/mmi_discrete_charger.ko \
	$(KERNEL_MODULES_OUT)/leds_aw99703.ko \
	$(KERNEL_MODULES_OUT)/leds_lm3697.ko \
	$(KERNEL_MODULES_OUT)/mmi_discrete_turbo_charger.ko

# OTA Assert
TARGET_OTA_ASSERT_DEVICE := rhodep

# Partitions
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
BOARD_BUILD_VENDOR_RAMDISK_IMAGE := true

# Partitions - A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS := \
      boot \
      dtbo \
      odm \
      product \
      system \
      system_ext \
      vbmeta \
      vbmeta_system \
      vendor \
      vendor_boot

# Partitions - Dynamic
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := odm product system system_ext vendor

# Partitions - Filesystems
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs

# Partitions - Metadata
BOARD_USES_METADATA_PARTITION := true

TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor

# Partitions - Sizes
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 8608808960 # ( BOARD_SUPER_PARTITION_SIZE - 4MB )
BOARD_SUPER_PARTITION_SIZE := 8613003264
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 100663296

# Properties
TARGET_ODM_PROP += $(DEVICE_PATH)/configs/props/odm.prop
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/configs/props/system.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/configs/props/system_ext.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/configs/props/vendor.prop

# Radio
ADD_RADIO_FILES := false

# Recovery
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
TARGET_NO_RECOVERY := true
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 90
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/init/fstab.default
TARGET_RECOVERY_WIPE := $(DEVICE_PATH)/recovery/recovery.wipe

# SELinux
BOARD_VENDOR_SEPOLICY_DIRS += \
    $(DEVICE_PATH)/sepolicy/vendor
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(COMMON_SEPOLICY_PATH)/common/private
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += $(COMMON_SEPOLICY_PATH)/common/public
PRODUCT_PRIVATE_SEPOLICY_DIRS += \
    $(DEVICE_PATH)/sepolicy/private

ifneq ($(AOSPA_BUILD),)
    SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
        $(COMMON_SEPOLICY_PATH)/aospa/private
endif

# UFS
#namespace definition for librecovery_updater
#differentiate legacy 'sg' or 'bsg' framework
SOONG_CONFIG_NAMESPACES += ufsbsg
SOONG_CONFIG_ufsbsg += ufsframework
SOONG_CONFIG_ufsbsg_ufsframework := bsg
