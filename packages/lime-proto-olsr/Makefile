#
# Copyright (C) 2006-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v3.
#

include ../../libremesh.mk

define Package/$(PKG_NAME)
	TITLE:=LiMe OLSR proto support (IPv4)
	CATEGORY:=LibreMesh
	MAINTAINER:=leonaard <leone@inventati.org>
	URL:=http://libremesh.org
	DEPENDS:=+lua +libuci-lua +lime-system +olsrd +olsrd-mod-jsoninfo +kmod-ipip +luci-lib-ip \
		 +luci-lib-nixio
	PKGARCH:=all
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
