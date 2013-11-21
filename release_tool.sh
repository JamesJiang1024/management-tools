#!/bin/bash

SCRIPT_NAME=$(basename $0)
SCRIPT_HOME=$(dirname $0)
SAGEUSB=${SAGEUSB-:/data1/release/sage-usb}
SAGE_TARGET=${SAGE_TARGET-:/data1/mirrors/uos/dailybuild}
TARGET_ISO_NAME=${TARGET_ISO_NAME-:uOS.iso}
NEED_SYNC=${NEED_SYNC-:1}
SYNC_TARGET=${SYNC_TARGET-:root@192.168.10.3:/home/uos/dailybuild/}

function show_options(){
      echo "Usage $SCRIPT_NAME [options] command name"
      echo 
      echo "Manage dailybuid and release of uos"
      echo "DailyBuild Command:" 
      echo "   daily-build    -- command to dailybuild"
      echo "Release Command:" 
      echo "   release        -- command to release"
}

$SAGEUSB/iso.sh
cp -f $SAGEUSB/uOS.iso $SAGE_TARGET/$TARGET_ISO_NAME
rsync -rP $SAGE_TARGET/* $SYNC_TARGET 
