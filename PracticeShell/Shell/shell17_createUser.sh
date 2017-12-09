#!/bin/bash

#================================================================
#   Copyright (C) 2017 Renleilei. All rights reserved.
#   
#   文件名称：shell17_createUser.sh
#   创 建 者：Renleilei (renleilei@foxmail.com)
#   创建日期：2017年12月01日
#   描    述：用来创建用户
#   版    本: Version 1.00
#================================================================

##----- 判断入参数量是否正确 -----##
if [ $# -lt 2 ]
then
    echo "Usage: 缺少参数! 请在执行时添加参数,参数1为用户名,参数2为初始密码!";
    exit 2;
else
    echo "参数数量正确，新增用户名为 [$1],初始密码为 [$2]";
fi


##----- 初次执行此脚本添加用户组 -----##
GROUP_COUNT=`cat /etc/group | grep ^TestGroup -c`
if [ $GROUP_COUNT -eq 0 ]
then
    echo "第一次执行此脚本，正在添加用户组 TestGroup ..."
    groupadd -g 1500 TestGroup
fi

##----- 判断执行脚本的用户是否为root -----##
iRet=`whoami`
if [ "$iRet" = "root" ]
then
    echo "执行用户为 root, 可以继续执行!";
else
    echo "执行用户为 [$iRet], 由于此脚本创建用户、组、设置密码需要root权限，请切换至root用户执行此脚本! :)"
    exit 2
fi

##----- 判断该用户是否已添加 -----##
USER_COUNT=`cat /etc/passwd | grep ^$1 -c`
USER_NAME=$1
USER_PASSWD=$2
iRet=`ls /$USER_NAME`
if [ $? -ne 0 ]
then
    echo "用户目录还未创建!";
    mkdir -p /$USER_NAME
    if [ $USER_COUNT -eq 0 ]
    then
        useradd $USER_NAME -d /$USER_NAME -g TestGroup              ##--- 创建用户,并加入TestGroup,指定登录目录 ---##
        if [ $? -eq 0 ]
        then
            echo $USER_PASSWD | passwd $USER_NAME --stdin           ##--- 创建用户成功后,为该用户添加密码       ---##
            echo $USER_NAME >> $CFG_FILE                            ##--- 创建用户成功后,将用户名写入配置文件   ---##
            sleep 1
            echo "$USER_NAME 用户新增成功,位于用户组 TestGroup 下! 登录名为:[$USER_NAME];登录密码为:[$USER_PASSWD]"
            exit 0
        else
            echo "$USER_NAME 用户创建失败,请联系管理员处理!"
            exit 1
        fi
    else
        echo "该用户已创建，请勿重复创建!"
        exit 2
    fi
else
    echo "用户目录已创建!"
    if [ $USER_COUNT -eq 0 ]
    then
        useradd $USER_NAME -d /$USER_NAME -g TestGroup              ##--- 创建用户,并加入TestGroup,指定登录目录 ---##
        if [ $? -eq 0 ]
        then
            echo $USER_PASSWD | passwd $USER_NAME --stdin           ##--- 创建用户成功后,为该用户添加密码       ---##
            echo $USER_NAME >> $CFG_FILE                            ##--- 创建用户成功后,将用户名写入配置文件   ---##
            sleep 1
            echo "$USER_NAME 用户新增成功,位于用户组 TestGroup 下! 登录名为:[$USER_NAME];登录密码为:[$USER_PASSWD]"
            exit 0
        else
            echo "$USER_NAME 用户创建失败,请联系管理员处理!"
            exit 1
        fi
    else
        echo "该用户已创建，请勿重复创建!"
        exit 2
    fi
fi
