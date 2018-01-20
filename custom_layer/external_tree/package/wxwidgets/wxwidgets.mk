#############################################################
#
# wxwidgets
#
#############################################################

##### This sets up some base definitions: note applications do NOT use the download site
WXWIDGETS_VERSION:=3.0.3
WXWIDGETS_SOURCE:=wxWidgets-$(WXWIDGETS_VERSION).tar.bz2
WXWIDGETS_SITE:=https://github.com/wxWidgets/wxWidgets/releases/download/v$(WXWIDGETS_VERSION)
#WXWIDGETS_DIR:=$(BUILD_DIR)/wxWidgets-$(WXWIDGETS_VERSION)
WXWIDGETS_INSTALL_STAGING = YES
WXWIDGETS_INSTALL_TARGET = YES
#WXWIDGETS_CONF_OPTS = --disable-shared
WXWIDGETS_DEPENDENCIES = libgtk2

#these options are fixes for newer compilers
WXWIDGETS_CONF_ENV = CXXFLAGS="${TARGET_CXXFLAGS} -std=gnu++11"

$(eval $(autotools-package))

define WXWIDGETS_POST_INSTALL_FIXUP
	#The wx-config link created by install points to an invalid absolute location. Fix it.
	rm $(STAGING_DIR)/usr/bin/wx-config
	ln -s $(STAGING_DIR)/usr/lib/wx/config/* $(STAGING_DIR)/usr/bin/wx-config
endef

WXWIDGETS_POST_INSTALL_STAGING_HOOKS += WXWIDGETS_POST_INSTALL_FIXUP

