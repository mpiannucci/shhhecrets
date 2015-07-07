ARCHS = armv7 armv7s arm64
SDKVERSION = 8.4
include theos/makefiles/common.mk

TWEAK_NAME = shhhecrets
shhhecrets_FILES = Tweak.xm
shhhecrets_FRAMEWORKS = UIKit LocalAuthentication

include $(THEOS_MAKE_PATH)/tweak.mk
