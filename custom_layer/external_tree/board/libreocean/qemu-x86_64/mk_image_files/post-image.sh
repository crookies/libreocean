#!/bin/sh

BUILD_DIR="/opt/crookiesdev/buildroot-git/buildroot/output"
BINARIES_DIR="/opt/crookiesdev/buildroot-git/buildroot/output/images"
TARGET_DIR="/opt/crookiesdev/buildroot-git/buildroot/output/target"
GENIMAGE=${BUILD_DIR}/host/usr/bin/genimage

BOARD_DIR="$(dirname $0)"
GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"

#cp ${BOARD_DIR}/boot.ini ${BINARIES_DIR}/

rm -rf "${GENIMAGE_TMP}"

${GENIMAGE}                           \
	--rootpath "${TARGET_DIR}"     \
	--tmppath "${GENIMAGE_TMP}"    \
	--inputpath "${BINARIES_DIR}"  \
	--outputpath "${BINARIES_DIR}" \
	--config "${GENIMAGE_CFG}"

#dd if=${BINARIES_DIR}/u-boot.bin of=${BINARIES_DIR}/sdcard.img bs=1 count=442 conv=sync,notrunc
#dd if=${BINARIES_DIR}/u-boot.bin of=${BINARIES_DIR}/sdcard.img bs=512 skip=1 seek=1 conv=fsync,notrunc
