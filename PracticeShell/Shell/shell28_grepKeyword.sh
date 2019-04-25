#!/bin/bash

#================================================================
#   Copyright (C) 2019 Renleilei. All rights reserved.
#   
#   文件名称：shell28_grepKeyword.sh
#   创 建 者：Renleilei (renleilei1992@foxmail.com)
#   创建日期：2019年04月11日
#   描    述：
#   版    本: Version 1.00
#================================================================

## 测试 grep 关键字的情况

keyword='grep'

echo "------情况1: 直接grep关键字"
grep 'grep' ./*.sh

echo "------情况2: grep 关键字变量"
grep '$keywod' ./*.sh
