# 
# Copyright (C) 2014 Pau Escrich
#
# This is free software, licensed under the GNU General Public License v3.
#

include ../../libremesh.mk

define Package/$(PKG_NAME)
  CATEGORY:=LibreMesh
  TITLE:=bmx7 auto Internet gateway module 
  MAINTAINER:=Pau Escrich <p4u@dabax.et>
  URL:=http://libremesh.org
  DEPENDS:=+bmx7 +watchping +ip
  PKGARCH:=all
endef

define Package/$(PKG_NAME)/description
	Watchping hooks to set bmx7 Internet automatic announcements
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
