
val=1

proc_1()
{
while(($val<10))
do
	echo $val >> ../Log/pro_1.log
    sleep 1
    ((val=val+1))
done
}

proc_2()
{
while(($val<10))
do
	echo $val >> ../Log/pro_2.log
    sleep 1
    ((val=val+1))
done
}

proc_3()
{
while(($val<10))
do
	echo $val >> ../Log/pro_3.log
    sleep 1
    ((val=val+1))
done
}

proc_main()
{
for pro_num in proc_1 porc_2 proc_3
do
	echo "$proc_num ..."
	{
		$pro_num;
	}&
	wait
done
}

proc_main
}
