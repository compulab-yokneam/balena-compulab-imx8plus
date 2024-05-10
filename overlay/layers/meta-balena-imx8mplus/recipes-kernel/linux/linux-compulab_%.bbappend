FILESEXTRAPATHS:prepend := "${THISDIR}/linux-compulab:"
inherit kernel-resin

DEPENDS += "rsync-native"

SRC_URI:append = "file://balena.cfg"

KERNEL_CONFIG:iot-gate-imx8plus = "iot-gate-imx8plus_defconfig compulab.config"
KERNEL_CONFIG:iot-gate-imx8plus-d1d8 = "iot-gate-imx8plus_defconfig compulab.config"

# Fixes issue where cryptodev module is installed
# along with the kernel image in the initramfs
KERNEL_PACKAGE_NAME="kernel"

# Fixes module loading
SCMVERSION="n"
