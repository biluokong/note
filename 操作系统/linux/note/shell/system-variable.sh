echo '如果第一行没有用 #! 指定解释器，则会用当前shell去解释该脚本，即$SHELL表示的解释器'
#系统变量
echo "查看当前shell中所有变量：set命令"
echo "----------------------------------------------------"

echo "用单引号表示的字符串会忽略所有特殊字符"
echo "用双引号表示的字符串会忽略大部分特殊字符（不包括$）"
echo "----------------------------------------------------"

echo 'echo $HOME'
echo $HOME
echo "----------------------------------------------------"

echo 'echo $PWD 类似pwd命令'
echo $PWD
echo "----------------------------------------------------"

echo 'echo $SHELL'
echo $SHELL
echo "----------------------------------------------------"

echo 'echo $USER'
echo $USER
echo "----------------------------------------------------"
