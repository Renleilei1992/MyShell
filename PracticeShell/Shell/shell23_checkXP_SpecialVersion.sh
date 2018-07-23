#!/bin/bash

#
# 用以查询一周内使用xp系统登录CCTalk 客户端的用户数量及名单
#
#
#
#
# 筛选区间: 20180721 - 20180722

echo "---------筛选开始-----------"
echo "配置信息如下:"


Path_result_prefix=/tmp/2018renleilei

ResultPath_00=$Path_result_prefix/20180723_result_00.txt
ResultPath_01=$Path_result_prefix/20180723_result_01.txt
ResultPath_02=$Path_result_prefix/20180723_result_02.txt
ResultPath_03=$Path_result_prefix/20180723_version.txt
ResultPath_04=$Path_result_prefix/20180723_user.txt
ResultPath_05=$Path_result_prefix/20180723_device.txt
Keyword01=osversion
Keyword02='"platform":"PC"'
Keyword03='"osversion":"5.1.2600"'      ### xp版本号: NT 5.1 Windows XP Home/ Windows XP 64-bit Edition / Windows XP Professional
Keyword04='"osversion":"5.2.3790"'      ### xp版本号: NT 5.2 Windows XP Professional x64

echo "筛选目录: "$Path
echo "关键词01: "$Keyword01
echo "关键词02: "$Keyword02
echo "关键词03: "$Keyword03
echo "关键词04: "$Keyword04
echo "使用XP版本的用户ID文件: "$ResultPath_04

for Day in $(seq 21 22)
do
{
        if [ $Day -lt 10 ]; then  Day="0"$Day; fi
        Path=/home/syslog-ng/2018/07/$Day/datareport/    ## 客户端日志存放路径
        for i in $(seq 0 23)
        do
        {
          if [ $i -lt 10 ]; then  i="0"$i; fi
          Filename="eventlog."$i".log"
          echo "开始筛选文件: "$Path$Filename

          ## 筛选出所有XP NT5.1 版本的用户 包含platform字段、userID字段、osversion字段 、version字段
          `grep $Keyword02 $Path$Filename | grep $Keyword03 | awk -F ',' '{print $4" "$6" "$7" "$8}' | sort -u >>$ResultPath_00`

          ## 筛选出所有XP NT5.2 版本的用户 包含platform字段、userID字段、osversion字段 、version字段
          `grep $Keyword02 $Path$Filename | grep $Keyword04 | awk -F ',' '{print $4" "$6" "$7" "$8}' | sort -u >>$ResultPath_00`
        }
        done
}
done

echo "--------筛选结束------------"

