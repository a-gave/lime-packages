#
# Copyright (C) 2019 Gioacchino Mazzurco <gio@altermundi.net>
#
# This is free software, licensed under the GNU Affero General Public License v3.
#

include ../../libremesh.mk

define Package/$(PKG_NAME)
	TITLE:=WiFI links information module for shared-state
	CATEGORY:=LibreMesh
	MAINTAINER:=Asociación Civil Altermundi <info@altermundi.net>
	DEPENDS:=+lua +luci-lib-jsonc +ubus-lime-utils \
		+lime-system +libiwinfo-lua +shared-state-ref_state_commons shared-state-async 
	PKGARCH:=all
endef

define Package/$(PKG_NAME)/description
	Syncronize links information beween nodes.
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
