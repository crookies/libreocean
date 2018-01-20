#!/bin/bash

set -e

B_DIR="$(dirname $0)"
cp $B_DIR/config.txt ${BINARIES_DIR}/rpi-firmware/config.txt
sh $B_DIR/../../raspberrypi3/post-image.sh $@

exit $?
