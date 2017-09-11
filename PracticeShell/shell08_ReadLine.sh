
## 测试得出 shell 中read会将文件中一行内容的末尾空格或者初始空格都读消失
## 暂未发现解决办法
## 除非使用读出来结果，再在结果上添加上空格后写入文件


filename=./test08.txt
## for NuCount in `

while read -r Line
do
	echo "$Line"
done < $filename
