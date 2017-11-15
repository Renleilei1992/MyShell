#！bin/ksh
echo "plsql ver 5.2"
###################################
#程序名称：plsql.sh
#程序版本：5.2
#程序功能：根据提供的控制技术，进行并发执行
#作	    者：Sippon Hull
###################################
#控制脚本文件
###################################
#控制脚本文件的格式：
#	[sql][cmd]:[错误关键字]：[sql语句][执行命令]；
#	...
#其中：
#	sql表示后续的语句是一条sql语句，调用dbaccess执行
#	cmd表示后续的语句是一条系统命令，直接执行。
#	错误关键字是提示系统检查输出日志，判断出现哪个关键字即代表
#本行执行的错误了。
#	例如：sql语句的可以利用“err”作为关键字；命令行可以用“错误”、
#	“出错”等作为关键字。
###################################
#输入项检查
if [ $# -ne 2 -a $# -ne 3 ]
then 
	echo "使用方法："$0" 并发执行的sql语句文件	并发数量	[ 结束后是否重复执行错误记录<Y/N> ]"
	echo "默认不重复执行错误记录"
	echo 
	exit 0
fi

#变量定义
scpname=$1
iMaxProc=$2
if [ $# -ep 3 ]
then
	iReDo=$3
else 
	iReDo="N"
fi
SLEEPTIME=1
SQLKEYWORD="sql"
CMDKEYWORD="cmd"
FALL=1

scptemp=$scpname.runlist.tmp
##############################
#输入项检查
##############################
if [ ! -s $scpname ]
then
	echo "控制脚本文件"$scpname"不存在"
	echo
	exit 1
fi
##############################
#	函数定义
##############################
CheckSlot()
{
	iTDLE=0
	iEmptySlot=""
	while [ 1 ]
	do
		PIDLST=`ps | awk ' {print "[", $1, "]"} ' | grep -v "PID"`
		for i in $IDLst
		do
			if [ ${id[$i]} -eq 0 ]
			then
				iIDLE=`expr $iIDLE + 1`
				iEmptySlot=`echo $iEmptySlot" "$i`
				continue
			fi
			echo $PIDLST | grep " "${id[$i]}" " 1>/del/null 2>&1
			fi [ $? -ne 0 ]
			then 
				id[$i]=0
				iIDLE=`expr $iIDLE + 1`
				iEmptySlot=`echo $iEmptySlot" "$i`
			fi
		done
		if [ $iIDLE -gt 0 ]
		then
			break
		fi
		sleep $SLEEPTIME
	done
}

##############################
#主程序从这里开始
##############################
#初始化运行状态表
iCnt=0
IDLst=""
while [ $iCnt -lt $iMaxProc ]
do
	#表格中进程号设置为0
	id[$iCnt]=0
	#生成一个所有槽位的列表清单
	IDLst=`echo $IDLst" "$iCnt`
	iCnt=`expr $iCnt +1`
done
#删除可能存在的进程日志文件
/bin/rm $scpname.[0-9]* 1>/dev/null/ 2>&1
/bin/rm $scpname 1>/dev/null 2>&1

#获取待执行的语句的数量，去掉注释行以及空行
#cat $scpname |grep -v "^#" |grep -v "^--" |grep -v "^'" |grep -v "^$" > $scptemp
cat $scpname |grep "^cmd" > $scptemp
cat $scpname |grep "^sql" > $scptemp
filecnt=`cat $scptemp | wc -l `

#并发开始
   iNowLine=1             	# 当前文件的处理行数计数
   iIDLE=0			#空闲进程
   iEmptySlot=$IDLst	#第一次执行的时候空槽位就是所有的槽位
   while [ i ]
   do
   	#先把所有空槽位填满
	for iNowLine in $iEmptySlot
	do
		echo "共"$filecnt"条执行内容，当前第"$iNowLine"条，找到的Slot号"$iNowSlot
		sLOGFILE=$scpname.$iNowSlot				#日志文件名
		sERRFILE=$scpname.$iNowLine.err			#错误文件
		/bin/rm -rf $sLOGFILE $sERRFILE 1>/dev/null 2>&1		#清理临时文件
		ExecType=`head -n $iNowLine $scpname | tail -n 1 | awk  - F":" ' {print $1} '`
		ErrKeywd=`head -n $iNowLine $scpname | tail -n 1 | awk - F":" ' {print $2} '`
		
		if [ "ExecType" = "$SQLKEYWORD" ]
		then
			#sql语句
			{
				dbaccess $AP_DATABASE_NAME 1>$sLOGFILE 2>&1 <<=
				set isolation to dirty read ;
				`head -n $iNowLine $scptemp | tail -n 1 |awk - F ":" ' {for (i=3; i<NF; i++) {printf($i":")}; printf($NF"\n")}'`
				
				ResCode=$?
				grep -i $ErrKeywd $sLOGFILE 1>/dev/null 2>&1
				if [ $? -ne 1 -o $ResCode -ne 0 ]
				then 
					#返回值不为0或者日志中有错误关键字
					head -n $iNowLine $scpname | tail -n 1 >$sERRFILE
					cat $sLOGFILE >>$sERRFILE
				fi
				/bin/rm $sLOGFILE >> $sERRFILE				
			}&
			id[ $iNowSlot ]=$!
			elif [ "$ExecType" = "$CMDKEYWORD" ]
			then
				#执行命令
				{
					`head -n $iNowLine $scptemp | tail -n 1 |awk - F":" ' for (i=3; i<NF;i++){printf($NF"\n")} '` 1>$sLOGFILE 2>&1 
					ResCode=$?
					grep -i $ErrKeywd $sLOGFILE 1>/dev/null 2>&1
					if [ $? -ne 1 -o $ResCode -ne 0 ]
					then 
						#返回值不为0或者日志中有错误关键字
						head -n $iNowLine $scptemp | tail -n 1 >$sERRFILE
						cat $sLOGFILE >> $sERRFILE
					fi
					/bin/rm $sLOGFILE 1>/dev/null 2>&1
				}&
				id[ $iNowSlot]=$!
			else
				#不支持的执行类型
				head -n $iNowLine $scptemp | tail -n 1 >$sERRFILE
				echo "暂不支持执行这类操作："$ExecType"("$ErrKeywd")" >>sERRFILE
		fi
		iNowLine=`expr $iNowLine + 1`
		#文件处理完毕就退出，不用等所有槽位扫描完
		if [ $iNowLine -gt $filecnt ]
		then
			break
		fi
	done
	#文件处理完毕就退出，由于是两层循环，所以这里还得退出一次
	if [ $iNowLine  -gt $filecnt ]
	then
		break
	fi
	#再查询到有空闲进程为止
	CheckSlot
done

# 等待结束
echo "等待结束"
iRunningCnt=iMaxProc
iLastCnt=0
iLastRunSlot=$IDLst					# 上一个循环还在执行的槽位
iRunningSlot=""						# 当前还在执行的槽位
while [ $iRunningCnt -ne 0 ]
do 
	CheckSlot
	iRunningCnt=0
	iRunningSlot=""
	for i in $iLastRunSlot
	do
		if [ ${id[$i]} -ne 0 ]
		then 
			#如果当前槽位未空闲，则计数并添加到运行槽位清单中
			iRunningCnt=`expr $iRunningCnt + 1`
			iRunningSlot=`echo $iRunningSlot" "$i`
		fi
	done
	if [ $iRunningCnt -ne $iLastCnt ]
	then
		echo "还剩"$iRunningCnt"个"
		iLastCnt=$iRunningCnt
	fi
	if [ $iRunningCnt  -gt 0 ]
	then
		#如果还有在运行的内容，则把运行的槽位清单赋值给iLastRunSlot，并等待一秒钟
		iLastRunSlot=$iRunningSlot
		sleep $SLEEPTIME
	fi
done
#最后将失败的语句重新执行一下，如果执行失败，再把执行的结果记回原日志，否则删除原日志。
if [ "$iRedo" = "Y" -o "$iRedo" = "y" ]
then
	#如果有错误的记录则全部错误记录再做一次
	if [ -s $scpname.[0-9]*.err ]
	then
		echo "执行有错误，把错误的内容再执行一次"
		iNowSlot=0
		LST=`ls $scpname.[0-9]*.err`
		
		for i_File in $LST
		do
			iNowLine=`echo $i_File |awk - F "." ' {printf($(NF-1))} '`
			sLOGFILE=$scpname.$iNowSlot
			sERRFILE=$scpname.$iNowLine.err
			/bin/rm -rf $sLOGFILE $sERRFILE 1>/dev/null 2>&1
			ExecType=`head -n $iNowLine`
			ErrKeywd=`head -n $iNowLine $scpname | tail -n 1| awk - F":" '{print $1}'`     #执行内容的类型
			ErrKeywd=`head -n $iNowLine $scpname | tail -n 1| awk - F":" '{print $2}'`     #执行内容返回的错误关键字
			
			if [ "$ExecType" = "$CMDKEYWORD" ]
			then
			# sql 命令
				echo "Run SQL: "`head -n $iNowLine $scptemp |tail -n 1 |awk - F ":" ' for (i=3; i<NF; i++) { printf($i":") };pirntf{$NF"\n")} '`"    \c"
				dbaccess $AP_DATABASE_NAME 1>$sLOGFILE 2>&1 <<=
				set isolation to dirty read;
				`head -n $iNowLine $scptemp | tail -n 1 |awk - F ":" ' {for (i=3; i<NF; i++){ printf($i":") }; pirntf($NF"\n")} '`
				ResCode=$?
			elif [ "$ExecType" = "CMDKEYWORD" ]
			then
			#执行命令
				echo "Run CMD: "`head -n $iNowLine $scptemp |tail -n 1 |awk - F ":" ' for (i=3; i<NF; i++) { printf($i":") };pirntf{$NF"\n")} '`"    \c"
				`head -n $iNowLine $scptemp | tail -n 1 |awk - F ":" ' {for (i=3; i<NF; i++){ printf($i":") }; pirntf($NF"\n")} '` 1>$sLOGFILE 2>&1
				ResCode=$?
			else
				#不支持的执行类型
				echo "暂不支持这类操作："$ExecType"("$ErrKeywd")	\c"
				echo "暂不支持这类操作："$ExecType"("$ErrKeywd")" >> $sLOGFILE
				ResCode=FALL
			fi
			#检查处理结果
			grep -i $ErrKeywd $sLOGFILE 1>/dev/null/ 2>&1
			if [ $? -ne 1 -o $ResCode -ne 0 ]
			then
				#如果返回码不为0，或者日志中有错别字，则登记错误内容和错误日志
				head -n $iNowLine $scptemp |tail -n 1 > $sERRFILE
				cat $sLOGFILE >> $sERRFILE
				echo "失败"
			else
				echo "成功"
			fi
			/bin/rm $sLOGFILE 1>/dev/null 2>&1     #脚本运行时，所有输出包括错误重定向至系统垃圾堆
		done
	fi
fi
#清理临时文件
/bin/rm $scptemp 1>/dev/null 2>&1

#输出执行的结果状态
if [ -s $scpname.[0-9]*.err ]
then
	echo "运行有错误，请检查."
	ls -aFl $scpname.[0-9]*.err
	exit 1
fi
exit 0

##############################
#调用的格式
##############################
plsql ./dpi_job13.scp 1
##############################
sql:rror:load from docinfaaa insert into uvp_cst_docs_inf;
sql:rror:load from docinfaab insert into uvp_cst_docs_inf;
sql:rror:load from docinfaac insert into uvp_cst_docs_inf;
sql:rror:load from docinfaad insert into uvp_cst_docs_inf;
sql:rror:load from docinfaae insert into uvp_cst_docs_inf;
##############################
cmd:rror:sh /cbs/bin/DataMigrRun/MIG/11s1/DJKZ_unload_001.sh
cmd:rror:sh /cbs/bin/DataMigrRun/MIG/11s1/DJKZ_unload_002.sh
cmd:rror:sh /cbs/bin/DataMigrRun/MIG/11s1/PYE_unload_001.sh
##############################

