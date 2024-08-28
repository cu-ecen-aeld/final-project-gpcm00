##############################################################
#
# RPI
#
##############################################################

RPI_VERSION = '06a3f8f'
RPI_SITE = 'git@github.com:gpcm00/power-modulator.git'
RPI_SITE_METHOD = git
RPI_GIT_SUBMODULES = YES
RPI_LICENSE = 'Dual BSD/GPL'
RPI_LICENSE_FILES = COPYING
RPI_MODULE_SUBDIRS = hello_module
RPI_MODULE_SUBDIRS += devices/powermodul

define RPI_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/devices/powermodul dt
endef

define RPI_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/test $(TARGET_DIR)/test
	$(INSTALL) -m 0755 $(@D)/devices/powermodul/powmodul.dtbo $(BINARIES_DIR)/rpi-firmware/overlays/pownmodul.dtbo
endef

$(eval $(kernel-module))
$(eval $(generic-package))
