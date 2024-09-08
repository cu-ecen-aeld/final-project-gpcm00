##############################################################
#
# RPI
#
##############################################################

RPI_VERSION = '2b5f0dc'
RPI_SITE = 'git@github.com:gpcm00/power-modulator.git'
RPI_SITE_METHOD = git
RPI_GIT_SUBMODULES = YES
RPI_LICENSE = 'Dual BSD/GPL'
RPI_LICENSE_FILES = COPYING
RPI_MODULE_SUBDIRS = hello_module
RPI_MODULE_SUBDIRS += devices/powercontrol

define RPI_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/devices/powercontrol dt
endef

define RPI_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/test $(TARGET_DIR)/test
	$(INSTALL) -m 0755 $(@D)/devices/powercontrol/powctl.dtbo $(BINARIES_DIR)/rpi-firmware/overlays/powctl.dtbo
endef

$(eval $(kernel-module))
$(eval $(generic-package))
