#!/bin/bash

#================================================================
#   Copyright (C) 2018 Renleilei. All rights reserved.
#   
#   文件名称：FindUserLog.sh
#   创 建 者：Renleilei (renleilei1992@foxmail.com)
#   创建日期：2019年04月11日
#   描    述：
#   版    本: Version 1.00
#================================================================


echo "---------筛选开始-----------"
echo "配置信息如下:"

echo "脚本名称:[$0]"
echo "参数1:[$1]"
echo "参数2:[$2]"

ResultPath=/tmp/renleilei/2019_result.txt
Keyword01='00FFC8E4DB4D'
Keyword02='6110106'

#echo "筛选目录: "$Path
echo "结果目录: "$ResultPath
echo "关键词01: "$Keyword01
echo "关键词02: "$Keyword02


## 清空结果文件
>$ResultPath

## 设定日期
Day=10

## 指定查询目录
Path=/home/

## 开始循环查找
for i in $(seq 0 23)
do
{
  if [ $i -lt 10 ]; then  i="0"$i; fi
  Filename="log."$i".log"
  echo "开始筛选文件: "$Filename

  echo "执行语句: grep $Keyword01 $Path$Filename >>$ResultPath"

  ## 以下为执行语句
  `grep '8E4DB4D' $Path$Filename >>$ResultPath`
}
done


echo "---------筛选结束-----------"
