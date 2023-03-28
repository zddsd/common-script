#!/bin/bash
#MYDATE=`date -d '7 days ago' +"%Y-%m-%d"`
#echo $MYDATE
#上传至ftp
ftp -n<<EOF
open [ip] [port]
user [username] [password]
#passive	
binary
#hash
cd /
lcd /data/logbak
prompt off
mkdir `date +"%Y%m%d"`
cd `date +"%Y%m%d"`
mput *
close
bye
EOF
echo "commit to ftp successfully"