# python基础

## 认识Python

### 1. Python介绍
> 由吉多·范罗苏姆(Guido van Rossum) 于1989年创造

#### 1.1 为什么学习Python
* 简单, 易学, 免费, 开源, 适用人群广泛
	* 零基础学习
	* 跨行业转型
	* 运维人员
	* Web全栈开发
	* 测试人员
* 应用领域广泛
	* 自动化测试
	* 网络爬虫
	* Web 开发
	* 自动化运维
	* 数据分析
	* 人工智能
	* 机器学习
#### 1.2 Python发展历史
* Python2.X
* Python3.X (主讲版本)
	* Python3.5
	* Python3.6
	* Python3.7
	* ...
* 详细了解：[参考](https://baike.baidu.com/item/Python/407313#3)
### 2. 语言分类简介
#### 2.1 编译型
* 把程序源代码都编译成机器语言(二进制)，保存为二进制文件
* 计算机可以直接运行，执行速度快
* C, C++, GO, Swift, Object-C …
#### 2.2 解释型
* 在程序执行的时候才会一行一行的处理成机器语言
* 执行速度慢
* JavaScript, Python, Ruby, PHP…
> 本质：计算机本身只能识别机器语言(二进制)
## Python环境搭建
### 1. Python 解释器
> Python 是一门解释型语言，通过解释器来运行 .py 文
#### 1.1 Python解释器下载
1. 下载对应的解释器安装包，官方解释器：https://www.python.org/downloads/release
2. 选择对应的版本: 建议使用3.5之后版本
3. 点击目标版本，进入指定下载界面
4. 下拉最后，选择对应平台适配版本
![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/e07ad38a01ec4667ae17ec85e94fba8c.png)

#### 1.2 Python解释器安装
1. 双击安装，执行下一步安装
2. 选择自定义安装
![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/5ef65517ceb54af5842d38d0916134c4.png)
3. 等待 完成安装
4. 验证是否成功：cmd进入命令行，输入python 查看信息
![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/00793f7334f147eea9b1256d85d83e5a.png)
> 注意：
> 1.默认安装路径可以使用，但是不方便将来查找第三方包存放目录
> 2.自定义目录建议直接放置于某个盘符根下，类似：C:/Python36 或 D:/python37…
> 3.强烈建议勾选将路径添加至 Path
### 2. 解释器运行Python脚本
> 前置条件：Python 解释器安装完毕
#### 2.1 演练步骤
1. 在桌面新建测试目录 demo
2. 在 demo 目录下新建 demo.py 文件
3. 使用 Notepad++ 工具打开 demo.py , 输入 print("第一个python程序")
![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/5a030116583740c084a912e3162bb05b.png)
4. 在 demo 目录下进入到 cmd 命令模式
![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/a125dae3847d43c3983c691beb9bed4d.png)
5. 使用 python demo.py 运行程序
> 注意：
> 1.在 windows 上新建的文件，有些操作系统默认编码是 gbk
> 2.建议直接使用 notepad++ 新建文件，保存为demo.py
## PyCharm
### 1. PyCharm介绍
* Pycharm 是一种 Python IDE (集成开发环境)， 内置功能丰富提高开发效率
* Pycharm 分为专业版(professional) 和 社区版(community), 这里使用社区版
### 2. PyCharm安装
1. 下载安装包，下载地址：http://www.jetbrains.com/pycharm/download
![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/6098380d25cb4163ae0b1362afd2ad27.png)
2. 执行安装程序
![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/fe8b1d6096e2438e9137553fbd4fd3d9.png)
### 3. PyCharm基本使用
#### 3.1 新建项目
1. 打开 Pycharm
2. 选择 [Create New Project ]
3. 指定本地的 Python 解释器
4. 点击 create 创建完成
![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/0c3cebd7e9714e2aac94635dac0ddb2d.png)
#### 3.2 新建文件
1. 进入 Pycharm 项目
2. 选中对应项目名，鼠标右击
3. 点击 New 选择 Python file
4. 自定义文件名然后选择创建
![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/54518c11cf8947d19152706f9fe2868b.png)
#### 3.3 编写代码运行
- 按语法书写 python 脚本
- 书写 print("第一个python脚本")
- 在工具栏或直接运行 py 脚本
![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/1b3665288541456194a857e5456509f6.png)
#### 3.4 查看运行结果
* 方式一：在当前 py 文件编辑区直接鼠标右击 选择Run
* 方式二：打开对应文件，在工具栏中选择 Run（绿色三角播放图标）
### 4. PyCharm常用配置
修改主题配置：
1. 点击菜单 File(文件), 选择 Settings(设置) 选项
2. 选择 Editor(编辑)，点击 Color Scheme(配色方案)
3. 在右侧选择对应的主题配置

自定义字体设置：
4. 点击菜单 File(文件), 选择 Settings(设置) 选项
5. 选择 Editor(编辑)
6. 选择 Font(字体)
7. 右侧设置具体的字体名称、大小、行高
## 注释
### 1. 注释的作用
* 使用开发者自已熟悉的语言在程序代码中添加标注或说明
* 通过注释增强程序代码可读性
* 注释的内容不会被解释器执行

未添加注释代码：
~~~python
import allure
import pytest
import Base
import Handle


class TestLogin:
	def setup(self):
		self.driver = Base.get_driver()
		self.handle = Handle.TotalHandle(self.driver)
		self.handle.init_home.tap_me()
		if not self.handle.init_me.assert_goon_exist():
			self.handle.init_me.tap_set()
			self.handle.init_set.tap_quit()
			self.handle.init_set.tap_confirm()
			self.handle.init_home.tap_me()
		self.handle.init_me.tap_logon()
	@pytest.mark.parametrize("info", Base.get_data("login", "login_miss_num"))
	def test_login_miss_num(self, info):
		self.handle.init_login.input_num(info["num"])
		self.handle.init_login.input_pwd(info["pwd"])
		self.handle.init_login.tap_login()
		assert self.handle.init_login.assert_toast("此用户不存在")
~~~
已添加注释代码：
~~~python
import allure
import pytest
import Base
import Handle


## 登录功能点测试脚本
class TestLogin:

	## 前置步骤
	def setup(self):
		self.driver = Base.get_driver()
		self.handle = Handle.TotalHandle(self.driver)
		## 执行点击 “我”动作
		self.handle.init_home.tap_me()
		## 执行是否登录的判断
		if not self.handle.init_me.assert_goon_exist():
			## 步骤1：点击设置
			self.handle.init_me.tap_set()
			## 步骤2：滑屏找到退出，点击
			self.handle.init_set.tap_quit()
			## 步骤3：点击确认
			self.handle.init_set.tap_confirm()
			## 步骤4：点击我
			self.handle.init_home.tap_me()
		## 执行点击 去登录 动作
		self.handle.init_me.tap_logon()

	## 账号不存在测试场景
	## 使用参数化实现数据驱动文件读取
	@pytest.mark.parametrize("info", Base.get_data("login", "login_miss_num"))
	def test_login_miss_num(self, info):
		## 步骤1：输入账号
		self.handle.init_login.input_num(info["num"])
		## 步骤2：输入密码
		self.handle.init_login.input_pwd(info["pwd"])
		## 步骤3：点击登录
		self.handle.init_login.tap_login()
		#步骤4： 断言
		assert self.handle.init_login.assert_toast("此用户不存在")
~~~
### 2. 注释分类
> 注释分为 ： 单行注释 + 多行注释(块注释)
* 单行注释
~~~python
## 一次只注释一行内容
~~~
* 多行注释
	1. 使用六个双引号，之间部分为注释内容 `""" 被注释内容 """`
	2. 使用六个单引号，之间部分为注释内容 `'''被注释内容'''`
* 注释快捷键
	`ctrl + /`
	1. 在需要被注释的单行代码所在行任意处执行即可
	2. 选中需要被注释的整段内容 执行即可
	3. 添加注释和去除注释规则是一样的
### 3. 注释扩展
* 何时进添加注释
	* 注释并非越多越好，一目了然的代码无需注释
	* 逻辑复杂的代码， 应当先写注释再编码
	* 不应用中文去翻译 python 代码的含义
* 代码规范
	* Python 官方提供了一套 PEP( Python Enhancement Proposals ) 文档
	* 其中第8篇文档专门针对 Python 的代码格式给出了建议，俗称 PEP8
	* 官方地址：https://www.python.org/dev/peps/pep-0008/
## 变量
### 1. 变量作用
场景举例：

超市购物时会将随身物品存放于储物柜中，然后得到一个"编号"。购物结束后，通过此编号就可以找到我们的物品

场景分析：

* 超市购物就是一个真实环境下的业务需求
* 随身物品就是完成整个业务需要用到的 ”数据“
* 我们最终需要获取的是 随身物品 ，找到物品使用了编号
* 可以认为是编号帮我们存储了 随身物品

变量作用：
1. 程序执行的过程都是发生在内存当中的
2. 内存中的数据都是临时存储的
3. 为了快速定位目标数据，我们将数据在内存空间占据的空间分配一个名称，即变量
> 总结：变量将运算的中间结果暂存到内存,便于程序后续调用
### 2. 变量定义
#### 2.1 语法
~~~sh
变量名 = 数据值
~~~
* 变量名自定义, 要满足 标识符 命名规则
* 数据值为要存储的数据，可以为不同的数据类型
* 单等号用于 赋值，不具备比较功能
#### 2.2 标识符规则
标识符命名规则是Python中定义各种变量名或其他名字的时候的统一规范, 具体如下:
* 由数字, 字母, 下划线组成
* 不能使用数字开头
* 不能使用Python内置关键字
* 严格区分大小写
* 不能使用中文定义变量名

Python中的关键字:
~~~sh
False None True and as assert break class
continue def del elif else except finally for
from global if import in is lambda nonlocal
not or pass raise return try while with
yield
~~~
#### 2.3 命名习惯
1. 见名知义
2. 使用驼峰体
	* 大驼峰：每个单词首字母大写, 例如: MyName
	* 小驼峰：第二个单词开始首字母大写, 例如: myName
3. 使用下划线：每个单词之间使用下划线连接, 例如: my_nam
### 3. 变量的使用
 使用步骤：
 1. 按标识符规则定义变量
2. 使用单等号给变量赋值
3. 在程序中使用变量名指代具体数据值

 实例代码：
~~~python
name = syy
age = 18
print(name)
print(age)
~~~
## 变量的类型
### 1. 数据为什么需要类型
1. 人类可以肉眼观察轻松的区分不同类型数据，但是计算机做不到。
2. 计算机工作的过程就是完成不同的类型的计算，例如做数学运算，做文件存储，做逻辑判断
3. 为了让计算机完成不同的运算过程，在Python中就定义了数据类型的概念
4. 数据类型可以对不同数据进行分类管理和标识
### 2. 常见数据类型分类
* 数字型
	* 整型
	* 浮点型
	* 布尔型
	* 复数型(了解)
* 非数字型
	* 字符串型
	* 列表
	* 元组
	* 字典
> 注意：
> 1. 这里只讨论 3.X之后Python版本常用类型
> 2. 布尔型中非0即为真
### 3. 数据类型检测
使用 type() 函数可以查看一个变量的类型
~~~python
age = 20
print(type(age))

a = 1
print(type(a)) ## <class 'int'> -- 整型
b = 1.1
print(type(b)) ## <class 'float'> -- 浮点型
c = True
print(type(c)) ## <class 'bool'> -- 布尔型
d = '12345'
print(type(d)) ## <class 'str'> -- 字符串
e = [10, 20, 30]
print(type(e)) ## <class 'list'> -- 列表
f = (10, 20, 30)
print(type(f)) ## <class 'tuple'> -- 元组
h = {10, 20, 30}
print(type(h)) ## <class 'set'> -- 集合
g = {'name': 'TOM', 'age': 20}
print(type(g)) ## <class 'dict'> -- 字典
~~~
### 4. 数据类型转换
作用: 将一个中数据类型转换为另一种数据类型
| 函数     | 说明                    |
| -------- | ----------------------- |
| int(x)   | 将x转换为一个整数       |
| float(x) | 将x转换为一个浮点数     |
| str(x)   | 将 x 转换为字符串       |
| tuple(s) | 将序列 s 转换为一个元组 |
| list(s)  | 将序列 s 转换为一个列表 |
> 注意:
> * int(x), x是字符串时,必须是数字类型的字符串
> * float(x), x是字符串时,必须是浮点数类型的字符串
> * str(x), 对于任意数据类型x都可以转为字符串类型
## 程序的输入和输出
### 1. 程序的输出
#### 1.1 基本输出
输出的作用: 将程序运行结果输出打印到屏幕或终端
~~~python
print("hello Python")
age = 18
print(age)
name = "小明"
print("姓名是: %s" % name)
~~~
#### 1.2 格式化输出
所谓格式化输出就是按照一定的格式输出内容
~~~python
name = "小明"
print("姓名是: %s" % name)
~~~
常见的格式化符号
![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/f2dca3c1579b4de1966bc397b81109a8.png)
> 技巧
> * %06d, 表示输出的整数显示位数, 不足位以0补全, 超出当前位数则原样输出
> * %.2f, 表示小数点后显示的小数位数, 此为保留2位小数

格式化字符串：`格式化字符串除了%s, 还可以写为 f'{表达式}'`
~~~python
age = 18
name = 'TOM'
weight = 75.5
student_id = 1
present = 95
## 我的名字是TOM
print('我的名字是%s' % name)
## 我的学号是0001
print('我的学号是%4d' % student_id)
## 我的体重是75.50公斤
print('我的体重是%.2f公斤' % weight)
## 合格率是95%
print('合格率是%d%%' % present)
## 我的名字是TOM，今年18岁了
print('我的名字是%s，今年%d岁了' % (name, age))
## 我的名字是TOM，明年19岁了
print('我的名字是%s，明年%d岁了' % (name, age + 1))
## 我的名字是TOM，明年19岁了
print(f'我的名字是{name}, 明年{age + 1}岁了')
~~~
> f-格式化字符串是Python3.6中新增的格式化方法，该方法更简单易读
#### 1.3 转义字符
* \n : 换行
* \t : tab键
> 思考：为什么两个print()会换行输出呢?

在Python中，print()函数默认自带 end="\n" 这个换行结束符，所以导致每两个 print 直接会换行展示，用户可以按
需求更改结束符
`print("输出的内容", end="\n")`
### 2. 程序的输入
在Python中, 程序用来接收用户输入的数据的功能即是输入。
#### 2.1 输入的语法
~~~python
input("提示信息")
~~~
#### 2.2 输入的特点
* 当程序执行到input , 等待用户输入, 输入完成之后程序才继续向下执行
* 在Python中, input 接收用户输入信息后, 一般保存到到变量中, 方便使用
* 在Python中, input 会把用户输入的任意数据都当做字符串处理
~~~python
password = input('请输入您的密码：')
print(f'您输入的密码是{password}')
print(type(password)) ## <class 'str'>
~~~
## 运算符
### 1. Python运算符介绍
#### 1.1 运算符作用
1. 计算机可以完成的运算分为很多种，不仅仅限于 加减乘除
2. 不同类型的运算需要依赖不同的符号
3. 运算符可以让计算机认识并处理对应的计算逻辑
#### 1.2 运算符分类
1. 算数运算符：完全常规数字运算
2. 比较运算符：完成二个值的大小比较运算
3. 逻辑运算符：常用业务之间的逻辑判断
4. 赋值运算符：将运算符右侧的值，赋值给左侧容器
#### 1.3 运算符使用
1. 准备运算过程中需要的数据
2. 选择对应的运算符规则
3. 执行程序代码完成最终运算
~~~python
a = 1
b = 2
print( a+b ) ## 通过加法运算符完成运算
~~~
### 2. 算术运算符
> 场景构建：假设有x y 二个变量，x=10, y=20

![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/a8355250f64e4cc898d4296633b4d8f1.png)
![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/693f1d124c8449769c49eb014e368f03.png)
> 注：
> python 算数运算符中的 ＊可以用于字符串计算
> 输入：print(“中”*10)
> 输出：中中中中中中中中中中
### 3. 比较运算符
> 场景构建：假设有a b 二个变量，a=10, b=20

![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/7750469e7a584343819d9d5004f30c8f.png)
### 4. 逻辑运算符
> 场景构建：假设有a b 二个变量，a=True, b=True

![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/11dd2f32b7274a749fd6221a9ca0a1e7.png)
### 5. 赋值运算符
> 场景构建：假设有a, b二个变量, a=10, b=20

![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/0da15d00cb41433496693d587cf645d5.png)
![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/5b4f22cabcde4b7abe4b27dd781b5d95.png)
> 注意：
> 1. = ， 单等号在程序语言中不表示比较，用于赋值
> 2. 复合赋值运算符之间没有空格，连接在一起 
### 6. 运算符优先级
> 有计算就会运算符，不同的运算符默认具备不同的优先级
#### 6.1 分类别单独比较
* 算术运算符【由高至低】
	* （）小括号分组最优先
	* ** 幂等
	* ＊ / // % 按书写顺序
	* ＋ －
* 逻辑运算符【由高至低】
	* （） 小括号分组，优先级最高
	* not
	* and
	* or
#### 6.2 按类型整体比较【由高至低】
![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/851f539d39e3402baa7c175798d360af.png)

# 流程控制结构

## 判断语句

### 1. 开发中的应用场景

生活中的判断几乎是无所不在的，我们每天都在做各种各样的选择，如果这样？如果那样？……

#### 1.1 程序中的判断

![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/784a3def527f4201832252f441b47986.png)

~~~python
if 今天发工资:
	先还信用卡的钱
	if 有剩余:
		又可以happy了，O(∩_∩)O哈哈~
	else:
		噢，no。。。还的等30天
else:
	盼着发工资
~~~

#### 1.2 判断的定义

* 如果 条件满足，才能做某件事情，
* 如果 条件不满足，就做另外一件事情，或者什么也不做

> 正是因为有了判断，才使得程序世界丰富多彩，充满变化！
> 判断语句 又被称为 “分支语句”，正是因为有了判断，才让程序有了很多的分支

### 2. if语句体验

#### 2.1 if

在Python中，if 语句 就是用来进行判断的，格式如下：

~~~python
if 要判断的条件:
	条件成立时，要做的事情
	……
~~~

> 注意：代码的缩进为一个 tab 键，或者 4 个空格 —— 建议使用空格
>
> * 在 Python 开发中，Tab 和空格不要混用！
> * PEP 8 —— Python 的官方风格指南 —— 强烈推荐使用 4 个空格来进行缩进（因为不同环境下Tab键的宽度可能为2个或其它）

我们可以把整个 if 语句看成一个完整的代码块
![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/8a88b346aa104c7e930989a954342cac.png)

#### 2.2 else

思考：在使用 if 判断时，只能做到满足条件时要做的事情。那如果需要在 不满足条件的时候，做某些事情，该如何做
呢？

答案：else，格式如下：

~~~python
if 要判断的条件:
	条件成立时，要做的事情
	……
else:
	条件不成立时，要做的事情
	……
~~~

#### 2.3 判断语句演练

需求：

1. 输入用户年龄
2. 判断是否满 18 岁 （>=）
3. 如果满 18 岁，允许进网吧嗨皮
4. 如果未满 18 岁，提示回家写作业

~~~python
## 1. 输入用户年龄
age = int(input("今年多大了？"))

## 2. 判断是否满 18 岁
## if 语句以及缩进部分的代码是一个完整的语法块
if age >= 18:
	print("可以进网吧嗨皮……")
else:
	print("你还没长大，应该回家写作业！")

## 3. 思考！- 无论条件是否满足都会执行
print("这句代码什么时候执行?")
~~~

注意：if 和 else 语句以及各自的缩进部分共同是一个 完整的代码块
![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/e696bf489e094b9097bfec4f15bc1d68.png)

### 3. 逻辑运算

* 在程序开发中，通常 在判断条件时，会需要同时判断多个条件
* 只有多个条件都满足，才能够执行后续代码，这个时候需要使用到 逻辑运算符
* 逻辑运算符 可以把 多个条件 按照 逻辑 进行 连接，变成 更复杂的条件
* Python 中的 逻辑运算符 包括：与 and／或 or／非 not 三种

#### 3.1 and

~~~sh
条件1 and 条件2
~~~

* 与／并且
* 两个条件同时满足，返回 True
* 只要有一个不满足，就返回 False
	![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/921b5f15243241ddb339cecc2efaa67b.png)

#### 3.2 or

~~~sh
条件1 or 条件2
~~~

* 或／或者
* 两个条件只要有一个满足，返回 True
* 两个条件都不满足，返回 False
	![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/d33cdf51ff1644b88ed46acd9ee9be65.png)

#### 3.3 not

~~~sh
not 条件
~~~

* 非／不是
	![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/d0815c47d7ce47b98bc9aedb13dfb588.png)

#### 3.4 逻辑运算演练

1. 练习1: 定义一个整数变量 age ，编写代码判断年龄是否正确
	* 要求人的年龄在 0-120 之间
2. 练习2: 定义两个整数变量 python_score 、 c_score ，编写代码判断成绩
	要求只要有一门成绩 > 60 分就算合格
3. 练习3: 定义一个布尔型变量 is_employee ，编写代码判断是否是本公司员工
	* 如果不是提示不允许入内

答案 1：

~~~python
## 练习1: 定义一个整数变量 age，编写代码判断年龄是否正确
age = 100

## 要求人的年龄在 0-120 之间
if age >= 0 and age <= 120:
	print("年龄正确")
else:
	print("年龄不正确")
~~~

答案 2：

~~~python
## 练习2: 定义两个整数变量 python_score、c_score，编写代码判断成绩
python_score = 50
c_score = 50

## 要求只要有一门成绩 > 60 分就算合格
if python_score > 60 or c_score > 60:
	print("考试通过")
else:
	print("再接再厉！")
~~~

答案 3：

~~~python
## 练习3: 定义一个布尔型变量 `is_employee`，编写代码判断是否是本公司员工
is_employee = True

## 如果不是提示不允许入内
if not is_employee:
	print("非公勿内")
~~~

### 4. if 语句进阶

#### 4.1 elif 多重判断

* 在开发中，使用 if 可以 判断条件
* 使用 else 可以处理 条件不成立 的情况
* 但是，如果希望 再增加一些条件，条件不同，需要执行的代码也不同 时，就可以使用 elif
* 语法格式如下：

~~~python
if 条件1:
	条件1满足执行的代码
	……
elif 条件2:
	条件2满足时，执行的代码
	……
elif 条件3:
	条件3满足时，执行的代码
	……
else:
	以上条件都不满足时，执行的代码
	……
~~~

* 对比逻辑运算符的代码

~~~python
if 条件1 and 条件2:
	条件1满足 并且 条件2满足 执行的代码
	……
~~~

注意：

1. elif 和 else 都必须和 if 联合使用，而不能单独使用
2. 可以将 if 、 elif 和 else 以及各自缩进的代码，看成一个 完整的代码块

**elif 演练：**

需求：

1. 定义 score 变量记录考试分数
	11
2. 如果分数是 大于等于 90分 应该显示 优
3. 如果分数是 大于等于 80分 并且 小于 90分 应该显示 良
4. 如果分数是 大于等于 70分 并且 小于 80分 应该显示 中
5. 如果分数是 大于等于 60分 并且 小于 70分 应该显示 差
6. 其它分数显示 不及格

~~~python
score = 49

if score >= 90:
	print("优")
elif score >= 80 and score < 90:
	print("良")
elif score >= 70 and score < 80:
	print("中")
elif score >= 60 and score < 70:
	print("差")
else:
	print("不及格")
~~~

> 拓展: score >= 80 and score < 90 可以简化为 80<= score < 90

#### 4.2 if 的嵌套

> elif 的应用场景是：同时 判断 多个条件，所有的条件是 平级 的

* 在开发中，使用 if 进行条件判断，如果希望 在条件成立的执行语句中 再 增加条件判断，就可以使用 if 的嵌套
* if 的嵌套 的应用场景就是：在之前条件满足的前提下，再增加额外的判断
* if 的嵌套 的语法格式，除了缩进之外 和之前的没有区别
* 语法格式如下：

~~~python
if 条件 1:
	条件 1 满足执行的代码
	……
	
	if 条件 1 基础上的条件 2:
		条件 2 满足时，执行的代码
		……

	## 条件 2 不满足的处理
	else:
		条件 2 不满足时，执行的代码

## 条件 1 不满足的处理
else:
	条件1 不满足时，执行的代码
	……
~~~

**if 的嵌套 演练 —— 火车站安检**
需求

1. 定义布尔型变量 has_ticket 表示是否有车票
2. 定义整型变量 knife_length 表示刀的长度，单位：厘米
3. 首先检查是否有车票，如果有，才允许进行 安检
4. 安检时，需要检查刀的长度，判断是否超过 20 厘米
	* 如果超过 20 厘米，提示刀的长度，不允许上车
	* 如果不超过 20 厘米，安检通过
5. 如果没有车票，不允许进门

~~~python
## 定义布尔型变量 has_ticket 表示是否有车票
has_ticket = True

## 定义整数型变量 knife_length 表示刀的长度，单位：厘米
knife_length = 20

## 首先检查是否有车票，如果有，才允许进行 安检
if has_ticket:
	print("有车票，可以开始安检...")

	## 安检时，需要检查刀的长度，判断是否超过 20 厘米
	## 如果超过 20 厘米，提示刀的长度，不允许上车
	if knife_length >= 20:
		print("不允许携带 %d 厘米长的刀上车" % knife_length)
	## 如果不超过 20 厘米，安检通过
	else:
		print("安检通过，祝您旅途愉快……")
		
## 如果没有车票，不允许进门
else:
	print("大哥，您要先买票啊")
~~~

### 5. 综合应用 —— 石头剪刀布

需求：

1. 从控制台输入要出的拳 —— 石头（1）／剪刀（2）／布（3）
2. 电脑 随机 出拳 —— 先假定电脑只会出石头，完成整体代码功能
3. 比较胜负
	![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/149d96fef6de4317b9156b13345179e3.png)

#### 5.1 基础代码实现

先假定电脑就只会出石头，完成整体代码功能

~~~python
## 从控制台输入要出的拳 —— 石头（1）／剪刀（2）／布（3）
player = int(input("请出拳 石头（1）／剪刀（2）／布（3）："))

## 电脑 随机 出拳 - 假定电脑永远出石头
computer = 1

## 比较胜负
## 如果条件判断的内容太长，可以在最外侧的条件增加一对大括号
## 再在每一个条件之间，使用回车，PyCharm 可以自动增加 8 个空格
if ((player == 1 and computer == 2) or
		(player == 2 and computer == 3) or
		(player == 3 and computer == 1)):
	print("噢耶！！！电脑弱爆了！！！")
elif player == computer:
	print("心有灵犀，再来一盘！")
else:
	print("不行，我要和你决战到天亮！")
~~~

#### 5.2 随机数的处理

在 Python 中，要使用随机数，首先需要导入 随机数 的 模块 —— “工具包”

~~~python
import random
~~~

* 导入模块后，可以直接在 模块名称 后面敲一个 . 然后按 Tab 键，会提示该模块中包含的所有函数。
* random.randint(a, b) ，返回 [a, b] 之间的整数，包含 a 和 b
* 例如：

~~~python
random.randint(12, 20) ## 生成的随机数n: 12 <= n <= 20
random.randint(20, 20) ## 结果永远是 20
random.randint(20, 10) ## 该语句是错误的，下限必须小于上限
~~~

## 循环

### 1. 程序的三大流程

在程序开发中，一共有三种流程方式：

* 顺序 —— 从上向下，顺序执行代码
* 分支 —— 根据条件判断，决定执行代码的 分支
* 循环 —— 让 特定代码 重复 执行
	![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/fa194a4241f44c0797bf01a365d67257.png)

### 2. while循环基本使用

* 循环的作用就是让 指定的代码 重复的执行
* while 循环最常用的应用场景就是 让执行的代码 按照 指定的次数 重复 执行
* 需求: 假如我有个女朋友，有一天我们闹矛盾生气了，女朋友说：道歉，说100遍“媳妇儿，我错 了”。这个时候
	程序员会怎么做？

> 答：100遍 print('媳妇儿，我错了')
> 思考：复制粘贴100次吗？
> 答：重复执行100次一样的代码，程序中循环即可

#### 2.1 while语句基本语法

~~~python
初始条件设置 —— 通常是重复执行的 计数器

while 条件(判断计数器是否达到目标次数):
	条件满足时，做的事情1
	条件满足时，做的事情2
	条件满足时，做的事情3
	...(省略)...
	
	处理条件(计数器 + 1)
~~~

注意： while 语句以及缩进部分是一个 完整的代码块

**第一个 while 循环**
需求: 打印 100 遍 "媳妇儿,我错了"

~~~python
## 1. 定义重复次数计数器
i = 1

## 2. 使用 while 判断条件
while i <= 100:
	## 要重复执行的代码	
	print("媳妇儿,我错了")
	## 处理计数器 i
	i = i + 1
	
print("循环结束后的 i = %d" % i)
~~~

> 注意：循环结束后，之前定义的计数器条件的数值是依旧存在的
> **死循环**：由于程序员的原因，忘记 在循环内部 修改循环的判断条件，导致循环持续执行，程序无法终止！

#### 2.2 Python中的计数方法

常见的计数方法有两种，可以分别称为：

* 自然计数法（从 1 开始）—— 更符合人类的习惯
* 程序计数法（从 0 开始）—— 几乎所有的程序语言都选择从 0 开始计数
	因此，大家在编写程序时，应该尽量养成习惯：除非需求的特殊要求，否则 循环 的计数都从 0 开始

#### 2.3 循环计算

> 在程序开发中，通常会遇到 利用循环 重复计算 的需求

遇到这种需求，可以：

1. 在 while 上方定义一个变量，用于 存放最终计算结果
2. 在循环体内部，每次循环都用 最新的计算结果，更新 之前定义的变量

需求: 计算0~100所有数字的累加和结果

~~~python
## 计算 0 ~ 100 之间所有数字的累计求和结果
## 0. 定义最终结果的变量
result = 0

## 1. 定义一个整数的变量记录循环的次数
i = 0

## 2. 开始循环
while i <= 100:
	print(i)
	## 每一次循环，都让 result 这个变量和 i 这个计数器相加
	result += i
	## 处理计数器
	i += 1
	
print("0~100之间的数字求和结果 = %d" % result)
~~~

需求进阶: 计算0~100之间所有 偶数 的累计求和结果

### 3. break 和 continue

> 注意: break 和 continue 是专门在循环中使用的关键字

* `break` 某一条件满足时，退出单层循环
* `continue` 某一条件满足时，结束本次循环(不执行continue后的循环体语句),执行下次循环

> break 和 continue 只针对 当前所在循环 有效

![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/ecca6e311af84f90bcdca85539f8db31.png)

#### 3.1 break

* 在循环过程中，如果 某一个条件满足后，不 再希望 循环继续执行，可以使用 break 退出循环
* 举例：一共吃5个苹果，吃完第一个，吃第二个…，这里"吃苹果"的动作是不是重复执行？

情况一：如果吃的过程中，吃完第三个吃饱了，则不需要再吃第4个和第五个苹果，即是吃苹果的动作 停止，这里就是break控制循环流程，即终止此循环。

~~~python
i = 1
while i <= 5:
	print("吃了第%d个苹果" % i)
	## break 某一条件满足时，退出循环，不再执行后续重复的代码
	if i == 3:
		print("吃饱了不吃了")
		break
	i += 1
print("over")
~~~

#### 3.2 continue

* 在循环过程中，如果 某一个条件满足后，不 希望 执行循环代码，但是又不希望退出循环，可以使用continue
* 情况二：如果吃的过程中，吃到第三个吃出一个大虫子...,是不是这个苹果就不吃了，开始吃第四个苹 果，这里就是continue控制循环流程，即退出当前一次循环继而执行下一次循环代码。

~~~python
i = 1
while i <= 5:
	if i == 3:
		print(f'大虫子，第{i}个苹果不吃了')
		## 在continue之前一定要修改计数器，否则会陷入死循环
		i += 1
		continue
	print(f'吃了第{i}个苹果')
	i += 1
~~~

> 注意：使用 continue 时，条件处理部分的代码，需要特别注意, 在continue之前一定要修改计数器，否则会陷入死循环

### 4. for循环

#### 4.1 作用

* for循环也可以让指定的代码重复执行
* for循环可以遍历容器中的数据( 遍历: 从容器中把数据一个一个取出）

#### 4.2 语法

~~~python
for 临时变量 in 容器:
	重复执行的代码1
	重复执行的代码2
	...	
~~~

**快速体验**

~~~python
str1 = 'itheima'
for i in str1:
	print(i)
~~~

#### 4.3 break作用于for循环

~~~python
str1 = 'itheima'
for i in str1:
	if i == 'e':
		print('遇到e不打印')
		break
	print(i)
~~~

#### 4.4 continue作用于for循环

~~~python
str1 = 'itheima'
for i in str1:
	if i == 'e':
		print('遇到e不打印')
		continue
	print(i)
~~~

# 数据序列

## 字符串

### 1. 字符串基础

#### 1.1 字符定义和使用

~~~python
## 1. 自定义变量
## 2. 在变量中存储相应字符串
val1 = "hello"
val2 = '你好'
print(val1)
print(val2)
~~~

#### 1.2 字符串定义细节

* 单引号字符串
* 双引号字符串
* 三引号字符串
* 特殊符号处理

~~~python
## 1 单引号
val1 = '单引号测试'
## 2 双引号
val2 = "双引号测试"
## 3 三引号
val3 = """三引号测试"""
val3 = '''三引号测试'''
## 4 转入字符串的特殊符号
val4 = "I\'m itcastYY"
## 5 去除特殊字符功能
val5 = r"I \' m itcastYY"
~~~

#### 1.3 字符串下标访问

* 可以将字符串当做是装有很多内容的容器，通过编号可以获取到指定位置的字符
* 下标是人为定义的一种计数规则，默认下标从 0 开始
* 下标的使用语法为 `字符串名[下标值]`

~~~python
## 下标获取对应位置上的字符
str1 = "hello"
print(str1[0]) ## h
print(str1[1]) ## e
~~~

### 2. 字符串切片

切片语法：`字符串[开始位置下标:结束位置下标:步长]`

示例：

~~~python
name = "abcdefg"
print(name[2:5:1]) ## cde
print(name[2:5]) ## cde
print(name[:5]) ## abcde
print(name[1:]) ## bcdefg
print(name[:]) ## abcdefg
print(name[::2]) ## aceg
print(name[:-1]) ## abcdef, 负1表示倒数第一个数据print(name[-4:-1]) ## def
print(name[::-1]) ## gfedcba
~~~

> 注意：
>
> * 结束下标位置对应的字符不会被截取到【俗称顾头不顾尾】
> * 下标，正负都可以，不表示大小，只表示开始方向
> * 步长用于设置截取间隔，默认步长为1

### 3. 字符串的常用操作

#### 3.1 find

功能 : 被查找字符是否存在于当前字符串中，如果存在则返加开始下标，不存在则返回 -1

语法： `字符串.find(被查找字符，开始位置，结束位置 )`

~~~python
mystr = "如果你给我的，和你给别人的是一样的，那我就不要了"
print(mystr.find('你')) ## 22
print(mystr.find('你', 3, 20)) ## 8
print(mystr.find('你我')) ## -1
~~~

> 注意：
>
> 1. 开始位置和结束位置可以省略，表示从头找到尾
> 2. 如果被查找字符重复存在，则返回第一次出现位置的下标
> 3. 被查找字符如果不存在则返回 -1

#### 3.2 replace

功能：使用新的子串，按规则替换旧的字符串内容
语法： `字符串.replace(原字符串, 新子串, 替换次数)`

~~~python
str_val = "春眠不觉晓，处处闻啼鸟"
new_str = str_val.replace("闻啼鸟", "蚊子咬", 1)
print(str_val)
print(new_str)
~~~

> 注意：
>
> 1. 旧字符可能存在多次，此时可通过设置替换次数来决定具体替换多少个
> 2. 字符串属于不可变数据类型，所以修改并不会影响原来的空间

#### 3.3 split

功能：按照指定字符来分割字符串
语法： `字符串.split(分割符，num)`

~~~python
mystr = "hello world and itcast and itheima and Python"
## 结果：['hello world ', ' itcast ', ' itheima ', ' Python']
print(mystr.split('and'))

## 结果：['hello world ', ' itcast ', ' itheima and Python']
print(mystr.split('and', 2))

## 结果：['hello', 'world', 'and', 'itcast', 'and', 'itheima', 'and', 'Python']
print(mystr.split(' '))

## 结果：['hello', 'world', 'and itcast and itheima and Python']
print(mystr.split(' ', 2))
~~~

> 注意：
>
> 1. num 为具体数值，当分割符存在多次时，可以设定使用几次
> 2. 默认不传入分割符则会以空格为边界

#### 3.4 join

功能：一般用于将列表按指定子字符合并为字符串
语法： `字符串.join(一般为列表)`

~~~python
list1 = ['张三', '李四', '小五', '黑']
print('_'.join(list1)) ## 结果：张三_李四_小五_黑
~~~

## 列表

### 1. 列表基础

* List（列表）是Python中使用最频繁的数据类型，在其他语言中通常叫做数组
* 专门用于存储一串信息（一组数据）

定义方式：

* 方式一：用 [] 定义，数据之间使用英文逗号 , 分隔

~~~python
name_list = []
name_list = ["zhangsan", "lisi", "wangwu"]
~~~

* 方式二：通过类实例化方式定义

~~~python
data_list = list()
~~~

### 2. 查询操作

* 下标就是数据在列表中的位置编号，下标又可以被称为索引
* 列表的下标从0开始

~~~python
name_list = ['张三', '李四']
print(name_list[0]) ## 张三
print(name_list[1]) ## 李四

## count函数：统计被测试值出现的次数
## 语法：列表.count(被测数据)
list_val1 = ['飞蛾扑火时', '一定是', "极快乐幸福的", "一定是"]
print(list_val1.count("一定是")) ## 2

## len函数：统计当前列表元素个数
## 语法：len(列表)
list_val1 = ['飞蛾扑火时', '一定是', "极快乐幸福的", "一定是"]
print(len(list_val1)) ## 4
~~~

### 3. 添加操作

#### 3.1 append

功能：在列表的结尾添加数据
语法： `列表.append(被添加数据)`

~~~python
val_list = ["Web自动化", "UI自动化", "接口自动化"]
val_list.append("APP自动化")
print(val_list) ## ['Web自动化', 'UI自动化', '接口自动化', 'APP自动化']
~~~

> 注意：
>
> 1. 使用 append() 将新的值添加在列表的末尾
> 2. 新增的值可以直接作用于原列表，固列表是可变数据类型
> 3. 如果使用append增加一个列表，则此列表会被当做一个值添加到末尾

#### 3.2 extend

功能：在列表结尾添加另外一个列表，可以理解为是列表合并
语法： `列表.extend(列表2)`

~~~python
num_list1 = [1, 2, 3]
num_list2 = [4, 5]
num_list1.extend(num_list2)
print(num_list1) ## [1, 2, 3, 4, 5]

name_list = ["张三", '李四']
name_list.extend("王五")
print(name_list) ## ['张三', '李四', '王', '五']
~~~

> 注：如果被添加值是不可变类型的可迭代对象，则会将其一一打散加入

#### 3.3 insert

功能：在指定位置插入新数据
语法： `列表.insert(指定位置, 数据)`

~~~python
val_list = ["Web自动化", "UI自动化", "接口自动化"]
val_list.insert(1, "APP自动化")
print(val_list) ## ['Web自动化', 'APP自动化', 'UI自动化', '接口自动化']
~~~

### 4. 删除操作

#### 4.1 pop

功能：删除指定下标的数据，并且返回被删除数据
语法： `列表.pop(下标)`

~~~python
val_list = ["Web自动化", "UI自动化", "接口自动化"]
val = val_list.pop(0)
print(val, val_list) ## web自动化，['UI自动化', '接口自动化']
~~~

> 注意：
>
> 1. pop() 方法不传递参数时，默认删除列表中最后一个数据
> 2. pop() 方法有返回值，会返回当前被删除的值

#### 4.2 remove

功能：在列表中删除某个具体数据，删除第一个被匹配到的
语法： `列表.remove(数据)`

~~~python
val_list = ["Web自动化", "UI自动化", "接口自动化", "Web自动化"]
val = val_list.remove("Web自动化")
print(val, val_list) ## None ['UI自动化', '接口自动化', 'Web自动化']
~~~

> 注意：
>
> 1. remove 方法使用不会返回被删除的值
> 2. 如果被删除数据出现多次，只会删除第一次出现的

#### 4.3 clear

功能：清空列表
语法： 列表.clear()

~~~python
val_list = ["Web自动化", "UI自动化", "接口自动化", "Web自动化"]
val_list.clear()
print(val_list) ## []
~~~

### 5. 修改操作

#### 5.1 下标修改

功能：通过指定下标修改对应数据
语法： `列表[下标] = 修改后的值`

~~~python
val_list = ["Web自动化", "UI自动化", "接口自动化", "Web自动化"]
val_list[1] = "碧落"
print(val_list) ## ['Web自动化', '黑马程序员', '接口自动化', 'Web自动化']
~~~

#### 5.2 reverse

功能：倒置列表，列表反转
语法： `列表.reverse()`

~~~python
num_list = [1, 2, 3, 4]
num_list.reverse()
print(num_list) ## [4, 3, 2, 1]
~~~

#### 5.3 排序

功能：将列表按指定规则进行数据排序
语法： `列表.sort(key=None, reverse=False)`

~~~python
val_list = [8, 100, 30, 10, 40, 2]
val_list.sort(reverse=True)
print(val_list) ## [100, 40, 30, 10, 8, 2]
~~~

> 注意：reverse 表示排序规则，默认是False表示升序，设置为True表示降序

### 6. 其它操作

#### 6.1 复制

语法： `列表.copy()`

~~~python
num_list1 = [1, 2, 3]
num_list2 = num_list1.copy()
num_list1.append(4)
print(num_list1) ## [1, 2, 3, 4]
print(num_list2) ## [1, 2, 3]
~~~

#### 6.2 for循环遍历

使用for语法实现列表的遍

~~~python
val_list = [8, 100, 30, 10, 40, 2]
for item in val_list:
	print(item)
~~~

#### 6.3 列表嵌套

* 列表可以多层嵌套
* 不论多少层都可以使用下标进行访问

~~~python
person_info = [["张三", "18", "功能测试"], ["李四", "20", "自动化测试"]]
print(person_info[0][1]) ## 18
~~~

## 元组

### 1. 元组基础

1. 元组和列表一样，都可用于存储多个数据
2. 有些数据在存储之后就不能发生改变
3. 通过元组可以存放多个数据，且这些数据不能被修改

**定义元组的方式**：

* 用 () 定义，数据之间使用英文逗号 , 分隔

~~~python
info_tuple = ()
info_tuple = ("zhangsan", 18, 1.75)
~~~

* 通过类实例化方式定义

~~~python
info_tuple = tuple()
~~~

> 注意：元组中只包含一个元素时，需要在元素后面添加逗号
>
> ~~~python
> data = (1,)
> ~~~

### 2. 常见操作

~~~python
## 返回指定下标对应的元素，语法：元组[下标]
tuple1 = (1, 2, 3)
print(tuple1[1]) ## 

## count：统计某个数据出现的次数，语法： 列表.count(被测数据)
print(tuple1.count(3)) ## 1

## len：返回目标元组的长度，语法： len(元组)
print(len(tuple1)) ## 3
~~~

## 字典

### 1. 字典基础

> 思考：会员管理系统需要处理不同会员身份信息，如何区分不同会员？同一个会员如何明确年纪、身高、体重等数据？

* 实际业务很复杂， 需要用到不同类型的数据
* 不同类型数据在保存时应当加以区分
* 字典不仅可以保存多个数据，同时还能给不同数据 ”起名字“

**定义字典的方法：**

1. 基本结构： 字典名 = {}
2. 大括号内结构为： 键名：键值 【俗称键值对】
3. 多个键值对之间使用逗号隔开

~~~python
user_info = {
"name": "xiaoming",
"age": 28,
"gender": "man"
}
~~~

### 2. 常见操作

~~~python
## 在字典中增加对应的键值对，语法： 字典名['键名'] = 新增键值
info = {
	16
	"name": "syy",
	"age": 18,
	"gender": "man"
}
info["salary"] = 100000
print(info) ## {'name': 'syy', 'age': 18, 'gender': 'man', 'salary': 100000}

## 删除指定字典或字典中的值，语法：del 字典[key]
del info["age"]
print(info)

## 清空整个字典，语法：字典.clear()
info.clear()
print(info) ## {}

## 修改字典中对应键的值，语法： 字典["键名"] = val
info["age"] = 28
print(info)
~~~

> 注：
>
> 1. 如果被修改的键名存在，则直接用新值更新旧值
> 2. 如果被修改的键名不存在，则相当于新增

~~~python
## 键名查找：通过键名来查找对应的值，语法： 字典名["键名"]
slogan = {
	"slogan1": "尘归于尘,土归于土,我，归于我们",
	"slogan2": '有时候我们要对自己残忍一点，不能纵容自己的伤心失望;有时候我们要对自己深爱的人残忍一点，将对他们的爱的记忆搁置',
	"slogan3": "红尘十丈，茫茫的人海，竟还是自己的来处"
}
print(slogan["slogan3"])
~~~

> 注意：此种方法查找时，如果键名不存在则会语法报错

~~~python
## get查找：返回对应键名的值，语法：字典名.get(key, 默认值)
print(slogan.get("abc"))
~~~

> 注意：如果键名不存在，不会抛出异常，而是返回None

### 3. 遍历操作

~~~python
## 遍历字典的Key：循环拿到字典中的每个键名
## 语法：使用循环结构完成
slogan = {
	"slogan1": "尘归于尘,土归于土,我，归于我们",
	"slogan2": "有时候我们要对自己残忍一点，不能纵容自己的伤心失望",
	"slogan4": "有时候我们要对自己深爱的人残忍一点，将对他们的爱的记忆搁置",
	"slogan3": "红尘十丈，茫茫的人海，竟还是自己的来处"
}
for key in slogan.keys():
	print(key)
## slogan1 slogan2 slogan3 slogan4

## 遍历字典的Value
for key in slogan.values():
	print(key)

## 遍历字典的Key和Value：调用字典的 items()方法获取字典的键和值，并自动赋值给不同的变量
user = {
	"name": "张三",
	"age": 18,
	"gender": "男",
}
for k, v in user.items():
	print("Key=%s Value=%s" % (k, v))
## Key=name Value=张三
## Key=age Value=18
## Key=gender Value=男

~~~

# 函数&匿名函数

## 函数基础

### 1. 快速体验

* 所谓函数，就是把 具有独立功能的代码块 组织为一个小模块，在需要的时候 调用
* 函数的使用包含两个步骤：
	1. 定义函数 —— 封装 独立的功能
	2. 调用函数 —— 享受 封装 的成果
* 函数的作用，在开发程序时，使用函数可以提高编写的效率以及代码的 `重用`

演练步骤：

1. 新建一个用来实现计算操作的文件 calculate.py
2. 添加一个实现加法操作的函数 add(x, y)
3. 新建另外一个文件，使用 import 导入并且调用函数

~~~python
## calculate.py
def add(x, y):
	return x + y
~~~

~~~python
## test_calculate.py
import calculate

result = calculate.add(1, 2)
print("result=", result) ## result= 3
~~~

### 2. 基本使用

定义函数的格式如下：

~~~python
def 函数名():
	函数封装的代码
	……
~~~

> 1. def 是英文 define 的缩写
> 2. 函数名称 应该能够表达 函数封装代码 的功能，方便后续的调用
> 3. 函数名称 的命名应该 符合 标识符的命名规则
> 		* 可以由 字母、下划线 和 数字 组成
> 		* 不能以数字开头
> 		* 不能与关键字重名

通过 函数名() 即可完成对函数的调用。

函数演练：

> 需求：
>
> 1. 编写一个打招呼 say_hello 的函数，封装三行打招呼的代码
> 2. 在函数下方调用打招呼的代码

~~~python
name = "小明"

## 解释器知道这里定义了一个函数
def say_hello():
	print("hello 1")
	print("hello 2")
	print("hello 3")

print(name)
## 只有在调用函数时，之前定义的函数才会被执行
## 函数执行完成之后，会重新回到之前的程序中，继续执行后续的代码
say_hello()

print(name)
~~~

> 注意：定义好函数之后，只表示这个函数封装了一段代码而已；如果不主动调用函数，函数是不会主动执行的

> 思考：能否将 函数调用 放在 函数定义 的上方？不能！
>
> * 因为在 使用函数名 调用函数之前，必须要保证 Python 已经知道函数的存在
> * 否则控制台会提示 NameError: name 'say_hello' is not defined (名称错误：say_hello 这个名字没有被定
> 	义)

pyCharm中 `F8 Step Over` 可以单步执行代码，会把函数调用看作是一行代码直接执行。
`F7 Step Into` 可以单步执行代码，如果是函数，会进入函数内部

**函数的文档注释：**

* 在开发中，如果希望给函数添加注释，应该在 定义函数 的下方，使用 连续的三对引号
* 在 连续的三对引号 之间编写对函数的说明文字
* 在 函数调用 位置，使用快捷键 CTRL + Q 可以查看函数的说明信息

> 注意：因为 函数体相对比较独立，函数定义的上方，应该和其他代码（包括注释）保留 两个空行

### 3. 函数的参数

**函数参数的使用**：

* 在函数名的后面的小括号内部填写 参数
* 多个参数之间使用 , 分隔

~~~python
def sum_2_num(num1, num2):
	result = num1 + num2
	print("%d + %d = %d" % (num1, num2, result))

sum_2_num(50, 20)
~~~

**参数的作用**：
函数，把 具有独立功能的代码块 组织为一个小模块，在需要的时候 调用。

函数的参数，增加函数的 通用性，针对 相同的数据处理逻辑，能够 适应更多的数据

1. 在函数 内部，把参数当做 变量 使用，进行需要的数据处理
2. 函数调用时，按照函数定义的参数顺序，把 希望在函数内部处理的数据，通过参数 传递

**形参和实参**：

* 形参：定义 函数时，小括号中的参数，是用来接收参数用的，在函数内部 作为变量使用
* 实参：调用 函数时，小括号中的参数，是用来把数据传递到 函数内部 用的

### 4. 函数的返回值

* 在程序开发中，有时候，会希望 一个函数执行结束后，告诉调用者一个结果，以便调用者针对具体的结果做后续的处理
* 返回值 是函数 完成工作后，最后 给调用者的 一个结果
* 在函数中使用 return 关键字可以返回结果
* 调用函数一方，可以 使用变量 来 接收 函数的返回结果

> 注意： return 表示返回，后续的代码都不会被执行

~~~python
def sum_2_num(num1, num2):
"""对两个数字的求和"""
	return num1 + num2

## 调用函数，并使用 result 变量接收计算结果
result = sum_2_num(10, 20)
print("计算结果是 %d" % result)
~~~

### 5. 函数的嵌套调用

* 一个函数里面 又调用 了 另外一个函数，这就是 函数嵌套调用
* 如果函数 test2 中，调用了另外一个函数 test1
	* 那么执行到调用 test1 函数时，会先把函数 test1 中的任务都执行完
	* 才会回到 test2 中调用函数 test1 的位置，继续执行后续的代码

~~~python
def test1():
	print("*" * 50)
	print("test 1")
	print("*" * 50)


def test2():
	print("-" * 50)
	print("test 2")
	test1()
	print("-" * 50)

test2()
~~~

## 变量进阶

### 1. 变量的引用

> * 变量 和 数据 都是保存在 内存 中的
> * 在Python中 函数 的 参数传递 以及 返回值 都是靠 引用 传递的

#### 1.1 引用的概念

在Python中

* 变量 和 数据 是分开存储的
* 数据 保存在内存中的一个位置
* 变量 中保存着数据在内存中的地址
* 变量 中 记录数据的地址，就叫做 引用
* 使用 id() 函数可以查看变量中保存数据所在的 内存地址

> 注意：如果变量已经被定义，当给一个变量赋值的时候，本质上是 修改了数据的引用
>
> * 变量 不再 对之前的数据引用
> * 变量 改为 对新赋值的数据引用

#### 1.2 变量引用的示例

在 Python 中，变量的名字类似于 便签纸 贴在 数据 上
![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/a8388a0bae544679bc27de511c437b24.png)
![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/3ce03fdcd97b483185eaefba57c47827.png)

#### 1.3 函数的参数和返回值的传递

在Python中，函数的 实参/返回值 都是是靠 引用 来传递来的

~~~python
def test(num):
	print("-" * 50)
	print("%d 在函数内的内存地址是 %x" % (num, id(num)))
	result = 100
	print("返回值 %d 在内存中的地址是 %x" % (result, id(result)))
	print("-" * 50)
	return result

a = 10
print("调用函数前 内存地址是 %x" % id(a))

r = test(a)

print("调用函数后 实参内存地址是 %x" % id(a))
print("调用函数后 返回值内存地址是 %x" % id(r))
~~~

### 2. 可变和不可变类型

* 不可变类型，内存中的数据不允许被修改：
	* 数字类型 int , bool , float , complex , long(2.x)
	* 字符串 str
	* 元组 tuple
* 可变类型，内存中的数据可以被修改：
	* 列表 list
	* 字典 dict

~~~python
a = 1
a = "hello"
a = [1, 2, 3]
a = [3, 2, 1]

demo_list = [1, 2, 3]
print("定义列表后的内存地址 %d" % id(demo_list))
demo_list.append(999)
demo_list.pop(0)
demo_list.remove(2)
demo_list[0] = 10

print("修改数据后的内存地址 %d" % id(demo_list))
demo_dict = {"name": "小明"}
print("定义字典后的内存地址 %d" % id(demo_dict))
demo_dict["age"] = 18
demo_dict.pop("name")
demo_dict["name"] = "老王"
print("修改数据后的内存地址 %d" % id(demo_dict))
~~~

> 注意：字典的 key 只能使用不可变类型的数据

注意：

1. 可变类型的数据变化，是通过 方法 来实现的
2. 如果给一个可变类型的变量，赋值了一个新的数据，引用会修改
	* 变量 不再 对之前的数据引用
	* 变量 改为 对新赋值的数据引用

**哈希 (hash)**：

* Python 中内置有一个名字叫做 hash(o) 的函数
	* 接收一个 不可变类型 的数据作为 参数
	* 返回 结果是一个 整数
* 哈希 是一种 算法，其作用就是提取数据的 特征码（指纹）
	* 相同的内容 得到 相同的结果
	* 不同的内容 得到 不同的结果
* 在 Python 中，设置字典的 键值对 时，会首先对 key 进行 hash 已决定如何在内存中保存字典的数据，以方便 后续 对字典的操作：增、删、改、查
	* 键值对的 key 必须是不可变类型数据
	* 键值对的 value 可以是任意类型的数据

### 3. 局部变量和全局变量

* 局部变量 是在 函数内部 定义的变量，只能在函数内部使用
* 局变量 是在 函数外部定义 的变量（没有定义在某一个函数内），所有函数 内部 都可以使用这个变量

> 提示：在其他的开发语言中，大多 不推荐使用全局变量 —— 可变范围太大，导致程序不好维护！

#### 3.1 局部变量

* 局部变量 是在 函数内部 定义的变量，只能在函数内部使用
* 函数执行结束后，函数内部的局部变量，会被系统回收
* 不同的函数，可以定义相同的名字的局部变量，但是 彼此之间 不会产生影响

局部变量的作用：在函数内部使用，临时 保存 函数内部需要使用的数据

~~~python
def demo1():
	num = 10
	print(num)
	num = 20
	print("修改后 %d" % num)

def demo2():
	num = 100
	print(num)

demo1()
demo2()
print("over")
~~~

**局部变量的生命周期**：

* 所谓 生命周期 就是变量从 被创建 到 被系统回收 的过程
* 局部变量 在 函数执行时 才会被创建
* 函数执行结束后 局部变量 被系统回收
* 局部变量在生命周期 内，可以用来存储 函数内部临时使用到的数据

#### 3.2 全局变量

全局变量 是在 函数外部定义 的变量，所有函数内部都可以使用这个变量

~~~python
## 定义一个全局变量
num = 10

def demo1():
	print(num)

def demo2():
	print(num)
	
demo1()
demo2()
print("over")
~~~

> 注意：函数执行时，需要处理变量时 会：
>
> 1. 首先 查找 函数内部 是否存在 指定名称 的局部变量，如果有，直接使用
> 2. 如果没有，查找 函数外部 是否存在 指定名称 的全局变量，如果有，直接使用
> 3. 如果还没有，程序报错！

**函数不能直接修改 `全局变量的引用`**

* 全局变量 是在 函数外部定义 的变量（没有定义在某一个函数内），所有函数 内部 都可以使用这个变量
* 在函数内部，可以 通过全局变量的引用获取对应的数据
* 但是，不允许直接修改全局变量的引用 —— 使用赋值语句修改全局变量的值

~~~python
num = 10
def demo1():
	print("demo1" + "-" * 50)
	## 只是定义了一个局部变量，不会修改到全局变量，只是变量名相同而已
	num = 100
	print(num)

def demo2():
	print("demo2" + "-" * 50)
	print(num)
	
demo1()
demo2()
print("over")
~~~

> 注意：只是在函数内部定义了一个局部变量而已，只是变量名相同 —— 在函数内部不能直接修改全局变量的值

**在函数内部修改全局变量的值**
如果在函数中需要修改全局变量，需要使用 global 进行声明

~~~python
num = 10

def demo1():
	print("demo1" + "-" * 50)
	## global 关键字，告诉 Python 解释器 num 是一个全局变量
	global num
	num = 100
	print(num)
	
def demo2():
	print("demo2" + "-" * 50)
	print(num)
	
demo1()
demo2()
print("over")
~~~

**全局变量定义的位置**
为了保证所有的函数都能够正确使用到全局变量，应该 将全局变量定义在其他函数的上方

~~~python
a = 10

def demo():
	print("%d" % a)
	print("%d" % b)
	print("%d" % c)
	
b = 20
demo()
c = 30
~~~

> 注意：由于全局变量 c，是在调用函数之后，才定义的，在执行函数时，变量还没有定义，所以程序会报错！

**全局变量命名的建议**
为了避免局部变量和全局变量出现混淆，在定义全局变量时，有些公司会有一些开发要求，例如：全局变量名前应该增加 g_ 或者 gl_ 的前缀

> 提示：具体的要求格式，各公司要求可能会有些差异

## 函数进阶

### 1. 函数参数和返回值的作用

函数根据 有没有参数 以及 有没有返回值，可以 相互组合，一共有 4 种 组合形式：

1. 无参数，无返回值
2. 无参数，有返回值
3. 有参数，无返回值
4. 有参数，有返回值
	![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/c7ccfdf4afb848e3833d0425b484a0f4.png)

> 定义函数时，是否接收参数，或者是否返回结果，是根据 实际的功能需求 来决定的！

5. 如果函数 内部处理的数据不确定，就可以将外界的数据以参数传递到函数内部
6. 如果希望一个函数 执行完成后，向外界汇报执行结果，就可以增加函数的返回值

#### 1.1 无参数，无返回值

此类函数，不接收参数，也没有返回值，应用场景如下：

1. 只是单纯地做一件事情，例如 显示菜单
2. 在函数内部 针对全局变量进行操作，例如：新建名片，最终结果 记录在全局变量 中

> 注意：
>
> * 如果全局变量的数据类型是一个 可变类型，在函数内部可以使用 方法 修改全局变量的内容 —— 变量的引用
> 	不会改变
> * 在函数内部，使用赋值语句 才会 修改变量的引用

#### 1.2 无参数，有返回值

此类函数，不接收参数，但是有返回值，应用场景如下：

* 采集数据，例如 温度计，返回结果就是当前的温度，而不需要传递任何的参数

#### 1.3 有参数，无返回值

此类函数，接收参数，没有返回值，应用场景如下：

* 函数内部的代码保持不变，针对 不同的参数 处理 不同的数据
* 例如 名片管理系统 针对 找到的名片 做 修改、删除 操作

#### 1.4 有参数，有返回值

此类函数，接收参数，同时有返回值，应用场景如下：

* 函数内部的代码保持不变，针对 不同的参数 处理 不同的数据，并且 返回期望的处理结果
* 例如 名片管理系统 使用 字典默认值 和 提示信息 提示用户输入内容
	* 如果输入，返回输入内容
	* 如果没有输入，返回字典默认值

### 2. 函数的返回值

* 在程序开发中，有时候，会希望 一个函数执行结束后，告诉调用者一个结果，以便调用者针对具体的结果做后续的处理
* 返回值 是函数 完成工作后，最后 给调用者的 一个结果
* 在函数中使用 return 关键字可以返回结果
* 调用函数一方，可以 使用变量 来 接收 函数的返回结果

> 问题：一个函数执行后能否返回多个结果？

**示例 —— 温度和湿度测量**：
假设要开发一个函数能够同时返回当前的温度和湿度
先完成返回温度的功能如下：

~~~python
def measure():
	"""返回当前的温度"""
	print("开始测量...")
	temp = 39
	print("测量结束...")
	return temp

result = measure()
print(result)
~~~

在利用 元组 在返回温度的同时，也能够返回 湿度
改造如下：

~~~python
def measure():
	"""返回当前的温度"""
	print("开始测量...")
	temp = 39
	wetness = 10
	print("测量结束...")
	return (temp, wetness)
~~~

> 提示：如果一个函数返回的是元组，括号可以省略

技巧

* 在 Python 中，可以 将一个元组 使用 赋值语句 同时赋值给 多个变量
* 注意：变量的数量需要和元组中的元素数量保持一致

~~~python
temp, wetness = measure()
~~~

**面试题 —— 交换两个数字**：

~~~python
## 解法 1 - 使用临时变量
c = b
b = a
a = c

## 解法 2 - 不使用临时变量
a = a + b
b = a - b
a = a - b

## 解法 3 —— Python 专有，利用元组
a, b = b, a
~~~

### 3. 函数的参数

#### 3.1. 不可变和可变的参数

> 问题 1：在函数内部，针对参数使用 赋值语句，会不会影响调用函数时传递的 实参变量？ —— 不会！

无论传递的参数是 可变 还是 不可变

* 只要 针对参数 使用 赋值语句，会在 函数内部 修改 局部变量的引用，不会影响到 外部变量的引用

~~~python
def demo(num, num_list):
	print("函数内部")
	## 赋值语句
	num = 200
	num_list = [1, 2, 3]
	print(num)
	print(num_list)
	print("函数代码完成")

gl_num = 99
gl_list = [4, 5, 6]
demo(gl_num, gl_list)
print(gl_num)
print(gl_list)
~~~

> 问题 2：如果传递的参数是 可变类型，在函数内部，使用 方法 修改了数据的内容，同样会影响到外部的数据

~~~python
def mutable(num_list):
	## num_list = [1, 2, 3]
	num_list.extend([1, 2, 3])
	print(num_list)

gl_list = [6, 7, 8]
mutable(gl_list)
print(gl_list)
~~~

**面试题 —— +=**：
在 python 中，列表变量调用 += 本质上是在执行列表变量的 extend 方法，不会修改变量的引用

~~~python
def demo(num, num_list):
	print("函数内部代码")
	## num = num + num
	num += num
	## num_list.extend(num_list) 由于是调用方法，所以不会修改变量的引用
	## 函数执行结束后，外部数据同样会发生变化
	num_list += num_list
	print(num)
	print(num_list)
	print("函数代码完成")
	
gl_num = 9
gl_list = [1, 2, 3]
demo(gl_num, gl_list)
print(gl_num)
print(gl_list)
~~~

#### 3.2 缺省参数

* 定义函数时，可以给 某个参数 指定一个默认值，具有默认值的参数就叫做 缺省参数
* 调用函数时，如果没有传入 缺省参数 的值，则在函数内部使用定义函数时指定的 参数默认值
* 函数的缺省参数，将常见的值设置为参数的缺省值，从而 简化函数的调用
* 例如：对列表排序的方法

~~~python
gl_num_list = [6, 3, 9]
## 默认就是升序排序，因为这种应用需求更多
gl_num_list.sort()
print(gl_num_list)
## 只有当需要降序排序时，才需要传递 `reverse` 参数
gl_num_list.sort(reverse=True)
print(gl_num_list)
~~~

**指定函数的缺省参数**
在参数后使用赋值语句，可以指定参数的缺省值

~~~python
def print_info(name, gender=True):
	gender_text = "男生"
	if not gender:
		gender_text = "女生"
	print("%s 是 %s" % (name, gender_text))
~~~

> 提示
>
> 1. 缺省参数，需要使用 最常见的值 作为默认值！
> 2. 如果一个参数的值 不能确定，则不应该设置默认值，具体的数值在调用函数时，由外界传递！

**缺省参数的注意事项**：

1. 缺省参数的定义位置
	* 必须保证 带有默认值的缺省参数 在参数列表末尾
	* 所以，以下定义是错误的！
		`def print_info(name, gender=True, title):`
2. 调用带有多个缺省参数的函数：在 调用函数时，如果有 多个缺省参数，需要指定参数名，这样解释器才能够知道参数的对应关系！

~~~python
def print_info(name, title="", gender=True):
	"""
	:param title: 职位
	:param name: 班上同学的姓名
	:param gender: True 男生 False 女生
	"""
	gender_text = "男生"
	if not gender:
		gender_text = "女生"
	print("%s%s 是 %s" % (title, name, gender_text))

## 提示：在指定缺省参数的默认值时，应该使用最常见的值作为默认值！
print_info("小明")
print_info("老王", title="班长")
print_info("小美", gender=False)
~~~

#### 3.3 多值参数

**定义支持多值参数的函数**：

* 有时可能需要 一个函数 能够处理的参数 个数 是不确定的，这个时候，就可以使用 多值参数
* python 中有 两种 多值参数：
	* 参数名前增加 一个 * 可以接收 元组
	* 参数名前增加 两个 * 可以接收 字典
* 一般在给多值参数命名时，习惯使用以下两个名字
	* *args —— 存放 元组 参数，前面有一个 *
	* **kwargs —— 存放 字典 参数，前面有两个 *
* args 是 arguments 的缩写，有变量的含义
* kw 是 keyword 的缩写， kwargs 可以记忆 键值对参数

~~~python
def demo(num, *args, **kwargs):
	print(num)
	print(args)
	print(kwargs)

demo(1, 2, 3, 4, 5, name="小明", age=18, gender=True)
~~~

> 提示：多值参数 的应用会经常出现在网络上一些大牛开发的框架中，知道多值参数，有利于我们能够读懂大牛的代码

**多值参数案例 —— 计算任意多个数字的和**：
需求

1. 定义一个函数 sum_numbers ，可以接收的 任意多个整数
2. 功能要求：将传递的 所有数字累加 并且返回累加结

~~~python
def sum_numbers(*args):
	num = 0
	## 遍历 args 元组顺序求和
	for n in args:
		num += n
	return num
	
print(sum_numbers(1, 2, 3))
~~~

**元组和字典的拆包**：

* 在调用带有多值参数的函数时，如果希望：
	* 将一个 元组变量，直接传递给 args
	* 将一个 字典变量，直接传递给 kwargs
* 就可以使用 拆包，简化参数的传递，拆包 的方式是：
	* 在 元组变量前，增加 一个 *
	* 在 字典变量前，增加 两个 *

~~~python
def demo(*args, **kwargs):
	print(args)
	print(kwargs)

## 需要将一个元组变量/字典变量传递给函数对应的参数
gl_nums = (1, 2, 3)
gl_xiaoming = {"name": "小明", "age": 18}

## 会把 num_tuple 和 xiaoming 作为元组传递个 args
## demo(gl_nums, gl_xiaoming)
demo(*gl_nums, **gl_xiaoming)
~~~

## 匿名函数

### 1. 匿名函数介绍

* 用lambda关键词能创建小型匿名函数
* 这种函数得名于省略了用def声明函数的标准步骤
* Lambda函数能接收任何数量的参数，但只能返回一个表达式的值

语法格式：

~~~python
lambda [arg1 [,arg2,.....argn]]:expression
~~~

示例：

~~~python
sum = lambda arg1, arg2: arg1 + arg2

## 调用sum函数
print("result=", sum(10, 20)) ## result= 30
print("result=", sum(20, 20)) ## result= 40
~~~

### 2. 应用场景

匿名函数主要用于临时调用一次的场景，更多的是将匿名函数作为其他函数的参数来使用

#### 2.1 自己定义函数

~~~python
def cal(x, y, opt):
	print("x=", x)
	print("y=", y)
	result = opt(x, y)
	print("result=", result)

cal(1, 2, lambda a, b: a + b)
## 打印结果
## x= 1
## y= 2
## result= 3
~~~

#### 2.2 作为内置函数的参数

~~~python
user_list = [
	{"name": "zhangsan", "age": 18},
	{"name": "lisi", "age": 19},
	{"name": "wangwu", "age": 17}
]
## 需求：按照用户姓名对用户列表数据进行排序
## 按照name进行排序
user_list.sort(key=lambda x: x["name"])
print(user_list)
## [{'name': 'lisi', 'age': 19}, {'name': 'wangwu', 'age': 17}, {'name': 'zhangsan', 'age': 18}]
~~~

# 面向对象

## 面向对象编程介绍

> 面向对象编程 —— Object Oriented Programming 简写 OOP

* 我们之前学习的编程方式就是 面向过程 的
* 面相过程 和 面相对象，是两种不同的 编程方式
* 对比 面向过程 的特点，可以更好地了解什么是 面向对象

**过程和函数**（科普）

* 过程 是早期的一个编程概念
* 过程 类似于函数，只能执行，但是没有返回值
* 函数 不仅能执行，还可以返回结果

**面相过程和面相对象基本概念**：

1. 面相过程 —— 怎么做？

	1. 把完成某一个需求的 所有步骤 从头到尾 逐步实现
	2. 根据开发需求，将某些 功能独立 的代码 封装 成一个又一个 函数
	3. 最后完成的代码，就是顺序地调用 不同的函数
	4. 开发复杂项目，没有固定的套路，开发难度很大！

2. 面向对象 —— 谁来做？

	> 相比较函数，面向对象 是 更大 的 封装，根据 职责 在 一个对象中 封装 多个方法

	1. 在完成某一个需求前，首先确定 职责 —— 要做的事情（方法）
	2. 根据 职责 确定不同的 对象，在 对象 内部封装不同的 方法（多个）
	3. 最后完成的代码，就是顺序地让 不同的对象 调用 不同的方法
	4. 更加适合应对复杂的需求变化，是专门应对复杂项目开发，提供的固定套路

## 类和对象

### 1. 类和对象的概念

>类 和 对象 是面向对象编程的两个核心概念

**类：**

* 类 是对一群具有 相同 特征 或者 行为 的事物的一个统称，是抽象的，不能直接使用
	* 特征 被称为 属性
	* 行为 被称为 方法
* 类 就相当于制造飞机时的图纸，是一个 模板，是 负责创建对象的

**对象：**

* 对象 是 由类创建出来的一个具体存在，可以直接使用
* 由 哪一个类 创建出来的 对象，就拥有在 哪一个类 中定义的：
	* 属性
	* 方法
* 对象 就相当于用 图纸 制造 的飞机

### 2. 类和对象的关系

* 类是模板，对象 是根据 类 这个模板创建出来的，应该 先有类，再有对象
* 类 只有一个，而 对象 可以有很多个
* 不同的对象 之间 属性 可能会各不相同
* 类 中定义了什么 属性和方法，对象 中就有什么属性和方法，不可能多，也不可能少

### 3. 类的设计

在程序开发中，要设计一个类，通常需要满足一下三个要素：

1. 类名 这类事物的名字，满足大驼峰命名法
2. 属性 这类事物具有什么样的特征
3. 方法 这类事物具有什么样的行为

> 大驼峰命名法： CapWords
>
> 1. 每一个单词的首字母大写
> 2. 单词与单词之间没有下划线

类名的确定：名词提炼法 分析 整个业务流程，出现的 名词，通常就是找到的类

属性和方法的确定：

* 对 对象的特征描述，通常可以定义成 属性
* 对象具有的行为（动词），通常可以定义成 方法

> 提示：需求中没有涉及的属性或者方法在设计类时，不需要考虑

### 4. 案例演练

~~~python
"""
需求1：
	小明 今年 18 岁，身高 1.75，每天早上 跑 完步，会去 吃 东西
	小美 今年 17 岁，身高 1.65，小美不跑步，小美喜欢 吃 东西
"""

"""
需求2：
	一只 黄颜色 的 狗狗 叫 大黄
	看见生人 汪汪叫
	看见家人 摇尾巴
"""
~~~

## 面相对象基础语法

### 1. dir内置函数

在Python中 对象几乎是无所不在的，我们之前学习的 变量、数据、函数 都是对象
在Python中可以使用以下两个方法验证：

1. 在 标识符 / 数据 后输入一个 `.` ，在PyCharm中会提示该对象能够调用的 方法列表
2. 使用内置函数 `dir` 传入 标识符 / 数据，可以查看对象内的 所有属性及方法

> 提示： `__方法名__` 格式的方法是 Python 提供的 内置方法 / 属性，稍后会给大家介绍一些常用的 内置方法 / 属性

![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/ddfafea9f17443cb84512b7c196a31f9.png)

### 2. 定义简单的类

面向对象 是 更大 的 封装，在 一个类中 封装 多个方法，这样 通过这个类创建出来的对象，就可以直接调用这些
方法了！

1. 定义只包含方法的类

~~~python
class 类名:
	
	def 方法1(self, 参数列表):
		pass

	def 方法2(self, 参数列表):
		pass
~~~

> 方法 的定义格式和之前学习过的函数 几乎一样。区别在于第一个参数必须是 self ，大家暂时先记住，稍后介绍 self
> 注意：类名 的 命名规则 要符合 大驼峰命名法

2. 创建对象：语法格式 `对象变量 = 类名()`
3. 示例：

~~~python
"""
需求：小猫 爱 吃 鱼，小猫 要 喝 水
分析：
	1. 定义一个猫类 Cat
	2. 定义两个方法 eat 和 drink
	3. 按照需求 —— 不需要定义属性
"""

class Cat:
	"""这是一个猫类"""
	
	def eat(self):
		print("小猫爱吃鱼")

	def drink(self):
		print("小猫在喝水")

tom = Cat()
tom.drink()
tom.eat()
~~~

> 引用概念的强调：在面向对象开发中，引用的概念是同样适用的！

* 在 Python 中使用类 创建对象之后， tom 变量中 仍然记录的是 对象在内存中的地址
* 也就是 tom 变量 引用 了 新建的猫对象
* 使用 print 输出 对象变量，默认情况下，是能够输出这个变量 引用的对象 是 由哪一个类创建的对象，以及
* 在内存中的地址（十六进制表示）

> 提示：在计算机中，通常使用 十六进制 表示 内存地址
>
> * 十进制 和 十六进制 都是用来表达数字的，只是表示的方式不一样
> * 十进制 和 十六进制 的数字之间可以来回转换
> * %d 可以以 10 进制 输出数字，%x 可以以 16 进制 输出数字

### 3. 方法中的 `self` 参数

**案例改造 —— 给对象增加属性**：
在 Python 中，要 给对象设置属性，非常的容易，只需要在 类的外部的代码 中直接通过 `.` 设置一个属性即可。

但是不推荐使用这种方式，因为对象属性的封装应该封装在类的内部

~~~python
tom.name = "Tom"
...
lazy_cat.name = "大懒猫"
~~~

**使用 self 在方法内部输出每一只猫的名字**：

> 由 哪一个对象 调用的方法，方法内的 self 就是 哪一个对象的引用

* 在类封装的方法内部， self 就表示 当前调用方法的对象自己
* 调用方法时，程序员不需要传递 self 参数
* 在方法内部
	* 可以通过 `self.` 访问对象的属性
	* 也可以通过 `self.` 调用其他的对象方法
* 改造代码如下：

~~~python
class Cat:

def eat(self):
	print("%s 爱吃鱼" % self.name)

tom = Cat()
tom.name = "Tom"
tom.eat()

lazy_cat = Cat()
lazy_cat.name = "大懒猫"
lazy_cat.eat()
~~~

![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/f11ff500fc2543a89501da0665bb2a21.png)
在 类的外部，通过 `变量名.` 访问对象的 属性和方法
在 类封装的方法中，通过 `self. ` 访问对象的 属性和方法

### 4. 初始化方法

**之前代码存在的问题 —— 在类的外部给对象增加属性**：
将案例代码进行调整，先调用方法 再设置属性，观察一下执行效果：

~~~python
tom = Cat()
tom.drink()
tom.eat()
tom.name = "Tom"
print(tom)

## 程序执行报错如下：
"""
AttributeError: 'Cat' object has no attribute 'name'
属性错误：'Cat' 对象没有 'name' 属性
"""
~~~

> 提示：
>
> * 在日常开发中，不推荐在 类的外部 给对象增加属性
> 		* 如果在运行时，没有找到属性，程序会报错
> * 对象应该包含有哪些属性，应该 封装在类的内部

#### 4.1 初始化方法

当使用 类名() 创建对象时，会 自动 执行以下操作：

1. 为对象在内存中 分配空间 —— 创建对象
2. 为对象的属性 设置初始值 —— 初始化方法( init )

这个 初始化方法 就是 __init__ 方法， __init__ 是对象的内置方法

> `__init__` 方法是 专门 用来定义一个类 具有哪些属性的方法！

在 Cat 中增加 __init__ 方法，验证该方法在创建对象时会被自动调用：

~~~python
class Cat:
"""这是一个猫类"""
	
	def __init__(self):
		print("初始化方法")
~~~

#### 4.2 在初始化方法内部定义属性

* 在 `__init__` 方法内部使用 `self.属性名 = 属性的初始值` 就可以 定义属性
* 定义属性之后，再使用 Cat 类创建的对象，都会拥有该属性

~~~python
class Cat:

	def __init__(self):
		print("这是一个初始化方法")
		## 定义用 Cat 类创建的猫对象都有一个 name 的属性
		self.name = "Tom"

	def eat(self):
		print("%s 爱吃鱼" % self.name)

## 使用类名()创建对象的时候，会自动调用初始化方法 __init__
tom = Cat()
tom.eat()
~~~

> 在开发中，如果希望在 创建对象的同时，就设置对象的属性，可以对 `__init__` 方法进行 改造
>
> 1. 把希望设置的属性值，定义成 `__init__ `方法的参数
> 2. 在方法内部使用 `self.属性 = 形参` 接收外部传递的参数
> 3. 在创建对象时，使用 类名(属性1, 属性2...) 调用
>
> ~~~python
> class Cat:
> 	def __init__(self, name):
> 		print("初始化方法 %s" % name)
> 		self.name = name
> ...
> 
> tom = Cat("Tom")
> ...
> lazy_cat = Cat("大懒猫")
> ...
> ~~~

### 5. 内置方法和属性

**`__del__` 方法**：

* 在 Python 中
	* 当使用 类名() 创建对象时，为对象 分配完空间后，自动 调用 `__init__` 方法
	* 当一个 对象被从内存中销毁 前，会 自动 调用 `__del__` 方法
* 应用场景
	* `__init__` 改造初始化方法，可以让创建对象更加灵活
	* `__del__` 如果希望在对象被销毁前，再做一些事情，可以考虑一下 __del__ 方法
* 生命周期
	* 一个对象从调用 类名() 创建，生命周期开始
	* 一个对象的 __del__ 方法一旦被调用，生命周期结束
	* 在对象的生命周期内，可以访问对象属性，或者让对象调用方法

~~~python
class Cat:
	def __init__(self, new_name):
		self.name = new_name
		print("%s 来了" % self.name)
	
	def __del__(self):
		print("%s 去了" % self.name)

## tom 是一个全局变量
tom = Cat("Tom")
print(tom.name)
## del 关键字可以删除一个对象
del tom
print("-" * 50)
~~~

**`__str__` 方法**：

* 在 Python 中，使用 print 输出 对象变量，默认情况下，会输出这个变量 引用的对象 是 由哪一个类创建的对象，以及 在内存中的地址（十六进制表示）
* 如果在开发中，希望使用 print 输出 对象变量 时，能够打印 自定义的内容，就可以利用 `__str__` 这个内置方法了

> 注意： __str__ 方法必须返回一个字符串

~~~python
class Cat:
	def __init__(self, new_name):
		self.name = new_name
		print("%s 来了" % self.name)
		
	def __del__(self):
		print("%s 去了" % self.name)

	def __str__(self):
		return "我是小猫：%s" % self.name

tom = Cat("Tom")
print(tom)
~~~

## 封装

* 封装 是面向对象编程的一大特点
* 面向对象编程的 第一步 —— 将 属性 和 方法 封装 到一个抽象的 类 中
* 外界 使用 类 创建 对象，然后 让对象调用方法
* 对象方法的细节 都被 封装 在 类的内部

**封装案例一：小明爱跑步**
需求：

1. 小明 体重 75.0 公斤
2. 小明每次 跑步 会减肥 0.5 公斤
3. 小明每次 吃东西 体重增加 1 公斤

~~~python
class Person:
	"""人类"""
	def __init__(self, name, weight):
		self.name = name
		self.weight = weight

	def __str__(self):
		return "我的名字叫 %s 体重 %.2f 公斤" % (self.name, self.weight)

	def run(self):
		"""跑步"""
		print("%s 爱跑步，跑步锻炼身体" % self.name)
		self.weight -= 0.5
	
	def eat(self):
		"""吃东西"""
		print("%s 是吃货，吃完这顿再减肥" % self.name)
		self.weight += 1

xiaoming = Person("小明", 75)
xiaoming.run()
xiaoming.eat()
xiaoming.eat()
print(xiaoming)
~~~

> 提示：
>
> 1. 在 对象的方法内部，是可以 直接访问对象的属性 的
> 2. 同一个类 创建的 多个对象 之间，属性 互不干扰！

**封装案例二：摆放家具**
需求：

1. 房子(House) 有 户型、总面积 和 家具名称列表
	新房子没有任何的家具
2. 家具(HouseItem) 有 名字 和 占地面积，其中
	席梦思(bed) 占地 4 平米
	衣柜(chest) 占地 2 平米
	餐桌(table) 占地 1.5 平米
3. 将以上三件 家具 添加 到 房子 中
4. 打印房子时，要求输出：户型、总面积、剩余面积、家具名称列表

剩余面积

1. 在创建房子对象时，定义一个 剩余面积的属性，初始值和总面积相等
2. 当调用 add_item 方法，向房间 添加家具 时，让 剩余面积 -= 家具面积

思考：应该先开发哪一个类？答案 —— 家具类
	1. 家具简单
	2. 房子要使用到家具，被使用的类，通常应该先开发

创建家具：

~~~python
class HouseItem:
	def __init__(self, name, area):
		"""
		:param name: 家具名称
		:param area: 占地面积
		"""
		self.name = name
		self.area = area

	def __str__(self):
		return "[%s] 占地面积 %.2f" % (self.name, self.area)

## 1. 创建家具
bed = HouseItem("席梦思", 4)
chest = HouseItem("衣柜", 2)
table = HouseItem("餐桌", 1.5)
print(bed)
print(chest)
print(table)
~~~

> 小结
>
> 1. 创建了一个 家具类，使用到 __init__ 和 __str__ 两个内置方法
> 2. 使用 家具类 创建了 三个家具对象，并且 输出家具信息

创建房间：

~~~python
class House:
	def __init__(self, house_type, area):
		"""
		:param house_type: 户型
		:param area: 总面积
		"""
		self.house_type = house_type
		self.area = area
		## 剩余面积默认和总面积一致
		self.free_area = area
		## 默认没有任何的家具
		self.item_list = []
		
	def __str__(self):
		## Python 能够自动的将一对括号内部的代码连接在一起
		return ("户型：%s\n总面积：%.2f[剩余：%.2f]\n家具：%s" % (self.house_type, self.area, self.free_area, self.item_list))

	def add_item(self, item):
		print("要添加 %s" % item)
		
...

## 2. 创建房子对象
my_home = House("两室一厅", 60)
my_home.add_item(bed)
my_home.add_item(chest)
my_home.add_item(table)
print(my_home)
~~~

> 小结
>
> 1. 创建了一个 房子类，使用到 __init__ 和 __str__ 两个内置方法
> 2. 准备了一个 add_item 方法 准备添加家具
> 3. 使用 房子类 创建了 一个房子对象
> 4. 让 房子对象 调用了三次 add_item 方法，将 三件家具 以实参传递到 add_item 内部

 添加家具：

1. 判断 家具的面积 是否 超过剩余面积，如果超过，提示不能添加这件家具
2. 将 家具的名称 追加到 家具名称列表 中
3. 用 房子的剩余面积 - 家具面积

~~~python
def add_item(self, item):
	print("要添加 %s" % item)
	## 1. 判断家具面积是否大于剩余面积
	if item.area > self.free_area:
		print("%s 的面积太大，不能添加到房子中" % item.name)
		return
	
	## 2. 将家具的名称追加到名称列表中
	self.item_list.append(item.name)
	
	## 3. 计算剩余面积
	self.free_area -= item.area
~~~

小结：

* 主程序只负责创建 房子 对象和 家具 对象
* 让 房子 对象调用 add_item 方法 将家具添加到房子中
* 面积计算、剩余面积、家具列表 等处理都被 封装 到 房子类的内部

### 4. 身份运算符

身份运算符用于 比较 两个对象的 内存地址 是否一致 —— 是否是对同一个对象的引用
![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/505e0a3da3e44e70942bfcaaa8c3320e.png)

> 在Python中针对 None 比较时，建议使用 is 判断

** is 与 == 区别**：

* is 用于判断 两个变量 引用对象是否为同一个
* == 用于判断 引用变量的值 是否相等

~~~python
>>> a = [1, 2, 3]
>>> b = [1, 2, 3]
>>> b is a
False
>>> b == a
True
~~~

## 私有属性和私有方法

### 1. 私有属性和私有方法

应用场景:

* 在实际开发中，对象 的 某些属性或方法 可能只希望 在对象的内部被使用，而 不希望在外部被访问到
* 私有属性 就是 对象 不希望公开的 属性
* 私有方法 就是 对象 不希望公开的 方法

定义方式：在 定义属性或方法时，在 属性名或者方法名前 增加 两个下划线，定义的就是 私有 属性或方法

~~~python
class Women:
	def __init__(self, name):
		self.name = name
		## 不要问女生的年龄
		self.__age = 18

	def __secret(self):
		print("我的年龄是 %d" % self.__age)

xiaofang = Women("小芳")
## 私有属性，外部不能直接访问
## print(xiaofang.__age)
## 私有方法，外部不能直接调用
## xiaofang.__secret()
~~~

### 2. 伪私有属性和私有方法

> 提示：在日常开发中，不要使用这种方式，访问对象的 私有属性 或 私有方法

Python中，并没有 真正意义 的 私有

* 在给 属性、方法 命名时，实际是对 名称 做了一些特殊处理，使得外界无法访问到
* 处理方式：在 名称 前面加上 _类名 => _类名__名称

~~~python
## 私有属性，外部不能直接访问到，但加上_类名前缀则可以访问了
print(xiaofang._Women__age)
## 私有方法，外部不能直接调用，但加上_类名前缀则可以调用了
xiaofang._Women__secret()
~~~

## 继承

### 1. 面向对象三大特性

* 封装：根据 职责 将 属性 和 方法 封装 到一个抽象的 类 中
* 继承：实现代码的重用，相同的代码不需要重复的编写
* 多态：不同的对象调用相同的方法，产生不同的执行结果，增加代码的灵活度

### 1. 继承

继承的概念：子类 拥有 父类 的所有 方法 和 属性
![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/95f1eef5fc63495ba0df31ce788d14d2.png)
继承的语法：

~~~python
class 类名(父类名):
	pass
~~~

> 子类 继承自 父类，可以直接 享受 父类中已经封装好的方法，不需要再次开发
> 子类 中应该根据 职责，封装 子类特有的 属性和方法

专业术语

* Dog 类是 Animal 类的子类， Animal 类是 Dog 类的父类， Dog 类从 Animal 类继承
* Dog 类是 Animal 类的派生类， Animal 类是 Dog 类的基类， Dog 类从 Animal 类派生

**继承的传递性**：

* C 类从 B 类继承， B 类又从 A 类继承
* 那么 C 类就具有 B 类和 A 类的所有属性和方法

子类 拥有 父类 以及 父类的父类 中封装的所有 属性 和 方法

> 思考：哮天犬能够调用 Cat 类中定义的 catch 方法吗？
> 答案：不能，因为哮天犬和 Cat 之间没有继承关系

### 2. 方法的重写

* 子类 拥有 父类 的所有 方法 和 属性
* 子类 继承自 父类，可以直接 享受 父类中已经封装好的方法，不需要再次开发

应用场景：当 父类 的方法实现不能满足子类需求时，可以对方法进行 重写(override)

重写 父类方法有两种情况：

1. 覆盖 父类的方法
2. 对父类方法进行 扩展

#### 2.1 覆盖父类的方

如果在开发中，父类的方法实现 和 子类的方法实现，完全不同。
就可以使用 覆盖 的方式，在子类中 重新编写 父类的方法实现

> 具体的实现方式，就相当于在 子类中 定义了一个 和父类同名的方法并且实现

重写之后，在运行时，只会调用 子类中重写的方法，而不再会调用 父类封装的方法

#### 2.2 对父类方法进行 扩展

如果在开发中，子类的方法实现 中 包含 父类的方法实现：

* 父类原本封装的方法实现 是 子类方法的一部分

就可以使用 扩展 的方式

1. 在子类中 重写 父类的方法
2. 在需要的位置使用 `super().父类方法` 来调用父类方法的执行
3. 代码其他的位置针对子类的需求，编写 子类特有的代码实现

**关于super**：

* 在 Python 中 super 是一个 特殊的类
* super() 就是使用 super 类创建出来的对象
* 最常 使用的场景就是在 重写父类方法时，调用 在父类中封装的方法实现

### 3. 父类的 私有属性 和 私有方法

1. 子类对象 不能 在自己的方法内部，直接 访问 父类的 私有属性 或 私有方法
2. 子类对象 可以通过 父类 的 公有方法 间接 访问到 私有属性 或 私有方法
	![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/d38734da72814cca91dae1782a1cd886.png)

## 多态

多态：不同的 子类对象 调用相同的 父类方法，产生不同的执行结果

* 多态 可以 增加代码的灵活度
* 以 继承 和 重写父类方法 为前提
* 是调用方法的技巧，不会影响到类的内部设计

**示例：**

需求

1. 在 Dog 类中封装方法 game
	* 普通狗只是简单的玩耍
2. 定义 XiaoTianDog 继承自 Dog ，并且重写 game 方法
	* 哮天犬需要在天上玩耍
3. 定义 Person 类，并且封装一个 和狗玩 的方法
	* 在方法内部，直接让 狗对象 调用 game 方法
		![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/daf1bd21663c414eb778b90588135c2b.png)

> Person 类中只需要让 狗对象 调用 game 方法，而不关心具体是 什么狗。
>
> * game 方法是在 Dog 父类中定义的
>
> 在程序执行时，传入不同的 狗对象 实参，就会产生不同的执行效果。

> 多态更容易编写出通用的代码，做出通用的编程，以适应需求的不断变化！

~~~python
class Dog(object):
	def __init__(self, name):
		self.name = name

	def game(self):
		print("%s 蹦蹦跳跳的玩耍..." % self.name)


class XiaoTianDog(Dog):
	def game(self):
		print("%s 飞到天上去玩耍..." % self.name)

class Person(object):
	def __init__(self, name):
		self.name = name

	def game_with_dog(self, dog):
		print("%s 和 %s 快乐的玩耍..." % (self.name, dog.name))
		## 让狗玩耍
		dog.game()


## 1. 创建一个狗对象
## wangcai = Dog("旺财")
wangcai = XiaoTianDog("飞天旺财")
## 2. 创建一个小明对象
xiaoming = Person("小明")
## 3. 让小明调用和狗玩的方法
xiaoming.game_with_dog(wangcai)
~~~

## 类属性和类方法

### 1. 类的结构

#### 1.1 实例

1. 使用面相对象开发，第 1 步 是设计 类
2. 使用 类名() 创建对象，创建对象 的动作有两步：
	* 在内存中为对象 分配空间
	* 调用初始化方法 `__init__` 为 对象初始化
3. 对象创建后，内存 中就有了一个对象的 实实在在 的存在 —— 实例
	![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/5da29be238da47d79fb000e6a90718b1.png)

因此，通常也会把：

1. 创建出来的 对象 叫做 类 的 实例
2. 创建对象的 动作 叫做 实例化
3. 对象的属性 叫做 实例属性
4. 对象调用的方法 叫做 实例方法

在程序执行时：

1. 对象各自拥有自己的 实例属性
2. 调用对象方法，可以通过 self.
	访问自己的属性
	调用自己的方法

结论

* 每一个对象 都有自己 独立的内存空间，保存各自不同的属性
* 多个对象的方法，在内存中只有一份，在调用方法时，需要把对象的引用 传递到方法内部

#### 1.2 类是一个特殊的对象

> Python 中 一切皆对象：
>
> * class AAA: 定义的类属于 类对象
> * obj1 = AAA() 属于 实例对象

* 在程序运行时，类 同样 会被加载到内存
* 在 Python 中，类 是一个特殊的对象 —— 类对象
* 在程序运行时，类对象 在内存中 只有一份，使用 一个类 可以创建出 很多个对象实例
* 除了封装 实例 的 属性 和 方法外，类对象 还可以拥有自己的 属性 和 方法
	1. 类属性
	2. 类方法
* 通过 `类名.` 的方式可以 访问类的属性 或者 调用类的方法
	![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/22576aab692f4a8ca2cbe8f1e500ed0e.png)

### 2. 类属性和实例属性

* 类属性 就是给 类对象 中定义的 属性
* 通常用来记录 与这个类相关 的特征
* 类属性 不会用于记录 具体对象的特征

示例需求:

* 定义一个 工具类
* 每件工具都有自己的 name
* 需求 —— 知道使用这个类，创建了多少个工具对象？

~~~python
class Tool(object):
	## 使用赋值语句，定义类属性，记录创建工具对象的总数
	count = 0

	def __init__(self, name):
		self.name = name
		## 针对类属性做一个计数+1
		Tool.count += 1

## 创建工具对象
tool1 = Tool("斧头")
tool2 = Tool("榔头")
tool3 = Tool("铁锹")
## 知道使用 Tool 类到底创建了多少个对象?
print("现在创建了 %d 个工具" % Tool.count)
~~~

**属性的获取机制**
在 Python 中 属性的获取 存在一个 向上查找机制
![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/c8805574887d4adb8ca36eba141cf46a.png)
因此，要访问类属性有两种方式：

1. 类名.类属性
2. 对象.类属性 （不推荐）

> 注意：如果使用 对象.类属性 = 值 赋值语句，只会 给对象添加一个属性，而不会影响到 类属性的值

### 3. 类方法和静态方法

#### 3.1 类方法

* 类属性 就是针对 类对象 定义的属性
	* 使用 赋值语句 在 class 关键字下方可以定义 类属性
	* 类属性 用于记录 与这个类相关 的特征
* 类方法 就是针对 类对象 定义的方法
	* 在 类方法 内部可以直接访问 类属性 或者调用其他的 类方法

语法如下：

~~~python
@classmethod
def 类方法名(cls):
	pass
~~~

* 类方法需要用 修饰器 @classmethod 来标识，告诉解释器这是一个类方法
* 类方法的 第一个参数 应该是 cls
	* 由 哪一个类 调用的方法，方法内的 cls 就是 哪一个类的引用
	* 这个参数和 实例方法 的第一个参数是 self 类似
	* 提示 使用其他名称也可以，不过习惯使用 cls
* 通过 类名. 调用 类方法，调用方法时，不需要传递 cls 参数
* 在方法内部
	* 可以通过 `cls.` 访问类的属性
	* 也可以通过 `cls.` 调用其他的类方法

示例需求:

* 定义一个 工具类
* 每件工具都有自己的 name
* 需求 —— 在 类 封装一个 show_tool_count 的类方法，输出使用当前这个类，创建的对象个数

~~~python
@classmethod
def show_tool_count(cls):
	"""显示工具对象的总数"""
	print("工具对象的总数 %d" % cls.count)
~~~

> 在类方法内部，可以直接使用 cls 访问 类属性 或者 调用类方法

#### 3.2 静态方法

* 在开发时，如果需要在 类 中封装一个方法，这个方法：
	* 既 不需要 访问 实例属性 或者调用 实例方法
	* 也 不需要 访问 类属性 或者调用 类方法
* 这个时候，可以把这个方法封装成一个 静态方法

语法如下:

~~~python
@staticmethod
def 静态方法名():
	pass
~~~

静态方法 需要用 修饰器 @staticmethod 来标识，告诉解释器这是一个静态方法。通过 `类名.` 调用 静态方法

~~~python
class Dog(object):
	## 狗类对象计数
	dog_count = 0

	@staticmethod
	def run():
		## 不需要访问实例属性也不需要访问类属性的方法
		print("狗在跑...")

	def __init__(self, name):
		self.name = name
~~~

#### 3.3 方法综合案例

需求

1. 设计一个 Game 类
2. 属性：
	* 定义一个 类属性 top_score 记录游戏的 历史最高分
	* 定义一个 实例属性 player_name 记录 当前游戏的玩家姓名
3. 方法：
	* 静态方法 show_help 显示游戏帮助信息
	* 类方法 show_top_score 显示历史最高分
	* 实例方法 start_game 开始当前玩家的游戏
4. 主程序步骤
	1. 查看帮助信息
	2. 查看历史最高分
	3. 创建游戏对象，开始游戏
		![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/c01f8525336f42d1a2ce80749de7f098.png)

案例小结

1. 实例方法 —— 方法内部需要访问 实例属性
	实例方法 内部可以使用 类名. 访问类属性
2. 类方法 —— 方法内部 只 需要访问 类属性
3. 静态方法 —— 方法内部，不需要访问 实例属性 和 类属性

提问：如果方法内部 即需要访问 实例属性，又需要访问 类属性，应该定义成什么方法？

答案：应该定义 实例方法。因为，类只有一个，在 实例方法 内部可以使用 类名. 访问类属性

~~~python
class Game(object):
	## 游戏最高分，类属性
	top_score = 0

	@staticmethod
	def show_help():
		print("帮助信息：让僵尸走进房间")

	@classmethod
	def show_top_score(cls):
		print("游戏最高分是 %d" % cls.top_score)

	def __init__(self, player_name):
		self.player_name = player_name

	def start_game(self):
		print("[%s] 开始游戏..." % self.player_name)

## 使用类名.修改历史最高分
Game.top_score = 999
## 1. 查看游戏帮助
Game.show_help()
## 2. 查看游戏最高分
Game.show_top_score()
## 3. 创建游戏对象，开始游戏
game = Game("小明")
game.start_game()
## 4. 游戏结束，查看游戏最高分
Game.show_top_score()
~~~

# 异常&模块&文件操作

## 异常

### 1. 异常的概念

程序在运行时，如果 Python 解释器 遇到到一个错误，会停止程序的执行，并且提示一些错误信息，这就是异常。

程序停止执行并且提示错误信息 这个动作，我们通常称之为：抛出(raise)异常

> 程序开发时，很难将 所有的特殊情况 都处理的面面俱到，通过 异常捕获 可以针对突发事件做集中的处理，从而保证程序的 稳定性和健壮性

### 2. 捕获异常

#### 2.1 简单的捕获异常语法

在程序开发中，如果 对某些代码的执行不能确定是否正确，可以增加 try(尝试) 来 捕获异常

捕获异常最简单的语法格式：

~~~python
try:
	尝试执行的代码
except:
	出现错误的处理
~~~

> try 尝试，下方编写要尝试代码，不确定是否能够正常执行的代码
> except 如果有异常捕获，下方编写捕获到异常,处理失败的代码

示例：

~~~python
try:
	## 提示用户输入一个数字
	num = int(input("请输入数字："))
except:
	print("请输入正确的数字")
~~~

#### 2.2 错误类型捕获

在程序执行时，可能会遇到 不同类型的异常，并且需要 针对不同类型的异常，做出不同的响应，这个时候，就需要捕获错误类型了

语法如下：

~~~python
try:
	## 尝试执行的代码
	pass
except 错误类型1:
	## 针对错误类型1，对应的代码处理
	pass
except (错误类型2, 错误类型3):
	## 针对错误类型2 和 3，对应的代码处理
	pass
except Exception as result:
	print("未知错误 %s" % result)
~~~

当 Python 解释器 抛出异常 时，最后一行错误信息的第一个单词，就是错误类型

示例：

1. 提示用户输入一个整数
2. 使用 8 除以用户输入的整数并且输出

~~~python
try:
	num = int(input("请输入整数："))
	result = 8 / num
	print(result)
except ValueError:
	print("请输入正确的整数")
except ZeroDivisionError:
	print("除 0 错误")
~~~

**捕获未知错误**
在开发时，要预判到所有可能出现的错误，还是有一定难度的,如果希望程序 无论出现任何错误，都不会因为 Python 解释器 抛出异常而被终止，可以再增加一个 except Exception

exception Exception as result: 中的 result记录异常的错误信息

语法如下：

~~~python
except Exception as result:
	print("未知错误 %s" % result)
~~~

#### 2.3 异常捕获完整语法

在实际开发中，为了能够处理复杂的异常情况，完整的异常语法如下：

> 提示：
>
> * 有关完整语法的应用场景，在后续学习中，结合实际的案例会更好理解
> * 现在先对这个语法结构有个印象即可

~~~python
try:
	## 尝试执行的代码
	pass
except 错误类型1:
	## 针对错误类型1，对应的代码处理
	pass
except 错误类型2:
	## 针对错误类型2，对应的代码处理
	pass
except (错误类型3, 错误类型4):
	## 针对错误类型3 和 4，对应的代码处理
	pass
except Exception as result:
	## 打印错误信息
	print(result)
else:
	## 没有异常才会执行的代码
	pass
finally:
	## 无论是否有异常，都会执行的代码
	print("无论是否有异常，都会执行的代码")
~~~

> * else 只有在没有异常时才会执行的代码
> * finally 无论是否有异常，都会执行的代码

### 3. 异常的传递

异常的传递 —— 当 函数/方法 执行 出现异常，会 将异常传递 给 函数/方法 的 调用一方

如果 传递到主程序，仍然 没有异常处理，程序才会被终止

> 提示：
>
> * 在开发中，可以在主函数中增加 异常捕获
> * 而在主函数中调用的其他函数，只要出现异常，都会传递到主函数的 异常捕获 中
> * 这样就不需要在代码中，增加大量的 异常捕获，能够保证代码的整洁

需求

1. 定义函数 demo1() 提示用户输入一个整数并且返回
2. 定义函数 demo2() 调用 demo1()
3. 在主程序中调用 demo2()

~~~python
def demo1():
	return int(input("请输入一个整数："))

def demo2():
	return demo1()

try:
	print(demo2())
except ValueError:
	print("请输入正确的整数")
except Exception as result:
	print("未知错误 %s" % result)
~~~

### 4. 抛出 `raise` 异常

应用场景：
	* 在开发中，除了 代码执行出错 Python 解释器会 抛出 异常之外
	* 还可以根据 应用程序 特有的业务需求 主动抛出异常

示例：提示用户 输入密码，如果 长度少于 8，抛出 异常
![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/1bb43bc16e894a17b15253ac0e47e2c6.png)

> 注意
>
> * 当前函数 只负责 提示用户输入密码，如果 密码长度不正确，需要其他的函数进行额外处理
> * 因此可以 抛出异常，由其他需要处理的函数 捕获异常

Python 中提供了一个 Exception 异常类，在开发时，如果满足 特定业务需求时，希望 抛出异常，可以：

1. 创建 一个 Exception类 的 对象
2. 使用 raise 关键字 抛出 异常对象

示例：

* 定义 input_password 函数，提示用户输入密码
* 如果用户输入长度 < 8，抛出异常
* 如果用户输入长度 >=8，返回输入的密码

~~~python
def input_password():
	## 1. 提示用户输入密码
	pwd = input("请输入密码：")
	## 2. 判断密码长度，如果长度 >= 8，返回用户输入的密码
	if len(pwd) >= 8:
		return pwd
	
	## 3. 密码长度不够，需要抛出异常
	## 1> 创建异常对象 - 使用异常的错误信息字符串作为参数
	ex = Exception("密码长度不够")
	## 2> 抛出异常对象
	raise ex


try:
	user_pwd = input_password()
	print(user_pwd)
except Exception as result:
	print("发现错误：%s" % result)
~~~

## 模块和包

### 1. 模块

**模块的概念**：

> 模块是 Python 程序架构的一个核心概念

* 每一个以扩展名 py 结尾的 Python 源代码文件都是一个 模块
* 模块名 同样也是一个 标识符，需要符合标识符的命名规则
* 在模块中定义的 全局变量 、函数、类 都是提供给外界直接使用的 工具
* 模块 就好比是 工具包，要想使用这个工具包中的工具，就需要先 导入 这个模块

**模块的两种导入方式**：

* import 导入

~~~python
## 方式1
import 模块名1, 模块名2
## 方式2，推荐
import 模块名1
import 模块名2
~~~

> 导入之后，通过 `模块名.` 使用 模块提供的工具 —— 全局变量、函数、类

使用 as 指定模块的别名：如果模块的名字太长，可以使用 as 指定模块的名称，以方便在代码中的使用

~~~python
import 模块名1 as 模块别名
~~~

> 注意：模块别名 应该符合 大驼峰命名法

* from...import 导入

	* 果希望 从某一个模块 中，导入 部分 工具，就可以使用 from ... import 的方式
	* import 模块名 是 一次性 把模块中 所有工具全部导入，并且通过 模块名/别名 访问

	~~~python
	## 从 模块 导入 某一个工具
	from 模块名1 import 工具名
	~~~

	> 导入之后不需要 通过 `模块名.` 可以直接使用 模块提供的工具 —— 全局变量、函数、类

> 注意：如果 两个模块，存在 同名的函数，那么 后导入模块的函数，会 覆盖掉先导入的函数
>
> * 开发时 import 代码应该统一写在 代码的顶部，更容易及时发现冲突
> * 一旦发现冲突，可以使用 as 关键字 给其中一个工具起一个别名

* from...import *

~~~python
## 从 模块 导入 所有工具
from 模块名1 import *
~~~

> 注意：这种方式不推荐使用，因为函数重名并没有任何的提示，出现问题不好排查

**模块的搜索顺序**[扩展]：
Python 的解释器在 导入模块 时，会：

1. 搜索 当前目录 指定模块名的文件，如果有就直接导入
2. 如果没有，再搜索 系统目录

> 在开发时，给文件起名，不要和 系统的模块文件 重名

Python 中每一个模块都有一个内置属性 __file__ 可以 查看模块 的 完整路径

示例：

~~~python
import random

## 生成一个 0～10 的数字
rand = random.randint(0, 10)
print(rand)
~~~

> 注意：如果当前目录下，存在一个 random.py 的文件，程序就无法正常执行了！
> 这个时候， Python 的解释器会 加载当前目录 下的 random.py 而不会加载 系统的 random 模块

**原则 —— 每一个文件都应该是可以被导入的**：

* 一个 独立的 Python 文件 就是一个 模块
* 在导入文件时，文件中 所有没有任何缩进的代码 都会被从上到下执行一遍！

实际开发场景

* 在实际开发中，每一个模块都是独立开发的，大多都有专人负责
* 开发人员 通常会在 模块下方 增加一些测试代码，仅在模块内使用，而被导入到其他文件中不需要执行

**`__name__` 属性**：

* `__name__` 属性可以做到，测试模块的代码 只在测试情况下被运行，而在 被导入时不会被执行！
* `__name__` 是 Python 的一个内置属性，记录着一个 字符串
* 如果 是被其他文件导入的， `__name__` 就是 模块名
* 如果 是当前执行的程序 `__name__` 是 `__main__`

在很多 Python 文件中都会看到以下格式的代码：

~~~python
## 导入模块
## 定义全局变量
## 定义类
## 定义函数

## 在代码的最下方
def main():
	## ...
	pass

## 根据 __name__ 判断是否执行下方代码
if __name__ == "__main__":
	main()
~~~

### 2. 包（Package）

概念：

* 包 是一个 包含多个模块 的 特殊目录
* 目录下有一个 特殊的文件`__init__.py`
* 包名的 命名方式 和变量名一致，小写字母 + `_`

好处：使用 import 包名 可以一次性导入 包 中 所有的模块

案例演练

1. 新建一个 hm_message 的 包
2. 在目录下，新建两个文件 send_message 和 receive_message
3. 在 send_message 文件中定义一个 send 函数
4. 在 receive_message 文件中定义一个 receive 函数
5. 在外部直接导入 hm_message 的包

**`__init__.py`**
要在外界使用 包 中的模块，需要在 `__init__.py` 中指定 对外界提供的模块列表

~~~python
## 从 当前目录 导入 模块列表
from . import send_message
from . import receive_message
~~~

## 文件操作

### 1. 文件的概念

**文件的概念和作用**:

* 计算机的 文件，就是存储在某种 长期储存设备 上的一段 数据
* 长期存储设备包括：硬盘、U 盘、移动硬盘、光盘...
* 作用：将数据长期保存下来，在需要的时候使用

**文件的存储方式**：在计算机中，文件是以 二进制 的方式保存在磁盘上的

**文本文件和二进制文件**:

* 文本文件
	* 可以使用 文本编辑软件 查看
	* 本质上还是二进制文件
	* 例如：python 的源程序
* 二进制文件
	* 保存的内容 不是给人直接阅读的，而是 提供给其他软件使用的
	* 例如：图片文件、音频文件、视频文件等等
	* 二进制文件不能使用 文本编辑软件 查看

### 2. 文件的基本操作

**操作文件的套路**：在 计算机 中要操作文件的套路非常固定，一共包含三个步骤：

1. 打开文件
2. 读、写文件
	* 读 将文件内容读入内存
	* 写 将内存内容写入文件
3. 关闭文件

**操作文件的函数/方法**：在Python中要操作文件需要记住 1 个函数和 3 个方法
![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/d975236861d64b4faa2464d3adcd1abe.png)

> open 函数负责打开文件，并且返回文件对象
> read / write / close 三个方法都需要通过 文件对象 来调用

**read 方法 —— 读取文件**：

* open 函数的第一个参数是要打开的文件名（文件名区分大小写）
	* 如果文件存在，返回文件操作对象
	* 如果文件不存在，会抛出异常
* read 方法可以一次性 读入 并 返回 文件的 所有内容
* close 方法负责 关闭文件
	* 如果 忘记关闭文件，会造成系统资源消耗，而且会影响到后续对文件的访问

~~~python
"""
方式1
存在的问题：
	如果在读取文件的过程中出现异常，则代码会终止执行，close()方法无法执行到，导致文件无法关闭
	使用 try ... finally 实现代码比较繁琐，并且每次都要调用close()方法
"""
## 1. 打开 - 文件名需要注意大小写
file = open("README")
## 2. 读取
text = file.read()
print(text)
## 3. 关闭
file.close()

"""
方式2：使用 with open() 语句的好处就是在语句执行完后会自动关闭文件，即使出现异常。代码更加简洁，建议使用该方式
"""
## 打开文件，并获取文件对象
with open("README") as f:
	## 读取
	text = f.read()
	print(text)
~~~

**打开文件的方式**：open 函数默认以 只读方式 打开文件，并且返回文件对象，语法 `f = open("文件名", "访问方式")`
![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/9f1ecd3b168742878784309c89f7f2b2.png)
写入文件示例

~~~python
with open("README", "w") as f:
	f.write("hello python！\n")
	f.write("今天天气真好")
~~~

**按行读取文件内容**：

* read 方法默认会把文件的 所有内容 一次性读取到内存
* 如果文件太大，对内存的占用会非常严重

* readline方法
	* readline 方法可以一次读取一行内容
	* 方法执行后，会把 文件指针 移动到下一行，准备再次读取

读取大文件的正确姿势：

~~~python
## 打开文件
with open("README") as file:
	while True:
		## 读取一行内容
		text = file.readline()
		## 判断是否读到内容
		if not text:
			break
		## 每读取一行的末尾已经有了一个 `\n`
		print(text, end="")	
~~~

## JSON操作

### 1. JSON介绍

JSON的全称是”JavaScript Object Notation”，是JavaScript对象表示法，它是一种基于文本，独立于语言的轻量级
数据交换格式。

- JSON是纯文本
- JSON具有良好的自我描述性，便于阅读和编写
- JSON具有清晰的层级结构
- 有效地提升网络传输效率

**JSON语法规则**:

- 大括号保存对象
- 中括号保存数组
- 对象数组可以相互嵌套
- 数据采用键值对表示
- 多个数据由逗号分隔

**JSON键**：JSON的键必须是字符串类型，用英文双引号括起来

**JSON值**:

- 数字（整数或浮点数）
- 字符串（在双引号中）
- 逻辑值（true 或 false）
- 数组（在中括号中）
- 对象（在大括号中）
- null

示例：

~~~json
{
  "name": "tom",
  "age": 18,
  "isMan": true,
  "school": null,
  "address": {
    "country": "中国",
    "city": "江苏苏州",
    "street": "科技园路"
  },
  "numbers": [
    2,
    6,
    8,
    9
  ],
  "links": [
    {
      "name": "Baidu",
      "url": "http://www.baidu.com"
    },
    {
      "name": "TaoBao",
      "url": "http://www.taobao.com"
    }
  ]
}
~~~

### 2. JSON数据操作

~~~python
## 导入依赖包
import json

## 读取文件
with open('data.json', encoding='UTF-8') as f:
	data = json.load(f) ## 返回的数据类型为字典或列表

## 写入文件
param = {'name': 'tom', 'age': 20}
with open('data2.json', 'w', encoding='UTF-8') as f:
	json.dump(param, f)
~~~

