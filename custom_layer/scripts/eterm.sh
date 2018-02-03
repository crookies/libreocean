#!/bin/sh
#
#set -x


sudo minicom -b 115200 -8 -o -D /dev/$1

