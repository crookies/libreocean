#/bin/bash
set +x
if [ "$LIBREOCEAN_ROOT_DIR" = "" ]; then
    echo "Libreocean env not configured!!!!!"
    exit
fi

if [[ "$1" =~ ^(qemu-x86_64|rpi3|odroidc2|odroidxu4)$ ]]; then
	LIBREOCEAN_TARGET=$1
	shift
else
    echo "first parameter must be qemu-x86_64|rpi3|odroidc2|odroidxu4"
    exit
fi

LIBREOCEAN_TARGET_ROOT_DIR=$LIBREOCEAN_ROOT_DIR/output/$LIBREOCEAN_TARGET

echo
echo "Target root dir: $LIBREOCEAN_TARGET_ROOT_DIR"

if [ ! -d $LIBREOCEAN_TARGET_ROOT_DIR ] ; then
   mkdir $LIBREOCEAN_TARGET_ROOT_DIR;
   cd $LIBREOCEAN_TARGET_ROOT_DIR;
   make O=$PWD -C $LIBREOCEAN_ROOT_DIR/buildroot libreocean_${LIBREOCEAN_TARGET}_defconfig;
fi

echo -n ${LIBREOCEAN_TARGET_ROOT_DIR} > ${LIBREOCEAN_ROOT_DIR}/.libreocean_last_target_root_dir

echo "You should exit this shell and re-define the environment OR resource setenv.sh"
echo


