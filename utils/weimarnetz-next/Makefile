include $(TOPDIR)/rules.mk

PKG_NAME:=weimarnetz-next
PKG_RELEASE:=1


PKG_SOURCE_URL=https://github.com/weimarnetz/weimarnetz.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=$(PKG_NAME)-$(shell git ls-remote $(PKG_SOURCE_URL) HEAD|cut -f1 | cut -c1-7)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.xz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_SOURCE_VERSION)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_SOURCE_VERSION)
PKG_VERSION:=$(PKG_SOURCE_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/weimarnetz-next
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Kalua extensions
  URL:=https://github.com/weimarnetz/weimarnetz
endef


define Package/weimarnetz-next/description
	Kalua extensions used in weimarnetz.
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/weimarnetz-next/install
	$(CP) -R $(PKG_BUILD_DIR)/files/* $(1)/
	@echo 'FFF_VERSION=$(PKG_SOURCE_VERSION)' >> $(1)/etc/variables_fff+
	@echo 'FFF_SOURCE_URL=$(PKG_SOURCE_URL)'  >> $(1)/etc/variables_fff+
endef

$(eval $(call BuildPackage,weimarnetz-next))
