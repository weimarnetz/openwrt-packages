include $(TOPDIR)/rules.mk

PKG_NAME:=kalua-bittorf
PKG_VERSION:=trunk
PKG_RELEASE:=2


PKG_SOURCE_URL=https://github.com/bittorf/kalua.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=master
PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.xz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_SOURCE_VERSION)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_SOURCE_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/kalua-bittorf
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Kalua extensions
endef


define Package/kalua-bittorf/description
	Kalua extensions used in weimarnetz.
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/kalua-bittorf/install
	$(CP) -R $(PKG_BUILD_DIR)/openwrt-addons/* $(1)/
        $(CP) $(PKG_BUILD_DIR)/openwrt-build/apply_profile* $(1)/etc/init.d/
endef

$(eval $(call BuildPackage,kalua-bittorf))
