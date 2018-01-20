#############################################################
#
# wxwidgets
#
#############################################################

##### This sets up some base definitions: note applications do NOT use the download site
GTK_THEME_ARC_VERSION:=20170302
GTK_THEME_ARC_SOURCE:=$(GTK_THEME_ARC_VERSION).tar.gz
GTK_THEME_ARC_SITE:=https://github.com/horst3180/arc-theme/archive
#WXWIDGETS_DIR:=$(BUILD_DIR)/wxWidgets-$(WXWIDGETS_VERSION)
#GTK_THEME_ARC_AUTORECONF = YES
GTK_THEME_ARC_INSTALL_STAGING = NO
GTK_THEME_ARC_INSTALL_TARGET = YES
GTK_THEME_ARC_DEPENDENCIES = libgtk2

#Configure for gtk2 only
GTK_THEME_ARC_CONF_OPTS = --disable-transparency --disable-gtk3 --disable-metacity --disable-unity --disable-xfwm

define GTK_THEME_ARC_BUILD_CMDS
	cd $(GTK_THEME_ARC_DIR) && ./autogen.sh --prefix=$(TARGET_DIR)/usr --disable-transparency --disable-gtk3 --disable-metacity --disable-unity --disable-xfwm --disable-cinnamon --disable-gnome-shell --with-gnome=
	cd $(GTK_THEME_ARC_DIR) && $(MAKE)
endef

define GTK_THEME_ARC_INSTALL_TARGET_CMDS
	cd $(GTK_THEME_ARC_DIR) && $(MAKE) install
endef

$(eval $(generic-package))

