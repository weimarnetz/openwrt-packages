include $(TOPDIR)/rules.mk

PKG_NAME:=kalua-trunk

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL=git://github.com/weimarnetz/weimarnetz.git
PKG_SOURCE_VERSION:=master
PKG_VERSION:=$(shell git describe --short)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_RELEASE=$(PKG_SOURCE_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/kalua-trunk
  SECTION:=utils
  CATEGORY:=Utilities
  MAINTAINER:=Andreas Bräu <freifunk@andi95.de>
  TITLE:=Kalua extensions
  URL:=http://kalua.org/trac/wiki
endef


define Package/kalua-trunk/description
 Kalua extensions used in weimarnetz.
endef

Build/Compile/Default

endef
Build/Compile = $(Build/Compile/Default)

define Package/kalua-trunk/install
	$(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,kalua-trunk))
