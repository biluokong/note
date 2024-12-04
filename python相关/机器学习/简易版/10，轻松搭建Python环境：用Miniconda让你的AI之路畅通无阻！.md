### 轻松搭建Python环境

Miniconda让你的AI之路畅通无阻！

<img src="imgs/image-20230315101700514.png" alt="image-20230315101700514" style="zoom: 25%;" />

在公司里面做为AI算法工程师，大部分工作时都会使用python语言，但是做人工智能不一定非要Python。



### 为何选择Miniconda

<img src="imgs/image-20230315101816878.png" alt="image-20230315101816878" style="zoom: 33%;" />



### 下载Miniconda

推荐从清华镜像下载安装包，因为从官网下载比较慢

https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/

打开网页后，下拉到最后找到Miniconda3-latest前缀的文件，或者网页中直接搜索Miniconda3-latest，都可以找到如下图这些安装文件。如果是windows 64位系统，则可以选择下载图中红色框中的安装文件，其它系统可以根据文件名称选择对应的安装文件。

![image-20220214094932453](imgs/image-20220214094932453.png)

温馨提示：

如果之前电脑中安装过原生python，建议先将原生python删除，

![image-20230315105519307](imgs/image-20230315105519307.png)

至少需要在环境变量中删除原生python对应项；

然后再去安装Miniconda；



### 安装Miniconda

2024新版参考：[最新版最详细Anaconda新手安装+配置+环境创建教程_anaconda配置-CSDN博客](https://blog.csdn.net/qq_44000789/article/details/142214660)

<img src="imgs/image-20220214111313678.png" alt="image-20220214111313678" style="zoom: 50%;" />

<img src="imgs/image-20220214111344264.png" alt="image-20220214111344264" style="zoom: 50%;" />

<img src="imgs/image-20220214111451199.png" alt="image-20220214111451199" style="zoom: 50%;" />

<img src="imgs/image-20220214111529748.png" alt="image-20220214111529748" style="zoom: 50%;" />

<img src="imgs/image-20220214111755326.png" alt="image-20220214111755326" style="zoom: 50%;" />

![image-20220214113036336](imgs/image-20220214113036336.png)

温馨提示：

请确保你使用的电脑用户对安装的Miniconda目录有完全控制权！

<img src="imgs/image-20230315112926220.png" alt="image-20230315112926220" style="zoom:50%;" />



### 配置环境变量

<img src="imgs/image-20220214112029956.png" alt="image-20220214112029956" style="zoom: 50%;" />

<img src="imgs/image-20220214112803008.png" alt="image-20220214112803008" style="zoom: 50%;" />

<img src="imgs/image-20230315112605835.png" alt="image-20230315112605835" style="zoom:50%;" />



**验证是否安装成功**

`cmd`打开命令行窗口，输入`conda info`，看到类似下图信息，说明安装成功

![image-20220214113758278](imgs/image-20220214113758278.png)

或者 输入框搜索anaconda，打开Anaconda Powershell Prompt应用

<img src="imgs/image-20220217123558984.png" alt="image-20220217123558984" style="zoom:50%;" />

输入`conda info`，看到类似下图信息，说明安装成功

![image-20220217123804407](imgs/image-20220217123804407.png)



### 开发第一个Python程序

**第一步：使用记事本，编写代码**

```python
print("hello world! ")
```

在D盘下保存路径`d:/mycode`, 文件名`Welcome.py`

![image-20220217123109818](imgs/image-20220217123109818.png)

新建文件时，注意文件后缀

![image-20220218152302535](imgs/image-20220218152302535.png)

**第二步：运行阶段**

打开Anaconda Powershell Prompt，进入python文件所在目录；

![image-20220218152000019](imgs/image-20220218152000019.png)

执行：`python  Welcome.py`（就是运行python脚本），输出执行结果

![image-20220218152112698](imgs/image-20220218152112698.png)

 