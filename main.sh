#! /bin/bash

logfile="/var/oscamlog/oscam1check.log"

case "$(pidof oscam1 | wc -w)" in

0)  echo "oscam1 not running, restarting oscam1:     $(date)" >> $logfile
    /usr/local/bin/oscam1 -b -c /usr/local/etc/oscam1 -t /usr/local/tmp.oscam1 &
    ;;
2)  echo "oscam1 running, all OK:     $(date)" >> $logfile
    ;;
*)  echo "multiple instances of oscam1 running. Stopping & restarting oscam1:     $(date)" >> $logfile
    kill $(pidof oscam1 | awk '{ $1=""; print $0}')
    ;;
esac
