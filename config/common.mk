PRODUCT_BRAND ?= nameless

# Versioning
include vendor/nameless/config/version.mk

# get device client id base
ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

# general properties
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false \
    persist.sys.root_access=1

# urls, links etc
PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.nameless.ota.download=https://sourceforge.net/projects/namelessrom/files/n-2.1/%s/ \

# Default notification/alarm sounds
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=Titania.ogg \
    ro.config.notification_sound=Titan.ogg \
    ro.config.alarm_alert=Timer.ogg \

# Disable excessive dalvik debug messages
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.debug.alloc=0

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.image-dex2oat-filter=everything

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# enable ADB authentication if not on eng build
ifeq ($(I_WANT_ACCESS_PLEASE),)
ifneq ($(TARGET_BUILD_VARIANT),eng)
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=1
endif
endif

# Tethering
PRODUCT_PROPERTY_OVERRIDES += persist.sys.dun.override=0

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/nameless/prebuilt/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/nameless/prebuilt/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/nameless/prebuilt/bin/50-hosts.sh:system/addon.d/50-hosts.sh \
    vendor/nameless/prebuilt/bin/blacklist:system/addon.d/blacklist

# OTA signature check
PRODUCT_COPY_FILES += \
    vendor/nameless/prebuilt/bin/otasigcheck.sh:install/bin/otasigcheck.sh

# init.d support
PRODUCT_COPY_FILES += \
    vendor/nameless/prebuilt/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/nameless/prebuilt/bin/sysinit:system/bin/sysinit

ifneq ($(TARGET_BUILD_VARIANT),user)
# userinit support
PRODUCT_COPY_FILES += \
    vendor/nameless/prebuilt/etc/init.d/90userinit:system/etc/init.d/90userinit
endif

# Init script file with nameless extras
PRODUCT_COPY_FILES += \
    vendor/nameless/prebuilt/etc/init.local.rc:root/init.nameless.rc

# SuperSU
PRODUCT_COPY_FILES += \
    vendor/nameless/prebuilt/etc/supersu.zip:supersu/supersu.zip

# Bring in camera effects
PRODUCT_COPY_FILES +=  \
    vendor/nameless/prebuilt/media/LMprec_508.emd:system/media/LMprec_508.emd \
    vendor/nameless/prebuilt/media/PFFprec_600.emd:system/media/PFFprec_600.emd

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/nameless/prebuilt/common/lib/content-types.properties:system/lib/content-types.properties

# Add apn's
include vendor/nameless/config/apns.mk

# Add features and permissions
include vendor/nameless/config/features.mk

# Additional packages
include vendor/nameless/config/packages.mk

# T-Mobile theme engine
include vendor/nameless/config/themes_common.mk

# TWRP common
include vendor/nameless/config/twrp_common.mk

# CM platform sdk
include vendor/nameless/config/cm_platform_sdk.mk

# Private Makefile
-include vendor/nameless/private/common.mk

# Add our overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/nameless/overlay/common

# SoftUI optimization
PRODUCT_PROPERTY_OVERRIDES += \
  ro.HOME_APP_ADJ=1
  
PRODUCT_PROPERTY_OVERRIDES += \
  ro.HorizontalVVM=true
 
PRODUCT_PROPERTY_OVERRIDES += \
  ro.media.enc.hprof.vid.bps=41943040
  
PRODUCT_PROPERTY_OVERRIDES += \
  ro.media.enc.hprof.vid.fps=60

PRODUCT_PROPERTY_OVERRIDES += \
  debug.sf.hw=1
  
PRODUCT_PROPERTY_OVERRIDES += \
  ro.min_pointer_dur=10
  
PRODUCT_PROPERTY_OVERRIDES += \
  ro.telephony.call_ring.delay=1000
  
PRODUCT_PROPERTY_OVERRIDES += \
  windowsmgr.max_events_per_sec=80
  
PRODUCT_PROPERTY_OVERRIDES += \
  video.accelerate.hw=1
  
PRODUCT_PROPERTY_OVERRIDES += \
  debug.performance.tuning=1
  
PRODUCT_PROPERTY_OVERRIDES += \
  debug.buttonfast.delay=0
  
PRODUCT_PROPERTY_OVERRIDES += \
  ro.media.enc.jpeg.quality=100
  
PRODUCT_PROPERTY_OVERRIDES += \
  pm.sleep_mode=1
  
PRODUCT_PROPERTY_OVERRIDES += \
  ro.ril.disable.power.collapse=0
  
PRODUCT_PROPERTY_OVERRIDES += \
  ro.media.dec.jpeg.memcap=8000000
  
PRODUCT_PROPERTY_OVERRIDES += \
  ro.lge.proximity.delay=25
  
PRODUCT_PROPERTY_OVERRIDES += \
  ro.ril.spender.bending=1
  
PRODUCT_PROPERTY_OVERRIDES += \
  ro.ril.music_echo_sound=12
  
PRODUCT_PROPERTY_OVERRIDES += \
  ril.category.delay=0
  
PRODUCT_PROPERTY_OVERRIDES += \
  debug.kill_allocating_task=0
