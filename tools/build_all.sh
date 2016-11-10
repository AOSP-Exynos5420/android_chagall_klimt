#!/bin/bash

CLEAN=1
OUT_DIR=/tmp/SG_TABS
type="userdebug"
products="chagalllte chagallwifi klimtlte klimtwifi"

msg_err(){
	echo -e '\E[40;31m'"\033[1m${1}\033[0m"
}

EXIT=0
if [[ ! $_ != $0 ]]
then
	msg_err "This script should be sourced from a working dev environment , not called as a subshell"
	EXIT=1
fi
if [ $EXIT == 1 ]; then exit; fi

if [ ! -d $OUT_DIR ]
then
	msg_err "${OUT_DIR} dir does not exists"
	EXIT=1
fi
if [ $EXIT == 1 ]; then exit; fi

if [ $CLEAN == 1 ]
then
	make clean
fi

DATE_TAG=$(date +%Y%m%d)
for product in $products
do
  lunch aosp_${product}-$type
  make -j 9 otapackage 
  OUT_FILE=${OUT_DIR}/aosp_${product}-${type}-${DATE_TAG}.zip
  cp out/target/product/${product}/aosp_${product}-ota-eng.*.zip $OUT_FILE
  md5sum $OUT_FILE > ${OUT_FILE}.md5
done
