#/bin/bash
called=$_
if [[ $called == $0 ]]; then 
	echo "ERROR: Script is being run, you need to source it----!!";
	echo
	return;
fi
SETENV=${BASH_SOURCE[@]}
#LO_ROOT_DIR is the directory where Libreocean has been installed
LIBREOCEAN_ROOT_DIR=$(dirname "$(realpath "$SETENV")")

#if dl does not exists, then exit
if [ ! -h "$LIBREOCEAN_ROOT_DIR/dl" ]; then
	echo "ERROR: dl must be a soft link to your download directory----!!";
	echo
	return;
fi

#Create a ccache file if it does not exists
if [ ! -d "$LIBREOCEAN_ROOT_DIR/ccache" ]; then
  mkdir $LIBREOCEAN_ROOT_DIR/ccache
fi

#Create an output file if it does not exists
if [ ! -d "$LIBREOCEAN_ROOT_DIR/output" ]; then
  mkdir $LIBREOCEAN_ROOT_DIR/output
fi

PATH=$LIBREOCEAN_ROOT_DIR/custom_layer/scripts:$PATH
BR2_EXTERNAL=$LIBREOCEAN_ROOT_DIR/custom_layer/external_tree

export BR2_EXTERNAL
export LIBREOCEAN_ROOT_DIR

LOTD=$LIBREOCEAN_ROOT_DIR/.libreocean_last_target_root_dir
if [ -f $LOTD ] ; then
	cd $(cat $LOTD)
else
	clear
	echo
	echo "WARNING: No target initialised ----------"
        echo "         Use lo_init_target.sh to select and/or init target----!!";
	echo
fi

echo "======================================================="
echo "            LibreOcean environment installed           "
echo "                                                       "
echo " Use lo_init_target.sh to start working on target.     "
echo " BR2_EXTERNAL = ${BR2_EXTERNAL}                        "
echo "                                                       "

