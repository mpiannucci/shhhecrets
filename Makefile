ARCHS = armv7 armv7s arm64
SDKVERSION = 9.0
include theos/makefiles/common.mk

TWEAK_NAME = shhhecrets
shhhecrets_FILES = tweak.xm
shhhecrets_FRAMEWORKS = UIKit LocalAuthentication

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += shhhecretssettings
include $(THEOS_MAKE_PATH)/aggregate.mk
