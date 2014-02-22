ARCHS = armv7 armv7s arm64
TARGET = iphone:clang:7.0:5.0

include theos/makefiles/common.mk

TWEAK_NAME = HideSoftwareUpdate
HideSoftwareUpdate_FILES = Tweak.x

include $(THEOS_MAKE_PATH)/tweak.mk
ADDITIONAL_OBJCFLAGS = -fobjc-arc

after-install::
	install.exec "killall -9 Preferences"
