# If RACK_DIR is not defined when calling the Makefile, default to two levels above
RACK_DIR ?= ../..

PKGCONFIG= pkg-config
PACKAGES= libusb-1.0 librtlsdr

# FLAGS will be passed to both the C and C++ compiler
FLAGS += $(shell $(PKGCONFIG) --cflags $(PACKAGES))
CFLAGS +=
CXXFLAGS +=

# Add .cpp and .c files to the build
SOURCES = $(wildcard src/*.cpp src/*.c src/*/*.cpp src/*/*.c)

# Must include the VCV plugin Makefile framework
include $(RACK_DIR)/arch.mk

# Careful about linking to libraries, since you can't assume much about the user's environment and library search path.
# Static libraries are fine.
ifdef ARCH_LIN
	# WARNING: static compilation is broken on Linux
	LDFLAGS +=$(shell $(PKGCONFIG) --libs $(PACKAGES))
endif

ifdef ARCH_MAC
	LDFLAGS +=$(shell $(PKGCONFIG) --libs libusb-1.0 librtlsdr)
endif

ifdef ARCH_WIN
	LDFLAGS +=$(shell $(PKGCONFIG) --variable=libdir librtlsdr)/librtlsdr_static.a
	LDFLAGS +=$(shell $(PKGCONFIG) --variable=libdir libusb-1.0)/libusb-1.0.a
endif

DISTRIBUTABLES += $(wildcard LICENSE*) res

# Include the VCV Rack plugin Makefile framework
include $(RACK_DIR)/plugin.mk
