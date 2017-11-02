# Inherit common stuff
$(call inherit-product, vendor/codeos/config/caf_fw.mk)
$(call inherit-product, vendor/codeos/config/common.mk)
$(call inherit-product, vendor/codeos/config/common_apn.mk)

# Telephony 
PRODUCT_PACKAGES += \
    Stk 

# SMS
PRODUCT_PACKAGES += \
	messaging
