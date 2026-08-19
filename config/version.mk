CUSTOM_PLATFORM_VERSION := 17.0
CUSTOM_VERSION_PROP := seventeen

CUSTOM_BUILD_DATE := $(shell date -u +%Y%m%d)
CUSTOM_VERSION := $(CUSTOM_BUILD)-$(CUSTOM_PLATFORM_VERSION)-$(CUSTOM_BUILD_DATE)

ifeq ($(IS_CI), true)
CUSTOM_BUILD_DATE_TIME := $(shell date -u %H%M)
CUSTOM_VERSION := $(CUSTOM_VERSION)-$(CUSTOM_BUILD_DATE_TIME)
endif

# PixelOS Platform Version
PRODUCT_PRODUCT_PROPERTIES += \
    ro.custom.build.date=$(CUSTOM_BUILD_DATE) \
    ro.custom.device=$(CUSTOM_BUILD) \
    ro.custom.version=PixelOS_$(CUSTOM_VERSION) \
    net.pixelos.version=$(CUSTOM_VERSION_PROP)

# Updater
ifeq ($(IS_CI),true)
    PRODUCT_PRODUCT_PROPERTIES += \
        net.pixelos.build_type=ci
endif
