#!/bin/bash
echo "----------------------------算术运算符------------------"
echo '运算符：+-/*，运算方式：$((运算式)) 或 $[运算式]'
echo
echo "----------------------------条件判断------------------"
echo "语法：test codition 或 [ codition ]（方括号的空格是必需的）"
echo '关系运算符以参数形式表示：'
echo "整数比较：-eq(equal)、-ne、-lt(less than)、-le、-gt(greater than)、-ge"
echo "字符串比较：=、!=（相等判断一个等于号即可）"
echo "对文件的权限进行判断：-r、-w、-x（分别表示是否有读、写、执行的权限）"
echo "对文件的类型进行判断：-e(exist)、-f(file)、-d(directory)"
echo
echo "---------------------------多条件判断和多命令执行--------------------"
echo "&&、||：如[ codition ] && [ codition ]、vi xxx.sh && chmod +x xxx.sh，用于不同命令之间"
echo "-a(and)、-o(or)、!(非)：如 test codition -a coditon、[ codition -o codition ]，用于同一个命令内"
echo
echo "---------------------------条件判断：((codition))---------------------"
echo '该方式使用运算符和java一样，只是空格是必要的，此方式不能用-eq等进行条件判断'
echo '运算符可以使用：<、>、!=、>=、&&、!、||等，有的运算符与操作数之间需要空格，运算符间有优先级'
echo
echo "--------------------------例子-------------------------"
echo 'test 30 -eq 22 && echo $?（echo $?命令无法用&&一起执行，只能分开执行，所以这里无值输出）'
test 30 -eq 22 && echo $?
echo 'test 30 -eq 22 \r\n echo $?（echo $?命令无法用&&一起执行，只能分开执行）'
test 30 -eq 22
echo $?
echo 'test ! 30 -eq 22 \r\n echo $?'
test ! 30 -eq 22
echo $?
echo 'test 30 -gt 20 -a 30 -gt 40 \r\n echo $?'
test 30 -gt 20 -a 30 -gt 40
echo $?
echo '[ 30 -gt 20 ] \r\n echo $?'
[ 30 -gt 20 ] && echo $?
echo '[ 20 -lt 15 ] || [ 20 -lt 25 ] \r\n echo $?'
[ 20 -lt 15 ] || [ 20 -lt 25 ] && echo $?
echo '[ 20 -lt 15 ] && [ 20 -lt 25 ] \r\n echo $?'
[ 20 -lt 15 ] && [ 20 -lt 25 ] 
echo $?
