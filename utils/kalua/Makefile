include $(TOPDIR)/rules.mk

PKG_NAME:=kalua
PKG_VERSION:=2014-06
PKG_RELEASE=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://github.com/kalua/kalua.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=81e32cd5fa3dcda04b6fc319d32a55082b2f6b3c
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_BUILD_PARALLEL:=0
CMAKE_INSTALL:=0

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/kalua/default
  SECTION:=utils
  CATEGORY:=Utilities
  URL:=http://kalua.org/trac/wiki
endef

define Package/kalua
$(Package/kalua/default)
  DEPENDS:=+olsr
  TITLE:=kalua
endef

define Package/kalua/description
 Kalua extensions.
endef

define Package/kalua/config
	config PACKAGE_kalua-cyassl
		depends on PACKAGE_kalua
		bool "Build with CyaSSL"
		default n
	config PACKAGE_kalua-openssl
		depends on PACKAGE_kalua
		bool "Build with OpenSSL"
		default n
endef



TARGET_CFLAGS += -I$(STAGING_DIR)/usr/include

ifndef CONFIG_PACKAGE_kalua-openssl
CMAKE_OPTIONS += \
        -DWITH_SSL=OFF
endif
ifdef CONFIG_PACKAGE_kalua-cyassl
CMAKE_OPTIONS += \
        -DWITH_CYASSL=1
endif

define Package/kalua/install
	$(INSTALL_DIR) $(1)/etc/kalua
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/etc/kalua/* $(1)/etc/kalua/
endef

$(eval $(call BuildPackage,kalua))
