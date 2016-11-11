#!/bin/bash

#Perso source file for android dev

################################################################
#VARS : 

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
	export PATH=${BASE_PATH}:${LOCAL_JAVA_PATH}/bin:$PATH
	cd ${BASE_PATH}
	export JAVA_HOME=$LOCAL_JAVA_PATH
	export JDK_HOME=$LOCAL_JAVA_PATH
	
	cd ${BASE_PATH}
	
	GCC_PATH=`pwd`/prebuilts/gcc/linux-x86/arm/arm-eabi-4.8/bin
	export PATH=$GCC_PATH:$PATH
	
	if [ -f ${BASE_PATH}/build/envsetup.sh ]
	then
		export USE_CCACHE=1
		export CCACHE_DIR=${BASE_PATH}/.ccache	
		source ${BASE_PATH}/build/envsetup.sh
		prebuilts/misc/linux-x86/ccache/ccache -M $CCACHE_SIZE
		croot
		lunch aosp_${PRODUCT}-${PRODUCT_TYPE}
	else 
		msg_err "!!!envsetup.sh does not exists , did you init & synced ? : "
		msg_err "    repo init -u https://github.com/alexmaloteaux/android_chagall_klimt -b nougat-release"
		msg_err "    repo sync"
	fi	
}

EXIT=0
#zsh lead to issue
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


BASE_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! -f ${BASE_PATH}/repo ]
then
	msg_err "!!!repo binary no found in $BASE_PATH"
	msg_err "    curl https://storage.googleapis.com/git-repo-downloads/repo > ${BASE_PATH}/repo"
	return
fi

# Creates a directory, venv/, containing the Virtualenv
#virtualenv2 venv 
if [ ! -d "venv" ]
then
	msg_err "venv does not exists, create it with 'virtualenv2 venv'"
	return
else
	source venv/bin/activate
fi

if [ ! -x ${BASE_PATH}/repo ]
then
	msg_err "!!!repo binary is not executable"
	return
fi

export LANG=C
sourcing

