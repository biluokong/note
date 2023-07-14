**（1） 准备环境**

| 服务器ip       | consul类型 | Node（节点名称） | 序号 |
| -------------- | ---------- | ---------------- | ---- |
| 192.168.74.101 | server     | server-1         | s1   |
| 192.168.74.102 | server     | server-2         | s2   |
| 192.168.74.103 | server     | server-3         | s3   |
| 192.168.71.1   | client     | clent-1          | s4   |

- Agent 以 client 模式启动的节点。在该模式下，该节点会采集相关信息，通过 RPC 的方式向 server 发送。Client模式节点有无数个，官方建议搭配微服务配置
- Agent 以 server 模式启动的节点。一个数据中心中至少包含 1 个 server 节点。不过官方建议使用 3 或 5 个 server 节点组建成集群，以保证高可用且不失效率。server 节点参与 Raft、维护会员信息、注册服务、健康检查等功能。

**（2） 安装consul并启动**

- 在每个consul节点上安装consul服务，下载安装过程和单节点一致。

```shell
##从官网下载最新版本的Consul服务
wget https://releases.hashicorp.com/consul/1.5.3/consul_1.5.3_linux_amd64.zip
##使用unzip命令解压
unzip consul_1.5.3_linux_amd64.zip
##将解压好的consul可执行命令拷贝到/usr/local/bin目录下
cp consul /usr/local/bin
##测试一下
consul
```

- 启动每个consul server节点

```shell
##登录s1虚拟机，以server形式运行
consul agent -server -bootstrap-expect 3 -data-dir /etc/consul.d -node=server-1 -bind=192.168.74.101 -ui -client 0.0.0.0 &
##登录s2 虚拟机，以server形式运行
consul agent -server -bootstrap-expect 2 -data-dir /etc/consul.d -node=server-2 -bind=192.168.74.102 -ui -client 0.0.0.0 & 
##登录s3 虚拟机，以server形式运行
consul agent -server -bootstrap-expect 2 -data-dir /etc/consul.d -node=server-3 -bind=192.168.74.103 -ui -client 0.0.0.0 & 
```

> **-server**： 以server身份启动。
>
> **-bootstrap-expect**：集群要求的最少server数量，当低于这个数量，集群即失效。
>
> **-data-dir**：data存放的目录，更多信息请参阅consul数据同步机制
>
> **-node**：节点id，在同一集群不能重复。
>
> **-bind**：监听的ip地址。
>
> **-client**：客户端的ip地址(0.0.0.0表示不限制)
>
> **&** ：在后台运行，此为linux脚本语法 

至此三个Consul Server模式服务全部启动成功

```shell
##在本地电脑中使用client形式启动consul
consul agent -client=0.0.0.0  -data-dir /etc/consul.d -node=client-1
```

**（3） 每个节点加入集群**

在s2，s3，s4 服务其上通过consul join 命令加入 s1中的consul集群中

```shell
##加入consul集群
consul join 192.168.74.101
```

**（4） 测试**

在任意一台服务器中输入 consul members查看集群中的所有节点信息

```shell
##查看consul集群节点信息
consul members
```

![1565233903922](images/1565233903922.png)



![1565233924944](images/1565233924944.png)

