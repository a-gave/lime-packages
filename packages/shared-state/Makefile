#
# Copyright (C) 2019-2020 Gioacchino Mazzurco <gio@altermundi.net>
#
# This is free software, licensed under the GNU Affero General Public License v3.
#

include ../../libremesh.mk

define Package/$(PKG_NAME)
	TITLE:=Very minimal state sharing betwen nodes
	CATEGORY:=LibreMesh
	MAINTAINER:=Gioacchino Mazzurco <gio@altermundi.net>
	URL:=http://libremesh.org
	DEPENDS:=+libuci-lua +lime-system +lua +luci-lib-jsonc +luci-lib-nixio \
		+iputils-ping +uclient-fetch
	PKGARCH:=all
endef

define Package/$(PKG_NAME)/description
	LiMe style minimal unsecured CRDT to share light state between nodes
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
