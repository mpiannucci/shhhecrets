ARCHS = armv7 armv7s arm64
SDKVERSION = 9.0
include theos/makefiles/common.mk

TWEAK_NAME = shhhecrets
shhhecrets_FILES = tweak.xm
shhhecrets_FRAMEWORKS = UIKit LocalAuthentication CoreGraphics
shhhecrets_PRIVATE_FRAMEWORKS = ChatKit
shhhecrets_OBJCFLAGS = -Wno-deprecated-declarations -Wno-unused-variable

include $(THEOS_MAKE_PATH)/tweak.mk
