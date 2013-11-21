#!/bin/bash

#==========================================
# Program   : update_yum_source.sh
# Info      : 定期同步官方 yum 源到本机
# Version   : 2010.01.28    First Release
#==========================================


Date=`date +%Y%m%d`
LogFile="/var/logs/update_yum_source.log"
ReceiveMail="yuxcer@gmail.com"

RsyncBin="/usr/bin/rsync"
RsyncPerm="-avzrt --progress --delete --exclude=debug/  --exclude=isos/ --log-file /var/log/rsync"
YumSiteList="rsync://yum.theforeman.org/releases/latest/"
CentOS_Path="/data1/mirrors/foreman"


echo "---- $Date `date +%T` Begin ----" >> $LogFile

PNUM=`ps aux|grep rsync | grep "$CentOS_Path"`

# centos
echo $RsyncPerm $YumSiteList $CentOS_Path
rsync $RsyncPerm $YumSiteList $CentOS_Path 2>&1 >> $LogFile

echo  "---- $Date `date +%T` End ----" >> $LogFile

#/bin/mail -s "opt001 - update yum source - $Date" $ReceiveMail<$LogFile
