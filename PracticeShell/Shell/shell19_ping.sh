#!/bin/bash

#================================================================
#   Copyright (C) 2018 Renleilei. All rights reserved.
#   
#   文件名称：shell19_ping.sh
#   创 建 者：Renleilei (renleilei1992@foxmail.com)
#   创建日期：2018年04月12日
#   描    述：
#   版    本: Version 1.00
#================================================================


for ip in `cat ./ip_list | sed "/^#/d"`
do
  ping -c 1 $ip &>/dev/null
  a=$?
  sleep 1
  ping -c 1 $ip &>/dev/null
  b=$?
  sleep 1
  ping -c 1 $ip &>/dev/null
  c=$?
  sleep 1
  DATE=$(DATE +%f" "%H:%M)
  if [ $a -ne 0 -a $b -ne 0 -a $c -ne 0 ]
  then
      echo "Date : $DATE\n Host : $ip\nProblem : Ping is timeout." >> ./Error.txt
  else
      echo "$ip ping is successful."
  fi
done
