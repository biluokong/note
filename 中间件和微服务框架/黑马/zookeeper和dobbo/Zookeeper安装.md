## 1.1 下载安装

**1、环境准备**

ZooKeeper服务器是用Java创建的，它运行在JVM之上。需要安装JDK 7或更高版本。

**2、上传**

将下载的ZooKeeper放到/opt/ZooKeeper目录下

```shell

#上传zookeeper alt+p
put f:/setup/apache-zookeeper-3.5.6-bin.tar.gz
#打开 opt目录
cd /opt
#创建zooKeeper目录
mkdir  zooKeeper
#将zookeeper安装包移动到 /opt/zooKeeper
mv apache-zookeeper-3.5.6-bin.tar.gz /opt/zookeeper/
```

**3、解压**

将tar包解压到/opt/zookeeper目录下

```shell
tar -zxvf apache-ZooKeeper-3.5.6-bin.tar.gz 
```

## 1.2 配置启动

**1、配置zoo.cfg**

进入到conf目录拷贝一个zoo_sample.cfg并完成配置

```shell
#进入到conf目录
cd /opt/zooKeeper/apache-zooKeeper-3.5.6-bin/conf/
#拷贝
cp  zoo_sample.cfg  zoo.cfg
```



修改zoo.cfg

```shell
#打开目录
cd /opt/zooKeeper/
#创建zooKeeper存储目录
mkdir  zkdata
#修改zoo.cfg
vim /opt/zooKeeper/apache-zooKeeper-3.5.6-bin/conf/zoo.cfg
```

![1577548250377](images/1577548250377.png)

修改存储目录：dataDir=/opt/zookeeper/zkdata

**2、启动ZooKeeper**

```shell
cd /opt/zooKeeper/apache-zooKeeper-3.5.6-bin/bin/
#启动
 ./zkServer.sh  start
```

![1577548052037](images/1577548052037.png)

看到上图表示ZooKeeper成功启动

**3、查看ZooKeeper状态**

```shell
./zkServer.sh status
```

zookeeper启动成功。standalone代表zk没有搭建集群，现在是单节点

![1577548175232](images/1577548175232.png)

zookeeper没有启动

![1577548112773](images/1577548112773.png)

## 1.3 docker安装使用

- 查看本地镜像和检索拉取Zookeeper 镜像

```sh
# 查看本地镜像
docker images
# 检索ZooKeeper 镜像
docker search zookeeper
# 拉取ZooKeeper镜像最新版本
docker pull zookeeper:latest
# 我使用的版本
docker pull zookeeper:3.5.7
```

- 创建ZooKeeper 挂载目录（数据挂载目录、配置挂载目录和日志挂载目录）

```sh
# 以下步骤可以先不做
mkdir -p /mydata/zookeeper/data # 数据挂载目录
mkdir -p /mydata/zookeeper/conf # 配置挂载目录
mkdir -p /mydata/zookeeper/logs # 日志挂载目录
```

- 启动ZooKeeper容器

```sh
docker run -d --name zk --privileged=true -p 2181:2181  -v /mydata/zookeeper/data:/data -v /mydata/zookeeper/conf:/conf -v /mydata/zookeeper/logs:/datalog zookeeper:3.5.7
# 简易
docker run --name zk --privileged -p 2181:2181 -d zookeeper:3.5.7

#参数说明
-e TZ="Asia/Shanghai" # 指定上海时区 
-d # 表示在一直在后台运行容器
-p 2181:2181 # 对端口进行映射，将本地2181端口映射到容器内部的2181端口
--name # 设置创建的容器名称
-v # 将本地目录(文件)挂载到容器指定目录；
--restart always #始终重新启动zookeeper，看需求设置不设置自启动
```

- 添加ZooKeeper配置文件，在挂载配置文件目录(/mydata/zookeeper/conf)下，新增zoo.cfg 配置文件，配置内容如下：

```sh
dataDir=/data  # 保存zookeeper中的数据
clientPort=2181 # 客户端连接端口，通常不做修改
dataLogDir=/datalog
tickTime=2000  # 通信心跳时间
initLimit=5    # LF(leader - follower)初始通信时限
syncLimit=2    # LF 同步通信时限
autopurge.snapRetainCount=3
autopurge.purgeInterval=0
maxClientCnxns=60
standaloneEnabled=true
admin.enableServer=true
server.1=localhost:2888:3888;2181
```

- 进入容器内部，验证容器状态

```sh
# 进入zookeeper 容器内部
docker exec -it zookeeper /bin/bash
docker exec -it zookeeper bash
cd bin/
# 检查容器状态
./zkServer.sh status
# 进入控制台
./zkCli.sh
```

