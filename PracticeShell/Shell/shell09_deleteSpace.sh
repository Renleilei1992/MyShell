
##

>../Cfg/shell09_1.cfg
sum=-1

while read Line
do
##	echo $Line;
	echo $Line | tr -d '[ \t]' >> ../Cfg/shell09_1.cfg;
done<../Cfg/shell09.cfg

while read Line
do
##	echo $Line;
	var_01=`echo $Line | awk -F "," '{print $1}' | awk -F "(" '{print $2}'`;
	var_02=`echo $Line | awk -F "(" '{print $3}' | awk -F ")" '{print $1}'`;
	var_03=`echo $Line | awk -F ")" '{print $2}'`;
##	echo $var_01;
##	echo $var_02;
##	echo $var_03;
	if [ $var_01 != $var_02 ]
	then
		echo "变量不同请更改!     "$Line;
	fi
	if [ "$var_03" != $sum ]
	then
		echo "请检查是否需要减一! "$Line;
	fi
done<../Cfg/shell09_1.cfg
