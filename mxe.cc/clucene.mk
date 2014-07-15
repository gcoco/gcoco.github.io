# This file is part of MXE.
# # See index.html for further information.

PKG             := clucene
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.3.3.4
$(PKG)_CHECKSUM := 76d6788e747e78abb5abf8eaad78d3342da5f2a4
$(PKG)_SUBDIR   := $(PKG)-core-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-core-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := http://$(SOURCEFORGE_MIRROR)/project/$(PKG)/$(PKG)-core-unstable/2.3/$($(PKG)_FILE)
$(PKG)_DEPS     := gcc

define $(PKG)_UPDATE
    $(WGET) -q -O- http://repo.or.cz/w/alure.git/tags | \
    grep alure- | \
    $(SED) -n 's,.*alure-\([0-9\.]*\)<.*,\1,p' | \
    head -1
endef

define $(PKG)_BUILD
    cd '$(1)' && mkdir build
    cd '$(1)/build' && cmake \
        -DBUILD_STATIC_LIBRARIES:BOOLEAN=TRUE \
        -DDISABLE_MULTITHREADING:BOOL=ON \
        -D_CL_HAVE_GCC_ATOMIC_FUNCTIONS_EXITCODE=0 \
        -D_CL_HAVE_TRY_BLOCKS_EXITCODE=0 \
        -D_CL_HAVE_NAMESPACES_EXITCODE=0 \
        -D_CL_HAVE_NO_SNWPRINTF_BUG_EXITCODE=0 \
        -DLUCENE_STATIC_CONSTANT_SYNTAX_EXITCODE=1 \
        -D_CL_HAVE_GCCVISIBILITYPATCH=0 \
        -D_CL_HAVE_FUNCTION_SNPRINTF:INTERNAL=0 \
        -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)' \
       ..
   $(MAKE) -C '$(1)/build' -j $(JOBS) VERBOSE=1
   $(MAKE) -C '$(1)/build' -j $(JOBS) install
endef

$(PKG)_BUILD_SHARED =
