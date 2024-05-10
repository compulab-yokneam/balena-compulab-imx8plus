SRCREV = "7acba54d1fbac38d1b3441e876abc9654a1e2c2a"

SRC_URI:append = " \
	file://10001-Revert-remove-include-config_defaults.h.patch \
	file://10002-iot-gate-imx8plus-Increase-default-ENV-size.patch \
	file://10003-integrate-with-balenaOS.patch \
	file://10004-Run-CRC32-checks-on-kernel-image-and-fdt.patch \
	file://10005-integrate-with-balenaOS-1.patch \
	file://10006-enable-xtrace-debug.patch \
"
