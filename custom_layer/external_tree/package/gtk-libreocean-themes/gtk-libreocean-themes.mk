#############################################################
#
# wxwidgets
#
#############################################################

##### This sets up some base definitions: note applications do NOT use the download site
GTK_LIBREOCEAN_THEMES_VERSION:=1_0
GTK_LIBREOCEAN_THEMES_SITE:=file://gtk-libreocean-themes
GTK_LIBREOCEAN_THEMES_SOURCE:=gtk-libreocean_ext_$(GTK_LIBREOCEAN_THEMES_VERSION).tar.gz
GTK_LIBREOCEAN_THEMES__INSTALL_STAGING = NO
GTK_LIBREOCEAN_THEMES__INSTALL_TARGET = YES
GTK_THEME_ARC_DEPENDENCIES = libgtk2

define GTK_LIBREOCEAN_THEMES_BUILD_CMDS
endef

define GTK_LIBREOCEAN_THEMES_INSTALL_TARGET_CMDS
   	cp -ra $(GTK_LIBREOCEAN_THEMES_DIR)/icons/* $(TARGET_DIR)/usr/share/icons
endef

$(eval $(generic-package))

