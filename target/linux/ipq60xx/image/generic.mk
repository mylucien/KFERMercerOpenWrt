define Device/FitImage
	KERNEL_SUFFIX := -fit-uImage.itb
	KERNEL = kernel-bin | gzip | fit gzip $$(DEVICE_DTS_DIR)/$$(DEVICE_DTS).dtb
	KERNEL_NAME := Image
endef

define Device/FitImageLzma
	KERNEL_SUFFIX := -fit-uImage.itb
	KERNEL = kernel-bin | lzma | fit lzma $$(DEVICE_DTS_DIR)/$$(DEVICE_DTS).dtb
	KERNEL_NAME := Image
endef

define Device/FitzImage
	KERNEL_SUFFIX := -fit-zImage.itb
	KERNEL = kernel-bin | fit none $$(DEVICE_DTS_DIR)/$$(DEVICE_DTS).dtb
	KERNEL_NAME := zImage
endef

define Device/UbiFit
	KERNEL_IN_UBI := 1
	IMAGES := nand-factory.ubi nand-sysupgrade.bin
	IMAGE/nand-factory.ubi := append-ubi
	IMAGE/nand-sysupgrade.bin := sysupgrade-tar | append-metadata
endef

define Device/wf_hr6001
	$(call Device/FitImage)
	$(call Device/UbiFit)
	DEVICE_VENDOR := WF
	DEVICE_MODEL := HR6001
	KERNEL_LOADADDR := 0x41000000
	BLOCKSIZE := 128k
	PAGESIZE := 2048
	DEVICE_DTS_CONFIG := config@cp01-c1
	SOC := ipq6018
	DEVICE_PACKAGES :=  uboot-envtools
endef
TARGET_DEVICES += wf_hr6001

define Device/cmiot_ax18
	$(call Device/FitImage)
	$(call Device/UbiFit)
	BLOCKSIZE := 128k
	PAGESIZE := 2048
	DEVICE_DTS := qcom-ipq6018-ax18
	DEVICE_DTS_CONFIG := config@cp03-c1
	DEVICE_TITLE := CMIOT AX18
endef
TARGET_DEVICES += cmiot_ax18

define Device/qihoo_v6
	$(call Device/FitImage)
	$(call Device/UbiFit)
	BLOCKSIZE := 128k
	PAGESIZE := 2048
	DEVICE_DTS := qcom-ipq6018-qihoo-v6
	DEVICE_DTS_CONFIG := config@cp03-c1
	DEVICE_TITLE := Qihoo V6
	DEVICE_PACKAGES := kmod-usb3 kmod-usb-phy-msm
endef
TARGET_DEVICES += qihoo_v6

define Device/zn_m2
	$(call Device/FitImage)
	$(call Device/UbiFit)
	BLOCKSIZE := 128k
	PAGESIZE := 2048
	DEVICE_DTS := qcom-ipq6018-zn-m2
	DEVICE_DTS_CONFIG := config@cp03-c1
	DEVICE_TITLE := ZN M2
endef
TARGET_DEVICES += zn_m2
