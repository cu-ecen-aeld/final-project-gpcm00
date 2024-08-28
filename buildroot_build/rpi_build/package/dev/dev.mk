################################################################################
#
# DEV
#
################################################################################

# DEV_VERSION = '9208ec8'
DEV_SITE = '/home/gpcm/documents/tmp/linux-driver-tutorial/Linux_Driver_Tutorial'
DEV_SITE_METHOD = local
# DEV_GIT_SUBMODULES = YES
DEV_LICENSE = 'Dual BSD/GPL'
DEV_LICENSE_FILES = COPYING
DEV_MODULE_SUBDIRS = 21_dt_gpio 
# DEV_MODULE_SUBDIRS += scull

define DEV_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/21_dt_gpio dt
endef

define DEV_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/21_dt_gpio/powmodul.dtbo $(BINARIES_DIR)/rpi-firmware/overlays/pownmodul.dtbo
	$(INSTALL) -m 0755 $(@D)/21_dt_gpio/testoverlay.dtbo $(BINARIES_DIR)/rpi-firmware/overlays/testoverlay.dtbo
endef

$(eval $(kernel-module))
$(eval $(generic-package))
