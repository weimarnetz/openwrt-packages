include $(TOPDIR)/rules.mk

PKG_NAME:=kalua
PKG_VERSION:=$(date "+%s")
PKG_RELEASE=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
ifdef REPOURL
	PKG_SOURCE_URL:=$(REPOURL)
else
	PKG_SOURCE_URL=git://github.com/weimarnetz/weimarnetz.git
endif
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=master
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
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/etc/kalua_* $(1)/etc/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/etc/local* $(1)/etc/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/etc/variables* $(1)/etc/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/etc/init.d/* $(1)/etc/init.d/
	$(INSTALL_DIR) $(1)/etc/dhcp-script.d
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/etc/dhcp-script.d/* $(1)/etc/dhcp-script.d/
	$(INSTALL_DIR) $(1)/etc/kalua
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/etc/kalua/* $(1)/etc/kalua/
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/* $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/www
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/www/*.* $(1)/www/
	$(INSTALL_DIR) $(1)/www/images
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/www/images/* $(1)/www/images/
endef

$(eval $(call BuildPackage,kalua))
