#!/bin/bash

#Perso source file for android dev

################################################################
#VARS : 

SOURCE_NAME="aosp_7_chagall_klimt"
LOCAL_JAVA_PATH="/usr/lib/jvm/java-8-openjdk"
#product : chagalllte chagallwifi klimtlte klimtwifi
PRODUCT=chagalllte
#type : eng  | user | userdebug
PRODUCT_TYPE=userdebug
CCACHE_SIZE=25G

################################################################

msg_err(){
	echo -e '\E[40;31m'"\033[1m${1}\033[0m"
}


sourcing() {
	export PATH=${BASE_PATH}/bin:${LOCAL_JAVA_PATH}/bin:$PATH
	cd ${BASE_PATH}
	export JAVA_HOME=$LOCAL_JAVA_PATH
	export JDK_HOME=$LOCAL_JAVA_PATH

	
	# Creates a directory, venv/, containing the Virtualenv
	#virtualenv2 venv 
	if [ -d "venv" ]
	then
	echo "venv"
		source venv/bin/activate
	fi
	
	# Fix build dependency
	#mkdir -p prebuilts/qemu-kernel/arm
	#touch prebuilts/qemu-kernel/arm/LINUX_KERNEL_COPYING
	
	cd ${SOURCE_DIR}
	
	GCC_PATH=`pwd`/prebuilts/gcc/linux-x86/arm/arm-eabi-4.8/bin
	export PATH=$GCC_PATH:$PATH
	
	if [ -f ${SOURCE_DIR}/build/envsetup.sh ]
	then
		export USE_CCACHE=1
		export CCACHE_DIR=${SOURCE_DIR}/.ccache	
		source ${SOURCE_DIR}/build/envsetup.sh
		prebuilts/misc/linux-x86/ccache/ccache -M $CCACHE_SIZE
		croot
		lunch aosp_${PRODUCT}-${PRODUCT_TYPE}
	else 
		msg_err "!!!envsetup.sh does not exists , did you init & synced ? : "
		msg_err "    repo init -u https://github.com/alexmaloteaux/android_chagall_klimt -b nougat-release"
		msg_err "    repo sync"
	fi	
}


#zsh lead to issue
EXIT=0
if [ "$(echo $0)" != "bash" ] && [ "$(echo $0)" != "/bin/bash" ]; then
	echo "!!!Only BASH is supported!!!"
	EXIT=1
fi
#compat with zsh
if [ $EXIT == 1 ]; then exit; fi

if [[ ! $_ != $0 ]]
then
	msg_err "This script should be sourced from a working dev environment , not called as a subshell"
	EXIT=1
fi
if [ $EXIT == 1 ]; then exit; fi

BIN_PATH="$( dirname ${BASH_SOURCE[0]} )"

if [ ! "$BIN_PATH" =~ "(.)*/bin" ]; then
	msg_err "!!!The source script should be located in a bin directory"
	return
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! -f ${DIR}/repo ]
then
	msg_err "!!!repo binary no found in $DIR"
	msg_err "    curl https://storage.googleapis.com/git-repo-downloads/repo > ${DIR}/repo"
	return
fi

BASE_PATH="$(dirname ${DIR})"
SOURCE_DIR="${BASE_PATH}/${SOURCE_NAME}"
export LANG=C

if [ ! -d "$SOURCE_DIR" ]; then
	msg_err "!!!Directory $SOURCE_DIR does not exists ..."
else
	echo "Started sourcing"
	sourcing
	echo "Finished sourcing"
fi
