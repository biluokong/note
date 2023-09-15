#!/bin/bash
echo "-------------------------系统函数---------------------"
echo
echo "-------------------------basename----------------------"
echo 'basename [string / pathname] [suffix] （功能描述：basename 命令会删掉所有的前缀包括最后一个（‘/’）字符，然后将字符串显示出来。
basename 可以理解为取路径里的文件名称
选项：
suffix 为后缀，如果 suffix 被指定了，basename 会将 pathname 或 string 中的 suffix 去掉。'
filename=$(basename $0)
echo "当前文件绝对路径为：$PWD/$filename"
echo "使用basename命令后："
basename $PWD/$filename
echo
echo "------------------------dirname-----------------------"
echo 'dirname 文件绝对路径。去除文件名(非目录部分)'
echo "当前文件绝对路径为：$PWD/$filename"
echo "使用dirname命令后："
dirname $PWD/$filename
echo
echo "-----------------------自定义函数-----------------"
echo "语法："
echo '[function] funname[(arg1,arg2...)]
{
	action;
	[return int;]	(int的值为0-255)
}'
echo "注：function 和 括号 不能同时省略"
echo
sum()
{
	read -p '请输入num1：' num1
	read -p '请输入num2：' num2
	echo $[$num1+$num2]
}
sum
