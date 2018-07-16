#!/bin/bash

#================================================================
#   Copyright (C) 2018 Renleilei. All rights reserved.
#   
#   文件名称：shell22_awkPrint.sh
#   创 建 者：Renleilei (renleilei@foxmail.com)
#   创建日期：2018年07月16日
#   描    述：
#   版    本: Version 1.00
#================================================================

`awk -F '"' '{print $4" "$8" "$12}' ../Cfg/001test.cfg`
