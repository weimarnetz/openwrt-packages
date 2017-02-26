#
# Copyright (C) 2012-2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-owm
PKG_RELEASE:=0.7.0

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)



include $(INCLUDE_DIR)/package.mk

define Package/luci-app-owm/default
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  URL:=https://github.com/freifunk/packages-pberg/
endef

define Package/luci-app-owm
  $(call Package/luci-app-owm/default)
  DEPENDS:=+luci-base +luci-lib-json +olsrd +olsrd-mod-jsoninfo +luci-lib-luaneightbl
  TITLE:=Luci JSON Export for Open Wireless Map
endef

define Package/luci-app-owm/description
  Luci JSON Export for Open Wireless Map
endef

define Package/luci-app-owm-cmd
  $(call Package/luci-app-owm/default)
  DEPENDS:=+luci-app-owm +luci-lib-httpclient
  TITLE:=luci-app-owm-cmd - Commandline update tool
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./luasrc $(PKG_BUILD_DIR)/
endef

define Build/Configure
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/luasrc
endef

define Package/luci-app-owm-cmd/install
	$(INSTALL_DIR) $(1)/usr/sbin/
	$(CP) files/owm.lua $(1)/usr/sbin/owm.lua
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(CP) files/owm-defaults $(1)/etc/uci-defaults/owm
endef

define Package/luci-app-owm/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci
	$(CP) $(PKG_BUILD_DIR)/luasrc/owm.lua $(1)/usr/lib/lua/luci/owm.lua
endef

$(eval $(call BuildPackage,luci-app-owm))
$(eval $(call BuildPackage,luci-app-owm-cmd))
