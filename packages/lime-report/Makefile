#
# This is free software, licensed under the GNU General Public License v3.
#

include ../../libremesh.mk

define Package/$(PKG_NAME)
	TITLE:=LibreMesh status report utility
	CATEGORY:=LibreMesh
	MAINTAINER:=Ilario Gelmetti <iochesonome@gmail.com>
	URL:=https://libremesh.org
	PKGARCH:=all
endef

define Package/$(PKG_NAME)/description
	Outputs a report about the status and the main configuration
	of a LibreMesh node, useful for debugging and issues reporting.
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
