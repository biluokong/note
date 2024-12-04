### Pandas

> 作者：iJeff
>
> 版本：QF1.0
>
> 版权：千锋Python教研院
>
> 公众号：Python专栏

#### 强大的数据处理和分析工具

<img src="./images/pandas1.png" style="zoom:150%;" />

####  一、Pandas课程介绍

- Pandas 是基于NumPy的一种工具，该工具是为解决数据分析任务而创建的, Pandas提供了大量能使我们快速便捷地处理数据的函数和方法。

- Pandas与出色的 Jupyter工具包和其他库相结合，Python中用于进行数据分析的环境在性能、生产率和协作能力方面都是卓越的。
- Pandas的主要数据结构是 **Series(**一维数据)与 **DataFrame **(二维数据)，这两种数据结构足以处理金融、统计、社会科学、工程等领域里的大多数案例
- 处理数据一般分为几个阶段：数据整理与清洗、数据分析与建模、数据可视化，Pandas 是处理数据的理想工具。

#### 二、Pandas安装

- Anaconda环境: 无需安装
- 普通Python环境: pip install pandas -i https://pypi.tuna.tsinghua.edu.cn/simple

#### 三、Pandas数据结构

#### Series

Series是一种类似于一维数组的对象，由下面两个部分组成：

- values：一组数据（ndarray类型）
- index：相关的数据索引标签

##### 1）Series的创建

两种创建方式：

###### (1) 由列表或NumPy数组创建

```python
list1 = [11, 22, 33, 44]
n = np.array(list1)
# type(n)  # numpy.ndarray

s = Series(n)
display(n, s, type(s))  
# pandas.core.series.Series
```

Series属性: index和values

```python
# values属性
s.values 
# array([11, 22, 33, 44])

s.index
# RangeIndex(start=0, stop=4, step=1)
list(s.index)

# 修改索引
s.index = list("abcd")
s.index = ["鲁班", "李白", "诸葛亮", "张飞"]
display(s)

# 通过索引取值
s.鲁班, s['鲁班']

# 通过索引修改值
s['鲁班'] = 100
```

###### (2) 还可以通过字典创建

```python
d = {
    'a': 11,
    'b': 22,
    'c': 33,
    'd': 44
}
s = Series(d)
s.index = list("ABCD")
display(s)


d = {
    'a': np.random.randint(0, 10, size=(2,3)),
    'b': np.random.randint(0, 10, size=(2,3)),
    'c': np.random.randint(0, 10, size=(2,3)),
    'd': np.random.randint(0, 10, size=(2,3))
}
s = Series(d)
display(s)


# 创建时同时设置索引
s = Series([1,2,3], index=["张三", '李四', '王五'])
display(s)
```

##### 2）Series的索引

可以使用中括号取单个索引（此时返回的是元素类型），或者中括号里一个列表取多个索引（此时返回的仍然是一个Series类型）。分为显示索引和隐式索引：

###### (1) 显式索引：

 - 使用index中的元素作为索引值
 - 使用.loc[]

注意，此时是闭区间

```python
s = Series({'语文': 150, "数学": 100, "英语": 120, "Python": 99})

# 显式索引：使用索引名字
s['语文']  # int类型
s[['语文', "Python", "数学"]]  # Series类型
s[['语文']]  # Series类型

# .loc[ ]
s.loc['语文']
s.loc[['语文', "Python", "数学"]] 
s.loc[['语文']]
```

###### (2) 隐式索引：

- 使用整数作为索引值
- 使用.iloc[]（推荐）

注意，此时是半开区间

```python
s = Series({'语文': 150, "数学": 100, "英语": 120, "Python": 99})

# 隐式索引： 使用数字下标
s[0]
s[[0, 2, 1]]
s[[0]]

# iloc[ ]
s.iloc[0]
s.iloc[[0, 2, 1]]
s.iloc[[0]]
```

##### 3）Series的切片

- Series一维数组切片

```python
s = Series({'语文': 150, "数学": 100, "英语": 120, "Python": 99, "Numpy": 66, "Pandas": 199})

# Series是一维数组

# 隐式切片 : 左闭右开
s[1: 4]
s.iloc[1: 4]

# 显式切片： 闭区间
s["数学": "Python"]
s.loc["数学": "Python"]
```

##### 4）Series的属性和方法

- shape 形状
- size 大小
- index 索引
- values 值
- dtype 元素类型
- name  Series名字

```python
s.shape  # 形状
s.size  # 元素个数
s.index  # 索引
s.values  # 值
s.dtype  # 元素类型

s = Series([11, 22, 33], name="年龄")
s.name
```

查看首尾数据

- head()  查看前几条数据，默认5条
- tail()  查看后几条数据，默认5 

```python
# 查看前几条数据，默认5条
head() 
s.head()  
s.head(2)

# 查看后几条数据，默认5
tail() 
s.tail()
s.tail(2)
```

检测缺失数据

- pd.isnull()
- pd.notnull()
- isnull()
- notnull()

```python
# s.isnul()
pd.isnull(s)

# s.notnull()
pd.notnull(s)

# 可以通过True，Flase过滤数据

# 保留不为空的数据
s[ pd.notnull(s) ]
```

##### 5）Series的运算

###### (1) 适用于NumPy的数组运算也适用于Series

```python
s = Series(np.random.randint(10, 100, size=10))

s + 100
s - 100
s * 100
s / 100
s // 10
s ** 2
```

###### (2) Series之间的运算

- 在运算中自动对齐索引的数据
- 如果索引不对应，则补NaN
- Series没有广播机制 

```python
s1 = Series(np.random.randint(10, 100, size=3))
s2 = Series(np.random.randint(10, 100, size=4))
display(s1 + s2)

# Numpy中有广播机制
n1 = np.array(np.random.randint(1, 10, size=(1, 3)))
n2 = np.array(np.random.randint(1, 10, size=(3, 1)))
display(n1 + n2)
```

- 注意：要想保留所有的index，则需要使用.add()函数

```python
s1.add(s2, fill_value=100)
```

#### DataFrame

DataFrame是一个【表格型】的数据结构，可以看做是【由Series组成的字典】（共用同一个索引）。DataFrame由按一定顺序排列的多列数据组成。设计初衷是将Series的使用场景从一维拓展到多维。DataFrame既有行索引，也有列索引。

- 行索引：index
- 列索引：columns
- 值：values（numpy的二维数组）

##### 1）DataFrame的创建

最常用的方法是传递一个字典来创建。DataFrame以字典的键作为每一【列】的名称，以字典的值（一个数组）作为每一列。

此外，DataFrame会自动加上每一行的索引（和Series一样）。

同Series一样，若传入的列与字典的键不匹配，则相应的值为NaN

```python
d = {
    'name' : ["鲁班", '陈咬金', "猪八戒"],
    'age' : [7, 9, 8],
    'sex': ['男', '女', '男']
}
df = DataFrame(d)
```

###### DataFrame属性和方法

- values 值
- columns 列索引
- index 行索引
- shape 形状
- head() 查看前几行数据
- tail() 查看后几行数据

```python
# 创建DataFrame
df = DataFrame(d, index=["第一行", "第二行", "第三行"])

df.values  # 值，二维ndarray数组
df.columns   # 列索引
df.index  # 行索引
df.shape  # 形状

# 查看首尾数据
df.head(2)
df.tail(2)
```

创建DataFrame的其他方式

```python
df = DataFrame(
    data=np.random.randint(0, 100, size=(4, 6)),
    index=['小明', "小红", '小绿', '小黄'],
    columns=['语文', '数学', '英语', 'Python', 'Numpy', 'Pandas']
)
df
```

##### 2）DataFrame的索引

###### (1) 对列进行索引

- 通过类似字典的方式
- 通过属性的方式

可以将DataFrame的列获取为一个Series。返回的Series拥有原DataFrame相同的索引，且name属性也已经设置好了，就是相应的列名。

```python
df = DataFrame(
    data=np.random.randint(0, 100, size=(4, 6)),
    index=['小明', "小红", '小绿', '小黄'],
    columns=['语文', '数学', '英语', 'Python', 'Numpy', 'Pandas']
)

df.语文
df['语文']  # Series

df[['语文', 'Python']]  # DataFrame
df[['语文']]
```

###### (2) 对行进行索引

- 使用.loc[ ]加index来进行行索引
- 使用.iloc[ ]加整数来进行行索引

同样返回一个Series，index为原来的columns。

```python
df = DataFrame(
    data=np.random.randint(0, 100, size=(4, 6)),
    index=['小明', "小红", '小绿', '小黄'],
    columns=['语文', '数学', '英语', 'Python', 'Numpy', 'Pandas']
)

# DataFrame默认取列索引
df.loc['小明']  # Series
df.iloc[0]

df.loc[['小明', '小绿']]  # DataFrame
df.loc[['小明']] 
df.iloc[[0, 2]]  # DataFrame
df.iloc[[0]]
```

###### (3) 对元素索引的方法

- 使用列索引
- 使用行索引(iloc[3,1]相当于两个参数;iloc[[3,3]] 里面的[3,3]看做一个参数)
- 使用values属性（二维numpy数组）

```python
df = DataFrame(
    data=np.random.randint(0, 100, size=(4, 6)),
    index=['小明', "小红", '小绿', '小黄'],
    columns=['语文', '数学', '英语', 'Python', 'Numpy', 'Pandas']
)

# 先取列，再取行
df['语文'][1]
df['语文']['小明']

# 先取行，再取列
df.iloc[1]['语文']
# df.loc['小明', '语文']  
```

##### 3）DataFrame的切片

【注意】 直接用中括号时：

- 索引表示的是列索引
- 切片表示的是行切片

```python
df = DataFrame(
    data=np.random.randint(0, 100, size=(4, 6)),
    index=['小明', "小红", '小绿', '小黄'],
    columns=['语文', '数学', '英语', 'Python', 'Numpy', 'Pandas']
)

# 索引： 优先使用列索引， 先取行就需要写loc或iloc
# 切片： 优先按行切片， 和Numpy操作类似

# 行： 行名， 行数字索引
# 列： 列名

# 行切片
df[1 : 3]  # 左闭右开
df['小明' : "小绿"]  # 闭区间

df.iloc[1 : 3]
df.loc['小明' : "小绿"]

# 列切片: 需要使用loc或iloc
df.iloc[:, 1:3]
df.loc[:, "数学": "Python"]

df.loc["小明":"小绿", "数学":"Python"]
df.iloc[:3, 1:4]
```

##### 4）DataFrame的运算

###### （1） DataFrame之间的运算

- 在运算中自动对齐索引的数据 
- 如果索引不对应，则补NaN
- DataFrame没有广播机制 

```python
# 创建DataFrame df1 不同人员的各科目成绩，月考一
df1 = DataFrame(
    data={
      'Python': [100, 90, 80], 
      'Java': [80, 70, 60], 
      'PHP': [60, 50, 40]
    },
    index=['张飞', "吕布", '关羽']
)

# 创建DataFrame df2 不同人员的各科目成绩，月考二
df2 = DataFrame(
    data={
      'Python': [100, 90, 80, 70], 
      'Java': [80, 70, 60, 50], 
      'PHP': [60, 50, 40, 30], 
      'Go': [40, 30, 20, 10]
    },
    index=['张飞', "吕布", '关羽', "刘备"]
)

# DataFrame和数的运算
display(df1 + 100)

# DataFrame之间的运算
display(df1 + df2)

# 自动填充， 再相加
df1.add(df2, fill_value=1000)
```

###### （2）Series与DataFrame之间的运算

- 使用Python操作符：以行为单位操作（参数必须是行），对所有行都有效。（类似于numpy中二维数组与一维数组的运算，但可能出现NaN）

- 使用pandas操作函数：

    axis=0：以列为单位操作（参数必须是列），对所有列都有效。
    axis=1：以行为单位操作（参数必须是行），对所有行都有效。

```python
# 创建DataFrame df1 不同人员的各科目成绩，月考一
df1 = DataFrame(
    data={
      'Python': [100, 90, 80], 
      'Java': [80, 70, 60], 
      'PHP': [60, 50, 40]
    },
    index=['张飞', "吕布", '关羽']
)

s = Series([100, 10, 1], index=df1.columns)

# 直接相加
df1 + s

# 使用add函数
df1.add(s)
df1.add(s, axis='columns')  # 列
df1.add(s, axis=1)  # 第二个维度

s = Series([100, 10, 1], index=df1.index)
df1.add(s, axis='index')  # 行
df1.add(s, axis=0)  # 行
```



#### 四、Pandas层次化索引

##### 1. 创建多层行索引

###### 1) 隐式构造

- 最常见的方法是给DataFrame构造函数的index参数传递两个或更多的数组

```python
data = np.random.randint(0, 100, size=(6, 6))

index = [
    ['1班', '1班', '1班', '2班', '2班', '2班'],
    ['张三', '李四', '王五', '赵六', '田七', '孙八']
]

columns = [
    ['期中', '期中', '期中', '期末', '期末', '期末'],
    ['语文', '数学', '英语', '语文', '数学', '英语']
]

df = pd.DataFrame(data=data, index=index, columns=columns)
df
```

- Series也可以创建多层索引

```python
data = np.random.randint(0, 100, size=6)

index = [
    ['1班', '1班', '1班', '2班', '2班', '2班'],
    ['张三', '李四', '王五', '赵六', '田七', '孙八']
]

s  = pd.Series(data=data, index=index)
s
```

###### 2) 显示构造pd.MultiIndex

- 使用数组

```python
data = np.random.randint(0, 100, size=(6, 6))

index = pd.MultiIndex.from_arrays( [
    ['1班', '1班', '1班', '2班', '2班', '2班'],
    ['张三', '李四', '王五', '赵六', '田七', '孙八']
] )

columns = [
    ['期中', '期中', '期中', '期末', '期末', '期末'],
    ['语文', '数学', '英语', '语文', '数学', '英语']
]

df = pd.DataFrame(data=data, index=index, columns=columns)
df
```

- 使用tuple

```python
data = np.random.randint(0, 100, size=(6, 6))

index = pd.MultiIndex.from_tuples( 
    (
        ('1班', '张三'), ('1班', '李四'), ('1班', '王五'), 
        ('2班', '赵六'), ('2班', '田七'), ('2班', '孙八'), 
    )
)

columns = [
    ['期中', '期中', '期中', '期末', '期末', '期末'],
    ['语文', '数学', '英语', '语文', '数学', '英语']
]

df = pd.DataFrame(data=data, index=index, columns=columns)
df
```

- 使用product 

```python
data = np.random.randint(0, 100, size=(6, 6))

# 笛卡尔积：{a, b} {c, d} => {a,c}, {a,d}, {b,c}, {b,d}
index = pd.MultiIndex.from_product( 
    [
        ['1班',  '2班'],
        ['张三', '李四', '王五']
    ]
)

columns = [
    ['期中', '期中', '期中', '期末', '期末', '期末'],
    ['语文', '数学', '英语', '语文', '数学', '英语']
]

df = pd.DataFrame(data=data, index=index, columns=columns)
df
```

##### 2. 创建多层列索引(同行索引)

除了行索引index，列索引columns也能用同样的方法创建多层索引

##### 3. 多层索引对象的索引与切片操作

###### 1）Series的操作

【重要】对于Series来说，直接中括号[]与使用.loc()完全一样

```python
# (1) 索引
data = np.random.randint(0, 100, size=6)

index = [
    ['1班', '1班', '1班', '2班', '2班', '2班'],
    ['张三', '李四', '王五', '赵六', '田七', '孙八']
]

s  = pd.Series(data=data, index=index)
s

# 显式索引
s['1班']
s.loc['1班']

s.loc[['1班']]
s.loc[['1班', '2班']]

s['1班']['张三']
s.loc['1班']['张三']
s.loc['1班','张三']
s['1班', '张三']

#隐式索引
s[1]
s.iloc[1]
s.iloc[[3, 2]]


# (2) 切片
# 显式切片
s['1班': '1班']
s.loc['1班': '2班']
# s.loc['李四': '田七']  # 没有结果
# s.loc[('1班', '李四'): ('2班', '田七')]   # 报错， 显式切片只对最外层索引有效

# 建议使用隐式切片
s[1: 4]
s.iloc[1: 5]
```

###### 2）DataFrame的操作

- 可以直接使用列名称来进行列索引
- 使用行索引需要用iloc()，loc()等函数 
- 无法直接对二级索引进行索引

```python
data = np.random.randint(0, 100, size=(6, 6))

index = pd.MultiIndex.from_product( 
    [
        ['1班',  '2班'],
        ['张三', '李四', '王五']
    ]
)
columns = [
    ['期中', '期中', '期中', '期末', '期末', '期末'],
    ['语文', '数学', '英语', '语文', '数学', '英语']
]
df = pd.DataFrame(data=data, index=index, columns=columns)


# 获取元素
df['期中']['数学'][1]

df.iloc[1, 3]  # 第1行，第3列（索引）  42
df.loc[('1班', '李四'), ('期末', '语文')]  # 42

# 列索引
df['期中']
df['期中']['数学']
df['期中', '数学']
# df[('期中', '数学')]
# df.期中.数学

df.iloc[:, 2]
df.iloc[:, [1,2,3]]

# 行索引
df.loc['1班']
df.loc['1班'].loc['张三']
df.loc['1班', '张三']
df.loc[('1班', '张三')]

df.iloc[1]
df.iloc[[1]]
df.iloc[[1,2,3]]

# 切片
# 行切片
df.iloc[1:5]
df.loc['1班' : '2班']
df.loc[('1班', '李四') : ('2班', '李四')]

# 列切片
df.iloc[:, 1: 5]
df.loc[:, '期中': '期末']
# df.loc[:, ('期中', '数学'): ('期末', '数学')]  # 报错
```

##### 4. 索引的堆叠（stack）

- stack()
- unstack()

【小技巧】使用stack()的时候，level等于哪一个，哪一个就消失，出现在行里。

```python
data = np.random.randint(0, 100, size=(6, 6))
index = pd.MultiIndex.from_product( 
    [
        ['1班',  '2班'],
        ['张三', '李四', '王五']
    ]
)
columns = [
    ['期中', '期中', '期中', '期末', '期末', '期末'],
    ['语文', '数学', '英语', '语文', '数学', '英语']
]
df = pd.DataFrame(data=data, index=index, columns=columns)

# stack: 列索引变成行索引
df.stack()  # 默认level=-1 (倒数第一层)，将最里层的列索引 变成行索引
df.stack(level=1) 

df.stack(level=0)  # 将最外层的列索引 变成行索引
```

【小技巧】使用unstack()的时候，level等于哪一个，哪一个就消失，出现在列里。

```python
# unstack : 将行索引 变成 列索引
df.unstack()
df.unstack(level=1)

df.unstack(level=0)
```

使用fill_value填充

```python
data = np.random.randint(0, 100, size=(6, 6))
index = pd.MultiIndex.from_tuples( 
    (
        ('1班', '张三'), ('1班', '李四'), ('1班', '王五'), 
        ('2班', '赵六'), ('2班', '田七'), ('2班', '孙八'), 
    )
)
columns = [
    ['期中', '期中', '期中', '期末', '期末', '期末'],
    ['语文', '数学', '英语', '语文', '数学', '英语']
]
df2 = pd.DataFrame(data=data, index=index, columns=columns)

df2.unstack()
df2.unstack(fill_value=0)
```

##### 5. 聚合操作

【注意】

- 需要指定axis
- 【小技巧】和unstack()相反，聚合的时候，axis等于哪一个，哪一个就保留。

```python
data = np.random.randint(0, 100, size=(6, 6))
index = pd.MultiIndex.from_tuples( 
    (
        ('1班', '张三'), ('1班', '李四'), ('1班', '王五'), 
        ('2班', '赵六'), ('2班', '田七'), ('2班', '孙八'), 
    )
)
columns = [
    ['期中', '期中', '期中', '期末', '期末', '期末'],
    ['语文', '数学', '英语', '语文', '数学', '英语']
]
df2 = pd.DataFrame(data=data, index=index, columns=columns)


# DataFrame聚合操作：求和，平均值，最大值，最小值....
df3 = df.loc['1班', '期中']

# axis : 0表式行index, 1表式列columns
df3.sum()
df3.sum(axis=0)  # 对同一列的多行进行求和
df3.sum(axis=1)  # 对同一行的多列进行求和


# 多层索引聚合操作
df.sum()  #  默认是对同一列的多行求和
df.sum(axis=1)   # 对同一行的多列求和
df.sum(axis=0, level=0)   # 表式 行 索引中的最外层
df.sum(axis=1, level=0)   # 表式 列 索引中的最外层
df.sum(axis=0, level=1)   # 表式 行 索引中的最里层
df.sum(axis=1, level=1)   # 表式 列 索引中的最里层
```



#### 五、Pandas数据合并

- pd.concat
- pd.append
- pd.merge 

为了方便，我们首先定义一个生成DataFrame的函数：

```python
def make_df(indexs, columns):    
    data = [[str(j)+str(i) for j in columns] for i in indexs]
    df = pd.DataFrame(data=data, index=indexs, columns=columns)
    return df
  
# 调用
# make_df([1, 2, 3, 4], list('ABCD'))
```

##### 1. 使用pd.concat()级联

Pandas使用pd.concat函数，与NumPy中的concatenate函数类似，只是多了一些参数：

###### 1) 简单级联

```python
df1 = make_df([1, 2], ['A', 'B'])
df2 = make_df([3, 4], ['A', 'B'])
display(df1, df2)

# 上下合并，垂直合并
pd.concat([df1, df2])  

# 左右合并，水平合并
pd.concat([df1, df2], axis=1) 

# 忽略行索引，重置行索引
pd.concat([df1, df2], ignore_index=True)  

# 使用多层索引 keys
pd.concat([df1, df2], keys=['x', 'y'])    
# pd.concat([df1, df2], keys=['x', 'y'], axis=1)    
```

###### 2) 不匹配级联

不匹配指的是级联的维度的索引不一致。例如纵向级联时列索引不一致，横向级联时行索引不一致

```python
df3 = make_df([1, 2, 3, 4], ['A', 'B', 'C', 'D'])
df4 = make_df([2, 3, 4, 5], ['B', 'C', 'D', 'E'])
display(df3, df4)

# 对应索引没有值的会自动用NaN填充
pd.concat([df3, df4])

# 外连接：补NaN（默认模式）, 默认值outer，类似并集， 所有数据都会显示
pd.concat([df3, df4])
pd.concat([df3, df4], join='outer')

# 内连接：只连接匹配的项, 交集， 只显示共同的列或行
pd.concat([df3, df4], join='inner')
```

##### 2. 使用append()函数添加

由于在后面级联的使用非常普遍，因此有一个函数append专门用于在后面添加

```python
df3 = make_df([1, 2, 3, 4], ['A', 'B', 'C', 'D'])
df4 = make_df([2, 3, 4, 5], ['B', 'C', 'D', 'E'])
display(df3, df4)

df3.append(df4, sort=True)
```

##### 3.使用merge()合并

- 类似MySQL中表和表之间的合并 
- merge与concat的区别在于，merge需要依据某一共同的行或列来进行合并
- 使用pd.merge()合并时，会自动根据两者相同column名称的那一列，作为key来进行合并。
- 每一列元素的顺序不要求一致

###### 1) 一对一合并

```python
df1 = pd.DataFrame({
    'name': ['张三', '李四', '王五'],
    'id' : [1, 2, 3],
    'age': [22, 33, 44]
})
df2 = pd.DataFrame({
    'id' : [2, 3, 4],
    'sex': ['男', '女', '女'],
    'job': ['saler', 'CTO', 'Programer']
})
display(df1, df2)

# 合并
# pd.merge(df1, df2)
df1.merge(df2)
```

###### 2) 多对一合并

```python
df1 = pd.DataFrame({
    'name': ['张三', '李四', '王五'],
    'id' : [1, 2, 2],
    'age': [22, 33, 44]
})
df2 = pd.DataFrame({
    'id' : [2, 3, 4],
    'sex': ['男', '女', '女'],
    'job': ['saler', 'CTO', 'Programer']
})
display(df1, df2)

# 合并
df1.merge(df2)
```

###### 3) 多对多合并

```python
df1 = pd.DataFrame({
    'name': ['张三', '李四', '王五'],
    'id' : [1, 2, 2],
    'age': [22, 33, 44]
})
df2 = pd.DataFrame({
    'id' : [2, 2, 4],
    'sex': ['男', '女', '女'],
    'job': ['saler', 'CTO', 'Programer']
})
display(df1, df2)

# 合并
df1.merge(df2)
```

###### 4) key的规范化

- 使用on=显式指定哪一列为key,当有多个key相同时使用

```python
df1 = pd.DataFrame({
    'name': ['张三', '李四', '王五'],
    'id' : [1, 2, 3],
    'age': [22, 33, 44]
})
df2 = pd.DataFrame({
    'id' : [2, 3, 4],
    'name': ['李四', '王五', '赵六'],
    'job': ['saler', 'CTO', 'Programer']
})
display(df1, df2)

# 如果有多列名称相同， 则需要指定一列作为连接的字段
df1.merge(df2, on='id')
df1.merge(df2, on='name')
```

- 使用left_on和right_on指定左右两边的列作为key，当左右两边的key都不想等时使用

```python
# 如果没有相同的列名，则需要使用left_on和right_on来分别指定2个表的列作为连接的字段
df1.merge(df2, left_on='id', right_on='id2')
```

- 当左边的列和右边的index相同的时候,使用right_index=True

```python
df1.merge(df2, left_index=True, right_on='id2')
```

###### 5) 内合并与外合并

- 内合并：只保留两者都有的key（默认模式）

```python
df1 = pd.DataFrame({
    'name': ['张三', '李四', '王五'],
    'id' : [1, 2, 3],
    'age': [22, 33, 44]
})
df2 = pd.DataFrame({
    'id' : [2, 3, 4],
    'sex': ['男', '女', '女'],
    'job': ['saler', 'CTO', 'Programer']
})
display(df1, df2)

# 内连接： inner join
df1.merge(df2)
df1.merge(df2, how='inner')
```

- 外合并 how='outer'：补NaN

```python
# 外连接: 
df1.merge(df2, how='outer')
```

- 左合并、右合并：how='left'，how='right'

```python
# 左连接: 
df1.merge(df2, how='left')

# 右连接: 
df1.merge(df2, how='right')
```

###### 6) 添加后缀

- 当列冲突时，即有多个列名称相同时，需要使用on=来指定哪一个列作为key，配合suffixes指定冲突列名
- 可以使用suffixes=自己指定后缀

```python
df1 = pd.DataFrame({
    'name': ['张三', '李四', '王五'],
    'id' : [1, 2, 3],
    'age': [22, 33, 44]
})
df2 = pd.DataFrame({
    'id' : [2, 3, 4],
    'name': ['李四', '王五', '赵六'],
    'job': ['saler', 'CTO', 'Programer']
})
display(df1, df2)

df1.merge(df2, on='id', suffixes=['_表1', '_表2'])
```

###### merge合并总结:

- 合并有三种现象: 一对一, 多对一, 多对多.
- 合并默认会找相同的列名进行合并, 如果有多个列名相同,用on来指定.
- 如果没有列名相同,但是数据又相同,可以通过left_on, right_on来分别指定要合并的列.
- 如果想和index合并, 使用left_index, right_index来指定.
- 如果多个列相同,合并之后可以通过suffixes来区分.
- 还可以通过how来控制合并的结果, 默认是内合并, 还有外合并outer, 左合并left, 右合并right.



#### 六、Pandas缺失值处理

有两种缺失值(空值)：

- None
- np.nan

##### 1. None

- None是Python自带的，是Python中的空对象。None不能参与到任何计算中。

- object类型的运算要比int类型的运算慢得多 


```python
# 计算不同数据类型求和时间
%timeit np.arange(1e5, dtype=object).sum()
# 6.1 ms ± 122 µs per loop (mean ± std. dev. of 7 runs, 100 loops each)

%timeit np.arange(1e5, dtype=np.int32).sum()
# 134 µs ± 7.16 µs per loop (mean ± std. dev. of 7 runs, 10000 loops each)
```

##### 2. np.nan（NaN）

- np.nan是浮点类型，能参与到计算中。但计算的结果总是NaN。

```python
type(np.nan)
# float
```

- 但可以使用np.nan*()函数来计算nan，此时会过滤掉nan。

```python
n = np.array([1, 2, 3, np.nan, 5, 6])

# np.sum(n)  # nan
np.nansum(n)

np.nan + 10
```

##### 3. pandas中的None与NaN

###### 1) pandas中None与np.nan都视作np.nan

- 创建DataFrame

```python
data = np.random.randint(0 ,100, size=(5, 5))
df = pd.DataFrame(data=data, columns=list('ABCDE'))

# 修改数据,增加2种nan
df.loc[2, 'B'] = np.nan
df.loc[3, 'C'] = None
display(df)

# 查看结果
df.loc[2, 'B']  # nan
df.loc[3, 'C']  # nan
```

###### 2) pandas中None与np.nan的操作

- isnull()
- notnull()
- all()
- any()
- dropna():  过滤丢失数据
- fillna():  填充丢失数据

(1)判断函数

- isnull()
- notnull()

```python
# isnull
df.isnull()

# notnull
df.notnull()

# all(): 必须全部为True才为True， 类似and
# any(): 只要有一个为True即为True,  类似or

df.isnull().any()  # 常用， 尽可能找到所有的空值
# df.isnull().all()

df.notnull().all()  # 常用，尽可能找到所有的空值
# df.notnull().any()

df.isnull().any(axis=1)  # axis=1 表式列，判断一行中的每一列数据进行判断
df.notnull().all(axis=1)
```

- 使用bool值索引过滤数据

```python
# 行过滤
# 将df中有空的列过滤掉
cond = df.isnull().any(axis=1)
# display(cond, ~cond)
# ~ 取反
df[~cond]

cond = df.notnull().all(axis=1)
# cond
df[cond]

# 列过滤
cond = df.notnull().all()
# cond
df.loc[:, cond]

cond = df.isnull().any()
# cond
df.loc[:, ~cond]
```

(2) 过滤函数

- `dropna()`

可以选择过滤的是行还是列（默认为行）

```python
df.dropna()  # 默认是删除有空的行
df.dropna(axis=1)  # 删除有空的列
```

也可以选择过滤的方式 how = 'all'

```python
df.dropna(how='any')  # 默认值，默认有空就会删除
df.dropna(how='all', axis=1)  # 所有的值都为空（整行或整列为空），才删除
```

inplace=True 修改原数据

```python
df2 = df.copy()

# inplace=True: 表式修改原数据
df2.dropna(inplace=True)
df2
```

(3) 填充函数 Series/DataFrame

- `fillna()`

```python
# 填充
df.fillna(value=100)

df2 = df.copy()
df2.loc[1, 'B'] = np.nan
df2.loc[4, 'C'] = None
display(df2)

# limit: 限制对应维度上填充的次数
df2.fillna(value=100, limit=1, inplace=True)

# 可以选择前向填充还是后向填充
# method : {'backfill', 'bfill', 'pad', 'ffill', None}, default None
#     Method to use for filling holes in reindexed Series
#     pad/ffill: propagate last valid observation forward to next valid
#     backfill/bfill: use next valid observation to fill gap.

df.fillna(method='ffill')  # 用上面数据来填充自己
# df.fillna(method='pad')

df.fillna(method='bfill')  # 用下面数据来填充自己
# df.fillna(method='backfill')

df.fillna(method='ffill', axis=1)  # 用左边数据来填充自己

df.fillna(method='bfill', axis=1)  # 用右边数据来填充自己
```



#### 七、Pandas处理重复值和异常值

```python
def make_df(indexs, columns):    
    data = [[str(j)+str(i) for j in columns] for i in indexs]
    df = pd.DataFrame(data=data, index=indexs, columns=columns)
    return df
  
# make_df([1, 2, 3, 4], ['A', 'B', 'C', 'D'])
```

##### 1. 删除重复行

- 使用duplicated()函数检测重复的行，返回元素为布尔类型的Series对象
- 每个元素对应一行，如果该行不是第一次出现，则元素为True

```python
# 让第一行和第二行重复
df.loc[1] = df.loc[2]

# 判断是否和前面的行重复了
df.duplicated()

# df.duplicated(keep='first')  # 保留第一行
# df.duplicated(keep='last')  # 保留最后一行
# df.duplicated(keep=False)  # 标记所有重复行

df.loc[1, 'D'] = 'DDD'
# subset: 子集， 只需要子集相同就可以判断重复
df.duplicated(subset=['A', 'B', 'C'])
```

使用drop_duplicates()函数删除重复的行

```python
df.drop_duplicates(subset=['A', 'B', 'C'])
df.drop_duplicates(subset=['A', 'B', 'C'], keep='last')
```

##### 2. 映射

映射的含义：创建一个映射关系列表，把values元素和一个特定的标签或者字符串绑定

包含三种操作：

- replace()函数：替换元素
- map()函数：处理某一单独的列, 最重要
- rename()函数：替换索引

###### 1) replace()函数：替换元素

使用replace()函数，对values进行替换操作

```python
index = ['鲁班', '张三丰', '张无忌', '杜甫', '李白']
columns = ['Python', 'Java', 'H5', 'Pandas']
data = np.random.randint(0, 100, size=(5, 4))

df = pd.DataFrame(data=data, index=index, columns=columns)

# replace还经常用来替换NaN元素
df.replace({1: 100})
```

###### 2) map()函数: 适合处理某一单独的列

```python
df2 = df.copy()
df2

# map是Series调用，不能使用DataFrame调用
df2['Python'].map({12: 100, 11: 90})

# map()函数中可以使用lambda函数
# 新建一列
df2['NumPy'] = df2['Python'].map(lambda x: x+100)
df2

# 新增一列：判断java成绩是否及格
df2['是否及格'] = df2['Java'].map(lambda n:  "及格" if n>=60 else "不及格")
df2

# 新增一列：判断Java成绩的等级（>=80优秀，>=60及格，<60不及格）
def fn(n):
    if n >= 80:
        return '优秀'
    elif n >= 60:
        return '及格'
    return '不及格'

df2['等级'] = df2['Java'].map(fn)
df2
```

###### 3) rename()函数：替换索引

```python
df3 = df.copy()
df3

# 更改索引名称
df3.rename({'鲁班': "Mr Lu"})  # 默认更改行索引
df3.rename({'Python': 'PYTHON'}, axis=1)  # 更改列索引

df3.rename(index={'鲁班': "Mr Lu"})  # 更改行索引
df3.rename(columns={'Python': 'PYTHON'})  # 更改列索引
```

###### 4) apply()函数：既支持 Series，也支持 DataFrame

```python
df = pd.DataFrame(data=np.random.randint(0, 10, size=(5,3)),
                  index=list('ABCDE'),
                  columns=['Python', 'NumPy', 'Pandas'])

# 用于Series，其中x是Series中元素
df['Python'].apply(lambda x:True if x >5 else False) 

# 用于DataFrame，其中的x是DataFrame中列或者行，是Series
df.apply(lambda x : x.median(), axis=0)  # 列的中位数
df.apply(lambda x : x.median(), axis=1)  # 行的中位数

# 自定义方法
def convert(x): 
    return (np.round(x.mean(), 1), x.count())
df.apply(convert, axis=1)  # 行平均值，计数

# applymap: DataFrame专有, 其中的x是DataFrame中每个元素
df.applymap(lambda x : x + 100) # 计算DataFrame中每个元素
```

###### 5) transform()函数

```python
df = pd.DataFrame(data=np.random.randint(0, 10, size=(10,3)),
                  index=list('ABCDEFHIJK'),
                  columns=['Python', 'NumPy', 'Pandas'])
                  
# 1、一列执行多项计算
df['Python'].transform([np.sqrt, np.exp]) # Series处理

# 2、多列执行不同计算
def convert(x):
    if x.mean() > 5:
        x *= 10
    else:
        x *= -10
    return x

df.transform({'Python':convert,'NumPy':np.max,'Pandas':np.min}) 
```

##### 3. 异常值检测和过滤

- describe(): 查看每一列的描述性统计量

```python
# 查看每一列的描述性统计
df.describe()
df.describe([0.3, 0.4, 0.5, 0.9, 0.99])  # 指定百分位数
df.describe([0.3, 0.4, 0.5, 0.9, 0.99]).T  # 转置，行和列转换，在列比较多的情况下使用
```

- df.std() : 可以求得DataFrame对象每一列的标准差

```python
df.std()
```

- df.drop(): 删除特定索引 

```python
df4 = df.copy()
df4

df4.drop('鲁班')  # 默认删除行
df4.drop('Java', axis=1)  # 删除列

df4.drop(index='鲁班')  # 删除行
df4.drop(columns='H5')  # 删除列

df4.drop(columns=['Java', 'Pandas'])  # 同时删除多列
```

- unique() : 唯一,去重

```python
index = ['鲁班', '张三丰', '张无忌', '杜甫', '李白']
columns = ['Python', 'Java', 'H5', 'Pandas']
data = np.random.randint(0, 10, size=(5, 4))

df = pd.DataFrame(data=data, index=index, columns=columns)
df

# unique() : 要用于Series, 不能用于DataFrame
df['Python'].unique()
```

- query() : 按条件查询

```python
# ==, >, <, 
# in
# and &
# or  |

df.query('Python == 5')
df.query('Python > 5')

df.query('Python==5 and Java==5')
df.query('Python==5 & Java==5')
df.query('Python==5 or Java==6')
df.query('Python==5 | Java==6')

# 使用变量
n = 5
df.query('Python > @n')  # @n 使用变量
df.query('Python in [3, 4, 5, 6]')
m = [3, 4, 5, 6]
df.query('Python in @m')
```

- df.sort_values(): 根据值排序

- df.sort_index(): 根据索引排序

```python
index = ['鲁班', '张三丰', '张无忌', '杜甫', '李白']
columns = ['Python', 'Java', 'H5', 'Pandas']
data = np.random.randint(0, 100, size=(5, 4))

df = pd.DataFrame(data=data, index=index, columns=columns)
df

df.sort_values('Python')  # 默认按照列名排序，默认升序
df.sort_values('Python', ascending=False)    # 降序
df.sort_values('鲁班', axis=1)  

# 按照行索引或列索引排序
df.sort_index(ascending=True, axis=1)
```

- df.info(): 查看数据信息

```python
df.info()
```

练习:

新建一个形状为10000*3的标准正态分布的DataFrame，去除掉所有满足以下情况的行：

- 其中任一元素绝对值大于3倍标准差

```python
df = pd.DataFrame(np.random.randn(10000, 3))
df.head()

# 标准差
df.std()
# 绝对值
df.abs()

# cond: 找到大于3倍标准差的值
cond = df.abs() > df.std() * 3
# cond.sum()
cond

# 找到有True（大于3倍标准差的值）的行
cond2 = cond.any(axis=1)
cond2

# 去除大于3倍标准差的值，取不满足大于3倍标准差的值
df.loc[~cond2]
```

##### 4. 抽样

- 使用.take()函数排序

- 可以借助np.random.permutation()函数随机排序

```python
# 使用前面的df2
df2.take([4, 1, 2, 3, 0])   # 行排列
df2.take([1, 0, 2, 3, 4, 5, 6], axis=1)  # 列排列

# 随机排序
np.random.permutation([0, 1, 2, 3, 4, 5])

# 无放回抽样：依次拿取，没有重复值
df2.take(np.random.permutation([0, 1, 2, 3, 4]))

# 有放回抽样： 可能出现重复值
# 当DataFrame规模足够大时，直接使用np.random.randint()函数，就配合take()函数实现随机抽样
np.random.randint(0, 10, size=10)
df2.take(np.random.randint(0, 5, size=5))
```



#### 八、Pandas数学函数

- 聚合函数

```python
df = pd.DataFrame(data=np.random.randint(0,100,size = (20,3)))

df.count() # 非空值的数量
df.max() # 最大值，axis=0/1
df.min() # 最小值, axis=0/1
df.median() # 中位数
df.sum() # 求和
df.mean(axis=1) # 每一行的平均值

df[0].value_counts() # 统计元素出现次数
df.cumsum() # 累加
df.cumprod() # 累乘

# 方差: 当数据分布比较分散（即数据在平均数附近波动较大）时，各个数据与平均数的差的平方和较大，方差就较大；当数据分布比较集中时，各个数据与平均数的差的平方和较小。因此方差越大，数据的波动越大；方差越小，数据的波动就越小
df.var() # 方差

# 标准差 = 方差的算术平方根
df.std() # 标准差
```

- 其他数学函数
  - 协方差
        - 两组数值中每对变量的偏差乘积的平均值 
        - 协方差>0 : 表式两组变量正相关
             - 如果两个变量的变化趋势一致，也就是说如果其中一个大于自身的期望值时另外一个也大于自身的期望值，那么两个变量之间的协方差就是正值；
        - 协方差<0 : 表式两组变量负相关
            - 如果两个变量的变化趋势相反，即其中一个变量大于自身的期望值时另外一个却小于自身的期望值，那么两个变量之间的协方差就是负值。
        - 协方差=0 : 表式两组变量不相关
     - 相关系数
           - 相关系数r = X与Y的协方差 / (X的标准差 * Y的标准差)
           - 相关系数值的范围在-1和+1之间
           - r＞0为正相关，r＜0为负相关。r＝0表示不相关
           - r 的绝对值越大，相关程度越高
           - 两个变量之间的相关程度，一般划分为四级：
               - 如两者呈正相关，r呈正值，r=1时为完全正相关；
               - 如两者呈负相关则r呈负值，而r=-1时为完全负相关，完全正相关或负相关时，所有图点都在直线回归线上；点分布在直线回归线上下越离散，r的绝对值越小。
               - 相关系数的绝对值越接近1，相关越密切；越接近于0，相关越不密切。
               - 当r=0时，说明X和Y两个变量之间无直线关系。
               - 通常｜r｜大于0.8时，认为两个变量有很强的线性相关性。

```python
# 协方差
#   两组数值中每对变量的偏差乘积的平均值

df.cov() 
df[0].cov(df[1])  # 第0列 和 第1列的协方差

# 相关系数 = X与Y的协方差 / (X的标准差 * Y的标准差)
df.corr() # 所有属性相关性系数
df.corrwith(df[2]) # 单一属性相关性系数
```

协方差： $Cov(X,Y) = \frac{\sum\limits_1^n(X_i - \overline{X})(Y_i - \overline{Y})}{n-1}$

相关性系数：$r(X,Y) = \frac{Cov(X,Y)}{\sqrt{Var[X]*Var[Y]}}$



#### 九、 数据分组聚合

数据聚合是数据处理的最后一步，通常是要使每一个数组生成一个单一的数值。

##### 分组

数据聚合处理：

- 分组：先把数据分为几组
- 用函数处理：为不同组的数据应用不同的函数以转换数据
- 合并：把不同组得到的结果合并起来

数据分类处理的核心： groupby()函数

```python
# 创建DataFrame
df = pd.DataFrame(
    {
        'color': ['green', 'green', 'yellow', 'blue', 'blue', 'yellow', 'yellow'],
        'price': [4, 5, 3, 2, 7, 8, 9]
    }
)
df

# 使用.groups属性查看各行的分组情况：
# 根据color进行分组
df.groupby(by='color')
df.groupby(by='color').groups

# 分组 + 聚合
df.groupby(by='color').sum()
```

##### 分组聚合练习：

假设菜市场张大妈在卖菜，有以下属性：

- 菜品(item)：萝卜，白菜，辣椒，冬瓜

- 颜色(color)：白，青，红

- 重量(weight)

- 价格(price)

1. 要求以属性作为列索引，新建一个ddd
2. 对ddd进行聚合操作，求出颜色为白色的价格总和
3. 对ddd进行聚合操作，求出萝卜的所有重量以及平均价格
4. 使用merge合并总重量及平均价格

```python
ddd = pd.DataFrame(
    data={
        "item": ["萝卜","白菜","辣椒","冬瓜","萝卜","白菜","辣椒","冬瓜"],
        'color':["白","青","红","白","青","红","白","青"],
        'weight': [10,20,10,10,30,40,50,60],
        'price': [0.99, 1.99, 2.99, 3.99, 4, 5, 6,7]
    }
)
ddd

# 2. 对ddd进行聚合操作，求出颜色为白色的价格总和
ddd.groupby('color')['price'].sum()  # Series
ddd.groupby('color')[['price']].sum()  # DataFrame
ddd.groupby('color')[['price']].sum() .loc[['白']]

# 3. 对ddd进行聚合操作，求出萝卜的所有重量以及平均价格
df1 = ddd.groupby('item')[['weight']].sum()
df2= ddd.groupby('item')[['price']].mean()

# 4.使用merge合并总重量及平均价格
# display(df1, df2)
df1.merge(df2, left_index=True, right_index=True)
```



#### 十、Pandas加载数据

##### csv数据

```python
data = np.random.randint(0,50,size=(10,5))
df = pd.DataFrame(data=data, columns=['Python','Java','Go','C','JS'])


# 保存到csv
df.to_csv('data.csv',
          sep=',',  # 文本分隔符，默认是逗号
          header=True, # 是否保存列索引
          # 是否保存行索引，保存行索引，文件被加载时，默认行索引会作为一列
          index=True)  
         
# 加载csv数据
pd.read_csv('data.csv',
            sep=',', # 默认是逗号
            header=[0], # 指定列索引
            index_col=0)  # 指定行索引

pd.read_table('data.csv', # 和read_csv类似，读取限定分隔符的文本文件
            sep=',',
            header=[0], # 指定列索引
            index_col=0  # 指定行索引
             ) 
```

##### excel数据

```python
data = np.random.randint(0, 50, size=(10,5))
df = pd.pDataFrame(data=data, columns=['Python','Java','Go','C','JS'])

# 保存到excel文件
df.to_excel('data.xls',
            sheet_name='sheet1',# Excel中工作表的名字
            header=True, # 是否保存列索引
            index=False) # 是否保存行索引

# 读取excel
pd.read_excel('data.xls',
              sheet_name=0, # 读取哪一个Excel中工作表，默认第一个, 也可以写工作表名称
              header=0, # 使用第一行数据作为列索引
              names=list('ABCDE'), # 替换行索引
              index_col=1) # 指定行索引，B作为行索引
```

##### MySQL数据

- 需要安装pymysql
  - pip install pymysql -i https://pypi.tuna.tsinghua.edu.cn/simple
- 需要安装sqlalchemy: 
  - pip install sqlalchemy -i https://pypi.tuna.tsinghua.edu.cn/simple
  - sqlalchemy是Python语言下的数据库引擎库, 在Django/Flask中常用ORM库

```python
from sqlalchemy import create_engine

data = np.random.randint(0,150,size=(150,3))
df = pd.DataFrame(data=data, columns=['Python','Pandas','PyTorch'])

# 数据库连接
# root: MySQL用户名
# 123456: MySQL密码
# localhost: 本机
# db: 数据库名(提前创建)
conn = create_engine('mysql+pymysql://root:123456@localhost/db')

# 保存到MySQL
df.to_sql('score', # 表名(会自动创建表)
          conn, # 数据库连接
          index=False,  # 是否保存行索引
          if_exists='append') # 如果表名存在，追加数据

# 从MySQL中加载数据
pd.read_sql('select * from score', # sql查询语句
            conn, # 数据库连接
            index_col='Python') # 指定行索引名
```

#### 十一、Pandas分箱操作

- 分箱操作就是将连续型数据离散化。
- 分箱操作分为等距分箱和等频分箱。 

```python
data = np.random.randint(0,150,size=(150,3))
df = pd.DataFrame(data=data, columns=['Python','Pandas','PyTorch'])

# 对Python列进行分箱
df.Python.values

# 1、等宽分箱
pd.cut(df.Python, bins=4)

# 指定宽度分箱
pd.cut(df.Python, # 分箱数据
       bins=[0, 30, 60, 80, 100], # 分箱断点
       right=False, # 左闭右开
       labels=['D','C','B','A']) # 分箱后分类标签

# 2、等频分箱
pd.qcut(df.Python, # 分箱数据
        q=4, # 4等份
        labels=['差', '中', '良', '优']) # 分箱后分类标签
```

#### 十二、Pandas绘图

- Series和DataFrame都有一个用于生成各类图表的plot方法
- Pandas的绘图是基于Matplotlib， 可以快速实现基本图形的绘制，复杂的图形还是需要用Matplotlib

常见可视化图形:

- 折线图
- 条形图/柱形图
- 饼图
- 散点图
- 箱型图
- 面积图
- 直方图

##### 1、折线图

```python
# 折线图
# Series画图
s = pd.Series([100, 200, 300, 200, 150, 400, 250])
s.plot()

# sin曲线：正弦曲线
x = np.arange(0, 2*np.pi, 0.1)
y = np.sin(x)
s = pd.Series(data=y, index=x)
s.plot()

# DataFrame画图
data = np.random.randint(50, 100, size=(5, 6))
index = ['1st', '2nd', '3th', '4th', '5th']
columns = ['Jeff', 'Jack', 'Rose', 'Lucy', 'Lily', 'Bob']
df = pd.DataFrame(data=data, index=index, columns=columns)
df.plot()  # 一列一根线
```

##### 2、条形图/柱形图

```python
# 条形图/柱形图
df = pd.DataFrame(data=np.random.rand(10,4))
df.plot.bar(stacked=True) # stacked 是否堆叠

# Series画图
# 可以使用plot中的kind属性来绘制不同图形
s = pd.Series(data=[100, 110, 130, 200])
s.index = ['Jeff', "千锋", 'Python', 'Rose']
s.plot(kind='bar')   # 柱状图
# 或
s.plot(kind='barh')   # 条形图
# kind:
#     - 'line' : line plot (default)
#     - 'bar' : vertical bar plot
#     - 'barh' : horizontal bar plot
#     - 'hist' : histogram
#     - 'box' : boxplot
#     - 'kde' : Kernel Density Estimation plot
#     - 'density' : same as 'kde'
#     - 'area' : area plot
#     - 'pie' : pie plot
#     - 'scatter' : scatter plot
#     - 'hexbin' : hexbin plot.

# DataFrame画图
data = np.random.randint(0, 100, size=(4, 3))
index = list('ABCD')
columns = ['Python', 'C', 'Java']

df = pd.DataFrame(data=data, index=index, columns=columns)
df.plot(kind='bar')
# 或
df.plot(kind='barh')
```

##### 3、饼图

```python
# 饼图
df = pd.DataFrame(data=np.random.rand(4,2),
                   index=list('ABCD'),
                   columns=['Python','Java'])

# subplots=True 子图:同时画多个图
# autopct='%.1f%%' 显示占比,保留1位小数
df.plot.pie(subplots=True, figsize=(8,8), autopct='%.1f%%')
```

##### 4、散点图

- 散点图是观察两个一维数据数列之间的关系的有效方法,DataFrame对象可用

```python
# 散点图
data = np.random.normal(size=(1000, 2))
df = pd.DataFrame(data=data, columns=list('AB'))
df.head()

# scatter： 散点图
# x='A'  ：使用A列作为x轴
# y='B'  ：使用B列作为y轴
df.plot(kind='scatter', x='A', y='B')
# 或
df.plot.scatter(x='A', y='B')  # A和B关系绘制
```

#####  5、面积图

```python
# 面积图
df = pd.DataFrame(data=np.random.rand(10, 4), columns=list('ABCD'))
df.plot.area(stacked=True)  # stacked 是否堆叠
```

##### 6、箱型图

```python
# 箱型图
df = pd.DataFrame(data=np.random.rand(10, 5), columns=list('ABCDE'))
df.plot.box()
# 或
df.plot(kind='box')
```

##### 7、直方图

```python
# 直方图
df = pd.DataFrame({'A': np.random.randn(1000) + 1, 
                    'B': np.random.randn(1000),
                    'C': np.random.randn(1000) - 1})
df.plot.hist(alpha=0.5) # 带透明度直方图
df.plot.hist(stacked=True)  # 堆叠图
# 或
df['A'].plot(kind='hist')
df.plot(kind='hist')
```

