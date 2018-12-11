#!/bin/bash

#================================================================
#   Copyright (C) 2018 Renleilei. All rights reserved.
#   
#   文件名称：shell21_checkXP.sh
#   创 建 者：Renleilei (renleilei@foxmail.com)
#   创建日期：2018年06月21日
#   描    述：
#   版    本: Version 1.00
#================================================================

#
# 用以查询一周内使用xp系统登录CCTalk客户端的用户数量及名单
#
# 筛选区间: 20180614 - 20180620

echo "---------筛选开始-----------"
echo "配置信息如下:"

ResultPath=/tmp/2018_lihanlong_result.log
Keyword01='"version":"7.3.7.10"'
Keyword02='Load ppt list time out'

echo "筛选目录: "$Path
echo "关键词01: "$Keyword01
echo "关键词02: "$Keyword02

for Day in $(seq 14 16)
do
{
        Path=/home/syslog-ng/2018/11/$Day/datareport/
        for i in $(seq 0 23)
        do
        {
          if [ $i -lt 10 ]; then  i="0"$i; fi
          Filename="eventlog."$i".log"
          echo "开始筛选文件: "$Filename

          echo "执行语句: grep $Keyword01 $Path$Filename | grep $Keyword02 >>$ResultPath"

		  ## 以下为执行语句
		  `grep $Keyword01 $Path$Filename | grep $Keyword02 >>$ResultPath`
        }
        done
}
done

echo "--------筛选结束------------"

