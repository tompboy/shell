#!/bin/sh
# Date:2018-01-16
# Author:Pboy Tom:)
# QQ:360254363/pboy@sina.cn
# E-mail:cylcjy009@gmail.com
# Website:www.pboy8.top pboy8.taobao.com
# Desc:Check your website status..
# Debug: optimize for some variables...2018-01-16
# Version:V 0.1

cat url.txt|while read URL;do 
U_STAT=`curl -I -s $URL |grep HTTP|awk '{print$2}'`
if [ 3$U_STAT -ne 3200 -o 3$U_STAT -ne 3301 -o 3$U_STAT -ne 3302 ]
then
echo -e "$URL not ok..">mail.txt
mail -s "$URL CAUTION." 188@139.com < mail.txt 
fi
done
