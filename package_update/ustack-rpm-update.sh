#!/bin/bash

#==========================================
# Program   : update_yum_source.sh
# Info      : 定期同步官方 yum 源到本机
# Version   : 2010.01.28    First Release
#==========================================


Date=`date +%Y%m%d`
LogFile="/var/logs/update_yum_source.log"
ReceiveMail="jiangwt100@gmail.com"

RsyncBin="/usr/bin/rsync"
#RsyncPerm="-avzrt --progress --delete --exclude=debug/  --exclude=isos/ --log-file /var/log/rsync"
RsyncPerm="-avzrt --progress --delete --exclude=debug/ --log-file /var/log/rsync"
#YumSiteList="rsync://repos.fedorapeople.org/repos/openstack/openstack-trunk/el6"
YumSiteList="rsync://mirrors4.ustc.edu.cn/centos"
CentOS_Path="/data1/mirrors/centos"

##============ epel ==============
#epelSite="rsync://mirrors.sohu.com/fedora-epel/"
#epelLocalPath="/data/soft/mirror.mysite.com/epel"

# rpmforge
rpmforgeSite="rsync://apt.sw.be/freshrpms/pub/dag/redhat/el5/"
rpmforgeLocalPath="/data/soft/mirror.mysite.com/rpmforce"



echo "---- $Date `date +%T` Begin ----" >> $LogFile

PNUM=`ps aux|grep rsync | grep "$CentOS_Path"`

# centos
echo $RsyncPerm $YumSiteList $CentOS_Path
rsync $RsyncPerm $YumSiteList $CentOS_Path 2>&1 >> $LogFile

# epel
#$RsyncBin $RsyncPerm  --exclude=4/ --exclude=4AS/ --exclude=4AS/ \
#--exclude=4WS/ --bwlimit=500 $epelSite $epelLocalPath >> $LogFile

# rpmforge
#$RsyncBin $RsyncPerm $rpmforgeSite $rpmforgeLocalPath >> $LogFile

echo  "---- $Date `date +%T` End ----" >> $LogFile

#/bin/mail -s "opt001 - update yum source - $Date" $ReceiveMail<$LogFile
