#!/bin/bash
##### OPTIONS VERIFICATION #####
if [[ -z "$1" ]]; then
  echo 0;
  exit 0;
fi
CODE="$1"
FILE="/etc/zabbix/out/app.cat"
REZ=`cat $FILE | awk {'if ($2=='$CODE') {print $1}'}`
let "REZ2 = REZ * 1"
echo $REZ2
DAT=`date`
exit 0
