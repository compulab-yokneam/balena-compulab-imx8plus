FILESEXTRAPATHS:prepend := "${THISDIR}/patches:${THISDIR}/imx8mp:"

UBOOT_KCONFIG_SUPPORT = "1"
inherit resin-u-boot
DEPENDS = "bison-native"

BALENA_DEVICE_FDT_ADDR_VAR ?= "fdt_addr_r"

# Pin to last working version for now, because upstream changes
# have been breaking applying of patches multiple times already
SRCREV = "7acba54d1fbac38d1b3441e876abc9654a1e2c2a"

SRC_URI:append = " \
	file://0001-Revert-remove-include-config_defaults.h.patch \
	file://0002-iot-gate-imx8plus-Increase-default-ENV-size.patch \
	file://0003-integrate-with-balenaOS.patch \
	file://0004-Run-CRC32-checks-on-kernel-image-and-fdt.patch \
	file://0005-integrate-with-balenaOS-1.patch \
	file://0006-enable-xtrace-debug.patch \
"

do_configure () {
    cp ${S}/scripts/kconfig/merge_config.sh ${B}/
    if [ -n "${UBOOT_CONFIG}" ]; then
        unset i j
        for config in ${UBOOT_MACHINE}; do
            i=$(expr $i + 1);
            for type in ${UBOOT_CONFIG}; do
                j=$(expr $j + 1);
                if [ $j -eq $i ]; then
                    oe_runmake -C ${S} O=${B}/${config} ${config}
                    if [ -n "${@' '.join(find_cfgs(d))}" ]; then
                        ./merge_config.sh -m -O ${B}/${config} ${B}/${config}/.config ${@" ".join(find_cfgs(d))}
                        oe_runmake -C ${S} O=${B}/${config} oldconfig
                    fi
                fi
            done
            unset j
        done
        unset i
        DEVTOOL_DISABLE_MENUCONFIG=true
    else
        if [ -n "${UBOOT_MACHINE}" ]; then
            oe_runmake -C ${S} O=${B} ${UBOOT_MACHINE}
        else
            oe_runmake -C ${S} O=${B} oldconfig
        fi
        merge_config.sh -m .config ${@" ".join(find_cfgs(d))}
        cml1_do_configure
    fi
}

do_unpack[nostamp]="1"
do_patch[nostamp]="1"
do_configure[nostamp] = "1"
do_compile[nostamp] = "1"
