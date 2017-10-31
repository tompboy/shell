#!/bin/bash
# Date:2017-08-30
# Author:Pboy Tom:)
# QQ:360254363/pboy@sina.cn
# E-mail:cylcjy009@gmail.com
# Website:www.pboy8.top pboy8.taobao.com
# Desc:Compare two files
# Version:V 0.1

TIM=`date +%Y_%m_%d_%H_%M`
DATE=`date -d"1 day ago" +"%Y_%m_%d"`
ER_LOG=/home/jk/error.log
date=`date`

cd /home/jk


[ $? = 0 ] && {
MDy=`md5sum index|awk '{print $1}'`
MDe=`md5sum index$TIM|awk '{print $1}'`
        if [ "$MDy" != "$MDe" ]; then
                #comm -13 index.html index.html$TIM >>$ER_LOG
                diff -B -b -c index index$TIM >>$ER_LOG
                diff -B -b -c index index$TIM >mail.txt
        else 
                echo "OK...">>$ER_LOG
                echo -e "$date...">>$ER_LOG
        fi
} || { 
echo "Download files failed...">>$ER_LOG
echo -e "$date...">>$ER_LOG
}

rm -f index.html$DATE* index$DATE*
