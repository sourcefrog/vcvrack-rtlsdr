# If RACK_DIR is not defined when calling the Makefile, default to two levels above
RACK_DIR ?= ../..

# Must include the VCV plugin Makefile framework
include $(RACK_DIR)/arch.mk

# Assume that `vcpkg install` has run so the dependencies from `vcpkg.json` are available
# under `vcpkg_installed` in the source dir.

PKGCONFIG= pkg-config
PACKAGES= libusb-1.0 librtlsdr

# Map VCVRack's arch.mk to vcpkg's triplet
ifeq ($(ARCH_OS), lin)
  TRIPLET := $(ARCH_CPU)-linux
else ifeq ($(ARCH_OS), mac)
  TRIPLET := $(ARCH_CPU)-osx
else ifeq ($(ARCH_OS), win)
  TRIPLET := $(ARCH_CPU)-windows
else
  $(error Unrecognized OS "$(ARCH_OS)")
endif

PKG_CONFIG_PATH = $(abspath vcpkg_installed)/$(TRIPLET)/lib/pkgconfig
PKGCONFIG := $(abspath vcpkg_installed)/$(TRIPLET)/tools/pkgconf/pkgconf --with-path=$(PKG_CONFIG_PATH)

# FLAGS will be passed to both the C and C++ compiler
FLAGS += $(shell $(PKGCONFIG)  --cflags $(PACKAGES))
CFLAGS +=
CXXFLAGS +=
LDFLAGS += $(shell $(PKGCONFIG)  --libs $(PACKAGES))

# Add .cpp and .c files to the build
SOURCES = $(wildcard src/*.cpp src/*.c src/*/*.cpp src/*/*.c)

DISTRIBUTABLES += $(wildcard LICENSE*) res

# Include the VCV Rack plugin Makefile framework
include $(RACK_DIR)/plugin.mk

.PHONY: vcpkg

vcpkg:
	vcpkg install --no-print-usage
