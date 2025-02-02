#!/bin/sh

echo "###########################"
echo "### BEFORE IMAGE CREATE ###"
echo "###########################"

BOARD_DIR="$(dirname $0)"

install -m 0644 -D $BOARD_DIR/extlinux.conf   $BINARIES_DIR/extlinux/extlinux.conf
install -m 0644 -D $BOARD_DIR/uboot-setup.img $BINARIES_DIR/boot.scr

exit 0
