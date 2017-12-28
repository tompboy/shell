#!/bin/bash
# Date:2017-08-30
# Author:Pboy Tom:)
# QQ:360254363/pboy@sina.cn
# E-mail:cylcjy009@gmail.com
# Website:www.pboy8.top pboy8.taobao.com
# Desc:Compare two files
# Debug: optimize for some variables...2017-12-28
# Version:V 0.1

TIM=`date +%Y_%m_%d_%H_%M`
DATE=`date -d"1 day ago" +"%Y_%m_%d"`

JK_DIR='/home/jk'
[ ! -e $JK_DIR ] && mkdir -p $JK_DIR
ER_LOG=`echo $JK_DIR`/error.log
date=`date`
DOM=www.baidu.com
cd $JK_DIR


wget -O index.html$TIM http://$DOM/ && grep -v "访问量" index.html$TIM >>index$TIM

[ $? = 0 ] && {
MDy=`md5sum index|awk '{print $1}'`
MDe=`md5sum index$TIM|awk '{print $1}'`
        if [ "$MDy" != "$MDe" ]; then
                #comm -13 index.html index.html$TIM >>$ER_LOG
                diff -B -b -c index index$TIM >>$ER_LOG
                diff -B -b -c index index$TIM >mail.txt
                mail -s "$DOM CAUTION." 188@139.com < mail.txt
        else 
                echo "OK...">>$ER_LOG
                echo -e "$date...">>$ER_LOG
        fi
} || { 
echo "Download files failed...">>$ER_LOG
echo -e "$date...">>$ER_LOG
}

rm -f index.html$DATE* index$DATE*