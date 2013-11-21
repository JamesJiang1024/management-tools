#!/bin/bash

SAGEUSB=${SAGEUSB-:/data1/release/sage-usb}
SAGE_TARGET=${SAGE_TARGET-:/data1/mirrors/uos/dailybuild}
TARGET_ISO_NAME=${TARGET_ISO_NAME-:uOS.iso}
NEED_SYNC=${NEED_SYNC-:1}
SYNC_TARGET=${SYNC_TARGET-:root@192.168.10.3:/home/uos/dailybuild/}

$SAGEUSB/iso.sh
cp -f $SAGEUSB/uOS.iso $SAGE_TARGET/$TARGET_ISO_NAME
rsync -rP $SAGE_TARGET/* $SYNC_TARGET 
