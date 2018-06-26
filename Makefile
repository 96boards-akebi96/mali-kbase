TOP_DIR ?= ${CURDIR}

MFLAGS=\
	INSTALL_MOD_STRIP=1 \
	INSTALL_MOD_PATH=${MAKETOP}

MIDGARD_DIR=${TOP_DIR}/drivers/gpu/arm/midgard
MIDGARD_MFLAGS=\
	CONFIG_MALI_MIDGARD=m \
	CONFIG_MALI_DEBUG=y \
	CONFIG_MALI_TRACE_TIMELINE=y \
	CONFIG_MALI_KUTF=n \
	CONFIG_MALI_IRQ_LATENCY=n \


all: modules

modules:
	make -C ${KERNEL_DIR} M=${MIDGARD_DIR} ${MFLAGS} ${MIDGARD_MFLAGS} modules
modules_install:
	make -C ${KERNEL_DIR} M=${MIDGARD_DIR} ${MFLAGS} ${MIDGARD_MFLAGS} modules_install
clean:
	make -C ${KERNEL_DIR} M=${MIDGARD_DIR} ${MFLAGS} ${MIDGARD_MFLAGS} clean

.PHONY: all modules_install clean modules

