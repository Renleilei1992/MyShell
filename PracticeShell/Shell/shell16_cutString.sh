#!/bin/bash

#================================================================
#   Copyright (C) 2017 Renleilei. All rights reserved.
#   
#   文件名称：shell16_cutString.sh
#   创 建 者：Renleilei (renleilei@foxmail.com)
#   创建日期：2017年11月22日
#   描    述：
#   版    本: Version 1.00
#================================================================


string="0001_21600_342399069.flg"

## 获取前四位字符
__str1=`echo ${string:0:4}`

## 截断文件全名中的 .flg 标识
__str2=`echo ${string%.*}`

## 获取不带路径的文件名
__str3=`basename /root/$string`

echo "$__str1"
echo "$__str2"
echo "$__str3"

