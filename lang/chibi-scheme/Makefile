include $(TOPDIR)/rules.mk

PKG_NAME:=chibi-scheme
PKG_VERSION:=git
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL=https://github.com/ashinn/chibi-scheme
PKG_SOURCE_VERSION:=$(shell git ls-remote $(PKG_SOURCE_URL) HEAD|cut -f1 | cut -c1-7)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_SOURCE_VERSION)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_SOURCE_VERSION)
PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=COPYING

include $(INCLUDE_DIR)/package.mk

define Package/chibi-scheme
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=chibi-scheme
  URL:=http://synthcode.com/scheme/chibi/
  MAINTAINER:=Martin Tippmann <mt@i3o.de>
endef

define Package/chibi-scheme/description
	Minimal Scheme Implementation for use as an Extension Language
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install 
endef

define Package/chibi-scheme/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/ $(1)/usr/bin/
endef

$(eval $(call BuildPackage,chibi-scheme))
