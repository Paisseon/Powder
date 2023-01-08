# Basic environment configuration

SYSROOT = $(THEOS)/sdks/iPhoneOS16.0.sdk/
ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:12.2

# Theos optimisations

FINALPACKAGE = 1
DEBUG = 0
THEOS_LEAN_AND_MEAN = 1
FOR_RELEASE = 1
USING_JINX = 1

# Processes die if they are killed

INSTALL_TARGET_PROCESSES = SpringBoard

# Define included files, imported frameworks, etc.

LIBRARY_NAME = JinxServer
$(LIBRARY_NAME)_FILES = Sources/load.s $(shell find Sources/$(LIBRARY_NAME) -name '*.swift')
$(LIBRARY_NAME)_LIBRARIES = mryipc

# Theos makefiles to include

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/library.mk
