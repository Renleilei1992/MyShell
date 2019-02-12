#!/bin/bash

#================================================================
#   Copyright (C) 2018 Renleilei. All rights reserved.
#   
#   文件名称：shell25_checkPPT.sh
#   创 建 者：Renleilei (renleilei1992@foxmail.com)
#   创建日期：2018年06月21日
#   描    述：
#   版    本: Version 1.00
#================================================================

#
# 查询ppt上传错误的信息
#
# 筛选区间: 20190210 - 20190211

echo "---------筛选开始-----------"
echo "配置信息如下:"

ResultPath=/tmp/renleilei/2019_ppt_result.txt
Keyword01='upload files failed'
Keyword02='Load ppt list time out'
Keyword03='_H5PPT_'
Keyword04='failed'

#echo "筛选目录: "$Path
echo "结果目录: "$ResultPath
echo "关键词01: "$Keyword01
echo "关键词02: "$Keyword02

for Day in $(seq 10 11)
do
{
        Path=/home/syslog-ng/2019/02/$Day/datareport/
        for i in $(seq 0 23)
        do
        {
          if [ $i -lt 10 ]; then  i="0"$i; fi
          Filename="eventlog."$i".log"
          echo "开始筛选文件: "$Filename

          echo "执行语句: grep $Keyword01 $Path$Filename >>$ResultPath"

		  ## 以下为执行语句
		  ##`grep 'upload files failed' $Path$Filename | grep '502' >>$ResultPath`
		  `grep '_H5PPT_' $Path$Filename | grep 'failed' >>$ResultPath`
        }
        done
}
done

## 下面命令先注释掉
##cd /tmp/renleilei
##pathNow=`pwd`
##echo "now the path is: "$pathNow

##`cat $ResultPath | awk -F ''

echo "--------筛选结束------------"


## 备注:

## _H5PPT_offlinepack_load_failed 		 -- 离线包下载失败，需关注 												errorCodeNum = 1
## _H5PPT_offlinepack_Md5failed 		 -- 离线包MD5校验失败，频次高需关注										errorCodeNum = 2
## _H5PPT_offlinepack_indexfilefailed	 -- 离线包下载成功，校验成功，但是解压后发现没有入口文件，频次高需关注  errorCodeNum = 3
## _H5PPT_online_load_failed 			 -- 在线包加载失败，频次高需关注                                        errorCodeNum = 4
## _H5PPT_local_failed 					 -- 离线包本地失败，频次高需关注                                        errorCodeNum = 5


ErrorLogPath=/tmp/renleilei/2019_PptErrorLog.txt
ErrorLogPath_temp=/tmp/renleilei/2019_PptErrorLog_temp.txt

## 获取 1-_H5PPT_offlinepack_load_failed 的错误用户信息
`grep '_H5PPT_offlinepack_load_failed' $ResultPath | awk -F '"' '{print $20" "$24" "$28" "$32" "$40}'` >>$ErrorLogPath_temp
`cat $ErrorLogPath_temp | awk -F ',' '{print $1}'` >>$ErrorLogPath

## 获取 2-_H5PPT_offlinepack_Md5failed 的错误用户信息
`grep '_H5PPT_offlinepack_Md5failed' $ResultPath | awk -F '"' '{print $20" "$24" "$28" "$32" "$40}'` >>$ErrorLogPath_temp
`cat $ErrorLogPath_temp | awk -F ',' '{print $1}'` >>$ErrorLogPath

## 获取 3-_H5PPT_offlinepack_indexfilefailed 的错误用户信息
`grep '_H5PPT_offlinepack_indexfilefailed' $ResultPath | awk -F '"' '{print $20" "$24" "$28" "$32" "$40}'` >>$ErrorLogPath_temp
`cat $ErrorLogPath_temp | awk -F ',' '{print $1}'` >>$ErrorLogPath

## 获取 4-_H5PPT_online_load_failed 的错误用户信息
`grep '_H5PPT_online_load_failed' $ResultPath | awk -F '"' '{print $20" "$24" "$28" "$32" "$40}'` >>$ErrorLogPath_temp
`cat $ErrorLogPath_temp | awk -F ',' '{print $1}'` >>$ErrorLogPath

## 获取 5-_H5PPT_local_failed 的错误用户信息
`grep '_H5PPT_local_failed' $ResultPath | awk -F '"' '{print $20" "$24" "$28" "$32" "$40}'` >>$ErrorLogPath_temp
`cat $ErrorLogPath_temp | awk -F ',' '{print $1}'` >>$ErrorLogPath
