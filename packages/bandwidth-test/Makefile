# 
# Copyright (C) 2019 Ilario Gelmetti
#
# This is free software, licensed under the GNU General Public License v3.
#

include ../../libremesh.mk

define Package/$(PKG_NAME)
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Internet download bandwidth measurement
  MAINTAINER:=Ilario Gelmetti <iochesonome@gmail.com>
  URL:=https://libremesh.org
  DEPENDS:=+pv
  PKGARCH:=all
endef

define Package/$(PKG_NAME)/description
  	Measure the maximum available bandwidth towards the internet, in the download direction.
	Downloading a list of files via HTTP connections.
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
