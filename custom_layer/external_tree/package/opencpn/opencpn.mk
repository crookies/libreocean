################################################################################
#
# opencpn
#
################################################################################


OPENCPN_VERSION = c4f53bea005fb320b113bb3aea37ae09b471535c
OPENCPN_SITE = $(call github,OpenCPN,OpenCPN,$(OPENCPN_VERSION))
OPENCPN_LICENSE = GPL
OPENCPN_LICENSE_FILES = COPYING
OPENCPN_INSTALL_STAGING = YES
OPENCPN_SUPPORTS_IN_SOURCE_BUILD = NO
OPENCPN_DEPENDENCIES = wxwidgets host-cmake bzip2 gpsd kbd portaudio tinyxml libcurl
ifeq ($(BR2_PACKAGE_LUAJIT),y)
OPENCPN_DEPENDENCIES += luajit
else
OPENCPN_DEPENDENCIES += lua
endif

$(eval $(cmake-package))

define OPENCPN_POST_INSTALL_TARGET_FIXUP
	#The following libraries are not deployed so do it now.
	for so in libNMEA0183 libGARMINHOST libMIPMAP libS57ENC libSYMBOLS libTEXCMP libWXCURL libWXSVG ; do \
	   $(INSTALL) -D -m 0777 $(@D)/buildroot-build/$$so.so $(TARGET_DIR)/usr/lib/$$so.so ; \
	done ; \

endef

OPENCPN_POST_INSTALL_TARGET_HOOKS += OPENCPN_POST_INSTALL_TARGET_FIXUP

