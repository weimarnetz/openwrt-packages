include $(TOPDIR)/rules.mk

PKG_NAME:=kalua

PKG_SOURCE_PROTO:=git
ifdef REPOURL
	PKG_SOURCE_URL:=$(REPOURL)
else
	PKG_SOURCE_URL=git://github.com/weimarnetz/weimarnetz.git
endif
PKG_SOURCE_VERSION:=GebrannteMandeln
$(shell git clone ${PKG_SOURCE_URL} -b ${PKG_SOURCE_VERSION} ${TMP_DIR}/getgitver --no-checkout )
LC:=$(shell git --git-dir $(TMP_DIR)/getgitver/.git log -1 --pretty=format:%ct )
LCH:=$(shell echo $$((${LC}/3600)) )
$(shell rm -rf $(TMP_DIR)/getgitver)
PKG_VERSION:=$(LCH)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_RELEASE=$(PKG_SOURCE_VERSION)

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
	$(INSTALL_DIR) $(1)/etc/profile.d
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/etc/profile.d/* $(1)/etc/profile.d/
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
	@echo 'FFF_PLUS_VERSION=$(LCH)' > $(1)/etc/variables_fff+
	@echo 'FFF_VERSION=$(PKG_SOURCE_VERSION)' >> $(1)/etc/variables_fff+
endef

$(eval $(call BuildPackage,kalua))
