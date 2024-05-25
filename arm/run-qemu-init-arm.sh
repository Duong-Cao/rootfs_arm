#!/bin/bash

KERNEL=~/linux-stable/arch/arm/boot/zImage
DTB=~/linux-stable/arch/arm/boot/dts/versatile-pb.dtb
INITRAMFS=/home/duogcao/initramfs.cpio.gz

if [ ! -f ${KERNEL} ]; then
	echo "${KERNEL} does not exist"
	exit 1
fi
if [ ! -f ${DTB} ]; then
	echo "${DTB} does not exist"
	exit 1
fi

QEMU_AUDIO_DRV=none \
qemu-system-arm -m 256M -nographic -M versatilepb -kernel ${KERNEL} -append "console=ttyAMA0,115200 rdinit=/sbin/init" -dtb ${DTB} -initrd ${INITRAMFS}

