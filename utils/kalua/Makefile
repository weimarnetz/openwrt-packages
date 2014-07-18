include $(TOPDIR)/rules.mk

PKG_NAME:=kalua
PKG_VERSION:=2014-06
PKG_RELEASE=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://github.com/weimarnetz/weimarnetz.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=67fcee1ee93fbd104cfa5f8a87d0825dd734a058
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz

include $(INCLUDE_DIR)/package.mk

define Package/kalua
  SECTION:=utils
  CATEGORY:=Utilities
  MAINTAINER:=Andreas Bräu <freifunk@andi95.de>
  TITLE:=Kalua extensions
  URL:=http://kalua.org/trac/wiki
endef


define Package/kalua/description
 Kalua extensions used in weimarnetz.
endef

define Package/kalua/compile
endef

define Package/kalua/install
	$(INSTALL_DIR) $(1)/etc/kalua
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/etc/kalua/* $(1)/etc/kalua/
endef

$(eval $(call BuildPackage,kalua))
