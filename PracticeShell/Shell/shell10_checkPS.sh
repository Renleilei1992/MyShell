#!/bin/sh
#############################################################################
#版权所有: 兴业银行
#版    本: V1.0
#操作系统: AIX5L / SCO OPEN SERVER 5
#文件名称: checkps.sh
#文件描述: 综合监控整个系统的服务进程增长情况
#发布日期: 2008/03/21
#程 序 员: XiaHuiLin
#修改：dinglei 2012/05/21
#############################################################################

Today=`date +%Y%m%d`

##MYLOGDIR=$HOME/psLog  #执行及日志目录
##LOGFILE=$MYLOGDIR/checkps_${Today}.log
##PS_FILE_OLD=$MYLOGDIR/ps_old
##PS_FILE_NEW=$MYLOGDIR/ps_new

MYLOGDIR=$HOME/psLog  #执行及日志目录
LOGFILE=$MYLOGDIR/checkps_${Today}.log
PS_FILE_OLD=$MYLOGDIR/ps_old
PS_FILE_NEW=$MYLOGDIR/ps_new

Wlog()
{
cTime=`date +"%Y-%m-%d %H:%M:%S"`
echo "[$cTime] $1" >>$LOGFILE

return 0
}

ps -elf >> $PS_FILE_NEW

if [ ! -e  ${PS_FILE_NEW} ]; then
	echo "文件${PS_FILE_NEW}不存在" >> $LOGFILE
	exit 0
fi

if [ ! -e  ${PS_FILE_OLD} ]; then
	mv ${PS_FILE_NEW} ${PS_FILE_OLD} >> $LOGFILE
	exit 0
fi

echo "\n\n\n" >>$LOGFILE
Wlog "==================================="

awk '
	BEGIN{
	    #此处可设置需过滤的字符串以及字符串总数
		aExps[1]="grep";
		aExps[2]="checkps";
		aExps[3]="ps -elf"
		aExps[4]="send-mail"
		aExps[5]="testcomm"
		aExps[6]="testfxcomm"
		iExps=6;
		}
	{
  		if (NR<=FNR)
  		{
  			for(i=0;i<=NF;i++){aFOld[FNR,i]=$i;}
  			iFOld_lines=FNR;
  		}
  		
  		if (NR>FNR)
  		{
  			for(j=0;j<=NF;j++){aFNew[FNR,j]=$j}
  			iNew_lines=FNR;
  		}
  		
	}
  END{mytmp=findchgps(aFNew,iNew_lines,aFOld,iFOld_lines);print "End";}
  	
  #查找变化、新增、丢失的进程
  function findchgps(afnew,ifnew_liens,afold,ifold_lines)
  {
    #查找有变化以及新增的进程
    for(j=1;j<=ifnew_liens;j++)
    {
  		for(i=1;i<=ifold_lines;i++)
  		{
  			if (afnew[j,4]==afold[i,4])
  			{
  				#如果不一致，则打印记录
  				if ((afnew[j,10]!=afold[i,10]) && (IsException(aExps,iExps,afnew[j,0])==0) )
  				{
  					print "-------------------------------------------------------------"
  					print "发现变化的进程:PID[" afnew[j,4] "] SIZE[" afold[i,10] "]-->[" afnew[j,10] "]";
  					print "原ps记录[" afold[i,0] "]"
  					print "现ps记录[" afnew[j,0] "]"
  				}
  				break;
  			}
  		}
  		# 未找到，是新的进程
  		if ((i>ifold_lines) && (IsException(aExps,iExps,afnew[j,0])==0) )
  		{
  			print "-------------------------------------------------------------"
  			print "发现新增的进程:PID[" afnew[j,4] "] SIZE[" afnew[j,10] "]";
  			print "现ps记录[" afnew[j,0] "]"	
  		}
  	}
  	#查找丢失的进程
  	for(i=1;i<=ifold_lines;i++)
  	{
  		for(j=1;j<=ifnew_liens;j++)
  		{
  			if (afnew[j,4]==afold[i,4])
  			{
  				break;
  			}
  		}
  		# 未找到，是丢失的进程
  		if( (j>ifnew_liens) && (IsException(aExps,iExps,afold[i,0])==0) )
  		{
  			print "-------------------------------------------------------------"
  			print "发现丢失的进程:PID[" afold[i,4] "] SIZE[" afold[i,10] "]";
  			print "原ps记录[" afold[i,0] "]"	
  		}  		
  	}
  	return 0;
  }
  
  #判断是否包含例外的字符串
  #返回值：0 非例外
  #        1 例外
  function IsException(aExp,iExp_count,sStr)
  {
    Result =0;
  	for(k=1;k<=iExp_count;k++)
  	{
  		if(match(sStr,aExp[k])!=0)
  		{
  			Result =1;
  			break;
  		}
  	}
  	return Result;
  }
  
' $PS_FILE_OLD $PS_FILE_NEW >> $LOGFILE


mv $PS_FILE_NEW $PS_FILE_OLD >> $LOGFILE


