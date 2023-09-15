#!/bin/bash
echo "-----------------------------输入----------------------"
echo "读取控制台输入命令：read"
echo 'read (选项) (参数)
选项：
-p：指定读取值时的提示符；
-t：指定读取值时等待的时间（秒）如果-t 不加表示一直等待
参数
变量名：指定输入数据存储的变量'
read -t 7 -p "请输入姓名：" name
echo $name
echo
echo "----------------------------输出-----------------------"
echo "发送消息：write"
echo "write login_user terminal msg"
echo 'login_user：当前登录的用户名'
echo 'terminal 当前登录的终端名'
echo 'msg：要发送的消息'
