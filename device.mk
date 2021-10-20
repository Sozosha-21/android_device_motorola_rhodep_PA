#
# Copyright (C) 2023 Paranoid Android
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/motorola/corfur

# A/B
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_client \
    update_engine_sideload \
    update_verifier \
    android.hardware.boot@1.1-impl-qti \
    android.hardware.boot@1.1-impl-qti.recovery \
    android.hardware.boot@1.1-service \
    checkpoint_gc \
    otapreopt_script

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

# API
BOARD_API_LEVEL := 30
BOARD_SHIPPING_API_LEVEL := 30
PRODUCT_SHIPPING_API_LEVEL := 30

# AVB
BOARD_AVB_ENABLE := true

# Bootloader
TARGET_BOARD_PLATFORM := holi
TARGET_BOOTLOADER_BOARD_NAME := corfur

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service_64 \
    camera.device@3.2-impl \
    camera.device@1.0-impl

# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Emulated Storage
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# FileSystem
PRODUCT_PACKAGES += \
    fs_config_files

# Fingerprint
PRODUCT_PACKAGES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

# FM
BOARD_HAVE_QCOM_FM := false

# Generic Kernel Headers
TARGET_HAS_GENERIC_KERNEL_HEADERS := true

# GSI keys
$(call inherit-product, build/make/target/product/gsi_keys.mk)

# Init
PRODUCT_COPY_FILES += $(DEVICE_PATH)/init/fstab.default:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.default

PRODUCT_PACKAGES += \
    charger_fstab.qti \
    init.qti.early_init.sh

# Kernel
KERNEL_MODULES_INSTALL := dlkm
KERNEL_MODULES_OUT := $(OUT_DIR)/target/product/corfur/$(KERNEL_MODULES_INSTALL)/lib/modules

# Manifests
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/configs/vintf/manifest.xml

# Partitions - Dynamic
PRODUCT_BUILD_ODM_IMAGE := true
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# QTI Components
TARGET_COMMON_QTI_COMPONENTS := all

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# Storage
PRODUCT_CHARACTERISTICS := nosdcard

# Treble
PRODUCT_FULL_TREBLE_OVERRIDE := true
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true
BOARD_VNDK_VERSION := current

# VNDK
PRODUCT_EXTRA_VNDK_VERSIONS := 30

# Proprietary Vendor
$(call inherit-product, vendor/motorola/corfur/corfur-vendor.mk)
