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
# 筛选区间: 20181212 - 20181213

echo "---------筛选开始-----------"
echo "配置信息如下:"

ResultPath=/tmp/2018_jiangjiang_result.txt
Keyword01='upload files failed'
Keyword02='Load ppt list time out'

#echo "筛选目录: "$Path
echo "结果目录: "$ResultPath
echo "关键词01: "$Keyword01
echo "关键词02: "$Keyword02

for Day in $(seq 12 13)
do
{
        Path=/home/syslog-ng/2018/12/$Day/datareport/
        for i in $(seq 0 23)
        do
        {
          if [ $i -lt 10 ]; then  i="0"$i; fi
          Filename="eventlog."$i".log"
          echo "开始筛选文件: "$Filename

          echo "执行语句: grep $Keyword01 $Path$Filename >>$ResultPath"

		  ## 以下为执行语句
		  `grep 'upload files failed' $Path$Filename | grep '502' >>$ResultPath`
        }
        done
}
done

cd /tmp
pathNow=`pwd`
echo "now the path is: "$pathNow

#`cat $ResultPath | awk -F ''

echo "--------筛选结束------------"

