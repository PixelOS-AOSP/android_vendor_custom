CUSTOM_PLATFORM_VERSION := 17.0

CUSTOM_VERSION := $(CUSTOM_BUILD)-$(CUSTOM_PLATFORM_VERSION)

ifeq ($(IS_OFFICIAL),true)
ifeq($(IS_RELEASE), true)
CUSTOM_BUILD_DATE := $(shell date -u +%Y%m%d)
else
CUSTOM_BUILD_DATE := $(shell date -u +%Y%m%d-%H%M)
endif
CUSTOM_VERSION := $(CUSTOM_VERSION)-$(CUSTOM_BUILD_DATE)
endif

CUSTOM_VERSION_PROP := seventeen

# PixelOS Platform Version
PRODUCT_PRODUCT_PROPERTIES += \
    ro.custom.build.date=$(CUSTOM_BUILD_DATE) \
    ro.custom.device=$(CUSTOM_BUILD) \
    ro.custom.version=PixelOS_$(CUSTOM_VERSION) \
    net.pixelos.version=$(CUSTOM_VERSION_PROP)

# Updater
ifeq ($(IS_OFFICIAL),true)
    PRODUCT_PRODUCT_PROPERTIES += \
        net.pixelos.build_type=ci
endif
