
##多进程处理
>chk.log

start=`date "+%S"`

for i in $(seq 1 5)
do
	{
		echo $i"'s process is working!";sleep 5
	}&
done

wait

end=`date "+%S"`
echo "Time: `expr $end - $start`"


start=`date "+%S"`
func_1()
{
	echo "func_1's process is working!";sleep 1
}

func_2()
{
	echo "func_2's process is working!";sleep 2
}

func_3()
{
	echo "func_3's process is working!";sleep 3
}

for func in func_1 func_2 func_3
do
	{
		$func > $func.log 2>&1
	}&
done

wait

for func in func_1 func_2 func_3 
do
	iRet=`cat $func.log >> chk.log`
##	iRet=`rm -rf $func.log`
done

end=`date "+%S"`
echo "Time: `expr $end - $start`"
