include $(TOPDIR)/rules.mk

PKG_NAME:=kalua-trunk
PKG_VERSION:=2017-01
PKG_RELEASE:=2


PKG_SOURCE_URL=https://github.com/weimarnetz/weimarnetz.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=master
PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.xz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_SOURCE_VERSION)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_SOURCE_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/kalua-trunk
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Kalua extensions
  URL:=https://github.com/weimarnetz/weimarnetz
endef


define Package/kalua-trunk/description
	Kalua extensions used in weimarnetz.
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/kalua-trunk/install
	$(CP) -R $(PKG_BUILD_DIR)/files/* $(1)/
endef

$(eval $(call BuildPackage,kalua-trunk))
