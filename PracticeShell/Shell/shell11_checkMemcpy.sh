
>../Cfg/check.log
>../Log/NeedCorrect.txt

sum=-1
var_Strcpy=strcpy

while read Line
do
	echo $Line | tr -d '[ \t]' >> ../Cfg/check.log
done<allTrans.txt

while read Line
do
	var_00=`echo $Line | awk -F ";" '{print $3}' | awk -F "(" '{print $1}'`;
	var_01=`echo $Line | awk -F ";" '{print $1}' | awk -F "(" '{print $2}'`;
	var_02=`echo $Line | awk -F "(" '{print $3}' | awk -F ")" '{print $1}'`;
	var_03=`echo $Line | awk -F ")" '{print $2}'`;

	if [ $var_00 == $var_Strcpy ]
	then
		echo $Line >> NeedCorrect.txt;
		continue;
	fi

	if [ $var_01 != $var_02 ]
	then
		echo "变量不同请更改!    "$Line;
	fi

	if [ ! -n "$var_03"]
	then
		echo "请检查是否需要减一!"$Line;
	fi
done<check.log
