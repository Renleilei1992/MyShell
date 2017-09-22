
>./num.txt

iRet=`grep -n hi ../Cfg/shell12.cfg | awk -F ":" '{print $1}' >> ./num.txt`

while read Line
do
	Line_num=$Line
	Line_num_B_1=`expr $Line - 1`

	echo "目标行号: "$Line_num
	echo "目标前一行号: "$Line_num_B_1

	val=`awk `

done<./num.txt


## awk 'NR>=1 && NR<=3{if(NR==1)tmp=$0;if(NR==2) t=$0;if(NR==3) print $0 RS t RS tmp;next;}1' shell12.cfg
