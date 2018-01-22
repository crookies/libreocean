#!/bin/bash

set -e

B_DIR="$(dirname $0)"
cp $B_DIR/config.txt ${BINARIES_DIR}/rpi-firmware/config.txt
sh $B_DIR/post-image-std.sh $@

exit $?
