PACKAGES:remove:compulab-mx8mp = "initramfs-module-migrate"
do_install:append:compulab-mx8mp() {
	rm -f ${D}/init.d/92-migrate
}
