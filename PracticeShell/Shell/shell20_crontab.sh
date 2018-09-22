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

#cd /home/Renleilei/Repository/MyShell/PracticeShell/Shell
LOCAL_PATH=~/Repository/MyShell/PracticeShell/Shell
LOCAL_LOG_PATH=~/Repository/MyShell/PracticeShell/Log
cd $LOCAL_PATH

echo "#"$date >>$LOCAL_PATH/$filename

ret00=`git add $LOCAL_PATH/$filename >> $LOCAL_PATH/commit.log`
ret01=`git add $LOCAL_LOG_PATH/commit.log`
ret02=`git commit -m "$date commit" $LOCAL_PATH/$filename >> $LOCAL_LOG_PATH/commit.log`
ret03=`git commit -m "$date commit" $LOCAL_LOG_PATH/commit.log`
ret04=`git pull origin master >> $LOCAL_LOG_PATH/commit.log`
ret05=`git push origin master >> $LOCAL_LOG_PATH/commit.log`

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
#Fri May 25 10:30:01 CST 2018
#Fri May 25 14:30:01 CST 2018
#Fri May 25 20:30:01 CST 2018
#Sat May 26 10:30:01 CST 2018
#Sat May 26 14:30:01 CST 2018
#Sat May 26 20:30:01 CST 2018
#Sun May 27 10:30:01 CST 2018
#Sun May 27 14:30:01 CST 2018
#Sun May 27 20:30:01 CST 2018
#Mon May 28 10:30:01 CST 2018
#Mon May 28 14:30:01 CST 2018
#Mon May 28 20:30:01 CST 2018
#Tue May 29 10:30:01 CST 2018
#Tue May 29 14:30:01 CST 2018
#Tue May 29 20:30:01 CST 2018
#Wed May 30 10:30:01 CST 2018
#Wed May 30 14:30:01 CST 2018
#Wed May 30 20:30:01 CST 2018
#Thu May 31 10:30:01 CST 2018
#Thu May 31 12:30:01 CST 2018
#Thu May 31 14:30:01 CST 2018
#Thu May 31 20:30:01 CST 2018
#Fri Jun 1 10:30:01 CST 2018
#Fri Jun 1 12:30:01 CST 2018
#Fri Jun 1 14:30:01 CST 2018
#Fri Jun 1 20:30:01 CST 2018
#Sat Jun 2 10:30:01 CST 2018
#Sat Jun 2 12:30:01 CST 2018
#Sat Jun 2 14:30:01 CST 2018
#Sat Jun 2 20:30:01 CST 2018
#Sun Jun 3 10:30:01 CST 2018
#Sun Jun 3 12:30:01 CST 2018
#Sun Jun 3 14:30:01 CST 2018
#Sun Jun 3 20:30:01 CST 2018
#Mon Jun 4 10:30:01 CST 2018
#Mon Jun 4 12:30:01 CST 2018
#Mon Jun 4 14:30:01 CST 2018
#Mon Jun 4 20:30:02 CST 2018
#Tue Jun 5 10:30:01 CST 2018
#Tue Jun 5 12:30:01 CST 2018
#Tue Jun 5 14:30:01 CST 2018
#Tue Jun 5 20:30:01 CST 2018
#Wed Jun 6 10:30:01 CST 2018
#Wed Jun 6 12:30:01 CST 2018
#Wed Jun 6 14:30:01 CST 2018
#Wed Jun 6 20:30:01 CST 2018
#Thu Jun 7 10:30:01 CST 2018
#Thu Jun 7 12:30:01 CST 2018
#Thu Jun 7 14:30:01 CST 2018
#Thu Jun 7 20:30:01 CST 2018
#Fri Jun 8 10:30:01 CST 2018
#Fri Jun 8 12:30:01 CST 2018
#Fri Jun 8 14:30:01 CST 2018
#Fri Jun 8 20:30:01 CST 2018
#Sat Jun 9 10:30:01 CST 2018
#Sat Jun 9 12:30:01 CST 2018
#Sat Jun 9 14:30:01 CST 2018
#Sat Jun 9 20:30:01 CST 2018
#Sun Jun 10 10:30:01 CST 2018
#Sun Jun 10 12:30:01 CST 2018
#Sun Jun 10 14:30:01 CST 2018
#Sun Jun 10 20:30:01 CST 2018
#Mon Jun 11 10:30:01 CST 2018
#Mon Jun 11 12:30:01 CST 2018
#Mon Jun 11 14:30:01 CST 2018
#Mon Jun 11 20:30:01 CST 2018
#Tue Jun 12 10:30:01 CST 2018
#Tue Jun 12 12:30:01 CST 2018
#Tue Jun 12 14:30:01 CST 2018
#Tue Jun 12 20:30:01 CST 2018
#Wed Jun 13 10:30:01 CST 2018
#Wed Jun 13 12:30:01 CST 2018
#Wed Jun 13 14:30:01 CST 2018
#Wed Jun 13 20:30:01 CST 2018
#Thu Jun 14 10:30:01 CST 2018
#Thu Jun 14 12:30:01 CST 2018
#Thu Jun 14 14:30:01 CST 2018
#Thu Jun 14 20:30:01 CST 2018
#Fri Jun 15 10:30:01 CST 2018
#Fri Jun 15 12:30:01 CST 2018
#Fri Jun 15 14:30:01 CST 2018
#Fri Jun 15 20:30:01 CST 2018
#Sat Jun 16 10:30:01 CST 2018
#Sat Jun 16 12:30:01 CST 2018
#Sat Jun 16 14:30:02 CST 2018
#Sat Jun 16 20:30:01 CST 2018
#Sun Jun 17 10:30:01 CST 2018
#Sun Jun 17 12:30:01 CST 2018
#Sun Jun 17 14:30:01 CST 2018
#Sun Jun 17 20:30:01 CST 2018
#Mon Jun 18 10:30:01 CST 2018
#Mon Jun 18 12:30:01 CST 2018
#Mon Jun 18 14:30:01 CST 2018
#Mon Jun 18 20:30:01 CST 2018
#Tue Jun 19 10:30:01 CST 2018
#Tue Jun 19 12:30:01 CST 2018
#Tue Jun 19 14:30:01 CST 2018
#Tue Jun 19 20:30:01 CST 2018
#Wed Jun 20 10:30:01 CST 2018
#Wed Jun 20 12:30:01 CST 2018
#Wed Jun 20 14:30:01 CST 2018
#Wed Jun 20 20:30:01 CST 2018
#Thu Jun 21 10:30:01 CST 2018
#Thu Jun 21 12:30:01 CST 2018
#Thu Jun 21 14:30:01 CST 2018
#Thu Jun 21 20:30:01 CST 2018
#Fri Jun 22 10:30:01 CST 2018
#Fri Jun 22 12:30:01 CST 2018
#Fri Jun 22 14:30:01 CST 2018
#Fri Jun 22 20:30:01 CST 2018
#Sat Jun 23 10:30:01 CST 2018
#Sat Jun 23 12:30:01 CST 2018
#Sat Jun 23 14:30:01 CST 2018
#Sun Jun 24 10:30:01 CST 2018
#Sun Jun 24 14:30:01 CST 2018
#Mon Jun 25 10:30:01 CST 2018
#Mon Jun 25 14:30:01 CST 2018
#Tue Jun 26 10:30:01 CST 2018
#Tue Jun 26 14:30:01 CST 2018
#Wed Jun 27 10:30:01 CST 2018
#Wed Jun 27 14:30:01 CST 2018
#Thu Jun 28 10:30:01 CST 2018
#Thu Jun 28 14:30:01 CST 2018
#Fri Jun 29 10:30:01 CST 2018
#Fri Jun 29 14:30:01 CST 2018
#Sat Jun 30 10:30:01 CST 2018
#Sat Jun 30 14:30:01 CST 2018
#Sun Jul 1 10:30:01 CST 2018
#Sun Jul 1 14:30:01 CST 2018
#Mon Jul 2 10:30:01 CST 2018
#Mon Jul 2 14:30:01 CST 2018
#Tue Jul 3 10:30:01 CST 2018
#Tue Jul 3 14:30:01 CST 2018
#Wed Jul 4 10:30:01 CST 2018
#Wed Jul 4 14:30:01 CST 2018
#Mon Jul 16 16:41:29 CST 2018
#Tue Jul 17 10:30:01 CST 2018
#Tue Jul 17 14:30:01 CST 2018
#Tue Jul 17 18:30:01 CST 2018
#Tue Jul 17 22:30:01 CST 2018
#Wed Jul 18 10:30:01 CST 2018
#Wed Jul 18 14:30:01 CST 2018
#Wed Jul 18 18:30:01 CST 2018
#Wed Jul 18 22:30:01 CST 2018
#Thu Jul 19 10:30:01 CST 2018
#Thu Jul 19 14:30:01 CST 2018
#Thu Jul 19 18:30:01 CST 2018
#Thu Jul 19 22:30:01 CST 2018
#Fri Jul 20 10:30:01 CST 2018
#Fri Jul 20 14:30:01 CST 2018
#Fri Jul 20 18:30:01 CST 2018
#Fri Jul 20 22:30:01 CST 2018
#Sat Jul 21 10:30:01 CST 2018
#Sat Jul 21 14:30:01 CST 2018
#Sat Jul 21 18:30:01 CST 2018
#Sat Jul 21 22:30:01 CST 2018
#Sun Jul 22 10:30:01 CST 2018
#Sun Jul 22 14:30:01 CST 2018
#Sun Jul 22 18:30:01 CST 2018
#Sun Jul 22 22:30:01 CST 2018
#Mon Jul 23 10:30:01 CST 2018
#Mon Jul 23 14:30:01 CST 2018
#Mon Jul 23 18:30:01 CST 2018
#Mon Jul 23 22:30:01 CST 2018
#Tue Jul 24 10:30:01 CST 2018
#Tue Jul 24 14:30:01 CST 2018
#Tue Jul 24 18:30:01 CST 2018
#Tue Jul 24 22:30:01 CST 2018
#Wed Jul 25 10:30:01 CST 2018
#Wed Jul 25 14:30:01 CST 2018
#Wed Jul 25 18:30:01 CST 2018
#Wed Jul 25 22:30:01 CST 2018
#Thu Jul 26 10:30:01 CST 2018
#Thu Jul 26 14:30:01 CST 2018
#Thu Jul 26 18:30:01 CST 2018
#Thu Jul 26 22:30:01 CST 2018
#Fri Jul 27 10:30:01 CST 2018
#Fri Jul 27 14:30:01 CST 2018
#Fri Jul 27 18:30:01 CST 2018
#Fri Jul 27 22:30:01 CST 2018
#Sat Jul 28 10:30:01 CST 2018
#Sat Jul 28 14:30:01 CST 2018
#Sat Jul 28 18:30:01 CST 2018
#Sat Jul 28 22:30:01 CST 2018
#Sun Jul 29 10:30:01 CST 2018
#Sun Jul 29 14:30:01 CST 2018
#Sun Jul 29 18:30:01 CST 2018
#Sun Jul 29 22:30:01 CST 2018
#Mon Jul 30 10:30:01 CST 2018
#Mon Jul 30 14:30:01 CST 2018
#Mon Jul 30 18:30:01 CST 2018
#Mon Jul 30 22:30:01 CST 2018
#Tue Jul 31 10:30:01 CST 2018
#Tue Jul 31 14:30:01 CST 2018
#Tue Jul 31 18:30:01 CST 2018
#Tue Jul 31 22:30:01 CST 2018
#Wed Aug 1 10:30:01 CST 2018
#Wed Aug 1 14:30:01 CST 2018
#Wed Aug 1 18:30:01 CST 2018
#Wed Aug 1 22:30:01 CST 2018
#Thu Aug 2 10:30:01 CST 2018
#Thu Aug 2 14:30:01 CST 2018
#Thu Aug 2 18:30:01 CST 2018
#Thu Aug 2 22:30:01 CST 2018
#Fri Aug 3 10:30:01 CST 2018
#Fri Aug 3 14:30:01 CST 2018
#Fri Aug 3 18:30:01 CST 2018
#Fri Aug 3 22:30:01 CST 2018
#Sat Aug 4 10:30:01 CST 2018
#Sat Aug 4 14:30:01 CST 2018
#Sat Aug 4 18:30:01 CST 2018
#Sat Aug 4 22:30:01 CST 2018
#Sun Aug 5 10:30:01 CST 2018
#Sun Aug 5 14:30:01 CST 2018
#Sun Aug 5 18:30:02 CST 2018
#Sun Aug 5 22:30:01 CST 2018
#Mon Aug 6 10:30:01 CST 2018
#Mon Aug 6 14:30:01 CST 2018
#Mon Aug 6 18:30:01 CST 2018
#Mon Aug 6 22:30:01 CST 2018
#Tue Aug 7 10:30:01 CST 2018
#Tue Aug 7 14:30:02 CST 2018
#Tue Aug 7 18:30:01 CST 2018
#Tue Aug 7 22:30:01 CST 2018
#Wed Aug 8 10:30:01 CST 2018
#Wed Aug 8 14:30:01 CST 2018
#Wed Aug 8 18:30:01 CST 2018
#Wed Aug 8 22:30:01 CST 2018
#Thu Aug 9 10:30:01 CST 2018
#Thu Aug 9 14:30:01 CST 2018
#Thu Aug 9 18:30:01 CST 2018
#Thu Aug 9 22:30:01 CST 2018
#Fri Aug 10 10:30:01 CST 2018
#Fri Aug 10 14:30:01 CST 2018
#Fri Aug 10 18:30:01 CST 2018
#Fri Aug 10 22:30:01 CST 2018
#Sat Aug 11 10:30:01 CST 2018
#Sat Aug 11 14:30:01 CST 2018
#Sat Aug 11 18:30:01 CST 2018
#Sat Aug 11 22:30:01 CST 2018
#Sun Aug 12 10:30:01 CST 2018
#Sun Aug 12 14:30:01 CST 2018
#Sun Aug 12 18:30:01 CST 2018
#Sun Aug 12 22:30:01 CST 2018
#Mon Aug 13 10:30:01 CST 2018
#Mon Aug 13 14:30:01 CST 2018
#Mon Aug 13 18:30:01 CST 2018
#Mon Aug 13 22:30:01 CST 2018
#Tue Aug 14 10:30:01 CST 2018
#Tue Aug 14 14:30:01 CST 2018
#Tue Aug 14 18:30:01 CST 2018
#Tue Aug 14 22:30:01 CST 2018
#Wed Aug 15 10:30:01 CST 2018
#Wed Aug 15 14:30:01 CST 2018
#Wed Aug 15 18:30:01 CST 2018
#Wed Aug 15 22:30:01 CST 2018
#Thu Aug 16 10:30:01 CST 2018
#Thu Aug 16 14:30:01 CST 2018
#Thu Aug 16 18:30:01 CST 2018
#Thu Aug 16 22:30:01 CST 2018
#Fri Aug 17 10:30:01 CST 2018
#Fri Aug 17 14:30:01 CST 2018
#Fri Aug 17 18:30:01 CST 2018
#Fri Aug 17 22:30:01 CST 2018
#Sat Aug 18 10:30:01 CST 2018
#Sat Aug 18 14:30:01 CST 2018
#Sat Aug 18 18:30:01 CST 2018
#Sat Aug 18 22:30:01 CST 2018
#Sun Aug 19 10:30:01 CST 2018
#Sun Aug 19 14:30:01 CST 2018
#Sun Aug 19 18:30:01 CST 2018
#Sun Aug 19 22:30:01 CST 2018
#Mon Aug 20 10:30:01 CST 2018
#Mon Aug 20 14:30:01 CST 2018
#Mon Aug 20 18:30:01 CST 2018
#Mon Aug 20 22:30:01 CST 2018
#Tue Aug 21 10:30:01 CST 2018
#Tue Aug 21 14:30:01 CST 2018
#Tue Aug 21 18:30:01 CST 2018
#Tue Aug 21 22:30:01 CST 2018
#Wed Aug 22 10:30:01 CST 2018
#Wed Aug 22 14:30:01 CST 2018
#Wed Aug 22 18:30:01 CST 2018
#Wed Aug 22 22:30:01 CST 2018
#Thu Aug 23 10:30:01 CST 2018
#Thu Aug 23 14:30:01 CST 2018
#Thu Aug 23 18:30:01 CST 2018
#Thu Aug 23 22:30:01 CST 2018
#Fri Aug 24 10:30:01 CST 2018
#Fri Aug 24 14:30:01 CST 2018
#Fri Aug 24 18:30:01 CST 2018
#Fri Aug 24 22:30:01 CST 2018
#Sat Aug 25 10:30:01 CST 2018
#Sat Aug 25 14:30:01 CST 2018
#Sat Aug 25 18:30:01 CST 2018
#Sat Aug 25 22:30:01 CST 2018
#Sun Aug 26 10:30:01 CST 2018
#Sun Aug 26 14:30:01 CST 2018
#Sun Aug 26 18:30:01 CST 2018
#Sun Aug 26 22:30:01 CST 2018
#Mon Aug 27 10:30:01 CST 2018
#Mon Aug 27 18:30:01 CST 2018
#Mon Aug 27 22:30:01 CST 2018
#Tue Aug 28 10:30:01 CST 2018
#Tue Aug 28 18:30:01 CST 2018
#Tue Aug 28 22:30:01 CST 2018
#Wed Aug 29 10:30:01 CST 2018
#Wed Aug 29 18:30:01 CST 2018
#Wed Aug 29 22:30:01 CST 2018
#Thu Aug 30 10:30:01 CST 2018
#Thu Aug 30 18:30:01 CST 2018
#Thu Aug 30 22:30:01 CST 2018
#Fri Aug 31 10:30:01 CST 2018
#Fri Aug 31 18:30:01 CST 2018
#Fri Aug 31 22:30:01 CST 2018
#Sat Sep 1 10:30:01 CST 2018
#Sat Sep 1 18:30:01 CST 2018
#Sat Sep 1 22:30:01 CST 2018
#Sun Sep 2 10:30:01 CST 2018
#Sun Sep 2 18:30:01 CST 2018
#Sun Sep 2 22:30:01 CST 2018
#Mon Sep 3 10:30:01 CST 2018
#Mon Sep 3 18:30:01 CST 2018
#Mon Sep 3 22:30:01 CST 2018
#Tue Sep 4 10:30:01 CST 2018
#Tue Sep 4 18:30:01 CST 2018
#Tue Sep 4 22:30:01 CST 2018
#Wed Sep 5 10:30:01 CST 2018
#Wed Sep 5 22:30:01 CST 2018
#Thu Sep 6 10:30:01 CST 2018
#Thu Sep 20 18:30:01 CST 2018
#Fri Sep 21 10:30:01 CST 2018
#Fri Sep 21 18:30:01 CST 2018
#Sat Sep 22 10:30:01 CST 2018
