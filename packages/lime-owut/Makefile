include $(TOPDIR)/rules.mk

PKG_NAME:=lime-owut
PKG_SOURCE_DATE:=2026-08-24
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=06139f3ad65c7971c6cc97c390dacde78f1dbe11
PKG_SOURCE_URL:=https://github.com/a-gave/owut.git
PKG_MIRROR_HASH:=035f319a43da7a3b3148ca9302a20763871ae91b82df514356886ba5c9b3602d

PKG_MAINTAINER:=Samuele Longhi <agave@dracaena.it>
PKG_LICENSE:=GPL-2.0-only

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=owut - an OpenWrt Upgrade Tool for LibreMesh
  URL:=https://github.com/efahl/owut
  DEPENDS:=+attendedsysupgrade-common \
    +rpcd-mod-file \
    +ucode +ucode-mod-fs +ucode-mod-ubus \
    +ucode-mod-uci +ucode-mod-uclient +ucode-mod-uloop
  PKGARCH:=all
  DEFAULT:=y if (BUILDBOT && !SMALL_FLASH)
endef

define Package/$(PKG_NAME)/description
  The OpenWrt Upgrade Tool (owut) is a command line program that
  checks for new packages, package build breakages, generates
  sysupgrade images containing installed packages and installs
  images.  It is written in ucode for easy end-user customization.

  Documentation is available at
  https://openwrt.org/docs/guide-user/installation/sysupgrade.owut
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/conffiles
/etc/owut.d/
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/files/owut.defaults $(1)/etc/uci-defaults/51-attendedsysupgrade-owut

	$(INSTALL_DIR) $(1)/etc/owut.d
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/pre-install.sh $(1)/etc/owut.d/pre-install.sh

	$(INSTALL_DIR) $(1)/usr/share/ucode/utils
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/argparse.uc $(1)/usr/share/ucode/utils

	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/owut $(1)/usr/bin

	sed -i -e "s/%%VERSION%%/$(PKG_VERSION)-r$(PKG_RELEASE)/" $(1)/usr/bin/owut
	sed -i -e "s/%%VERSION%%/$(PKG_VERSION)-r$(PKG_RELEASE)/" $(1)/usr/share/ucode/utils/argparse.uc

	# Remove comments and empty lines
	sed -i -e '/^[ \t]*\/\//d' -e '/^$$$$/d' $(1)/usr/bin/owut
	sed -i -e '/^[ \t]*\/\//d' -e '/^$$$$/d' $(1)/usr/share/ucode/utils/argparse.uc

	$(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
