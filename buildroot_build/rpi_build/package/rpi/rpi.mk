##############################################################
#
# RPI
#
##############################################################

RPI_VERSION = '392ff48'
RPI_SITE = 'git@github.com:gpcm00/power-modulator.git'
RPI_SITE_METHOD = git
RPI_GIT_SUBMODULES = YES

define RPI_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

define RPI_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/test $(TARGET_DIR)/test
endef

$(eval $(generic-package))
