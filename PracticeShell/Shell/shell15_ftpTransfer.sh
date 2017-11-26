#!/system/bin/sh

#================================================================
#   Copyright (C) 2017 Renleilei. All rights reserved.
#   
#   文件名称：shell14_ftpTransfer.sh
#   创 建 者：Renleilei (renleilei@foxmail.com)
#   创建日期：2017年11月20日
#   描    述：
#   版    本: Version 1.00
#================================================================


#----------------------  设置环境变量  --------------------------#
setEnv()
{
  CURR_DATE=`date +%Y%m%d`
  CFG_PATH=								#--- 配置文件目录 ---#
  
  FTP_HOST=10.7.64.225                  #--- 
  FTP_USER=gafe
  FTP_PASSWD=bxdx123456

  FTP_RECV_DIR=
  FTP_SEND_DIR=

  FTP_REAL_SIZE=
  FTP_RECV_SIZE=
  FTP_SEND_SIZE=

  return 0
}


#---------------------  定义功能函数 ----------------------------#

#--- 时间戳 ---#
TimeLog()
{
	iTime=`date +%Y%m%d-%H:%M:%S`
    echo "[$iTime]:$1"
}
