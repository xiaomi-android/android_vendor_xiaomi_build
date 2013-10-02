LOCAL_PATH := $(PWD)
INTERNAL_SELF_EXTRACTORS_TARGET := $(PRODUCT_OUT)/self-extractors
SELF_EXTRACTORS_SRC := $(LOCAL_PATH)/device/$(TARGET_DEVICE)/aries/self-extractors

$(INTERNAL_SELF_EXTRACTORS_TARGET): 
	echo "Self Extractors: $@"
	@rm -Rf $@
	$(ACP) -r $(SELF_EXTRACTORS_SRC) $@
	cd $@ && bash ./generate-packages.sh $(LOCAL_PATH)/$(INTERNAL_OTA_PACKAGE_TARGET)

.PHONY: self-extractors
self-extractors: $(INTERNAL_SELF_EXTRACTORS_TARGET)
