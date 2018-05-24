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

ret00=`git add /home/Renleilei/Repository/MyShell/PracticeShell/Shell/$filename >> /home/Renleilei/Repository/MyShell/PracticeShell/Log/commit.log`
ret01=`git add /home/Renleilei/Repository/MyShell/PracticeShell/Log/commit.log`
ret02=`git commit -m "$date commit" /home/Renleilei/Repository/MyShell/PracticeShell/Shell/$filename >> /home/Renleilei/Repository/MyShell/PracticeShell/Log/commit.log`
ret03=`git commit -m "$date commit" /home/Renleilei/Repository/MyShell/PracticeShell/Log/commit.log`
ret04=`git pull origin master >> /home/Renleilei/Repository/MyShell/PracticeShell/Log/commit.log`
ret05=`git push origin master >> /home/Renleilei/Repository/MyShell/PracticeShell/Log/commit.log`

#shell18_crontab.sh
#Thu May 3 14:01:53 CST 2018
#Thu May 3 14:03:55 CST 2018
#Thu May 3 14:05:39 CST 2018
#Thu May 3 15:13:42 CST 2018
#Thu May 3 16:30:01 CST 2018
#Thu May 3 20:30:01 CST 2018
#Fri May 4 10:30:01 CST 2018
#Fri May 4 12:30:01 CST 2018
#Fri May 4 14:30:01 CST 2018
#Fri May 4 16:30:01 CST 2018
#Fri May 4 20:30:01 CST 2018
#Sat May 5 10:30:01 CST 2018
#Sat May 5 12:30:01 CST 2018
#Sat May 5 14:30:01 CST 2018
#Sat May 5 16:30:01 CST 2018
#Sat May 5 19:13:40 CST 2018
#Sat May 5 20:30:01 CST 2018
#Sun May 6 10:30:01 CST 2018
#Sun May 6 12:30:01 CST 2018
#Sun May 6 14:30:01 CST 2018
#Sun May 6 16:30:01 CST 2018
#Sun May 6 20:30:01 CST 2018
#Mon May 7 10:30:01 CST 2018
#Mon May 7 12:30:01 CST 2018
#Mon May 7 14:30:01 CST 2018
#Mon May 7 16:30:01 CST 2018
#Mon May 7 20:30:01 CST 2018
#Tue May 8 10:30:01 CST 2018
#Tue May 8 12:30:01 CST 2018
#Tue May 8 14:30:01 CST 2018
#Tue May 8 16:30:01 CST 2018
#Tue May 8 20:30:01 CST 2018
#Wed May 9 10:30:01 CST 2018
#Wed May 9 12:30:01 CST 2018
#Wed May 9 14:30:01 CST 2018
#Wed May 9 16:30:01 CST 2018
#Wed May 9 20:30:01 CST 2018
#Thu May 10 10:30:01 CST 2018
#Thu May 10 12:30:01 CST 2018
#Thu May 10 14:30:01 CST 2018
#Thu May 10 20:30:01 CST 2018
#Fri May 11 10:30:01 CST 2018
#Fri May 11 14:30:01 CST 2018
#Fri May 11 20:30:01 CST 2018
#Sat May 12 10:30:01 CST 2018
#Sat May 12 14:30:01 CST 2018
#Sat May 12 20:30:01 CST 2018
#Sun May 13 10:30:01 CST 2018
#Sun May 13 14:30:01 CST 2018
#Sun May 13 20:30:01 CST 2018
#Mon May 14 10:30:01 CST 2018
#Mon May 14 14:30:01 CST 2018
#Mon May 14 20:30:01 CST 2018
#Tue May 15 10:30:01 CST 2018
#Tue May 15 14:30:01 CST 2018
#Tue May 15 20:30:01 CST 2018
#Wed May 16 10:30:01 CST 2018
#Wed May 16 14:30:01 CST 2018
#Wed May 16 20:30:01 CST 2018
#Thu May 17 10:30:01 CST 2018
#Thu May 17 14:30:01 CST 2018
#Thu May 17 20:30:01 CST 2018
#Fri May 18 10:30:01 CST 2018
#Fri May 18 14:30:01 CST 2018
#Fri May 18 20:30:01 CST 2018
#Sat May 19 10:30:01 CST 2018
#Sat May 19 14:30:01 CST 2018
#Sat May 19 20:30:01 CST 2018
#Sun May 20 10:30:01 CST 2018
#Sun May 20 14:30:01 CST 2018
#Sun May 20 20:30:01 CST 2018
#Mon May 21 10:30:01 CST 2018
#Mon May 21 14:30:01 CST 2018
#Mon May 21 20:30:01 CST 2018
#Tue May 22 10:30:01 CST 2018
#Tue May 22 14:30:01 CST 2018
#Tue May 22 20:30:01 CST 2018
#Wed May 23 10:30:01 CST 2018
#Wed May 23 14:30:01 CST 2018
#Wed May 23 20:30:01 CST 2018
#Thu May 24 10:30:01 CST 2018
#Thu May 24 14:30:01 CST 2018
#Thu May 24 20:30:01 CST 2018
