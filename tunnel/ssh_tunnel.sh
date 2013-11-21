#!/bin/bash
cd /tmp
tsocks wget google.com >> /dev/null
t=`echo $?`
if [ $t -gt 0 ]
   then 
      killall ssh
      ssh -i /root/.ssh/sws_ci.pem  -D 127.0.0.1:7070 -N -vv ubuntu@54.251.104.91 >> /var/log/ssh_tunnel
else 
   echo `date` >> /var/log/ssh_tunnel
   echo "ssh tunnel is ok now" >> /var/log/ssh_tunnel
fi

