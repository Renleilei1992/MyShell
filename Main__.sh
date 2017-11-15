#!/system/bin/sh

#================================================================
#   Copyright (C) 2017 Renleilei. All rights reserved.
#   
#   文件名称：Main__.sh
#   创 建 者：Renleilei (renleilei@foxmail.com)
#   创建日期：2017年11月15日
#   描    述：
#   版    本: Version 1.00
#================================================================





## 使用 TimeLog() 记录时间
TimeLog()
{
	iTime=`date +%Y%m%d-%H:%M:%S`
	echo "[$iTime]:$1" $2
}

## 去除空行
trim()
{
	echo $1 | sed 's/^ \+//' | sed 's/ \+$//'
}

