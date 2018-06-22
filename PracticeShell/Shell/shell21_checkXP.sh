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
#
#
#
# 用以查询一周内使用xp系统登录CCTalk客户端的用户数量及名单
#
#
#
#
# 筛选区间: 20180614 - 20180620

echo "---------筛选开始-----------"
echo "配置信息如下:"

ResultPath_01=/tmp/20180620_result_01.txt
ResultPath_02=/tmp/20180620_result_02.txt
ResultPath_03=/tmp/20180620_version.txt
ResultPath_04=/tmp/20180620_user.txt
ResultPath_05=/tmp/20180620_device.txt
Keyword01=osversion
Keyword02='"platform":"PC"'
Keyword03='"osversion":"5.1.2600"'      ### xp版本号: NT 5.1 Windows XP Home/ Windows XP 64-bit Edition / Windows XP Professional
Keyword04='"osversion":"5.2.3790"'      ### xp版本号: NT 5.2 Windows XP Professional x64

echo "筛选目录: "$Path
echo "关键词01: "$Keyword01
echo "关键词02: "$Keyword02
echo "关键词03: "$Keyword03
echo "使用XP版本的用户名文件: "$ResultPath_04

for Day in $(seq 14 20)
do
{
        Path=/home/syslog-ng/2018/06/$Day/datareport/
        for i in $(seq 0 23)
        do
        {
          if [ $i -lt 10 ]; then  i="0"$i; fi
          Filename="eventlog."$i".log"
          echo "开始筛选文件: "$Filename

          ##    echo "执行语句: grep $Keyword01 $Path$Filename | grep $Keyword02 | awk -F',' '{print \$7}' | awk -F '\"' '{print \$4}' | sort -u >>$ResultPath"
          ##    echo "---$i---" >>$ResultPath_01
          ##    `grep $Keyword01 $Path$Filename | grep $Keyword02 | awk -F',' '{print $7}' | awk -F '"' '{print $4}' | sort -u >>$ResultPath_01`

          ## 筛选出所有的PC版本号
          ##    `grep $Keyword01 $Path$Filename | grep $Keyword02 | awk -F',' '{print $7}' | awk -F '"' '{print $4}' >>$ResultPath_01`

          ## 筛选出所有XP NT5.1 版本的用户
##        `grep $Keyword02 $Path$Filename | grep $Keyword03 | awk -F',' '{print $6}' | awk -F '"' '{print $4}' >>$ResultPath_02`

          ## 筛选出所有XP NT5.2 版本的用户
##        `grep $Keyword02 $Path$Filename | grep $Keyword04 | awk -F',' '{print $6}' | awk -F '"' '{print $4}' >>$ResultPath_02`

          ## 筛选出所有XP NT5.1 版本的用户设备号
          `grep $Keyword02 $Path$Filename | grep $Keyword03 | awk -F',' '{print $5}' | awk -F '"' '{print $4}' >>$ResultPath_01`

          ## 筛选出所有XP NT5.2 版本的用户设备号
          `grep $Keyword02 $Path$Filename | grep $Keyword04 | awk -F',' '{print $5}' | awk -F '"' '{print $4}' >>$ResultPath_01`
        }
        done
}
done

## 对版本号进行去重排序
##`sort -u $ResultPath_01 >> $ResultPath_03` 

## 对使用xp版本的用户进行去重排序
##`sort -u $ResultPath_02 >> $ResultPath_04` 

## 对使用xp版本的用户设备号去重排序
`sort -u $ResultPath_01 >> $ResultPath_05`

echo "--------筛选结束------------"

