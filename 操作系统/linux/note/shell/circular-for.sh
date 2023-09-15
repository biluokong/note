!#/bin/bash
echo "语法1（for循环括号内的空格可以加也可以不加）："
echo 'for ((初始值; 循环控制条件; 变量变化))
do
	程序
done'
echo "语法2："
echo 'for 变量 in 值1 值2 值3 ...
do
	程序
done'
sum=0
for ((i=0; i<5; i++))
do
	sum=$[$i+$sum]
done
echo $sum

for i in zs ls ww
do
	echo $i
done

for i in $@
do
	echo $i
done
