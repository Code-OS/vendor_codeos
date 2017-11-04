PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Disable excessive dalvik debug messages
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.debug.alloc=0

#Themes
PRODUCT_PACKAGES += \
    PixelTheme \
    Stock

# Backup tool
PRODUCT_COPY_FILES += \
    vendor/codeos/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/codeos/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/codeos/prebuilt/common/bin/50-codeos.sh:system/addon.d/50-codeos.sh

# Backup services whitelist
PRODUCT_COPY_FILES += \
    vendor/codeos/config/permissions/backup.xml:system/etc/sysconfig/backup.xml

# Signature compatibility validation
PRODUCT_COPY_FILES += \
    vendor/codeos/prebuilt/common/bin/otasigcheck.sh:install/bin/otasigcheck.sh

# Codeos-specific init file
PRODUCT_COPY_FILES += \
    vendor/codeos/prebuilt/common/etc/init.local.rc:root/init.codeos.rc

# Copy LatinIME for gesture typing
PRODUCT_COPY_FILES += \
    vendor/codeos/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so

# SELinux filesystem labels
PRODUCT_COPY_FILES += \
    vendor/codeos/prebuilt/common/etc/init.d/50selinuxrelabel:system/etc/init.d/50selinuxrelabel

# Fix Dialer
PRODUCT_COPY_FILES +=  \
    vendor/aosp/prebuilt/common/etc/sysconfig/dialer_experience.xml:system/etc/sysconfig/dialer_experience.xml

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    vendor/codeos/prebuilt/common/etc/mkshrc:system/etc/mkshrc \
    vendor/codeos/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf

# Fix Dialer
PRODUCT_COPY_FILES +=  \
    vendor/codeos/prebuilt/common/sysconfig/dialer_experience.xml:system/etc/sysconfig/dialer_experience.xml

# Codeos-specific startup services
PRODUCT_COPY_FILES += \
    vendor/codeos/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/codeos/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit \
    vendor/codeos/prebuilt/common/bin/sysinit:system/bin/sysinit

# Required packages
PRODUCT_PACKAGES += \
    CellBroadcastReceiver \
    Development \
    SpareParts \
    LockClock \
    su

# Optional packages
PRODUCT_PACKAGES += \
    Basic \
    LiveWallpapersPicker \
    PhaseBeam

# Include explicitly to work around GMS issues
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    librsjni

# AudioFX
PRODUCT_PACKAGES += \
    AudioFX

# Extra Optional packages
PRODUCT_PACKAGES += \
    Calculator \
    LatinIME \
    BluetoothExt \
    AdAway \
    GooglePixelLauncher \
    LawnChairLauncher \
    Phonograph

# Extra tools
PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs \
    fsck.exfat \
    mkfs.exfat \
    ntfsfix \
    ntfs-3g

# Bring in camera effects
PRODUCT_COPY_FILES +=  \
    vendor/codeos/prebuilt/common/media/LMspeed_508.emd:system/vendor/media/LMspeed_508.emd \
    vendor/codeos/prebuilt/common/media/PFFprec_600.emd:system/vendor/media/PFFprec_600.emd

# MusicFX advanced effects
#ifneq ($(TARGET_NO_DSPMANAGER), true)
#PRODUCT_PACKAGES += \
#    libcyanogen-dsp \
#    audio_effects.conf
#endif

# Custom off-mode charger
ifneq ($(WITH_CM_CHARGER),false)
PRODUCT_PACKAGES += \
    charger_res_images \
    cm_charger_res_images \
    font_log.png \
    libhealthd.cm
endif

# DU Utils library
#PRODUCT_BOOT_JARS += \
#    org.dirtyunicorns.utils

# DU Utils library
#PRODUCT_PACKAGES += \
#    org.dirtyunicorns.utils

#ifeq ($(DEFAULT_ROOT_METHOD),magisk)
# Magisk Manager
#PRODUCT_PACKAGES += \
#    MagiskManager

# Magisk
#PRODUCT_COPY_FILES += \
#   vendor/codeos/prebuilt/common/addon.d/magisk.zip:system/addon.d/magisk.zip
#endif

#ifeq ($(DEFAULT_ROOT_METHOD),supersu)
# SuperSU
#PRODUCT_COPY_FILES += \
#   vendor/codeos/prebuilt/common/etc/UPDATE-SuperSU.zip:system/addon.d/UPDATE-SuperSU.zip \
#   vendor/codeos/prebuilt/common/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon
#endif

# Explict rootless defined, or none of the root methods defined,
# default rootless : nothing todo
#ifeq ($(DEFAULT_ROOT_METHOD),rootless)
#endif

# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libffmpeg_extractor \
    libffmpeg_omx \
    media_codecs_ffmpeg.xml

PRODUCT_PROPERTY_OVERRIDES += \
    media.sf.omx-plugin=libffmpeg_omx.so \
    media.sf.extractor-plugin=libffmpeg_extractor.so

# Charging sounds
PRODUCT_COPY_FILES += \
    vendor/codeos/google/effects/BatteryPlugged.ogg:system/media/audio/ui/BatteryPlugged.ogg \
    vendor/codeos/google/effects/BatteryPlugged_48k.ogg:system/media/audio/ui/BatteryPlugged_48k.ogg

# Storage manager
PRODUCT_PROPERTY_OVERRIDES += \
    ro.storage_manager.enabled=true

# easy way to extend to add more packages
-include vendor/extra/product.mk

PRODUCT_PACKAGE_OVERLAYS += vendor/codeos/overlay/common

# Bootanimation
PRODUCT_COPY_FILES += vendor/codeos/prebuilt/common/bootanimation/bootanimation.zip:system/media/bootanimation.zip

# Versioning System
# codeos first version.
PRODUCT_VERSION_MAJOR = 8.0
PRODUCT_VERSION_MINOR = BETA
PRODUCT_VERSION_MAINTENANCE = 2.0
CODEOS_POSTFIX := -$(shell date +"%Y%m%d-%H%M")
ifdef CODEOS_BUILD_EXTRA
    CODEOS_POSTFIX := -$(CODEOS_BUILD_EXTRA)
endif

ifndef CODEOS_BUILD_TYPE
    CODEOS_BUILD_TYPE := UNOFFICIAL
endif

# Set all versions
CODEOS_VERSION := Codeos-$(CODEOS_BUILD)-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-$(CODEOS_BUILD_TYPE)$(CODEOS_POSTFIX)
CODEOS_MOD_VERSION := Codeos-$(CODEOS_BUILD)-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-$(CODEOS_BUILD_TYPE)$(CODEOS_POSTFIX)

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    codeos.ota.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE) \
    ro.codeos.version=$(CODEOS_VERSION) \
    ro.modversion=$(CODEOS_MOD_VERSION) \
    ro.codeos.buildtype=$(CODEOS_BUILD_TYPE)

EXTENDED_POST_PROCESS_PROPS := vendor/codeos/tools/codeos_process_props.py

