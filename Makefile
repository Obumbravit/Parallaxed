export THEOS = /var/theos
export ARCHS = arm64 arm64e
THEOS_DEVICE_IP = 192.168.5.11

INSTALL_TARGET_PROCESSES = SpringBoard
TARGET_IPHONEOS_DEPLOYMENT_VERSION = 13.3

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Parallaxed
Parallaxed_FILES = Parallaxed.x Classes/ParallaxWallView.m
Parallaxed_FRAMEWORKS = UIKit
Parallaxed_LIBRARIES = imagepicker
Parallaxed_CFLAGS = -fobjc-arc

include $(THEOS)/makefiles/tweak.mk
SUBPROJECTS += parallaxedprefs
include $(THEOS)/makefiles/aggregate.mk
