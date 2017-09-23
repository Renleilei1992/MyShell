
echo "begin........."

for ProName in `find ../Cfg/ -name "shell12*" -print | awk -F "." '{print $3}'  | awk -F "/" '{print $3}'`
do
	echo $ProName;
	>$ProName.num
    iRet=`grep -n hi ../Cfg/$ProName.cfg | awk -F ":" '{print $1}' >> ./$ProName.num`
done

## iRet=`grep -n hi ../Cfg/shell12.cfg | awk -F ":" '{print $1}' >> ./num.txt`


for Name in `find ./ -name "*.num" -print | awk -F "." '{print $2}' | awk -F "/" '{print $2}'`
do
	echo "开始替换 $Name.cfg! ";
	while read Line
	do
		Line_num=$Line
		Line_num_B_1=`expr $Line - 1`
	
		echo "目标行号: "$Line_num
		echo "目标前一行号: "$Line_num_B_1

		B_1=`awk -v Num_B_1="$Line_num_B_1" 'NR==Num_B_1{print}' ../Cfg/$Name.cfg | tr -d '[ \t]'`
		if [ "$B_1" = "{" ]
		then
				echo "跳过该行! {";
		else
				val=`awk -v Num="$Line_num" -v Num_1="$Line_num_B_1" 'NR>=Num_1 && NR<=Num{if(NR==Num_1)tmp=$0;if(NR==Num)print $0 RS tmp;next;}1' ../Cfg/$Name.cfg >../Cfg/$Name_do.cfg`
				if [ $? -ne 0 ]; then echo "替换失败! ";exit 1;fi
				val_01=`mv ../Cfg/$Name_do.cfg ../Cfg/$Name.cfg`
				if [ $? -ne 0 ]; then echo "更名失败! ";exit 1;fi
		fi
	done<./$Name.num
done


## awk 'NR>=1 && NR<=3{if(NR==1)tmp=$0;if(NR==2) t=$0;if(NR==3) print $0 RS t RS tmp;next;}1' shell12.cfg
