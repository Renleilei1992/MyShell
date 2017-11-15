#��bin/ksh
echo "plsql ver 5.2"
###################################
#�������ƣ�plsql.sh
#����汾��5.2
#�����ܣ������ṩ�Ŀ��Ƽ��������в���ִ��
#��	    �ߣ�Sippon Hull
###################################
#���ƽű��ļ�
###################################
#���ƽű��ļ��ĸ�ʽ��
#	[sql][cmd]:[����ؼ���]��[sql���][ִ������]��
#	...
#���У�
#	sql��ʾ�����������һ��sql��䣬����dbaccessִ��
#	cmd��ʾ�����������һ��ϵͳ���ֱ��ִ�С�
#	����ؼ�������ʾϵͳ��������־���жϳ����ĸ��ؼ��ּ�����
#����ִ�еĴ����ˡ�
#	���磺sql���Ŀ������á�err����Ϊ�ؼ��֣������п����á����󡱡�
#	����������Ϊ�ؼ��֡�
###################################
#��������
if [ $# -ne 2 -a $# -ne 3 ]
then 
	echo "ʹ�÷�����"$0" ����ִ�е�sql����ļ�	��������	[ �������Ƿ��ظ�ִ�д����¼<Y/N> ]"
	echo "Ĭ�ϲ��ظ�ִ�д����¼"
	echo 
	exit 0
fi

#��������
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
#��������
##############################
if [ ! -s $scpname ]
then
	echo "���ƽű��ļ�"$scpname"������"
	echo
	exit 1
fi
##############################
#	��������
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
#����������￪ʼ
##############################
#��ʼ������״̬��
iCnt=0
IDLst=""
while [ $iCnt -lt $iMaxProc ]
do
	#����н��̺�����Ϊ0
	id[$iCnt]=0
	#����һ�����в�λ���б��嵥
	IDLst=`echo $IDLst" "$iCnt`
	iCnt=`expr $iCnt +1`
done
#ɾ�����ܴ��ڵĽ�����־�ļ�
/bin/rm $scpname.[0-9]* 1>/dev/null/ 2>&1
/bin/rm $scpname 1>/dev/null 2>&1

#��ȡ��ִ�е�����������ȥ��ע�����Լ�����
#cat $scpname |grep -v "^#" |grep -v "^--" |grep -v "^'" |grep -v "^$" > $scptemp
cat $scpname |grep "^cmd" > $scptemp
cat $scpname |grep "^sql" > $scptemp
filecnt=`cat $scptemp | wc -l `

#������ʼ
   iNowLine=1             	# ��ǰ�ļ��Ĵ�����������
   iIDLE=0			#���н���
   iEmptySlot=$IDLst	#��һ��ִ�е�ʱ��ղ�λ�������еĲ�λ
   while [ i ]
   do
   	#�Ȱ����пղ�λ����
	for iNowLine in $iEmptySlot
	do
		echo "��"$filecnt"��ִ�����ݣ���ǰ��"$iNowLine"�����ҵ���Slot��"$iNowSlot
		sLOGFILE=$scpname.$iNowSlot				#��־�ļ���
		sERRFILE=$scpname.$iNowLine.err			#�����ļ�
		/bin/rm -rf $sLOGFILE $sERRFILE 1>/dev/null 2>&1		#������ʱ�ļ�
		ExecType=`head -n $iNowLine $scpname | tail -n 1 | awk  - F":" ' {print $1} '`
		ErrKeywd=`head -n $iNowLine $scpname | tail -n 1 | awk - F":" ' {print $2} '`
		
		if [ "ExecType" = "$SQLKEYWORD" ]
		then
			#sql���
			{
				dbaccess $AP_DATABASE_NAME 1>$sLOGFILE 2>&1 <<=
				set isolation to dirty read ;
				`head -n $iNowLine $scptemp | tail -n 1 |awk - F ":" ' {for (i=3; i<NF; i++) {printf($i":")}; printf($NF"\n")}'`
				
				ResCode=$?
				grep -i $ErrKeywd $sLOGFILE 1>/dev/null 2>&1
				if [ $? -ne 1 -o $ResCode -ne 0 ]
				then 
					#����ֵ��Ϊ0������־���д���ؼ���
					head -n $iNowLine $scpname | tail -n 1 >$sERRFILE
					cat $sLOGFILE >>$sERRFILE
				fi
				/bin/rm $sLOGFILE >> $sERRFILE				
			}&
			id[ $iNowSlot ]=$!
			elif [ "$ExecType" = "$CMDKEYWORD" ]
			then
				#ִ������
				{
					`head -n $iNowLine $scptemp | tail -n 1 |awk - F":" ' for (i=3; i<NF;i++){printf($NF"\n")} '` 1>$sLOGFILE 2>&1 
					ResCode=$?
					grep -i $ErrKeywd $sLOGFILE 1>/dev/null 2>&1
					if [ $? -ne 1 -o $ResCode -ne 0 ]
					then 
						#����ֵ��Ϊ0������־���д���ؼ���
						head -n $iNowLine $scptemp | tail -n 1 >$sERRFILE
						cat $sLOGFILE >> $sERRFILE
					fi
					/bin/rm $sLOGFILE 1>/dev/null 2>&1
				}&
				id[ $iNowSlot]=$!
			else
				#��֧�ֵ�ִ������
				head -n $iNowLine $scptemp | tail -n 1 >$sERRFILE
				echo "�ݲ�֧��ִ�����������"$ExecType"("$ErrKeywd")" >>sERRFILE
		fi
		iNowLine=`expr $iNowLine + 1`
		#�ļ�������Ͼ��˳������õ����в�λɨ����
		if [ $iNowLine -gt $filecnt ]
		then
			break
		fi
	done
	#�ļ�������Ͼ��˳�������������ѭ�����������ﻹ���˳�һ��
	if [ $iNowLine  -gt $filecnt ]
	then
		break
	fi
	#�ٲ�ѯ���п��н���Ϊֹ
	CheckSlot
done

# �ȴ�����
echo "�ȴ�����"
iRunningCnt=iMaxProc
iLastCnt=0
iLastRunSlot=$IDLst					# ��һ��ѭ������ִ�еĲ�λ
iRunningSlot=""						# ��ǰ����ִ�еĲ�λ
while [ $iRunningCnt -ne 0 ]
do 
	CheckSlot
	iRunningCnt=0
	iRunningSlot=""
	for i in $iLastRunSlot
	do
		if [ ${id[$i]} -ne 0 ]
		then 
			#�����ǰ��λδ���У����������ӵ����в�λ�嵥��
			iRunningCnt=`expr $iRunningCnt + 1`
			iRunningSlot=`echo $iRunningSlot" "$i`
		fi
	done
	if [ $iRunningCnt -ne $iLastCnt ]
	then
		echo "��ʣ"$iRunningCnt"��"
		iLastCnt=$iRunningCnt
	fi
	if [ $iRunningCnt  -gt 0 ]
	then
		#������������е����ݣ�������еĲ�λ�嵥��ֵ��iLastRunSlot�����ȴ�һ����
		iLastRunSlot=$iRunningSlot
		sleep $SLEEPTIME
	fi
done
#���ʧ�ܵ��������ִ��һ�£����ִ��ʧ�ܣ��ٰ�ִ�еĽ���ǻ�ԭ��־������ɾ��ԭ��־��
if [ "$iRedo" = "Y" -o "$iRedo" = "y" ]
then
	#����д���ļ�¼��ȫ�������¼����һ��
	if [ -s $scpname.[0-9]*.err ]
	then
		echo "ִ���д��󣬰Ѵ����������ִ��һ��"
		iNowSlot=0
		LST=`ls $scpname.[0-9]*.err`
		
		for i_File in $LST
		do
			iNowLine=`echo $i_File |awk - F "." ' {printf($(NF-1))} '`
			sLOGFILE=$scpname.$iNowSlot
			sERRFILE=$scpname.$iNowLine.err
			/bin/rm -rf $sLOGFILE $sERRFILE 1>/dev/null 2>&1
			ExecType=`head -n $iNowLine`
			ErrKeywd=`head -n $iNowLine $scpname | tail -n 1| awk - F":" '{print $1}'`     #ִ�����ݵ�����
			ErrKeywd=`head -n $iNowLine $scpname | tail -n 1| awk - F":" '{print $2}'`     #ִ�����ݷ��صĴ���ؼ���
			
			if [ "$ExecType" = "$CMDKEYWORD" ]
			then
			# sql ����
				echo "Run SQL: "`head -n $iNowLine $scptemp |tail -n 1 |awk - F ":" ' for (i=3; i<NF; i++) { printf($i":") };pirntf{$NF"\n")} '`"    \c"
				dbaccess $AP_DATABASE_NAME 1>$sLOGFILE 2>&1 <<=
				set isolation to dirty read;
				`head -n $iNowLine $scptemp | tail -n 1 |awk - F ":" ' {for (i=3; i<NF; i++){ printf($i":") }; pirntf($NF"\n")} '`
				ResCode=$?
			elif [ "$ExecType" = "CMDKEYWORD" ]
			then
			#ִ������
				echo "Run CMD: "`head -n $iNowLine $scptemp |tail -n 1 |awk - F ":" ' for (i=3; i<NF; i++) { printf($i":") };pirntf{$NF"\n")} '`"    \c"
				`head -n $iNowLine $scptemp | tail -n 1 |awk - F ":" ' {for (i=3; i<NF; i++){ printf($i":") }; pirntf($NF"\n")} '` 1>$sLOGFILE 2>&1
				ResCode=$?
			else
				#��֧�ֵ�ִ������
				echo "�ݲ�֧�����������"$ExecType"("$ErrKeywd")	\c"
				echo "�ݲ�֧�����������"$ExecType"("$ErrKeywd")" >> $sLOGFILE
				ResCode=FALL
			fi
			#��鴦����
			grep -i $ErrKeywd $sLOGFILE 1>/dev/null/ 2>&1
			if [ $? -ne 1 -o $ResCode -ne 0 ]
			then
				#��������벻Ϊ0��������־���д���֣���ǼǴ������ݺʹ�����־
				head -n $iNowLine $scptemp |tail -n 1 > $sERRFILE
				cat $sLOGFILE >> $sERRFILE
				echo "ʧ��"
			else
				echo "�ɹ�"
			fi
			/bin/rm $sLOGFILE 1>/dev/null 2>&1     #�ű�����ʱ������������������ض�����ϵͳ������
		done
	fi
fi
#������ʱ�ļ�
/bin/rm $scptemp 1>/dev/null 2>&1

#���ִ�еĽ��״̬
if [ -s $scpname.[0-9]*.err ]
then
	echo "�����д�������."
	ls -aFl $scpname.[0-9]*.err
	exit 1
fi
exit 0

##############################
#���õĸ�ʽ
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

