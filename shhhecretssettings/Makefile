include theos/makefiles/common.mk

BUNDLE_NAME = shhhecretssettings
shhhecretssettings_FILES = shhhecretssettings.mm
shhhecretssettings_INSTALL_PATH = /Library/PreferenceBundles
shhhecretssettings_FRAMEWORKS = UIKit
shhhecretssettings_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/shhhecretssettings.plist$(ECHO_END)
