#!/bin/bash
echo "语法1："
echo 'while [ 条件判断式 ]
do
	程序
done'
sum=0
i=1
while [ $i -le 100 ]
do
	sum=$[$sum+$i]
	i=$[$i+1]
done
echo $sum
echo
sum=0
i=1
while (($i <= 100))
do
	sum=$(($sum+$i))
	i=$(($i+1))
done
echo $sum
