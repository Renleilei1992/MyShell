#!/bin/bash

#================================================================
#   Copyright (C) 2018 Renleilei. All rights reserved.
#   
#   文件名称：shell20_crontab.sh
#   创 建 者：Renleilei (renleilei@foxmail.com)
#   创建日期：2018年05月03日
#   描    述：
#   版    本: Version 1.00
#================================================================

date=`date`
filename=shell20_crontab.sh

echo $date
echo $filename
echo $0

cd /home/Renleilei/Repository/MyShell/PracticeShell/Shell

echo "#"$date >>/home/Renleilei/Repository/MyShell/PracticeShell/Shell/$filename

ret01=`git add /home/Renleilei/Repository/MyShell/PracticeShell/Shell/$filename >> /home/Renleilei/Repository/MyShell/PracticeShell/Log/commit.log`
ret02=`git commit -m "$date commit" /home/Renleilei/Repository/MyShell/PracticeShell/Shell/$filename >> /home/Renleilei/Repository/MyShell/PracticeShell/Log/commit.log`
ret03=`git pull origin master >> /home/Renleilei/Repository/MyShell/PracticeShell/Log/commit.log`
ret04=`git push origin master >> /home/Renleilei/Repository/MyShell/PracticeShell/Log/commit.log`

#shell18_crontab.sh
#Thu May 3 14:01:53 CST 2018
#Thu May 3 14:03:55 CST 2018
#Thu May 3 14:05:39 CST 2018
#Thu May 3 15:13:42 CST 2018
#Thu May 3 16:30:01 CST 2018
#Thu May 3 20:30:01 CST 2018
#Fri May 4 10:30:01 CST 2018
