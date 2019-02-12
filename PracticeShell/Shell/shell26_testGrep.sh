#!/bin/bash

#================================================================
#   Copyright (C) 2019 Renleilei. All rights reserved.
#   
#   文件名称：shell26_testGrep.sh
#   创 建 者：Renleilei (renleilei1992@foxmail.com)
#   创建日期：2019年02月11日
#   描    述：
#   版    本: Version 1.00
#================================================================

val_1=$(grep AAAA ../Cfg/test.cfg | wc -l)

echo "val_1 = "$val_1

