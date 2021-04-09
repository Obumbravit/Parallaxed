include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = parallaxedprefs
parallaxedprefs_FILES = PXDRootListController.m
parallaxedprefs_FRAMEWORKS = UIKit
parallaxedprefs_PRIVATE_FRAMEWORKS = Preferences
parallaxedprefs_LIBRARIES = imagepicker Obvpr
parallaxedprefs_INSTALL_PATH = /Library/PreferenceBundles
parallaxedprefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/parallaxedprefs.plist$(ECHO_END)
