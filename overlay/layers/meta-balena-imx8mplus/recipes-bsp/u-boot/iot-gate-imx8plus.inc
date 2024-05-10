SRCREV = "436b70159e2567daae8bd619e67272cf2439122e"

SRC_URI:append = " \
	file://0001-Revert-remove-include-config_defaults.h.patch \
	file://0001-iot-gate-imx8plus-Increase-default-ENV-size.patch \
	file://0003-integrate-with-balenaOS.patch \
	file://0006-Run-CRC32-checks-on-kernel-image-and-fdt.patch \
"
