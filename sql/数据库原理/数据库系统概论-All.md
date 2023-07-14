*   [相关pdf下载：密码7281](https://url18.ctfile.com/f/22722418-803434693-77fa8b)

其他科目导航

*   [【专栏必读】王道考研408操作系统万字笔记（有了它不需要你再做笔记了）：各章节内容概述导航和思维导图](https://blog.csdn.net/qq_39183034/article/details/121004242)
*   [【专栏必读】王道考研408数据结构万字笔记（有了它不需要你再做笔记了）：各章节内容概述导航和思维导图](https://blog.csdn.net/qq_39183034/article/details/121501138?spm=1001.2014.3001.5501)
*   [【专栏必读】王道考研408计算机组成原理万字笔记（从学生角度辅助大家理解）：各章节导航及思维导图](https://zhangxing-tech.blog.csdn.net/article/details/120664162?spm=1001.2014.3001.5502)
*   [【README】Linux系统编程必读：本专栏内容提要以及系统调用接口总结](https://zhangxing-tech.blog.csdn.net/article/details/116207393)
*   [C++学习](https://blog.csdn.net/qq_39183034/category_10813323.html?spm=1001.2014.3001.5482)
*   [Java教程](https://zhangxing-tech.blog.csdn.net/article/details/127306871?spm=1001.2014.3001.5502)
*   [【免费分享】软件工程核心知识点](https://blog.csdn.net/qq_39183034/category_11563929.html?spm=1001.2014.3001.5482)

[数据库系统概论第五版](https://so.csdn.net/so/search?q=%E6%95%B0%E6%8D%AE%E5%BA%93%E7%B3%BB%E7%BB%9F%E6%A6%82%E8%AE%BA%E7%AC%AC%E4%BA%94%E7%89%88&spm=1001.2101.3001.7020)（王珊）学习笔记分享

*   本专栏笔记全部纯手打，以 **《数据系统概论》（第五版，王珊著）内容为准**  
    ![](https://img-blog.csdnimg.cn/222d79e886564b08b83cb96419ea4e83.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_11,color_FFFFFF,t_70,g_se,x_16)
    
*   **内容为第1章~第11章，即本科生必学章节**。后续更新看自己的时间和文章阅读量高低，如果可以的话会加入研究生选学内容
    
*   注意**第八章数据库编程**属于了解性内容，不是特别好整理，所以暂时忽略
    
*   （更新）**第十二章MySQL和JDBC编程**，着重介绍MySQL的使用和JDBC编程
    
*   **专栏笔记来源于三个部分**：**课本（主要依据，但不是全抄，而且有些部分课本叙述并不清晰）、C站其他博主文章（主要是对比一下内容是否完整）、B站视频（数据库有一些部分课本讲解的并不是很清楚，所以对于难点我专门学习了一下，总结在里面）**
    
*   数据库没有特别好的教学视频，所以大家可以多搜一搜
    
*   需要注意每章中有些小节内容太少，**所以会和前后节进行合并**，但是文章标题中会标注清楚
    
*   **导航在下面，点击可以跳转至对应文章**
    

**重要补充**：为了方便大家记忆，我制作了本专栏笔记表格（利用[onenote](https://so.csdn.net/so/search?q=onenote&spm=1001.2101.3001.7020)的嵌套表格制作），使用表格的方式理清逻辑。分为 **`onenote`(.onepkg格式，导入onenote即可，使用onenote2016)和`pdf`** 两种格式，需要的同学可以自行下载

*   [数据库表格笔记点击跳转](https://download.csdn.net/download/qq_39183034/83508567)
*   [完整的考研初试和复试数据库+软件工程资料（800多页）请点击跳转](https://download.csdn.net/download/qq_39183034/85100101)  
    ![](https://img-blog.csdnimg.cn/42cf914710d0444191847e990aa0db7b.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)  
    ![](https://img-blog.csdnimg.cn/f854cce9bb4943fbb51ef16f8ee7df39.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

第一章：绪论
======

## 第一节：数据库系统概论

### 一：四大基本概念

#### （1）数据(Data)

**概念：是数据库中存储的基本对象，是描述事物的符号记录**

**种类：文本、图形、图像、音频、视频、学生的档案记录、货物的运输情况等**

**特点：数据与其语义是不可分的**

#### （2）数据库(DataBase,DB)

**概念：是永久存储在计算机内，有组织、可共享的大量数据的集合**

**特征：**

*   **数据按一定的数据模型组织、描述和储存**
*   **可为各种用户共享**
*   **冗余度较小**
*   **数据独立性较高**
*   **易扩展**

#### （3）数据库管理系统(DataBase Management System,DBMS)

MYSQL就是一张DBMS

* * *

**概念：是位于用户与操作系统之间的一层数据管理软件。和操作系统一样是计算机的基础软件**

*   数据库是一个仓库，但是对数据库的操作是依靠DBMS完成的

**功能：**

**1：数据定义功能**

*   提供**数据定义语言(DDL)**
*   定义数据库中的数据对象

**2：数据组织、存储和管理功能**

*   分类组织、存储和管理各种数据
*   确定组织数据的文件结构和存取方式
*   实现数据之间的联系
*   提供多种存取方法提高存取效率

**3：数据操作功能**

*   提供**数据操纵语言(DML)**
*   实现对数据库的基本操作 (查询、插入、删除和修改)

**4：数据库的事物管理和运行管理**

*   数据库在建立、运行和维护时由DBMS统一管理和控制
*   保证数据的安全性、完整性、多用户对数据的并发使用
*   发生故障后的系统恢复

**5：数据库的建立和维护功能（实用程序）**

*   数据库初始数据装载转换
*   数据库转储
*   介质故障恢复
*   数据库的重组织
*   性能监视分析等

其他功能（如通信、[数据转换](https://so.csdn.net/so/search?q=%E6%95%B0%E6%8D%AE%E8%BD%AC%E6%8D%A2&spm=1001.2101.3001.7020)、互访等）

#### （4）数据库系统(Database System，DBS)

**概念：在计算后的系统构成**

**组成**

*   **数据库 Database**
*   **数据库管理系统（及其开发工具）Database Management System**
*   **应用系统(app)**
*   **数据库管理员 Database Administrator(DBA)**

![](https://img-blog.csdnimg.cn/d390adc98ce74b68941d3ace7e95883f.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)  
**特点：**  
**1：数据结构化（数据库系统与文件系统的本质区别）**

*   **整体结构化**是数据库的主要特征之一
*   所谓整体结构化就是指它不针对某一个应用，而是面向全组织。不仅数据**内部结构化并且数据之间也具有连续**
*   数据的结构用**数据模型描述**，无需程序定义和解释；数据可以变长；数据的最小存取单位是**数据项**

**2：数据的共享性高，冗余度低，易扩充**

**3：数据独立性高（由DBMS的二级映像功能保证）**

*   **物理独立性**：用户的应用程序与存储在磁盘上的数据库中数据是独立的。当数据的物理存储改变，应用程序不改变
*   **逻辑独立性**：指用户的应用程序与数据库的逻辑结构是相互独立的。数据的逻辑结构改变了，用户程序也可以不变

**4：数据由DBMS统一管理和控制**

*   **数据的安全性（Security）保护**：保护数据，以防止不合法的使用造成的数据的泄密和破坏。
*   **数据的完整性（Integrity）检查**：将数据控制在有效的范围内，或保证数据之间满足一定的关系。
*   **并发（Concurrency）控制**：对多用户的并发操作加以控制和协调，防止相互干扰而得到错误的结果。
*   **数据库恢复（Recovery）**：将数据库从错误状态恢复到某一已知的正确状态。

### 二：数据库发展阶段

**人工管理阶段(20世纪40年代中–50年代中)**：数据不保存、不共享、不具有独立性

**文件系统阶段(20世纪50年代末–60年代中)**：可保存，但共享性差，冗余度大，独立性差

**数据库系统阶段(20世纪60年代末–现在)**：数据库系统的出现使信息系统以**加工数据的程序**为中心转向**围绕共享的数据库**为中心的新阶段

## 第二节：数据模型

### 一：什么是[数据模型](https://so.csdn.net/so/search?q=%E6%95%B0%E6%8D%AE%E6%A8%A1%E5%9E%8B&spm=1001.2101.3001.7020)

**数据模型：计算机是不可能直接处理现实世界中的具体事物的，所以人们必须事先把具体事物转化为计算机能够处理的数据。因此数据模型是对现实世界数据特征的抽象，也即数据模型是用来描述数据、组织数据和对数据进行操作的。它应该满足下面三点要求**

*   比较真实地模拟现实世界
*   容易被人理解
*   便于在计算机上实现

### 二：两类数据模型

就像在建筑设计和施工的不同阶段需要不同图纸一样，在开发实施数据库应用系统中也需要使用不同的数据模型，**根据模型应用的不同目的，可分为两大类**

*   概念模型（信息模型）
*   逻辑模型和物理模型

为了把现实世界中的具体事物抽象、组织为某一数据库管理系统支持的数据模型，**人们常常首先将现实世界抽象为信息世界，然后将信息世界转换为机器世界**。也就是说，首先把现实世界中的客观对象抽象为某一种信息结构，这种信息结构并不依赖于具体的计算机系统，不是某一个数据库管理系统支持的数据模型，而是概念级的模型:然后再把概念模型转换为计算机上某一数据库管理系统支持的数据模型

![](https://img-blog.csdnimg.cn/b448736890b04cf684562f6f5e111cff.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

*   从现实世界到概念模型的转换是由**数据库设计人员完成的**
*   从概念模型到逻辑模型的转换可由**数据库设计人员完成**
*   从逻辑模型到物理模型的转换主要是由**数据库管理系统完成**

#### （1）概念模型（信息模型）

##### A：定义

**概念模型：是按用户的观点来对数据和信息建模，用于数据库设计**

##### B：相关术语

**实体： 客观存在并可以相互区别的事物。实体可以是具体的人、事、物，也可以是抽象的概念或联系**

*   比如职工、学生、学生的一次选课、教师与院系的工作关系

**属性： 实体所具有的某一特性。一个实体可以由若干属性刻画**

*   比如(201315121， 张山，男，199505， 计算机系，2013) 即表征了一个学生

**码： 唯一标识实体的属性**

*   比如人的身份证号

**实体型：用实体名及其属性集合来抽象和刻画同类实体**

*   比如学生(学号，姓名，性别，出生年月，所在院系)就是一个实体型

**实体集：同一类型实体的集合**

*   例如全体学生就是一个实体集

**联系：在现实世界中，事物内部以及事物之间是有联系的，这些联系在信息世界中反映为实体(型)内部的联系和实体(型)之间的联系。实体内部的联系通常是指组成实体的各属性之间的联系，实体之间的联系通常是指不同实体集之间的联系**

*   实体之间的联系有一一对一、-对多和多对多 等多种类型

##### C：概念模型的一种表示方法：实体-联系方法

实体联系方法用**E-R**图来描述现实世界的概念模型，所刻画的某些也称为**E-R模型**

#### （2）逻辑模型和物理模型

**逻辑模型：是按计算机系统的观点对数据建模，主要用于数据库管理系统的实现。主要包括**

*   层次模型
*   网状模型
*   **关系模型**
*   面向对象数据模型
*   对象关系数据模型
*   半结构化数据模型

**物理模型：是对数据最底层的抽象，它描述数据在系统内部的表示方式和存取方法，或在磁盘或磁带上的存储方式和存取方法，是面向计算机系统的。数据库设计人员需要了解和选择物理模型，但用户不需要考虑物理细节**

### 三：数据模型的组成要素

**数据结构**：数据结构是所研究的对象类型的集合

**数据操作**：是指对数据库中各种对象(型)的实例(值)允许执行的操作及有关的操作规则

*   查询
*   更新

**数据的完整性约束条件**：数据的完整性约束条件是一组完整性规则的集合，规定数据库状态及状态变化所应满足的条件，以保证数据的正确性、有效性和相容性

*   实体完整性
*   参照完整性

### 四：层次模型、网状模型和关系模型

层次模型和网状模型逐渐已被关系模型取代，所以对于前两个重点掌握概念即可，关系模型是重点，同时关系模型对应的关系数据库将在第二章重点介绍

#### （1）层次模型

##### A：层次模型的数据结构（二叉树）

在数据库中定义满足下面两个条件的基本层次联系的集合就为层次模型

*   **有且只有一个结点没有双亲结点，此结点为根节点**
*   **根结点以外的所有结点有且只有一个双亲结点**

在层次模型中**每个结点表示一个记录类型，记录类型之间的联系用结点之间的连线（有向边）表示，这种联系是父子之间的一对多的联系**

![](https://img-blog.csdnimg.cn/b90a42c74d884bc1b956eb5741c8b192.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

例如  
![](https://img-blog.csdnimg.cn/d9847e26b419432eb7e52f1a93466f47.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

##### B：层次模型优缺点（了解）

**优点**

*   层次模型的数据结构较为简单清晰
*   层次模型的查询效率高
*   层次模型提供了良好的完整性支持

**缺点**

*   层次模型不能很好的表示多对多联系
*   插入，删除麻烦，编写程序复杂
*   查询子女结点必须通过双亲结点
*   由于结构严密，层次命令趋于程序化

#### （2）网状模型

##### A：网状模型的数据结构（图）

在数据库中定义满足下面两个条件的基本层次联系的集合就为网状模型

*   **允许一个以上的结点无双亲**
*   **一个结点可以有多于一个的双亲**

![](https://img-blog.csdnimg.cn/bbe497ad40ee44df8bd2d30f56027469.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

例如  
![](https://img-blog.csdnimg.cn/c20eb60a6c904bb2b9b1bde648e3103d.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

##### B：网状模型的优缺点（了解）

**优点**

*   能够更为直接地描述现实世界
*   具有良好的性能，存取效率较高

**缺点**

*   结构复杂，不利于用户掌握
*   其DDL、DML复杂，嵌入高级语言中也难以让用户掌握
*   用户需要了解结构细节，加重了编写程序的负担

#### （3）关系模型

##### A：关系模型的数据结构

关系不同于上面的两种模型，它是建立在严格的**数学概念**上的（更严格的定义在二章给出）。

从**用户的角度看**，关系模型由一组**关系**组成，每个关系的数据结构是一张**规范化的二维表**

![](https://img-blog.csdnimg.cn/8d48f9e1d811405882be94440615e1eb.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)  
涉及术语如下

**关系：一个关系对应一张表**

**元组：表中一行或者是一条记录叫做一个元组**

**属性：表中一列叫做一个属性，给每一个属性起一个名称叫做属性名**

**码：用于唯一确定一个元组**

**域：属性的取值范围**

**分量：元组的每一个属性值，关系的每一个分量都不可以再分**

**关系模式：对关系的描述，必须是规范化的**

*   关系名（属性1，属性2，… ，属性n）

##### B：关系模型的优缺点

**优点**

*   建立在严格的数学概念的基础上
*   关系模型的概念单一，无论实体还是联系都用关系表示，对数据的检索和更新结果也是关系。因此简单、清晰，易用
*   关系模型的存取路径对用户透明

**缺点**

*   查询效率往往不如格式化数据模型
*   开发相应数据库管理系统难度大

## 第三节：数据库系统的结构

### 一：数据库系统模式的概念

#### （1）型和值

[数据模型](https://so.csdn.net/so/search?q=%E6%95%B0%E6%8D%AE%E6%A8%A1%E5%9E%8B&spm=1001.2101.3001.7020)中有“型(type)”和“值(value)”的概念

*   **型(type)：对某一类数据的结构和属性的说明**
*   **值(value)：是型的一个具体赋值**

![](https://img-blog.csdnimg.cn/f954ae0869fc41f3acb1feae0b93c62c.png)

#### （2）模式和实例

虽然实际的[数据库管理系统](https://so.csdn.net/so/search?q=%E6%95%B0%E6%8D%AE%E5%BA%93%E7%AE%A1%E7%90%86%E7%B3%BB%E7%BB%9F&spm=1001.2101.3001.7020)产品种类很多，它们支持不同的数据模型，使用不同的数据库语言，建立在不同的操作系统之上，数据的存储结构也各不相同，但它们在体系结构上通常都具有相同的特征，即**采用三级模式结构(早期微机上的小型数据库系统除外)并提供两级映像功能**

* * *

**模式(schema)：是数据库逻辑结构和特征的描述**

*   是**型的描述**
*   反应的是**数据的结构及其联系**
*   模式**相对稳定**

**实例(instance)：模式的一个具体值**

*   反映数据库**某一时刻的状态**
*   同一个模式**可以有很多实例**
*   实例随数据中的数据的**更新而变动**

**一个数据库只有一个模式，可以把模式看成是唯一的数据库，实例就是数据库里面的多个表**

*   所以MYSQL中创建模式其实也就是在创建数据库

![](https://img-blog.csdnimg.cn/0c1eda2f3ac0496599402171c61490cc.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

### 二：三级模式

![](https://img-blog.csdnimg.cn/ae0a6f4c1e0d4d8792386df8e485b610.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

#### （1）模式(schema)

**模式：是数据库中全体数据的逻辑结构和特征的描述，是所有用户的公共数据视图，综合了所有用户的需求，对应概念模式**

*   它是数据库模式结构的**中间层**，**既不涉及数据的物理存储细节和硬件环境，又与具体的应用程序、所使用的应用开发工具及高级语言无关**
*   **一个数据库只有一个模式**
*   数据库模式以某一种**数据模型**为基础，统一考虑所有用户需求，并将这些需求有机结合为一个逻辑整体
*   DBMS提供**模式DDL**来严格定义模式

#### （2）外模式(external schema)

**外模式：是数据库用户（包括程序员和最终用户）能够看见和使用的局部的逻辑结构和特征的描述，是数据库用户的数据视图，是与某一应用有关的数据的逻辑描述**

*   **外模式通常是模式的一个子集**，所以模式与外模式的关系为**一对多**
*   一个数据库可以有多个外模式，反映了不同用户的需求（比如爱奇艺的付费用户和普通用户）
*   **同一个外模式也可以为某一用户的多个应用系统所使用，但一个应用程序只能使用一个外模式**
*   外模式是保证**数据库安全性**的一个有力措施。每个用户只能看见和访问所对应的外模式中的数据，数据库中的其余数据是不可见的
*   DBMS提供**外模式DDL**来严格定义外模式

#### （3）内模式(internal schema)

**内模式：是数据物理结构和存储方式的描述，是数据在数据库内部的表示方式**

*   **一个数据库只有一个内模式**

### 三：二级映像

#### （1）外模式/模式映像

同一个模式可以有任意多个外模式，**对于每一个外模式，数据库系统都有一个外模式/模式映像，它定义了该外模式与模式之间的对应关系**

**当模式改变时( 例如增加新的关系、新的属性、改变属性的数据类型等)，由数据库管理员对各个外模式/模式的映像作相应改变，可以使外模式保持不变。应用程序是依据数据的外模式编写的，从而应用程序不必修改，保证了数据与程序的逻辑独立性，简称数据的逻辑独立性**

#### （2）模式/内模式映像

**当数据库的存储结构改变时( 例如选用了另一种存储结构)，由数据库管理员对模式/内模式映像作相应改变，可以使模式保持不变。从而应用程序不必改变，保证了数据与程序的物理独立性，简称数据的物理独立性**

* * *

### 其他（该内容选择课本，可不看，但对理解有帮助）

![](https://img-blog.csdnimg.cn/7faddd3ca6904933bd73bd7bc97faf86.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

## 习题

### 名词解释

*   **数据**：是数据库中存储的基本对象，是描述事物的符号记录
    
*   **数据库**：是永久存储在计算机内的，有组织的、可共享的大量数据的集合
    
*   **数据库管理系统**：是位于用户与操作系统之间的一层数据管理软件，和操作系统一样都是计算机的基础软件
    
*   **数据库系统**：是在计算机中引入数据库后的系统构成。包括DB,[DBMS](https://so.csdn.net/so/search?q=DBMS&spm=1001.2101.3001.7020),APP,DBA
    
*   **数据模型**：计算机是不可能直接处理现实世界中的具体事物的，所以人们必须事先把具体事物转化为计算机能够处理的数据。因此数据模型是对现实世界数据特征的抽象，也即数据模型是用来描述数据、组织数据和对数据进行操作的
    
*   **概念模型（信息模型）**：是按用户的观点来对数据和信息建模，用于数据库设计
    
*   **逻辑模型**：是按计算机系统的观点对数据建模，主要用于[数据库管理系统](https://so.csdn.net/so/search?q=%E6%95%B0%E6%8D%AE%E5%BA%93%E7%AE%A1%E7%90%86%E7%B3%BB%E7%BB%9F&spm=1001.2101.3001.7020)的实现
    
*   **物理模型**：对数据最底层的抽象，它描述数据在系统内部的表示方法和存取方法，或在磁盘或磁带上的存储方式和存取方法，是面向计算机系统的
    
*   **实体** ：客观存在并可以相互区别的事物。实体可以是具体的人、事、物，也可以是抽象的概念或联系
    
*   **属性**：实体所具有的某一特性。一个实体可以由若干属性刻画
    
*   **码** ：唯一标识实体的属性
    
*   **实体型**： 用实体名及其属性集合来抽象和刻画同类实体
    
*   **实体集**： 同一类型实体的集合
    
*   **联系** ：实体内部的联系通常是指组成实体的各属性之间的联系，实体之间的联系通常是指不同实体集之间的联系
    
*   **关系** ：一个关系对应一张表
    
*   **元组** ：表中一行或者是一条记录叫做一个元组
    
*   **属性** ：表中一列叫做一个属性，给每一个属性起一个名称叫做属性名
    
*   **码** ：用于唯一确定一个元组
    
*   **域** ：属性的取值范围
    
*   **分量** ：元组的每一个属性值，关系的每一个分量都不可以再分
    
*   **关系模式** ：对关系的描述，必须是规范化的
    
*   **模式**：是数据库中全体数据的逻辑结构和特征的描述，是所有用户的公共数据视图，综合了所有用户的需求，对应概念模式
    
*   **外模式**：是数据库用户（包括程序员和最终用户）能够看见和使用的局部的逻辑结构和特征的描述，是数据库用户的数据视图，是与某一应用有关的数据的逻辑描述
    
*   **内模式**：是数据物理结构和存储方式的描述，是数据在数据库内部的表示方式
    

### 简答题

* * *

> ![](https://img-blog.csdnimg.cn/17277a12636740a69d79220d63930d23.png)

【答案】

*   **数据**：是数据库中存储的基本对象，是描述事物的符号记录
*   **数据库**：是永久存储在计算机内的，有组织的、可共享的大量数据的集合
*   **数据库管理系统**：是位于用户与操作系统之间的一层数据管理软件，和操作系统一样都是计算机的基础软件
*   **数据库系统**：是在计算机中引入数据库后的系统构成。包括DB,DBMS,APP,DBA

* * *

> ![](https://img-blog.csdnimg.cn/c871701fab594bd6b60840cec43a897b.png)  
> ![](https://img-blog.csdnimg.cn/976ce21933334371a87da28b7953d655.png)

【答案】

*   数据库系统具有一个很大的特点，那就是整体结构化。数据的结构用 数据模型描述，无序程序定义和解释
*   数据库系统中数据的共享度高，冗余度低，易扩充
*   数据库系统数据独立性高（物理独立性和逻辑独立性），也即程序和数据之间相互独立，互不影响
*   数据由DBMS统一管理和控制，他可以提供安全性、完整性、并发等诸多服务

* * *

> ![](https://img-blog.csdnimg.cn/7944d743f6c948fd8a4b59af4bdfdd13.png)

【答案】

**区别**：文件系统面向某一应用程序，共享性差，冗余度大，数据独立性差，记录内有结构，整体无结构，由应用程序自己控制。数据库系统面向现实世界，共享性高，冗余度小，具有较高的物理独立性和一定的逻辑独立性，整体结构化，用数据模型描述，由数据库管理系统提供数据的安全性、完整性、并发控制和恢复能力

**联系**：文件系统与数据库系统都是计算机系统中管理数据的软件。解析文件系统是操作系统的重要组成部分;而DBMS是独立于操作系统的软件。但是DBMS是在操作系统的基础上实现的;数据库中数据的组织和存储是通过操作系统中的文件系统来实现的

* * *

> ![](https://img-blog.csdnimg.cn/32511637f84544ccac4dca61a4641659.png)

【答案】

*   数据定义功能（提供数据定义语言DDL）
*   数据组织、存储和管理功能
*   数据操纵功能（提供数据操纵语言DML）
*   数据库的事务管理和运行管理
*   数据库的建立和维护功能

* * *

> ![](https://img-blog.csdnimg.cn/6abf1be0794246718c767ba7933456fd.png)

【答案】

*   **定义**：是按照用户的观点对数据和信息建模，用于数据库设计
*   **作用**：概念模型实际上是现实世界到机器世界的一个中间层次。概念模型用于信息世界的建模，是现实世界到信息世界的第一层抽象，是数据库设计人员进行数据库设计的有力工具，也是数据库设计人员和用户之间进行交流的语言

> ![](https://img-blog.csdnimg.cn/22ee674dc45e43d0b0fc38bfacfae13b.png)

【答案】

*   **实体**：客观存在并可以相互区别的事物
*   **实体型**：用实体名及其属性集合来抽象和刻画同类实体
*   **实体集**：同一类型实体的集合
*   **联系**：实体内部的联系通常是指组成实体的各属性之间的联系，实体之间的联系通常是指不同实体集之间的联系

> ![](https://img-blog.csdnimg.cn/595d5c86c4394196a179e23b2380beb7.png)

【答案】

*   **数据模型的概念**：数据模型是对现实世界数据特征的抽象，也即数据模型是用来描述，组织数据和操纵数据的
*   **三个要素**：数据结构，数据操纵和数据完整性约束

> ![](https://img-blog.csdnimg.cn/59a5a654c83c4a448eca27213df91955.png)

【答案】

①：层次模型  
![](https://img-blog.csdnimg.cn/25d6a7e61cd54034838f2cc200c64114.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

![](https://img-blog.csdnimg.cn/541f2bc52ea747cb983628178ec076b1.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

②：网状模型  
![](https://img-blog.csdnimg.cn/997cef7fec9f488fb5e6f448ad8a4e1b.png)  
![](https://img-blog.csdnimg.cn/dcb972cb950d41debff1d7869ca7c16c.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

> ![](https://img-blog.csdnimg.cn/300900aeb861441696d28f1884bb9d91.png)

【答案】  
![](https://img-blog.csdnimg.cn/202c9387c2d24300b2823886228e09e0.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

> ![](https://img-blog.csdnimg.cn/de618369e6bb4cb69d7a66ea3f3d39df.png)

【答案】

![](https://img-blog.csdnimg.cn/fd12bb8e6f2548b9a72b356e92a8d846.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

> ![](https://img-blog.csdnimg.cn/49c6b77218dc48f28c839babaf4e779f.png)

【答案】

*   **物理独立性**：用户的应用程序与存储在磁盘上的数据库中数据是独立的。当数据的物理存储改变时，应用程序不改变
*   **逻辑独立性** ：用户应用程序与数据库的逻辑结构是相互独立的。数据的逻辑结构改变了，用户的程序也可以不变

![](https://img-blog.csdnimg.cn/4921dd1ac5054be18526755b1ba4d6bf.png)

### 应用题

第二章：关系数据库
=========

## 第一节：关系数据结构及其形式化定义

### 一：关系

前面说过，**关系模型建立在严格的数学概念之上，只包含单一的数据结构——关系，在用户看来关系就是一张二维表**

#### （1）域

**域：是一组具有相同数据类型的值的集合**

*   如自然数、整数、实数

#### （2）[笛卡尔积](https://so.csdn.net/so/search?q=%E7%AC%9B%E5%8D%A1%E5%B0%94%E7%A7%AF&spm=1001.2101.3001.7020)

**笛卡尔积：是一种域上面的集合运算，得到每个域中元素的所有可能的组合，它可以表示为一张二维表**，在笛卡尔积中有

*   **元组**：每一行是一个元组，比如 (张清玫，计算机专业，李勇)、(张清玫，计算机专业，刘晨)等都是元组 ;
*   **分量**：每一行中每一个元素都是一个分量，比如张清玫、计算机专业、李勇、刘晨等都是分量

比如下面的 D 1 D\_{1} D1、 D 2 D\_{2} D2和 D 3 D\_{3} D3个域  
![](https://img-blog.csdnimg.cn/a3a7da4fb5dc4e75b939fa787edcb41b.png)  
如果让他们做笛卡尔积，也就是排列组合，那么就会形成下面一张二维表

![](https://img-blog.csdnimg.cn/1ded063825bb40b2bfd8fd114a2f4afb.png)

![](https://img-blog.csdnimg.cn/5de8aa8a4c94416888d9a9477cc389fc.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

由此可知，该笛卡尔积的基数为2×2×3=12，也即有12个元组

上面的笛卡尔积中很多元组**是没有意义的**（例如在实际情形中一个导师一般专注于一个研究方向）。所以该笛卡尔积**的一个子集才是有意义的，才可以表示导师和研究生的关系**，例如  
![](https://img-blog.csdnimg.cn/6948cdfceadb4d5a810659d156af1d2b.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

*   表SAP

#### （3）关系

##### A：基本概述

**关系：笛卡尔积（ D 1 D\_{1} D1× D 2 D\_{2} D2,…, D n D\_{n} Dn）的子集叫做在域 D 1 D\_{1} D1、 D 2 D\_{2} D2,…, D n D\_{n} Dn的关系，表示为R( D 1 D\_{1} D1、 D 2 D\_{2} D2,…, D n D\_{n} Dn)**,其中

*   **R**：关系名
*   **n**：关系的目或度（n=1时称为单元关系，n=2时称为二元关系）

关系既然是笛卡尔积的子集（有限子集），所以关系也是一张**二维表**

*   **表的每一行对应一个元组，表的每一列对应一个域**
*   由于域可以相同，为了区分，**必须对每列起一个名字，称为属性**（比如上面的表中研究生和导师都是人，为了区分，所以才取了不同的名字）

##### B：码相关概念

以下面关系为例  
![](https://img-blog.csdnimg.cn/7c384cf31bda4c1897cc81198d994f3f.png)

* * *

**候选码：若关系中的某一属性组（注意是组不是某单个属性，当然有时属性组也可能只有一个属性）能唯一地标识一个元组，而其子集不能，则该属性组称之为候选码**

*   上面关系中，学号是无法区分的，因为学号虽然不重复，但一个学生可能会对应多个课程，这就导致学号无法唯一标识一个元组。**因此这里（学号，课程名）可以作为一个候选码**
*   **需要注意的是候选码不一定只有一个，可能有多个，只要满足条件即可，但在本例中确实只有一个**

**超码：能够唯一标识一条记录的属性或属性集，超码是候选码的扩充，候选码是最小的超码**

*   上面关系中，（学号、课程名）是候选码，那么它的超集，**例如（学号、课程名、姓名）、（学号、课程名、性别）就是超码**

**主码：某个能够唯一标识一条记录的最小属性集（候选码中的“人选之子”）**

*   候选码可能有多个，**但是数据库设计者在设计时会根据实际需求选择一个候选码作为主码**

**外码：是本关系的属性且不是码，而是另一个关系的主码（后续会详细介绍）**

**全码：这是一种特殊情况：关系的所有属性组是这个关系模式的候选码**

**主属性和非属性：包含在候选码中的属性（注意是集合，不是某个候选码）称为主属性；不包含在候选码中的属性称为非主属性**

*   上面关系中，**姓名、性别和期末分数都是非主属性**

##### C：关系的三种类型

关系可以有三种类型

*   **基本关系（又称为基本表）**：**实际存在**的表，是实际存储数据的逻辑表示
*   **查询表**：**查询结果**对应的表
*   **视图表**：由基本表或其他视图表导出的表，**是虚表**，不对应实际存储的数据

其中基本关系满足以下性质（作了解即可）  
![](https://img-blog.csdnimg.cn/6630e4b20c5d44b690ca68193477d988.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

### 二：关系模式

在[关系模式就是型，关系就是值，关系模式是对关系的描述，具体来说要描述以下方面](https://zhangxing-tech.blog.csdn.net/article/details/122526835>（数据库系统概论|王珊）第一章绪论-第三节：数据库系统的结构</a>中讲过型和值的概念</p> 
<ul><li><strong>型(type)</strong>：对某一类数据的结构和属性的说明</li><li><strong>值(value)</strong>：是型的一个具体赋值</li></ul> 
<p><strong>在关系数据库中，<font color=)

[

*   元组集合的结构（由哪些属性构成、这些属性来自哪些域、属性与域之间的映像关系）
*   元组语义以及完整性约束
*   属性之间的数据依赖关系

* * *

**关系模式：关系模式就是对关系的描述，可以表示为**

R ( U , D , D O M , F ) R(U,D,DOM,F) R(U,D,DOM,F)

*   R R R：关系名
*   U U U：组成该关系的属性名集合
*   D D D： U U U中属性所来自的域
*   D O M DOM DOM：属性向域的映像集合
*   F F F：属性间数据的依赖关系集合（此部分属于第六章：关系数据理论的内容）

**关系模式通常可以简记为（重点用）**

R ( U ) R(U) R(U)

或  
R ( A 1 , A 2 , . . . , A n ) R(A\_{1},A\_{2},...,A\_{n}) R(A1,A2,...,An)

*   R R R：关系名
*   A 1 , A 2 , . . . , A n A\_{1},A\_{2},...,A\_{n} A1,A2,...,An：属性名
*   “域名”及“属性向域的映像”常常直接说明为属性的**类型**和**长度**

](https://zhangxing-tech.blog.csdn.net/article/details/122526835>（数据库系统概论|王珊）第一章绪论-第三节：数据库系统的结构</a>中讲过型和值的概念</p> 
<ul><li><strong>型(type)</strong>：对某一类数据的结构和属性的说明</li><li><strong>值(value)</strong>：是型的一个具体赋值</li></ul> 
<p><strong>在关系数据库中，<font color=)

[](https://zhangxing-tech.blog.csdn.net/article/details/122526835>（数据库系统概论|王珊）第一章绪论-第三节：数据库系统的结构</a>中讲过型和值的概念</p> 
<ul><li><strong>型(type)</strong>：对某一类数据的结构和属性的说明</li><li><strong>值(value)</strong>：是型的一个具体赋值</li></ul> 
<p><strong>在关系数据库中，<font color=)三：关系数据库
==================================================================================================================================================================================================================================================================

#### （1）基本概念

**关系数据库：在一个给定的应用领域中，所有关系的集合构成的一个关系数据库**

#### （2）关系数据库的型与值

**关系数据库的型：也称为关系数据库模式，是对关系数据库的描述**，包括

*   若干域的定义
*   在这些域上定义的若干关系模式

**关系数据库的值：这些关系模式在某一时刻对应的关系的和，通常就叫做关系数据库**

 

文章知识点与官方知识档案匹配，可进一步学习相关知识

[算法技能树](https://edu.csdn.net/skill/algorithm/?utm_source=csdn_ai_skill_tree_blog)[首页](https://edu.csdn.net/skill/algorithm/?utm_source=csdn_ai_skill_tree_blog)[概览](https://edu.csdn.net/skill/algorithm/?utm_source=csdn_ai_skill_tree_blog)42145 人正在系统学习中

## 第二节、第三节：关系操作和关系完整性

### 一：关系操作

#### （1）基本的关系操作

关系模型常用关系操作如下。

**关系操作的特点是集合操作方式，也即操作的对象和结果都是集合。也称为一次一集合（set-at-a-time）的方式**

*   非关系数据模型的数据操作方式称为**一次一记录**（record-at-a-time）

![](https://img-blog.csdnimg.cn/ce7b1b5ce24e4a9982040a3d16c4b455.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

#### （2）关系数据语言的分类

关系数据语言可分为三类，如下  
![](https://img-blog.csdnimg.cn/c45a2f7273ac4fb2860f1946be81f411.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

下面是SQL的了解性内容，可不看（下一章将会重点介绍）

> 特别地，[SQL语言](https://so.csdn.net/so/search?q=SQL%E8%AF%AD%E8%A8%80&spm=1001.2101.3001.7020)是一种高度非过程化的语言，用户不必请求数据库管理员为其建立特殊的存取路径，存取路径的选择由关系数据库管理系统的优化机制来完成。例如，在一个存储有几百万条记录的关系中查找符合条件的某一个或某一些记录，从原理上讲可以有多种查找方法。例如，可以顺序扫描这个关系，也可以通过某一一种索引来查找。不同的查找路径(或者称为存取路径)的效率是不同的，有的完成某一个  
> 查询可能很快，有的可能极慢。关系[数据库管理系统](https://so.csdn.net/so/search?q=%E6%95%B0%E6%8D%AE%E5%BA%93%E7%AE%A1%E7%90%86%E7%B3%BB%E7%BB%9F&spm=1001.2101.3001.7020)中研究和开发了查询优化方法，系统可以自动选择较优的存取路径，提高查询效率

### 二：关系完整性约束

关系完整性规则是对关系的**某种约束条件**，这些约束条件实际上是现实世界的要求，例如性别只能有男、女两种取值

关系模型中有如下三类完整性约束

*   **实体完整性**（entity integrity）
*   **参照完整性**（referential integrity）
*   **用户自定义完整性**（user-defined integrity）

其中实体完整性和参照完整性是关系模型必须满足的完整性约束条件，被称为**关系的两个不变性**

#### （1）实体完整性

**实体完整性：若属性A是基本关系 R R R的主属性，则属性A不能取空值**

*   例如“选修（学号,课程号,成绩）”关系中，若（学号,课程号）为主码，则**学号和课程号都不能取空值**

#### （2）参照完整性

##### A：参照关系

（注意在关系表示中，**下划线表示主码**）

* * *

【例1】如下两个关系中，**学生关系引用了专业关系的主码“专业号”，也就是说，学生关系中的某个属性的取值需要参照专业关系的属性取值**

![](https://img-blog.csdnimg.cn/62c4d790353a4d1fb10de4b7674e8b7c.png)

【例2】如下三个关系中，**选修关系引用了学生关系的主码“学号”和课程关系的主码“课程号”，也就是说，选修关系中某些属性的取值需要参照其他关系的属性取值**

![](https://img-blog.csdnimg.cn/f7b8fea4854f4946b33c3bc346418b1c.png)

【例3】还有，**同一关系内部也可能存在引用关系**。比如在**学生(学号，姓名，性别，专业号，年龄，班长)关系中，“学号”属性是主码，“班长”属性表示该学生所在班级的班长的学号，它引用了本关系“学号”属性，即“班长”必须是确实存在的学生的学号**  
![](https://img-blog.csdnimg.cn/7e72d2b8fe1447d3a217d2688881065d.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

##### B：外码

**外码：设 F F F是基本关系 R R R的一个或一组属性，但不是关系 R R R的码【例如这里 F F F是学生关系的专业号】， K s K\_{s} Ks是基本关系 S S S的主码【例如这里 K s K\_{s} Ks是专业关系的主码】。若 F F F和 K s K\_{s} Ks相对应，则称 F F F是 R R R的外码(foreign key)【则称专业号是学生关系的外码】，并称基本关系 R R R为参照关系(referencing relation)【这里学生关系就是参照关系】，基本关系S为被参照关系(referenced relation)【这里专业关系就是被参照关系】。关系 R R R和 S S S不一定是不同的关系**

*   注意：**外码并不一定要与相应的主码同名**，如上面第三个例子中，学生关系的主码为学号，外码为班长。不过，在实际应用中为了便于识别，当外码与相应的主码属于不同关系时，往往给它们取相同的名字。

上面三个例子的参照关系表示如下  
![](https://img-blog.csdnimg.cn/5e7981b75f73455e9e6a3e97d69ffe0d.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

##### C：参照完整性规则

**参照完整性：若属性或属性组 F F F是基本关系 R R R的外码，它与基本 S S S的主码相对应（关系 R R R和 S S S不一定是不同的关系），则对于 R R R中每个元组在 F F F上的值必须**

*   **要么取空值（此时 F F F的每个属性值均为空值）**
*   **要么等于 S S S中某个元组的主码值**

因此对于【例1】，学生关系中每个元组的**专业号**只能取下面两类值

*   **空值**：表示该学生尚未分配专业
*   **非空值（且该值必须是专业关系中某个元组的专业号值）**：表示该学生不能分配到一个不存在的专业中

而对于【例2】，按照道理来说“学号”和“课程号”也可以取两类值，**但是“学号”和“课程号”它作为的是选修关系的主码，所以如果取空值的话将会违背实体完整性规则**

对于【例3】， R R R和 S S S是同一个关系，“班长”可以取两类值

*   **空值**：该班还没有选出班长
*   **非空值**：班长必须是班里的同学

#### （3）用户自定义完整性

用户自定义完整性1针对某一具体关系数据库的约束条件，反映**某一具体应用所涉及的数据必须满足的语义要求**，例如某个属性必须取唯一值，某个非主属性不能取空值等等

## 第四节：关系代数

### 一：[关系代数](https://so.csdn.net/so/search?q=%E5%85%B3%E7%B3%BB%E4%BB%A3%E6%95%B0&spm=1001.2101.3001.7020)的基本概念

**关系代数：是一种抽象的查询语言，用于对关系运算来表达查询**

关系代数的**运算对象和运算结果都是关系**，所用到运算符可分为如下两种

*   **传统的集合运算**：运算从行的角度进行
*   **专门的关系运算**：运算同时涉及行和列

![](https://img-blog.csdnimg.cn/1050915aaedf4cdba1f83d607608af7c.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_14,color_FFFFFF,t_70,g_se,x_16)

### 二：传统的集合运算

严格的定义这里不再给出，可借助课本。我的目的就是能帮助快速理解即可

#### （1）并（union）

**并：对于关系 R R R和 S S S，并操作就是将两个关系上下拼在一起形成一个新的关系，记为 R R R∪ S S S**

*   所以两个关系具有**相同数目的属性**

![](https://img-blog.csdnimg.cn/1e445308de584ef6a66c42614c130844.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

#### （2）差（except）

**差：对于关系 R R R和 S S S，求他们的差，就是在 R R R中去掉两个关系中所有相同的行，形成一个新的关系，记为 R R R\- S S S**

![](https://img-blog.csdnimg.cn/5365c0ef651f4b2ea34e296bf6abccb8.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

#### （3）交（intersection）

**交：对于关系 R R R和 S S S，求他们的交，就是选出两个关系中所有相同的行，形成一个新的关系，记为 R R R∩ S S S**

*   所以 R R R∩ S S S\= R R R\- ( R − S ) (R-S) (R−S)

![](https://img-blog.csdnimg.cn/3122590b5043409f931639db282ca34c.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

#### （4）笛卡尔积（cartersian product）

**笛卡尔积：对于关系 R R R和 S S S，求他们的笛卡尔积，就是两个关系所有元组的不同排列组合，形成一个新的关系，记为 R R R× S S S**

![](https://img-blog.csdnimg.cn/b3cbbddfaa284693ad281a8b9763ec56.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

### 三：专门的关系运算

注意：在下面的叙述中有时会用到如下三种关系

*   学生关系Student
*   课程关系Course
*   选修关系SC

![](https://img-blog.csdnimg.cn/11d35f18f05743dc9588c3359af84b9c.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

#### （1）选择（selection）

**选择：从行的角度出发，在关系 R R R中选择满足条件的元组然后组成新的关系。“满足条件”意味着有条件表达式，其运算符如下**

![](https://img-blog.csdnimg.cn/a66cc32f63a84e52944846cacdbbbf3d.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_16,color_FFFFFF,t_70,g_se,x_16)  
**例如可在关系Student中查询所有IS系的学生，查询结果形成一个关系，记为 σ S d e p t = ′ I S ′ ( S t u d e n t ) σ\_{Sdept=\_{'IS'}}(Student) σSdept\=′IS′(Student)**

![](https://img-blog.csdnimg.cn/2e860e364e8a415c94730268626ca3af.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)  
**再比如可在关系Student中查询所有年龄小于20的学生，查询结果形成一个关系，记为 σ S a g e < 20 ( S t u d e n t ) σ\_{Sage<20}(Student) σSage<20(Student)**

![](https://img-blog.csdnimg.cn/037d251aaa244e4c9bc329d6164c9cc6.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

#### （2）投影（projection）

**选择：从列的角度出发，选择满足条件的若干属性列组成新的关系**

*   投影之后取消了原关系中的某些列，当然也有可能会取消某些元祖（因为一旦取消了某些属性列后就极有可能出现重复行），所以**一定注意消除完全相同的行**

**例如在关系Student中查询姓名和所在系的投影，记为 ∏ S n a m e , S d e p t ( S t u d e n t ) ∏\_{Sname,Sdept}(Student) ∏Sname,Sdept(Student)**

![](https://img-blog.csdnimg.cn/c0266d2def6c4f958ecefcd972a0d9a9.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)  
**再比如在关系Student中查询都有哪些系，记为 ∏ S d e p t ( S t u d e n t ) ∏\_{Sdept}(Student) ∏Sdept(Student)**

*   注意投影**要取消重复的CS元组**

![](https://img-blog.csdnimg.cn/75b7d103b71f4215ab762ed1cd4b22db.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

#### （3）连接（join）

##### A：[等值连接](https://so.csdn.net/so/search?q=%E7%AD%89%E5%80%BC%E8%BF%9E%E6%8E%A5&spm=1001.2101.3001.7020)和自然连接

**等值连接：可以按照如下步骤考虑，最终形成新的关系，记为**

*   首先找到关系 R R R和 S S S中属性相同的列
*   然后找到两列中相同的元素
*   将相同元素所在的行组成新的一行，**需要用【关系.属性】的格式区两个关系中相同的属性**

![](https://img-blog.csdnimg.cn/342697b6e2264e60b79d305ccd209119.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

**自然连接：它是一种特殊的等值连接，在等值连接的结果中去掉重复列即可**  
![](https://img-blog.csdnimg.cn/46cd1e28461d46e3ae592d80bbdca48c.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

##### B：外连接

**悬浮元组的概念**： R R R和 S S S在做[自然连接](https://so.csdn.net/so/search?q=%E8%87%AA%E7%84%B6%E8%BF%9E%E6%8E%A5&spm=1001.2101.3001.7020)时， R R R中某些元组有可能在 S S S中不存在公共属性上值相等的元组，就会造成 R R R中这些元组在操作时被舍弃（反过来 S S S也是这样）。**例如上图自然连接中就舍弃了 R R R的第4个元组和 S S S的第5个元组**

* * *

**外连接：若将悬浮元组保留在自然连接的结果中，而在其他属性上填NULL，那么这种连接就叫做外连接，同时**

*   **左外连接：只保留左边关系 R R R中的悬浮元组**
*   **右外连接：只保留右边关系 R R R中的悬浮元组**

![](https://img-blog.csdnimg.cn/4c7f849ec1d2469e974f9e3d7d36044e.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

#### （4）除（division）

**除：是笛卡尔积的逆运算，对于关系 R R R和 S S S，求 R R R÷ S S S可按如下步骤考虑**

*   研究对象是 R R R和 S S S中相同的属性列
*   在 R R R中挑选元祖，所挑选的元组一定满足它的属性均出现在 S S S对应相同属性列的所有属性集合内

![](https://img-blog.csdnimg.cn/dfee8fc004f9464bb72927b7426c3816.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

## 习题

### 名词解释

*   **域**：是一组具有相同数据类型的值的集合
*   **笛卡尔积**：是一种域上面的集合运算，得到每个域中元素的所有可能的组合，它可以表示为一张二维表
*   **候选码**：如果关系中的某一属性组能唯一标识一个元组，而其子集不能，则称该属性组为候选码
*   **超码**：能够唯一标识一条记录的属性或属性集。超码是候选码的扩充，候选码是最小的超码
*   **主码**：能够唯一标识一条记录的最小属性集
*   **全码**：关系中的所有属性组都是该关系模式的候选码
*   **外码**：是本关系的属性但不是码，而是另一个关系的主码
*   **主属性**：包含在候选码中的属性
*   **SQL**：即结构化查询语言，是一种高度非过程化的语言，集数据查询、数据操纵、数据定义、数据控制功能于一体。是关系数据库的标准语言
*   **实体完整性**：若属性A是基本关系R的主属性，则属性A不能取空值

### 简答题

> ![](https://img-blog.csdnimg.cn/486f9b3c06ee4928ae998db97cb9c9bd.png)

【答案】

*   关系数据结构
*   关系操作集合
*   关系完整性约束

> ![](https://img-blog.csdnimg.cn/af74e539b4c84186bf6bd3acb1238421.png)

【答案】

**这些关系数据语言的共同特点是**：语言具有完备的表达能力，是非过程化的集合操作语言，功能强，能够嵌入高级语言中使用  
![](https://img-blog.csdnimg.cn/b449b90580114bf08be21989a8d1ca53.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

> ![](https://img-blog.csdnimg.cn/70b2cdb7955b4adfa13802e026c9cc50.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

【答案】

![](https://img-blog.csdnimg.cn/42f6f3bdc9b24bc483e26eaa6942f9de.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)  
![](https://img-blog.csdnimg.cn/a48d743a0ab142a9ac2087ca3916d0ef.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)  
[关系模式](https://so.csdn.net/so/search?q=%E5%85%B3%E7%B3%BB%E6%A8%A1%E5%BC%8F&spm=1001.2101.3001.7020)  
![](https://img-blog.csdnimg.cn/76aee11e19ca4163887867cc40c7ce8a.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)  
![](https://img-blog.csdnimg.cn/c254a7e0cfd94095b75ca0aeb5d5c0f9.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

> ![](https://img-blog.csdnimg.cn/1a14660f9fc549fdbd82d878f6d19b1b.png)

【答案】  
![](https://img-blog.csdnimg.cn/7887c27a09dc4caeb96ad11bb131aa5f.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)  
当外码属性不是主属性是可以取空值

![](https://img-blog.csdnimg.cn/ddd7e56ec43845d5aba78ea008d5e8ee.png)  
【答案】

**等值连接**：连接运算符是“=”的连接运算称为[等值连接](https://so.csdn.net/so/search?q=%E7%AD%89%E5%80%BC%E8%BF%9E%E6%8E%A5&spm=1001.2101.3001.7020)，它是从关系R和S的广义笛卡尔积中选取A，B属性值相等的那些元组

**自然连接**：自然连接是一种特殊的等值连接，它要求两个关系中进行比较的分量必须是相同的属性组，并且在结果中把重复的属性列去掉

![](https://img-blog.csdnimg.cn/5b903ca5f47c47739ddf4868d76e4017.png)  
【答案】

并、差、笛卡尔积、投影和选择是基本运算。其余运算（交、连接、除）均可由基本运算导出

### 应用题

> ![](https://img-blog.csdnimg.cn/a20b47dceac34250b39e0a03cf88d77d.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)  
> ![](https://img-blog.csdnimg.cn/297f2f5a72a242048840be1ca372fb0d.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)  
> ![](https://img-blog.csdnimg.cn/586e2b79959146b885d4d63959f12003.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)  
> ![](https://img-blog.csdnimg.cn/33de47db2bfb487c93e598a0af6caec9.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)  
> ![](https://img-blog.csdnimg.cn/0223d09f9eed48fdb0da7e5a63929b7d.png)

【答案】

（1）： Π S N O ( σ J N O = ′ J 1 ′ ( S P J ) ) \\Pi\_{SNO} (\\sigma\_{JNO='J1'}(SPJ)) ΠSNO(σJNO\=′J1′(SPJ))

（2）： Π S N O ( σ J N O = ′ J 1 ′ ∧ P N O = ′ P 1 ′ ( S P J ) ) \\Pi\_{SNO} (\\sigma\_{JNO='J1' \\land PNO='P1'}(SPJ)) ΠSNO(σJNO\=′J1′∧PNO\=′P1′(SPJ))

（3）： Π S N O ( Π S N O , P N O ( σ J N O = ′ J 1 ′ ( S P J ) ) ⋈ Π P N O ( σ C O L O R = ′ 红 ′ ( P ) ) ) \\Pi\_{SNO}(\\Pi\_{SNO,PNO}(\\sigma \_{JNO='J1'}(SPJ))\\bowtie \\Pi\_{PNO}(\\sigma\_{COLOR='红'}(P))) ΠSNO(ΠSNO,PNO(σJNO\=′J1′(SPJ))⋈ΠPNO(σCOLOR\=′红′(P)))

（4）： Π J N O ( S P J ) − Π J N O ( σ c i t y = ′ 天 津 ′ ∧ C o l o r = ′ 红 ′ ( S ∧ S P J ∧ P ) ) \\Pi\_{JNO}(SPJ)-\\Pi\_{JNO}(\\sigma\_{city='天津' \\land Color='红'}(S\\land SPJ \\land P)) ΠJNO(SPJ)−ΠJNO(σcity\=′天津′∧Color\=′红′(S∧SPJ∧P))

（5）： Π J N O , P N O ( S P J ) ÷ Π P N O ( σ S N O = ′ S 1 ′ ( S P J ) ) \\Pi\_{JNO,PNO}(SPJ) \\div \\Pi\_{PNO}(\\sigma\_{SNO='S1'}(SPJ)) ΠJNO,PNO(SPJ)÷ΠPNO(σSNO\=′S1′(SPJ))

第三章：关系数据库标准语言SQL
================

## 第一节：SQL概述

### 一：SQL的产生与发展

此部分没什么考点，但可以做一定了解

*   [这一篇文章大家有时间可以看看，真可谓天妒英才（点击跳转）](https://www.sohu.com/a/448543330_468731)

![](https://img-blog.csdnimg.cn/edae591253224db4848111d9b2bf6a67.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)  
不过需要注意以下几点

*   目前，没有任何一个数据库系统能够支持SQL标准的所有概念和特性
*   许多软件厂商对SQL基本命令集还进行了不同程度的扩充和修改
*   **我们介绍的是SQL的基本概念和基本功能，并不是针对某个厂商，具体实现起来可能有所差异，所以还需要大家查阅相关手册**
*   为了演示，我们使用的是MYSQL，具体安装细节，请见[（数据库系统概论|王珊）第三章关系数据库标准语言SQL-第零节：MYSQL环境安装和表的建立以及一些注意事项](https://zhangxing-tech.blog.csdn.net/article/details/122552342)  
    ![](https://img-blog.csdnimg.cn/a8ee835d98b74c58a08bfc29b17a0312.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_13,color_FFFFFF,t_70,g_se,x_16)

### 二：SQL特点

SQL集**数据查询(dataquery)**、**数据操纵(datamanipulation)**、**数据定义(data definition)** 和 **数据控制(data control)** 功能于一体， 其主要特点包括以下几部分

#### （1）综合统一

SQL集数据定义语言、数据操纵语言、数据控制语言的功能于一体，语言风格统一，可以独立完成数据库生命周期中的全部活动，包括以下一系列操作要求

*   定义和修改、删除关系模式，定义和删除视图，插入数据，建立数据库
*   对数据库中的数据进行查询和更新
*   数据库重构和维护
*   数据库安全性、完整性控制，以及事务控制
*   嵌入式SQL和动态SQL定义

#### （2）高度非过程化

用SQL进行数据操作时，**只要提出“做什么”，而无须指明“怎么做”**，因此无须了解存取路径。存取路径的选择以及SQL的操作过程由系统自动完成

#### （3）面向集合的操作方式

而**SQL采用集合操作方式**，不仅操作对象、查找结果可以是元组的集合，而且一次插入、删除、更新操作的对象也可以是元组的集合

#### （4）以同一种语法结构提供多种使用方式

**SQL可作为独立语言**：SQL既是独立的语言，又是嵌入式语言。作为独立的语言，它能够独立地用于联机交互的使用方式，用户可以在终端键盘上直接键入SQL命令对数据库进行操作

**SQL可作为嵌入式语言**：SQL语句可以嵌入到高级语言（例如C++、Java等）程序中，供程序员设计程序时使用

而且在这两种不同的使用方式下，**其语法结构仍然基本是一致的**

#### （5） 语言简洁，易学易用

SQL功能极强，但由于设计巧妙，语言十分简洁，完成核心功能只用了9个动词（下表）。SQL接近英语口语，因此易于学习和使用  
![](https://img-blog.csdnimg.cn/8110ab91aedb4b57887ca6466a650e47.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

### 三：SQL的基本概念

支持SQL的关系[数据库管理系统](https://so.csdn.net/so/search?q=%E6%95%B0%E6%8D%AE%E5%BA%93%E7%AE%A1%E7%90%86%E7%B3%BB%E7%BB%9F&spm=1001.2101.3001.7020)（例如MYSQL）当然支持关系数据库三级模式结构

*   **外模式**：包括若干视图（view）和部分基本表（base table）
*   **内模式**：包括若干存储文件（stored file）

![](https://img-blog.csdnimg.cn/c226ac1f65104a5d890c1f255dc325fa.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

注意基本表和视图

*   **基本表**：基本表就是本身独立存在的表，在关系数据库管理系统中**一个关系就对应了一个基本表**，一个或多个基本表对应一个存储文件。一个表可以带若干索引，索引可以存放在存储文件中
*   **视图**：从一个或几个基本表中导出的表，它本身不独立存储在数据库中，也即数据库中只存放视图的定义而不存放视图对应的数据，视图是一个**虚表**

### 四：基本数据类型

学习任何一门高级语言，必定会首先学习它的数据类型，例如`int`、`char`等。SQL也是如此，其常用数据类型如下

*   注意：不需要刻意记忆，常用的也就那么几个，用着用着就熟悉了，这里展示的目的只是做查询手册用
*   **常用数据类型已用黑体标出**

#### （1）数值类型

![](https://img-blog.csdnimg.cn/a56856fc5a40453e963ace696d0e5f3c.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

#### （2）日期和时间类型

![](https://img-blog.csdnimg.cn/8d7472c4c8bf4211834c9423621294c8.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

#### （3）字符串类型

## 第二、三节：数据定义

### 零：有关说明

#### （1）安装数据库与建表

*   关于数据库如何安装，表如何建立这里不再介绍，请移步：[（数据库系统概论|王珊）第三章关系数据库标准语言SQL-第零节：MYSQL环境安装和表的建立以及一些注意事项](https://zhangxing-tech.blog.csdn.net/article/details/122552342)
*   所用表为（上面文章中也有完整代码）：  
    ![](https://img-blog.csdnimg.cn/013a2479007d4c6dadd2ee7f9873a1db.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

#### （2）一些语法说明

由于我们使用的MYSQL所以有些语法和可能和SQL标准有所差异，甚至无法实现，总结如下

**①：关于语法中的括号**

*   **<>**：尖括号用于分隔字符串
*   **\[\]**：方括号表示规则中的可选元素，可以选择也可以省略
*   **{}**：花括号表示聚集规则中的元素，必须明确指定

**②：其它**

*   在SQLserver中我们可以用 `CREATE DATABASE`来创建数据库，而用`CREATE SCHEMA`来创建架构。但是在MYSQL中两者是同等作用的，可以认为没有区别。所以下面介绍时没有实际的演示例子
*   在MYSQL中字符串用的不是单引号，而是\`\`（键盘上数字1左边的那个）
*   在MYSQL中创建模式时是没有后面的`AUTHROIZATION <用户名>`的
*   **MYSQL中大小写均可行**

* * *

回归正题，SQL的数据定义主要包括以下内容

*   模式定义
*   表定义
*   视图定义
*   索引定义

![](https://img-blog.csdnimg.cn/37ec2e55519140af99da914dd08ed67f.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

*   注意**修改视图和修改模式时只能删除重建**

* * *

### 一：模式的定义和删除（SCHEMA）

**注意：在SQLserver中我们可以用 CREATE DATABASE来创建数据库，而用CREATE SCHEMA来创建架构。但是在MYSQL中两者是同等作用的，可以认为没有区别。所以下面介绍时没有实际的演示例子**

#### （1）定义模式

**语法：`CREATE SCHEMA <模式名> AUTHORIZATION <用户名>`（注意上面语法说明）**

*   **如果没有指定 <模式名>， 那么<模式名>隐含为<用户名>**
*   定义模式本质是定义了一个**命名空间**
*   创建模式的同时也可以创建其它东西：`CREATE SCHEMA <模式名> AUTHORIZATION <用户名> [<表定义子句> | <视图定义子句> | <授权定义子句>]`

#### （2）删除模式

**语法：`DROP SCHEMA <模式名><CASCADE|RESTRICT>`（注意上面语法说明）**

*   `CASCADE`：表示**级联**，也即删除模式时会删除该模式中所有数据库对象
*   `RESTRICT`：表示**限制**，也即在删除时如果该模式下定义了其它对象，则拒绝

### 二：基本表的定义、删除和修改（TABLE）

#### （1）定义基本表

**语法**：  
![](https://img-blog.csdnimg.cn/2cf408a165bc49b1b42ff3c92cd5fd8e.png)

*   建表的同时通常还可以定义与该表有关的完整性约束条件（参照前几节内容）
*   **如果完整性约束条件涉及该表的多个属性列，则必须定义在表级上，否则既可以在列级上也可以在表级上**

**演示**：  
【例1】：建立学生表`Student`，其中`Sno`是主码，且`Sname`不能重复

    CREATE TABLE Student
    (
    	Sno CHAR(9) PRIMARY KEY, //主码
    	Sname CHAR(20) UNIQUE,	//唯一值
    	Ssex	CHAR(2),
    	Sage SMALLINT,
    	Sdept CHAR(20)
    );


![](https://img-blog.csdnimg.cn/b32cfb0dca444def88d9e753bda7a013.png)  
【例2】：建立[课程表](https://so.csdn.net/so/search?q=%E8%AF%BE%E7%A8%8B%E8%A1%A8&spm=1001.2101.3001.7020)`Course`，其中`Cno`是主码，`Cname`不能取空值，`Cpno`代表先修课（意思是学习该课前必须先学习某个课程），它是外码，需要参照本表，参照列为`Cno`

    CREATE TABLE Course
    (
    	Cno CHAR(4) PRIMARY KEY,//主码
    	Cname CHAR(20) NOT NULL,//非空
    	Cpno CHAR(4),
    	Credit SMALLINT,
    	FOREIGN KEY (Cpno) REFERENCES Course(Cno)//表级完整性，Cpno是外码，被参照表示Course，被参照列是Cno
    );


![](https://img-blog.csdnimg.cn/f0b44a11abbe400992248ae90fcb6376.png)  
【例3】：建立学生选课表`SC`，其中`Sno`和`Cno`是外码，分别参照`Student`表的`Sno`列和`Course`表的`Cno`列

*   `Sno`和`Cno`是`SC`的主码，必须使用表级完整性定义

    CREATE TABLE SC
    (
    	Sno CHAR(9),
    	Cno CHAR(4),
    	Grade SMALLINT,
    
    	PRIMARY KEY(Sno,Cno),//必须使用表级完整性定义
    	FOREIGN KEY(Sno) REFERENCES Student(Sno),
    	FOREIGN KEY(Cno) REFERENCES Course(Cno)
    )
    

![](https://img-blog.csdnimg.cn/28ad92c161b4436b988d5103a493acc4.png)

#### （2）修改基本表

**语法**：  
![](https://img-blog.csdnimg.cn/ee787b17b1e44ecdb4361f8f76c1b841.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

*   **`ADD`：用于增加新列，新的列级完整性约束条件和新的表级完整性约束条件**
*   **`DROP COLUMN`：用于删除表中的列**
*   **`DROP CONSTRAINT`：用于删除指定的完整性约束条件**
*   **`ALTER COLUMN`：用于修改原有的列定义**

**演示**：

【例4】：向`Student`表中增加“入学时间”列，数据类型为“日期型”

    ALTER TABLE Student ADD Sentrance DATE;


![](https://img-blog.csdnimg.cn/5f16c97cb475453db31b2e6dba69cbe3.png)  
【例5】：将`Student`表“年龄”这一列的数据类型由改为 `INT`

    ALTER TABLE Student ALTER COLUMN Sage CHAR;


【例6】：`Course`表中的`Cname`必须取唯一值

    ALTER TABLE Course ADD UNIQUE(Cname);


【例7】：删除`Student`表中的“入学时间”列

    ALTER TABLE Student DROP COLUMN Sentrance CASCADE;


![](https://img-blog.csdnimg.cn/5e62f9eeb4fe4fc5a6ae2efd61ff5818.png)  
【例8】：删除`Course`表中`Cname`的唯一约束

*   此部分看完这个就明白了：[（数据库系统概论|王珊）第五章数据库完整性-第四、六、七节：约束命名子句、断言和触发器](https://zhangxing-tech.blog.csdn.net/article/details/122654008)

    ALTER TABLE Course DROP INDEX Cname;
    

MYSQL在删除约束时有一些不一样，请点击查看：[链接](https://www.begtut.com/sql/sql-ref-drop-constraint.html)

#### （3）删除基本表

**语法**：  
![](https://img-blog.csdnimg.cn/fae55e92650e4bfa91e8ccc3a99de49c.png)

*   **选择`RESTRICT`**：欲删除的基本表不能被其他表的约束所引用（比如CHECK、FOREIGN KEY等）、不能有视图、不能有触发器（trigger），不能有存储过程或函数等
*   **选择`CASCADE`**：没有限制条件，所有相关依赖对象连同基本表一起删除

**演示**：

【例9】：删除`Student`表，使用`RESTRICT`

*   由于`SC`表参照的是`Student`，所以删除不成功

    DROP TABLE student RESTRICT;
    

![](https://img-blog.csdnimg.cn/42c859bfd6644183bc1cd6b717e06130.png)

### 三：索引的建立与删除（INDEX）

当表的数据量较大时，查询操作就会十分耗时。**建立索引是加快查询速度的有效手段**

*   数据库索引类似于图书后面的索引，能快速定位需要查询的内容

![](https://img-blog.csdnimg.cn/268748a6f88243678de9e8b66817b609.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

**用户可以根据应用环境的需要在基本表上建立一个或多个索引，类型有**

*   顺序文件上的索引
*   B+树索引
*   散列索引
*   位图索引

**索引虽然能加快查询速度，但也有缺点**

*   需要占用一定的存储空间
*   会提高查询速度但是会降低更新速度

#### （1）建立索引

**语法**：  
![](https://img-blog.csdnimg.cn/dbd9b112a0054167bb3c84d78de6ce81.png)

*   **`<表名>`**：要建立索引的基本表的名字
*   **索引可以建立在该表的一列或多列上，各列之间使用逗号分隔**
*   **每个<列名>后面还可以用<次序>指定索引值的排列次序，可选ASC-升序（默认）或DESC-降序**
*   **UNIQUE**：表明此索引的每一个索引值只对应唯一的数据记录
*   **CLUSTER**：表示需要建立聚簇索引（第七章会讲到）

**演示**：

【例10】：请按以下要求建立索引

*   `Student`表按学号升序建立唯一索引
*   `Course`表按课程号升序建立唯一索引
*   `SC`表按学号升序和课程号降序建立唯一索引

    CREATE UNIQUE INDEX Stusno ON Student(Sno);
    CREATE UNIQUE INDEX Coucno ON Course(Cno);
    CREATE UNIQUE INDEX SCno ON SC(Sno ASC,Cno DESC);
    

#### （2）修改索引

**语法**：  
![](https://img-blog.csdnimg.cn/e5148e5c937d414a9848b0209ec29e71.png)  
**演示**：

【例11】：将`SC`表的`SCno`索引改名为`SCSno`

    ALTER INDEX SCno RENAME TO SCSno


#### （3）删除索引

**语法**：  
![](https://img-blog.csdnimg.cn/6f760184ed48498886cf36ddfd40aaf1.png)

**演示**：  
【例12】：删除`SC`表的SCSno`索引`

```sql
DROP INDEX SCSno

//如果失败，也可这样写
DROP INDEX SCSno on SC;
DROP INDEX SC.SCSno;
```

## 第四节：数据查询

### 一：单表查询（查询时只涉及一张表）

#### （1）选择表中的若干列

##### A：查询指定列

**演示：**

【例1】查询`Student`表中的学生及年龄

    SELECT Sname,Sage from Student;


![](https://img-blog.csdnimg.cn/97f36ebd6b774a0e941675eda3e61c4c.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

##### B：查询全部列

**语法：**

*   `*`作为通配符表示全部

**演示：**

【例2】查询`Student`表中全部列

    SELECT * from Student;


![](https://img-blog.csdnimg.cn/8a047d620dc242a1890087f063352b5b.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

##### C：查询经过计算的值

**语法：SELECT子句的`<目标列表达式>`不仅可以是属性列，还可以是表达式，具体有**

*   算数表达式
*   字符串常量
*   函数
*   列别名

###### ①：算数表达式

**演示：**

【例3】根据年龄计算学生的出生日期

    SELECT Sname,2022-Sage from Student;


![](https://img-blog.csdnimg.cn/63a46a4982c44db393ea3e17c3395171.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

###### ②：字符串常量及函数

**演示：**

【例4】使用小写字母展示所在系别

    SELECT Sname,LOWER(Sdept) from student;


![](https://img-blog.csdnimg.cn/9702c20d9b8d4c54839b4675a9df257f.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_15,color_FFFFFF,t_70,g_se,x_16)

###### ③：使用列别名改变查询结果标题

**演示：**

【例5】查询`Student`表中的`Sname`和`Sage`，列标题起别名为“姓名”和年龄

    SELECT Sname `姓名`,Sage `年龄` from student;


![](https://img-blog.csdnimg.cn/184d94f83ef54362841775046780b456.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

#### （2）选择表中的若干行（元组）

##### A：消除取值重复的行（DISTINCT）

**语法：前面说过投影操作可能会导致相同的行出现所以其结果必须消除重复行。可以使用`DISTINCT`消除**

**演示：**

【例6】：查询`SC`表的`Sno`列，然后消除重复学号

    SELECT DISTINCT Sno from SC;


![](https://img-blog.csdnimg.cn/2148b19e0a7a431fa73cdbe94247ebcb.png)

##### B：查询满足条件的元组

**语法：通过WHERE子句实现，常用的查询条件如下**  
![](https://img-blog.csdnimg.cn/a3c32c0cd68a43fe8ec27a5be039c2fa.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

###### ①：比较大小

**演示：**

【例7】在`SC`表中查询成绩大于85的同学的学号

    SELECT Sno,Grade from SC
    WHERE Grade > 85;


![](https://img-blog.csdnimg.cn/3eead6c6654d4626b0d22f090e4acacf.png)

###### ②：确定范围

**演示：**

【例8】查血年龄在闭区间\[19,20\]的学生

    SELECT Sname,Sage from student
    WHERE Sage BETWEEN 19 AND 20;


![](https://img-blog.csdnimg.cn/45503a4bedbd4ddbb97e7aca270b759a.png)  
【例9】查血年龄不在闭区间\[19,20\]的学生

    SELECT Sname,Sage from student
    WHERE Sage NOT BETWEEN 19 AND 20;


![](https://img-blog.csdnimg.cn/32ad6d4b21bd4f06b033f599a380a49a.png)

###### ③：确定集合

**演示：**

【例10】查询数字1是否在集合(1,2,3)中

*   由于满足，所以会返回1

    SELECT 1 IN (1,2,3);
    

![](https://img-blog.csdnimg.cn/cf715022bff645e699c7bb12a049fd69.png)

【例11】查询数学系（MA）和计算机科学系（CS）学生的姓名

    SELECT Sname,Sdept from student
    WHERE Sdept IN('MA','CS');


![](https://img-blog.csdnimg.cn/1f622c9454024cb48c85e481c714a5a4.png)

【例12】查询非数学系（MA）和非计算机科学系（CS）学生的姓名

    SELECT Sname,Sdept from student
    WHERE Sdept NOT IN('MA','CS');


![](https://img-blog.csdnimg.cn/57ec64a6fb684477b023c45340f23938.png)

###### ④：字符匹配

注意：

*   可以使用`=`代替`LIKE`，使用`!=`代替`NOT LIKE`
*   `%`可以代替多个字符
*   `_`只能代替一个字符

**演示：**

【例13】查询所有男生

    SELECT Sname from student
    WHERE Ssex LIKE '男';


![](https://img-blog.csdnimg.cn/0cd5f14c53c042cb9d3193435ca57ff9.png)  
【例14】查询所有姓刘的学生（%代替多个）

    SELECT Sname FROM student 
    WHERE Sname like '刘%';


![](https://img-blog.csdnimg.cn/e04ecb63224a47fa9034c2fe9c9931e7.png)

###### ⑤：转义字符

注意：

*   `ESCAPE '＼'` 表示将“ ＼” 翻译为转义字符

**演示：**

【例15】假设`Course`表中有一门课叫做`DB_Design`

*   如果不作处理，这里的`_`代替某个字符，产生歧义

    SELECT Cno,Ccredit
    FROM Course
    WHERE Cname LIKE 'DB\_Design' ESCAPE '\';
    

###### ⑥：涉及空值的查询

**演示：**

【例16】查询缺少成绩的学生的学号和相应的课程号

*   某些学生选修课程后没有参加考试，所以有选课记录，但没有考试成绩

    SELECT Sno Cno FROM SC
    WHERE Grade IS NULL;
    

![](https://img-blog.csdnimg.cn/981d9804728442579a6fbd3e46f6b1fa.png)

###### ⑦：多重条件查询

注意：

*   `AND`和 `OR`来联结多个查询条件
*   `AND`的优先级高于`OR`
*   可以用括号改变优先级

**演示：**

【例17】 查询计算机系年龄在20岁以下的学生姓名

    SELECT * FROM student
    WHERE Sdept='CS' AND Sage < 20;


![](https://img-blog.csdnimg.cn/f332b7529e314f6a93d2e3015ce2683c.png)

#### （3）ORDER BY子句

**语法：ORDER BY子句对查询结果按照一个或多个属性列进行排序**

*   ASC-升序（默认）
*   DESC-降序

**演示：**

【例18】查询选修了3号课程的学生的学号及其成绩，查询结果按分数[降序排列](https://so.csdn.net/so/search?q=%E9%99%8D%E5%BA%8F%E6%8E%92%E5%88%97&spm=1001.2101.3001.7020)

    SELECT Sno,Grade
    from SC
    WHERE Cno='3'
    ORDER BY Grade DESC;


![](https://img-blog.csdnimg.cn/6f205ee3ee4f4876b23f542503ca4dda.png)

【例19】查询全体学生情况，查询结果按所在系的系号升序排列，同一系中的学生按年龄降序排列

    SELECT *
    FROM student
    ORDER BY Sdept,Sage DESC;


![](https://img-blog.csdnimg.cn/25e2906b9f704a8ba3903c63a68b1879.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_19,color_FFFFFF,t_70,g_se,x_16)

#### （4）聚集函数

**语法：主要有以下几种**  
![](https://img-blog.csdnimg.cn/03b2cab78c434dafb90f6accf809a5a9.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

**演示：**

【例20】查询学生的总人数

    SELECT COUNT(Sno)
    FROM student;


![](https://img-blog.csdnimg.cn/8feb23d51e9c4648ab0b438eff301357.png)  
【例21】查询选修了课程的学生人数

    SELECT COUNT(DISTINCT Sno) Num
    FROM SC;


![](https://img-blog.csdnimg.cn/02c753f55db546a3989122866953a31d.png)  
【例22】 计算2号课程的学生平均成绩

    SELECT AVG(Grade)
    FROM SC 
    WHERE Cno = '2';


![](https://img-blog.csdnimg.cn/c9193d752bce4b9e9b891e857aa6287d.png)  
【例23】查询选修2号课程的学生最高分数

    SELECT Sno,MAX(Grade)
    FROM SC 
    WHERE Cno='2';


![](https://img-blog.csdnimg.cn/f9041848be6147a497c7b4815910b46c.png)

#### （5）GROUP BY子句

**语法：GROUP BY子句将查询结果按某一列或多列的值分组，值相等的分为一组**

*   分组目的是为了**细化聚集函数的作用对象：若未分组，聚集函数将会作用于整个查询结果；若分组，聚集函数将会作用于每一个组，也即每一个组都有一个函数值**
*   需要注意：**WHERE子句作用于整个表或视图，从中选择出满足条件的元组；HAVING短语作用于组，从中选择满足条件的组**

相信读完之后大家可能还是有点迷糊，举个例子。比如我要查询“各个课程对应的选课人数”，如果没有`GROUP BY`子句

    SELECT Cno,Count(Sno)
    FROM sc;


由于它会作用于整个查询结果，所以直接统计出了记录的条数  
![](https://img-blog.csdnimg.cn/78bcf98f315e430bb7a648ec927373da.png)  
如果加入`GROUP BY`子句，按照课程号分组，**那么`GROUP BY`会按照`Cno`进行分组，相同的为一组，然后在每组内统计`Sno`**

    SELECT Cno,Count(Sno)
    FROM sc
    GROUP BY Cno;


![](https://img-blog.csdnimg.cn/1357320be958415fa367e476fa1c6a31.png)

而如果我只想显示那些选课人数大于1以上的课程号呢，**那么就可以使用`HAVING`短语，在组内进行筛选**

    SELECT Cno,Count(Sno)
    FROM sc
    GROUP BY Cno
    HAVING Count(Sno) > 1;


![](https://img-blog.csdnimg.cn/ca032ff259434c12878badbc2b7bd8af.png)  
**演示：**

【例24】查询平均成绩大于等于80分的学生学号和平均成绩

    SELECT Sno,AVG(Grade)
    FROM SC 
    GROUP BY Sno
    HAVING AVG(Grade) >= 80;


![](https://img-blog.csdnimg.cn/dd98750c9a1140caa99779d1e276fc55.png)

### 二：连接查询（查询时涉及多张表）

#### （1）等值连接和非等值连接

**语法：在WHERE子句中写入连接条件（又叫做连接每谓词），其格式为**  
![](https://img-blog.csdnimg.cn/04445338e11c4257b9e38b00ea959b88.png)  
**其中比较运算符有：`=`、`>`、`<`、`>=`、`<=`、`!=`**

*   **当运算符为`=`时称之为等值连接**
*   **当运算符不为`=`时称之为非等值连接**

**演示：**

【例25】查询每个学生及其选修课程的情况

    SELECT student.*,sc.*
    FROM student,sc
    WHERE student.Sno=sc.Sno;


![](https://img-blog.csdnimg.cn/9098dae7e8664c35a00b3efc7bef1a6e.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)  
【例26】使用自然连接（**特殊的等值连接**）完成【例25】

    SELECT student.Sno,Sname,Ssex,Sage,Sdept,Cno,Grade
    FROM student,sc
    WHERE student.sno=sc.sno;


![](https://img-blog.csdnimg.cn/6010830aed8d49c8b1f4255b54f223bc.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)  
【例27】查询选修2号课程且成绩在80分以上的所有学生的学号和姓名

    SELECT Student.Sno,Sname
    FROM student,sc
    WHERE student.Sno=sc.Sno AND //连接条件
    	Cno='2' AND Grade > 80; //其他限定条件


![](https://img-blog.csdnimg.cn/0a277f31557246178600e1e4decb66be.png)

#### （2）自身连接

**语法：所谓自身连接就是指一个表与自己连接**

**演示：**

【例28】查询每一门课的先修课的先修课

*   在`Course`表中有的只是每门课的直接先修课，要想得到先修课的先修课，那么就必须先找到一门课的先修课，然后再按此先修课的课程号查找它的先修课

因此，**为`Course`表取两个别名，分别为`ONE`和`TWO`**

![](https://img-blog.csdnimg.cn/86891c0d38cd493bba9bfb6d3da0d7e4.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

    SELECT ONE.Cno,TWO.Cpno
    FROM Course ONE,Course TWO
    WHERE ONE.Cpno=TWO.Cno;


![](https://img-blog.csdnimg.cn/4838953460f94e42b4b74ad1d66f2bdf.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_14,color_FFFFFF,t_70,g_se,x_16)

当然，还可以继续找**先修课的先修课的先修课**

    SELECT ONE.Cno,THREE.Cpno
    FROM Course ONE,Course TWO,course THREE
    WHERE ONE.Cpno=TWO.Cno AND TWO.Cpno=THREE.Cno;


![](https://img-blog.csdnimg.cn/0f77917831a44722be332a3a9122ecae.png)

#### （3）连接JOIN

**语法：SQL JOIN用于把来自两个或多个表的行结合起来，其格式如下**

    SELECT column_name(s)
    FROM TABLE1//左表
    <某某 JOIN>TABLE2//右表
    ON TABLE1.column_name=TABLE2.column_name


**有如下几类**

*   `INNER JOIN`(`JOIN`)
*   `LEFT JOIN`(`LEFT OUTER JOIN`)
*   `RIGHT JOIN`(`RIGHT OUTER JOIN`)
*   `FULL JOIN`(`FULL OUTER JOIN`)

##### A：INNER JOIN(JOIN)

**`INNER JOIN`(`JOIN`)：关键字在表中存在至少一个匹配时返回行**  
![](https://img-blog.csdnimg.cn/8235d2a68c914bf09cd38e5a0e335c48.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_19,color_FFFFFF,t_70,g_se,x_16)  
**演示：**

【例29】以`sc`和`course`的`Cno`作为比对标准，将相同连接在一起

    SELECT Sno,sc.Cno,Grade,course.Cno,Cname,Cpno,Ccredit
    FROM sc INNER JOIN course ON(sc.Cno=course.Cno);


![](https://img-blog.csdnimg.cn/c4702afa17964fe89116980641e9253d.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

##### B：LEFT JOIN(LEFT OUTER JOIN)

**`LEFT JOIN`(`LEFT OUTER JOIN`)：以左表为标准，若右表中无匹配，则填NULL**

![](https://img-blog.csdnimg.cn/c45245514e184c8d83c6ceb1b84f0a4d.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_15,color_FFFFFF,t_70,g_se,x_16)

    SELECT Sno,sc.Cno,Grade,course.Cno,Cname,Cpno,Ccredit
    FROM sc LEFT JOIN course ON(sc.Cno=course.Cno);


![](https://img-blog.csdnimg.cn/c4702afa17964fe89116980641e9253d.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

##### C：RIGHT JOIN(RIGHT OUTER JOIN)

**`RIGHT JOIN`(`RIGHT OUTER JOIN`)：以右表为标准，若左表中无匹配，则填NULL**

![](https://img-blog.csdnimg.cn/7357f9afd26a453288fc308993a0cc88.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_18,color_FFFFFF,t_70,g_se,x_16)

    SELECT Sno,sc.Cno,Grade,course.Cno,Cname,Cpno,Ccredit
    FROM sc RIGHT JOIN course ON(sc.Cno=course.Cno);


![](https://img-blog.csdnimg.cn/17c4bdf789b242eab9878687a482f149.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

##### D：FULL JOIN(FULL OUTER JOIN)

**`FULL JOIN`(`FULL OUTER JOIN`)：本质就是结合了LEFT JOIN和RIGHT JOIN**

![](https://img-blog.csdnimg.cn/66d741f7877348c49fa7986278c3af6a.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

    SELECT Sno,sc.Cno,Grade,course.Cno,Cname,Cpno,Ccredit
    FROM sc FULL JOIN course ON(sc.Cno=course.Cno);


#### （4）复合条件连接

**语法：没有什么新的东西，就是涉及多张表，多个条件的查询**

**演示：**

【例30】查询每个学生的学号、姓名、选修的课程名及成绩

    SELECT student.Sno,Sname,Cname,Grade
    FROM student,course,sc
    WHERE student.Sno=sc.Sno AND sc.Cno =course.Cno;


![](https://img-blog.csdnimg.cn/f02845b4019f4d74a96741556cdc9297.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_16,color_FFFFFF,t_70,g_se,x_16)

### 三：嵌套查询

在SQL中，一个`SELECT-FROM-WHERE`语句称为一个**查询块**，**将一个查询块嵌套在另一个查询块的WHERE子句或HAVING短语的条件中的查询称之为嵌套查询。比如**

在下面的这个例子中，**内层循环查出来的是符合`Cno=2`的`Sno`集合，外层循环则在该集合内查询是否有满足的`Sno`，有的话显示`Sname`即可**

    SELECT Sname //外层查询
    FROM Student
    WHERE Sno IN
    	(
    		SELECT Sno //内层查询
    		FROM SC
    		WHERE Cno='2'
    	)


![](https://img-blog.csdnimg.cn/986cc55e311f42a497c2a7ab7d0ebdf3.png)

**需要注意以下几点**

*   **子查询的SELECT语句不能使用`ORDER BY`子句**
*   **嵌套查询往往可以转换为对应的连接运算**

#### （1）带有IN谓词的子查询

**语法：嵌套查询中，子查询的结果往往是一个集合，所以IN在嵌套查询中使用次数最为频繁**

**演示：**

【例31】查询与“刘晨”在同一个系学习的学生

*   考虑时可以由内向外，**先查询出刘晨所在的系，然后在该集合中查询满足该集合的学生姓名**

    SELECT student.Sno,Sname,Sdept FROM student WHERE Sdept IN
    (SELECT Sdept FROM student WHERE Sname='刘晨');
    

![](https://img-blog.csdnimg.cn/7c9126e4322e4892b5952796903bc769.png)

当然嵌套查询有时也可以转化为**连接**完成

    SELECT S1.Sno,S1.Sname,S1.Sdept
    FROM Student S1,Student S2
    WHERE S1.Sdept=S2.Sdept AND S2.Sname='刘晨';


【例32】查询选修了课程名为“信息系统”的学生学号和姓名

*   首先在`Course`表中找出“信息系统”的`Cno`，形成`Cno`的集合
*   然后在`SC`表中找出哪些记录的`Cno`在`Cno`集合内，形成`Sno`集合
*   最后在`Student`表中找出哪些记录的`Sno`在`Sno`集合内，形成最终的结果

    SELECT Sno,Sname FROM Student WHERE Sno IN 
    (SELECT Sno FROM SC WHERE Cno IN
    	(SELECT Cno FROM Course WHERE Cname='信息系统')
    );
    

![](https://img-blog.csdnimg.cn/fff0fca87f6f4601986f1753edb837b0.png)  
当然本例也可以使用**连接**完成

    SELECT student.Sno,Sname
    FROM student,course,sc
    WHERE Student.Sno=sc.Sno AND sc.Cno=course.Cno AND Cname='信息系统';


#### （2）带有比较运算符的子查询

**语法：带有比较运算符的子查询是指父查询与子查询之间用比较运算符进行连接。当用户能确切知道内层查询返回的是单个值时，可以使用`>`、`<`、`=`、`>=`、`<=`、`!=`等比较运算符**

**演示：**

【例33】查询与“刘晨”在同一个系学习的学生

*   和【例31】一样，只不过【例31】使用`IN`完成的

    SELECT Sno,Sname,Sdept FROM student WHERE Sdept
    =
    (SELECT Sdept FROM student WHERE Sname='刘晨');
    

![](https://img-blog.csdnimg.cn/e4492d7dcb3d45fb8bd869d722449e47.png)

【例34】找出每个学生超过他选修课程平均成绩的课程号

*   首先内层循环要计算该学生的平均成绩
*   外层循环使用`>=`
*   两个循环要用`Sno`关联在一起（相关子查询）

    SELECT Sno,Cno FROM sc x WHERE Grade
    >=
    >(SELECT AVG(Grade) from sc WHERE x.Sno=Sno);
    

![](https://img-blog.csdnimg.cn/14ce95e514964ea69faba61b1a21d454.png)

##### √：不相关子查询和相关子查询

**不相关子查询：子查询的查询条件不依赖于父查询**

*   像【例31】、【例32】这样的都是不相关子查询

**查询时由里向外、逐层处理。每个子查询在上一级查询处理之前求解，子查询的结果用于建立父查询的查找条件**

**相关子查询：子查询的查询条件依赖于父查询**

*   像【例34】这样的都是相关子查询

**查询时首先会取外层查询中表的第一个元组，根据它与内层查询相关的属性值处理内层查询，若WHERE子句返回为真，则将此元组放入结果表，然后再取外层表的下一个元组，接着重复上述过程**

**比如对于【例34】，其处理过程可能是下面这样的**

①：从外层查询中取出`sc`的一个元祖`x`，将`x.Sno`的值(201215121)传递给内层查询

    SELECT AVG(Grade)
    FROM sc y
    WHERE y.Sno='201215121';


②：执行内层查询，得到值88（近似），用该值代替内层查询，得到外层查询

    SELECT Sno,Cno
    FROM SC X
    WHERE Grade >= 88


③：执行这个查询，得到

    (201215121,1)
    (201215121,3)


然后再取下一个元组重复上述过程即可

#### （3）带有ANY（SOME）或ALL谓词的子查询

**语法：内层查询返回单个值时使用比较运算符。如果返回多个值要用`ANY`（有的是SOME）或`ALL`，然后同时使用比较运算符**

![](https://img-blog.csdnimg.cn/c5550c56e34f4b0bac6f2ce4899ad1c5.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)  
**另外`ANY`或`ALL`与聚集函数、`IN`等谓词有等价关系。也就是说在一些情况下，他们的写法效果作用是一样的**  
![](https://img-blog.csdnimg.cn/cfde6efde6f44212a68f0857e6b70069.png)

*   例如`<ALL`意思是小于所有值，那么它的等价含义就是小于最小值，也即`<MIN`

**演示：**

【例35】查询其他系比计算机科学系**任意**一个学生年龄小的学生姓名和年龄

    SELECT Sname,Sage FROM student WHERE Sage < ANY
    	(SELECT Sage FROM student WHERE Sdept='CS')
    AND Sdept!='CS';


![](https://img-blog.csdnimg.cn/8a2c8a7288704cbb9dd55d77979ddc9d.png)  
由于`<ANY`等价于`<MAX`，所以其等价写法就是

    SELECT Sname,Sage FROM student WHERE Sage <
    	(SELECT MAX(Sage) FROM student WHERE Sdept='CS')
    AND Sdept!='CS';


#### （4）带有EXISTS谓词的子查询

**语法：EXISTS代表“存在量词 ∃ {\\exists} ∃”。带有EXISTS谓词的子查询不返回任何数据，只返回`true`或`false`。另外，由EXISTS引出的子查询，其目标列表达式通常都是`*`，因为给出列名没有实际意义**

*   若内层查询结果非空，则外层WHERE子句返回`true`
*   若内层查询结果为空，则外层WHERE子句返回`false`

**与EXISTS相对的便是NOT EXISTS**

*   若内层查询结果为空，则外层WHERE子句返回`true`
*   若内层查询结果非空，则外层WHERE子句返回`false`

**需要注意的是，一些带有EXISTS和NOT EXISTS谓词的子查询不能被其他形式的子查询等价替换；但是所有带IN谓词，比较运算符，ANY和ALL谓词的子查询都可以用带EXISTS谓词的子查询替换**

**演示：**

【例36】查询所有选修了1号课程的学生姓名

*   处理时，首先会取外层查询中`Student`表的第一个元组，根据它与内层查询相关的属性值（`Sno`）处理内层查询，若`WHERE`子句返回为`true`则取外层查询中该元组的`Sname`放入结果表

    SELECT Sname FROM student WHERE 
    EXISTS
    (SELECT * from sc where Sno=student.Sno AND Cno='1');
    

![](https://img-blog.csdnimg.cn/e769e622fb2045429f81f8e8e699cb94.png)

【例37】查询与“刘晨”在同一个系学习的学生

*   和【例31】一样，这里用EXISTS代替IN

    SELECT Sno,Sname Sdept FROM student s1 WHERE
    EXISTS
    	(select * FROM student WHERE Sdept=s1.Sdept AND Sname='刘晨');
    

![](https://img-blog.csdnimg.cn/69356106ed3546168328734d81bd6e54.png)

【例38】查询选修了全部课程的学生姓名

*   它等价于：**查询这样一个学生，没有一门课是它不选的**

![](https://img-blog.csdnimg.cn/3447702db2a04524a65f4647cf4ac640.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

### 四：集合查询

**语法：SELECT语句的查询结果是元组的集合，所以多个SELECT语句的结果可进行集合操作。主要有**：

*   并操作：`UNION`
*   交操作：`INTERSECT`
*   差操作：`EXCEPT`

**需要注意的是查询结果的列数必须相同且对应项的数据类型也必须相同**

**演示：**

【例39】查询计算机科学系的学生及年龄不大于19岁的学生

    SELECT Sname,Sage,Sdept FROM student WHERE Sdept='CS' 
    UNION
    SELECT Sname,Sage,Sdept FROM student WHERE Sage<=19;


![](https://img-blog.csdnimg.cn/4d79d4890395426eb9548e7a0ed23055.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

【例40】查询计算机科学系的学生与年龄不大于19岁的学生的交集

    SELECT * FROM student WHERE Sdept='CS'
    INTERSECT
    SELECT * FROM student WHERE Sage <=19;

## 第五节：数据更新

SQL数据更新主要有三种形式

*   插入数据（INSERT）
*   修改数据（UPDATE）
*   删除数据（DELETE）

### 一：插入数据（INSERT）

#### （1）插入元组

**语法：格式如下，用于将新元组插入指定表中。需要注意**

*   `INTO`子句中没有出现的属性列，新元组在这些列上将会取`NULL`
*   若`INTO`子句中没有指明任何属性列名，则新插入的元祖必须在每个属性列上均有值

![](https://img-blog.csdnimg.cn/93a441256646481a9039e63212692a3b.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

**演示：**

【例1】将一个新学生元组 **（学号：200215128；姓名：陈冬；性别：男；所在系：IS；年龄：18岁）** 插入到Student表中

    INSERT
    INTO student(Sno,Sname,Ssex,Sdept,Sage)
    VALUES('201215128','陈冬','男','IS',18);


*   注意**顺序可以和表不一致**

![](https://img-blog.csdnimg.cn/686138abb487419ca4ff556a4a503d7d.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

【例2】插入学生张成民

    INSERT
    INTO student
    VALUES('201215126','张成民','男',18,'CS');


*   注意由于没有指定顺序，所以**按照必须按照表中属性列的顺序插入，否则会导致插入错误**

![](https://img-blog.csdnimg.cn/52f1ee2db0cb42c6b8eff6844dfb27f5.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

【例3】插入一条选课记录（201215128,1）

    INSERT
    INTO sc(Sno,Cno)
    values('201215128','1');


*   在这种情况下，`Grade`属性列会设置为`NULL`
*   需要注意如果没有给出属性列，则**必须执行`Grade`为`NULL`**

![](https://img-blog.csdnimg.cn/75ac235d145845af963acfd5f38baa82.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_13,color_FFFFFF,t_70,g_se,x_16)  
【例4】插入多条记录

    INSERT 
    INTO student 
    VALUES 
    (201515000,'小赵','男',30,'IS')，
    (201515001,'小钱','女',28,'MA')，
    (201515002,'小孙','男',33,'MJ')，
    (201515003,'小李','女',25,'CS')，
    (201515004,'小周','男',41,'LI');


#### （2）插入子查询结果

**语法：格式如下，子查询同样可以嵌套在`INSERT`语句中用于生成待插入的批量数据**

![](https://img-blog.csdnimg.cn/d58b60a350b448f08f6878b455270f84.png)

**演示：**

【例5】对每一个系，求学生的平均年龄，并把结果存入数据库

    CREATE TABLE dept_age(
    	Sdept char(15),
    	Age SMALLINT
    );
    
    INSERT 
    INTO dept_age(Sdept,Age)
    SELECT Sdept,AVG(Sage)
    FROM student
    GROUP BY Sdept;


![](https://img-blog.csdnimg.cn/c367eca22fb74c5ebc7201c438f1605a.png)

### 二：修改数据（UPDATE）

**语法：格式如下，其功能是修改指定表中满足`WHERE`子句条件的元组**

*   如果省略WHERE子句，则表示要修改表中所有元组

![](https://img-blog.csdnimg.cn/ae9586d56ff742f4b98bbcdef7722ac6.png)

#### （1）修改某一个元组的值

**演示：**

【例6】将学生201215121的年龄改为22岁

    UPDATE student
    set Sage=22
    WHERE Sno='201215121';


![](https://img-blog.csdnimg.cn/784a98b35d0b405a923c3e8771bf39f5.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

#### （2）修改多个元组的值

**演示：**

【例7】将所有学生的年龄增加1岁

    UPDATE student
    set Sage=Sage+1;


![](https://img-blog.csdnimg.cn/32d9b9e9b33a43cf9a9f25be2911a9a7.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

#### （3）带子查询的修改语句

**演示：**

【例8】将CS系所有学生的成绩置0

    UPDATE sc
    SET Grade=0
    WHERE Sno IN
    (
    	SELECT Sno FROM student WHERE Sdept='CS'
    );


![](https://img-blog.csdnimg.cn/e5f56a92e7034c2690b6ce66eb7dd523.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_11,color_FFFFFF,t_70,g_se,x_16)

### 三：删除数据（DELETE）

**语法：格式如下，其功能是从指定表中删除满足`WHERE`子句条件的所有元组，注意**

*   `DELETE`删除的是表的数据，而不是表的定义
*   如果省略`WHERE`子句，那么就表示删除全部元组

![](https://img-blog.csdnimg.cn/e45c2afc96444072be578fdaa0d0cb17.png)

#### （1）删除某一个元组的值

**演示：**

【例9】删除学号为201215128的学生记录

    DELETE 
    FROM student
    WHERE Sno='201215128';


![](https://img-blog.csdnimg.cn/36cea86cb87a4411ad15be135122d304.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

#### （2）删除多个元组的值

**演示：**

【例10】删除所有的学生选课记录

    DELETE
    FROM SC；


#### （3）带子查询的删除语句

**演示：**

【例11】删除计算机科学系所有学生的选课记录

    DELETE FROM sc
    WHERE Sno IN
    	(SELECT Sno FROM student WHERE Sdept='CS');

## 第六、七节：视图

### 一：关于视图

#### （1）什么视图

**视图：视图是一个虚表，其本质就是一条`SELECT`语句，而查询结果被赋予了一个名字，也即视图名字。或者说视图本身不包含任何数据，它只包含映射到基表的一个查询语句，当基表数据发生变化时，视图数据也随之变化。其目的就是在于方便，简化数据操作**

#### （2）什么时候会用到视图

简单点说，**当我们感觉查询语句太过复杂且不好操控时**就可以[创建视图](https://so.csdn.net/so/search?q=%E5%88%9B%E5%BB%BA%E8%A7%86%E5%9B%BE&spm=1001.2101.3001.7020)，直接

    SELECT * FROM [view]


#### （3）视图的作用

*   视图能够简化用户的操作
*   视图使用户能以多种角度看待同一数据
*   视图对重构数据库提供了一定程度的逻辑独立性
*   视图能够对机密数据提供安全保护
*   适当的利用视图可以更清晰的表达查询

### 二：视图的定义和删除

#### （1）建立视图

**语法：使用`CREATE VIEW`语句创建视图，格式如下**![](https://img-blog.csdnimg.cn/35453393eb694f159939b678b6dd963f.png)

*   子查询可以是**任意的`SELECT`语句**（是可以含有`ORDER BY`子句和`DISTINCT`短语取决于具体系统）
*   组成视图的属性列名**要么全部省略要么全部指定，不能有第三种情况**
*   如果省略视图列名，则其列名默认由 **`SELECT`子句目标列诸字段组成**

##### A：简单创建

**演示：**

【例1】建立信息系IS学生的视图

    CREATE VIEW IS_student
    AS 
    SELECT Sno,Sname,Sage,Sdept
    FROM student
    WHERE Sdept='IS'


![](https://img-blog.csdnimg.cn/b3c0ad2963b04eae9f511234e57f38b6.png)

##### B：基于多个基表的视图

**演示：**

【例2】建立计算机科学系选修了1号课程的学生视图

    CREATE VIEW CS1
    AS
    SELECT student.Sno Sno,Sname,Grade
    FROM student,sc
    WHERE Sdept='CS' AND student.Sno=sc.Sno AND sc.Cno='1';


![](https://img-blog.csdnimg.cn/2b4fd84d45dc4830b8244ef38e55606f.png)

##### C：基于视图的视图

**演示：**

【例3】 建立计算机科学系选修了1号课程且成绩大于95分的学生的视图

    CREATE VIEW CS2
    AS
    SELECT *
    FROM CS1
    WHERE Grade > 95;


![](https://img-blog.csdnimg.cn/987022f96ec54b508b640c99056ae3a9.png)

##### D：带表达式的视图

**演示：**

【例4】定义一个反映学生出生年份的视图

    CREATE VIEW birthday(Sno,Sname,Syear)
    AS
    SELECT Sno,Sname,2022-Sage
    FROM student;


![](https://img-blog.csdnimg.cn/d396993daa3b4b8997421c246352d1d3.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

##### E：分组视图

*   带有聚集函数和`GROUP BY`

**演示：**

【例5】将学生的学号及他的平均成绩定义为一个视图

    CREATE VIEW stu_grade_avg(Sno,Savg)
    AS
    SELECT Sno,AVG(Grade)
    FROM sc
    GROUP BY Sno;


![](https://img-blog.csdnimg.cn/b18180ddcfd14839a12086785a728e52.png)

#### （2）删除视图

**语法：格式如下，需要注意**

*   基本表删除之后，由该基本表导出的所有视图均无法使用，**但是视图的定义没有从字典中清除**

![](https://img-blog.csdnimg.cn/4faab94addaf4178965b8ea0622e37b7.png)

### 三：视图的查询

**语法：从用户角度出发，查询视图和查询基本表相同；从DBMS角度出发，采用视图消解法，具体来讲**

*   首先进行**有效性检查**
*   接着转换成**等价的**对基本表的查询
*   最后执行**修正**后的查询

这里具体就不再做过多演示了，一般来说转换是能成功进行的，更多细节大家可以了解课本（这部分内容不多）

### 四：视图的更新

**语法：视图是虚表，所以对视图的更新最终会转化为对基本表的更新。为了防止用户通过视图对数据进行更新时，有意或无意地对不属于视图范围内的基本表数据进行操作，可以在定义视图时加上`WITH CHECK OPTION`子句。这样在更新时，如果不满足条件，DBMS会拒绝操作**

#### （1）UPDATE

**演示：**

【例6】将信息系学生视图`IS_Student`中学号201215125的学生姓名改为“刘辰”

    UPDATE is_student
    SET Sname='刘辰'
    WHERE Sno='201215125';


![](https://img-blog.csdnimg.cn/e38deb10ba1c4b4eaff5c19d0401fb04.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

【例7】如果在定义视图`is_student`在定义时加入了`WITH CHECK OPTION`子句，接着再执行【例6】需求

那么在更新时如果将`Sdept`字段改为了’MA’或其他值，DBMS就会拒绝执行，并有下面的错误反馈

    UPDATE is_student
    SET Sdept='MA'
    WHERE Sno='201215125';


> ![](https://img-blog.csdnimg.cn/217941776d7c4d4eb1aa34e8427dd7d4.png)

如果在更新时只修改名字，那么就没有问题

    UPDATE is_student
    SET Sname='德玛'
    WHERE Sno='201215125';


![](https://img-blog.csdnimg.cn/f99e7f391cb841b7b1a584c8d3848c42.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

#### （2）INSERT

**演示：**

【例8】向信息系学生视图`IS_Student`中插入一个新的学生记录：201215129，赵新，20岁

    INSERT INTO is_student
    VALUES('201215129','赵新',20);


![](https://img-blog.csdnimg.cn/3df7025dcf304f8d85098a071791c41e.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

*   这里视图没有数据，且20插入到了错误的地方（如果没有`WITH CHECK OPTION`就会导致这些错误出现）
*   如果假如了`WITH CHECK OPTION`，那么DBMS会拒绝执行

#### （3）DELETE

*   删除数据时，有无`WITH CHECK OPTION`都是一样的

**演示：**

【例9】删除学号为201215125的学生

    DELETE 
    FROM is_student
    WHERE Sno='201215125';


![](https://img-blog.csdnimg.cn/fa3ab49a20e340e093020481c3f3cd35.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

## 习题

### 名词解释

*   **视图**：视图是一个虚表，其本质就是一条`SELECT`语句，而查询结果被赋予了一个名字，也即视图名字。或者说视图本身不包含任何数据，它只包含映射到基表的一个查询语句，当基表数据发生变化时，视图数据也随之变化。其目的就是在于方便，简化数据操作

### 简答题

> ![](https://img-blog.csdnimg.cn/86ea6bdd07c74fc8aefeba5de69424a4.png)

【答案】  
![](https://img-blog.csdnimg.cn/3780002a6726464194fa82eef8f197f0.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

> ![](https://img-blog.csdnimg.cn/01e88d558a4448d8b9e600982a36c870.png)

【答案】

![](https://img-blog.csdnimg.cn/92e297e2a065463593eb3fa680f7b523.png)

> ![](https://img-blog.csdnimg.cn/5c4740d74e3b4d1ca0c7debb7d336b5a.png)

【答案】

基本表是本身独立存在的表，在sQL中一个关系就对应一个表。视图是从一个或几个基本表导出的表。视图本身不独立存储在数据库中，是一个虚表。即数据库中只存放视图的定义而不存放视图对应的数据，这些数据仍存放在导出视图的基本表中。视图在概念上与基本表等同，用户可以如同基本表那样使用视图，可以在视图上再定义视图

> ![](https://img-blog.csdnimg.cn/57033fd6932242dca520a8003f3e3482.png)

【答案】

![](https://img-blog.csdnimg.cn/2bf346cdae654e8cbead1d784dffc0da.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

> ![](https://img-blog.csdnimg.cn/3355a36f5d814c7f840735968324640f.png)

【答案】  
基本表的行列子集视图一般是可更新的。若视图的属性来自[集合](https://so.csdn.net/so/search?q=%E9%9B%86%E5%90%88&spm=1001.2101.3001.7020)函数、表达式，则该视图肯定是不可以更新的

### 应用题

> ![](https://img-blog.csdnimg.cn/f3e1852ee972411e953798796c66da15.png)

【答案】

    SELECT * FROM S WHERE A='10';
    
    SELECT A,B FROM S;
    
    SELECT A,B,S.C,S.D,E,F FROM S,T WHERE S.C=T.C AND S.D=T.D;
    
    SELECT * FROM S,T WHERE S.C=T.C;
    
    SELECT * FROM S,T WHERE A<E;
    
    SELECT S.C,S.D,T.* FROM S,T;


​    

> ![](https://img-blog.csdnimg.cn/7c7fafd4b5424e4f81b3fc9ab68bcaee.png)  
> ![](https://img-blog.csdnimg.cn/b7a45f1dee634f8a9b4eb4fbb9189001.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

*   题目链接：[（数据库系统概论|王珊）第二章关系数据库：习题](https://blog.csdn.net/qq_39183034/article/details/122824387?spm=1001.2014.3001.5501)

【答案】

    SELECT SNO FROM SPJ WHERE JNO='J1';
    
    SELECT SNO FROM SPJ WHERE JNO='J1' AND PNO='P1';
    
    SELECT SPJ.SNO FROM SPJ,P WHERE SPJ.PNO=P.PNO AND JNO='J1' AND COLOR='红';
    
    SELECT JNO FROM SPJ WHERE JNO NOT IN
    (SELECT JNO FROM SPJ,S,P WHERE S.CITY='天津' AND COLOR='红' AND SPJ.SNO=S.SNO AND SPJ.PNO=P.PNO)
    
    ①：先查询S1供应的零件号
    SELECT PNO FROM SPJ WHERE SNO='S1' ，其结果为（P1,P2）
    ②：查询哪一个工程即使用P1又使用P2
    SELECT JON FROM SPJ WHERE PNO='P1' AND JNO IN (SELECT JNO FROM SPJ WHERE PNO='P2');


​    

> ![](https://img-blog.csdnimg.cn/52d1c5a368e8474c8b21bd9950a3bcaa.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

    SELECT SNAME,CTIY FROM S;
    
    SELECT PNAME,COLOR,WEIGHT FROM P;
    
    SELECT JNO FROM SPJ WHERE SNO='S1';
    
    SELECT PNAME,QTY FROM P,SPJ WHERE SPJ.PNO=P.PNO AND JNO='J2';
    
    SELECT PNO FROM SPJ,S WHERE SPJ.SNO=S.SNO AND S.CITY='上海';
    
    SELECT JNAME FROM SPJ,S,J WHERE SPJ.SNO=S.SNO AND SPJ.JNO=J.JNO AND S.CITY='上海';
    
    SELECT JNO FROM SPJ WHERE JNO NOT IN(
    	SELECT JNO FROM SPJ,S WHERE SPJ.SNO=S.SNO AND S.CITY='天津'
    );
    
    UPDATE P SET COLOR='蓝' WHERE COLOR='红';
    
    UPDATE SPJ SET SNO='S3' WHERE SNO='S5' AND JNO='J4' AND PNO='P6';
    
    DELETE FROM S WHERE SNO='S2' DELETE FROM SPJ WHERE SNO='S2';
    
    INSERT INTO SPJ VALUES('S2','J6','P4',200);


​    

> ![](https://img-blog.csdnimg.cn/b9f1a10f228342ffb7511befda86dae8.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

【答案】

    CREATE VIEW VSP AS SELECT SNO,SPJ.PNO,QTY FROM SPJ,J WHERE PPJ.JNO=J.JNO AND J.JNAME='三建'
    
    SELECT PNO,QTY FROM VSP
    
    SELECT * FROM VSP WHERE SNO='S1';

第四章：数据库安全性
==========

## 第一节：数据库安全性概述

在第一节：数据库系统概论我们就说过数据库系统特点之一就是**要提供安全性保护机制**

**数据库的安全性：保护数据库以防止不合法使用所造成的数据泄露、更改或破坏**

### 一：数据库的不安全因素

**1.非授权用户对数据库的恶意存取和破坏:** 一些**黑客**和**犯罪分子**在用户存取数据库时猎取用户名和用户口令，然后**假冒**合法用户偷取、修改甚至破坏用户数据。防范措施有

*   **用户身份鉴别**
*   **存取控制**
*   **视图**

**2.数据库中重要或敏感的数据被泄露:** **黑客和敌对分子**千方百计盗窃数据库中的重要数据，一-些机密信息被暴露。防范措施有

*   **强制存取控制**
*   **数据加密存储**
*   **加密传输**

**3.安全环境的脆弱性:**

### 二：安全标准简介

*   此部分内容主要是了解，可查阅课本，一些重点内容如下

#### （1）信息安全标准的发展简史

![](https://img-blog.csdnimg.cn/1c8d2dfa00204931bdd28fc3c2baf70f.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

#### （2）TCSEC/TDI

##### A：基本内容

*   安全策略
*   责任
*   保证
*   文档

##### B：安全级别划分

![](https://img-blog.csdnimg.cn/c12d97a02d2c4b6c8ef927f3f5f227c7.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

## 第二、三、四、五、六节：数据库安全性控制

数据库相关的安全性措施主要有

*   用户身份鉴别
*   多层存取控制
*   审计
*   视图
*   数据加密

且它们是层层设置的，就像防火墙一样

下图是**数据库安全保护的一个存取控制流程**

![](https://img-blog.csdnimg.cn/8ec8c1185a42477ca0d996f5da4f0361.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

*   首先，数据库管理系统对提出SQL访问请求的数据库**用户进行身份鉴别**，防止不可信用户使用系统
*   然后，在SQL处理层进行**自主存取控制和强制存取控制**，进一步还可以进行推理控制
*   为监控恶意访问，可根据具体安全需求配置**审计规则**，对用户访问行为和系统关键操作进行审计
*   通过设置简单入侵检测规则，对**异常用户行为**进行检测和处理
*   在数据存储层，数据库管理系统不仅存放用户数据，还存储与安全有关的标记和信息(称为**安全数据**)，提供存储加密功能等

### 一：用户身份鉴别

**用户身份鉴别：每个用户在系统中都有一个用户标识。每个用户标识由用户名（user name）和用户标识号（UID）组成。系统内部记录着所有合法用户的标识，每次用户进入系统时，系统会核对用户的身份，只有通过鉴定后才提供相关数据库管理系统的权限**

#### （1）静态口令鉴别

**静态口令鉴别**：一般由**用户自己设定**，设定后就**静态不变**。鉴别时只有输入正确的口令即可。一般用户习惯以自己的生日、电话等作为口令，极易被破解

*   该方式**简单，但是安全性极低**

#### （2）动态口令鉴别

**动态口令鉴别**：该方式的口令是**动态变化的**，每次鉴别时均需使用动态产生的**新口令**登录系统，例如常见的[短信验证码](https://so.csdn.net/so/search?q=%E7%9F%AD%E4%BF%A1%E9%AA%8C%E8%AF%81%E7%A0%81&spm=1001.2101.3001.7020)

*   该方式相较于静态口令，安全性较高

#### （3）生物特征鉴别

**生物特征鉴别**：生物特征是指**生物体唯一具有的，可测量、识别和验证的稳定生物特征**，例如指纹、虹膜等等

*   该种方式相较于传统的口令，安全性有了质的提升

#### （4）智能卡鉴别

**智能卡鉴别**：智能卡是一种**不可复制**的硬件，内置集成电路的芯片，具有硬件加密的功能。智能卡由用户随身携带，登录[数据库管理系统](https://so.csdn.net/so/search?q=%E6%95%B0%E6%8D%AE%E5%BA%93%E7%AE%A1%E7%90%86%E7%B3%BB%E7%BB%9F&spm=1001.2101.3001.7020)时用户将智能卡**插入**专用的读卡器进行身份验证

*   该方式可能会被一些监听技术截取到信息，所以存在安全隐患
*   实际应用中采用**PIN（个人身份识别码）和智能卡结合**的方式提高安全性

### 二：存取控制

**存取控制：存取控制的目的就是确保只授权给有资格的用户访问数据库的权限，其余人等无法接近数据。主要包括以下两个部分**

*   **定义用户权限**：用户对某一数据对象的操作权力称为**权限**。某个用户应该具有何种权限是个**管理问题和政策问题**，而不是技术问题。数据库管理系统的功能是**保证这些决定的执行**。为此，数据库管理系统必须提供适当的语言来**定义用户权限**，这些定义经过编译后存储在数据字典中，被称做**安全规则或授权规则**
    
*   **合法权限检查**：每当用户发出存取数据库的操作请求后(请求一般应包括操作类型、操作对象和操作用户等信息)，数据库管理系统查找数据字典，**根据安全规则进行合法权限检查**，若用户的操作请求超出了定义的权限，系统将**拒绝执行此操作**
    

**而存取控制方法又分为以下两类**

*   **自主存取控制（DAC）**：**用户对于不同的数据库对象有不同的存取权限，不同的用户对同一对象也有不同的权限，而且用户还可将其拥有的存取权限转授给其他用户，因此自主存取控制非常灵活**
*   **强制存取控制（MAC）：每一个数据库对象被标以一定的密级，每一个用户也被授予某一个级别的许可证。对于任意一个对象，只有具有合法许可证的用户才可以存取，因此强制存取控制因此相对比较严格**

#### （1）自主存取控制DAC

##### A：基本概念

**自主存取控制DAC：SQL中自主存取控制主要是通过`GRANT`语句和`REVOKE`语句来实现的。是指用户可以“自主”地决定将数据的存取权限授予何人、决定是否也将“授权”的权限授予别人**

* * *

**授权：用户权限由数据库对象和操作类型这两个要素组成。定义一个用户的存取权限就是定义这个用户可以在哪些数据对象上进行哪些类型的操作。所谓授权就是指定义存取权限**

*   在**非关系系统**中，用户只能对**数据**进行操作，存取控制的数据库对象也仅限于数据本身
*   在**关系数据库系统**中，存取控制的对象不仅有数据本身(基本表中的数据、属性列上的数据），还有**数据库模式(包括数据库、基本表、视图和索引的创建等)**

下表就是**关系数据库中的主要存取权限**

![](https://img-blog.csdnimg.cn/202afc8ee1314578ac465140b086d3af.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

##### B：GRANT与REVOKE

SQL中使用`GRANT`和`REVOKE`语句向用户**授予或收回**对数据的操作权限

###### ①：GRANT

**语法：格式如下，其含义为授予指定用户对指定操作对象的指定操作权限。注意**

*   如果指定了`WITH GRANT OPTION`子句，则**获得某种权限的用户还可以把这种权限再授权给其他用户**。但不允许**循环授权**
*   如果未指定`WITH GRANT OPTION`子句，则**获得某种权限的用户只能使用但无法传播**

![](https://img-blog.csdnimg.cn/23d5b72890494377808d0d840d78f3f4.png)

*   **如果要授权所有权限，可以写`ALL PRIVILEGES`**
*   **如果所有用户接受权限，可以写`PUBLIC`**

**以下对象可以发出`GRANT`**

*   DBA
*   数据库对象的创建者
*   已经拥有该权限的用户

**演示：**

【例1】把**查询**Student表的权限授权给用户U1

    GRANT SELECT 
    ON TABLE Student
    TO U1;


【例2】把对Student表和Course表的全部操作权限授予用户U2和U3

    GRANT ALL PRIVILEGES
    ON TABLE Student,Course
    TO U2,U3;


【例3】把对表SC的查询权限授予所有用户

    GRANT SELECT
    ON TABLE SC
    TO PUBLIC;


【例4】把查询Student表和修改学生学号的权限授给用户U4

    GRANT UPDATE(Sno),SELECT
    ON TABLE Student
    TO U4;


【例5】把对表SC的INSERT权限授予U5用户，并允许将此权限再授予其他用户

    GRANT INSERT
    ON TABLE SC
    TO U5
    WITH GRANT OPTION;


【例6】U5可以把对表SC的INSERT权限授予其他用户，例如U6

    GRANT INSERT
    ON TABLE SC
    TO U6
    WITH GRANT OPTION;


![](https://img-blog.csdnimg.cn/41a2765c986b43d7833f9fa7f6ef89e3.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

###### ②：REVOKE

**语法：格式如下，注意**

*   如果加入`CASCADE`，表示**收回某用户权限的同时也会把该用户所有授权过用户的权限一并收回**

![](https://img-blog.csdnimg.cn/d5a950ad50384f90908d2cd16aaeac5f.png)  
**演示：**

【例7】把用户U4修改学生学号的权限收回

    REVOKE UPDATE(Sno)
    ON TABLE Student
    FROM U4;


【例8】收回所有用户对表SC的查询权限

    REVOKE SELECT
    ON TABLE SC
    FROM PUBLIC;


【例9】把用户U5对SC表的INSERT权限收回，同时收回所有U5授权过的用户的该权限

    REVOKE INSERT
    ON TABLE SC
    FROM U5 CASCADE;


![](https://img-blog.csdnimg.cn/49017c5644364846bf9075d21cd37a14.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

###### ③：创建数据库模式的权限

前面所讲到都是对**数据**的操作权限，而对**创建数据库模式类的数据库对象的授权则由数据库管理员在创建用户时实现**

* * *

**语法：使用`CREATE USER`语句创建用户，其格式如下。注意**

*   只有系统的**超级用户**才有权创建一个新的数据库用户
*   新创建的数据库用户有三种权限：`CONNECT`、`RESCOURCE`、`DBA`

![](https://img-blog.csdnimg.cn/41a2fcfb6f9e4e1fafa1e5df07f33d83.png)

**这三种权限所能做的操作如下表**

![](https://img-blog.csdnimg.cn/8bb9dc6bd2c44db6982ffcce8386f417.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

##### C：数据库角色

**数据库角色：是被命名的一组与数据库操作相关的权限，也即角色是权限的集合。在创建用户时如果为其赋予某种角色，那么用户就自动拥有了该数据库角色所拥有的权限，从而省去了繁琐的授权语句**

###### ①：创建角色

**语法**

![](https://img-blog.csdnimg.cn/6cd45049a94f4d2f8de3aa021b03ea51.png)

###### ②：给角色授权

**语法**

![](https://img-blog.csdnimg.cn/1f1df79daf774885a8f1e3ff805e20bb.png)

###### ③：将一个角色授予其他角色或用户

**语法**

![](https://img-blog.csdnimg.cn/b88e5c6aecd645d7b3d6dc1da1aa4c0e.png)

###### ④：角色权限的收回

**语法**

![](https://img-blog.csdnimg.cn/25d2590a977d4409a9e27924ca9c4825.png)

**综合演示：**

【例1】通过角色来实现将一组权限授予一个用户

    //首先需要创建一个角色R1
    CREATE ROLE R1;
    //接着使用GRANT语句，使角色R1拥有对Student表的权限
    GRANT SELECT ,UPDATE,INSERT
    ON TABLE Student
    TO R1;
    //然后将这个角色授予用户U1、U2、U3，使他们具有角色R1所拥有的全部权限
    GRANT R1
    TO U1,U2,U3
    //最后，也可以通过R1来收回用户的权限
    REVOKE R1
    FROM U1;


#### （2）强制存取控制MAC

##### A：自主存取控制的隐患

自主存取控制(DAC)能够通过授权机制有效地控制对敏感数据的存取。但是由于用户对数据的存取权限是 **“自主”** 的，用户可以自由地决定将数据的存取权限授予何人，以及决定是否也将“授权”的权限授予别人。在这种授权机制下，仍可能存在数据的“**无意泄露**”。比如，甲将自己权限范围内的某些数据存取权限授权给乙，甲的意图是仅允许乙本人操纵这些数据。但甲的这种安全性要求并不能得到保证，因为乙一旦获得了对数据的权限，就可以将数据备份，获得自身权限内的副本，并在不征得甲同意的前提下传播副本。造成这一问题的根本原因就在于，**这种机制仅仅通过对数据的存取权限来进行安全控制，而数据本身并无安全性标记**

要解决这个问题，就需要对系统控制下的所有主客体实施**强制存取控制策略**

##### B：基本概念

**强制存取控制：为保证更高程度的安全，对于任意对象，只有拥有合法许可证的用户才可以存取，它不是用户能直接感知和进行控制的。强制存取控制是对数据本身进行密级标记，无论数据如何复制，标记与数据是一个不可分的整体，只有符合密级标记要求的用户才可以操纵数据**

##### C：主体和客体及敏感度标记

在强制存取控制中，数据库管理系统所管理的全部实体被分为**主体和客体**两大类

**主体：是系统中活动实体，即包括数据库管理系统所管理的实际用户，也包括代表各用户的各进程**

**客体：是系统中的被动实体，是受主体操纵的，例如**

*   文件
*   基本表
*   索引
*   视图

* * *

对于主体和客体，数据库管理系统为它们每个实例(值)指派一个**敏感度标记(label)**，分为若干个级别

*   **绝密（TS）**
*   **机密（S）**
*   **可信（C）**
*   **公开（P）**

**其中**

T S ≥ S ≥ C ≥ P TS\\geq S \\geq C \\geq P TS≥S≥C≥P

##### D：强制存取规则

**主体的敏感度标记称之为许可证级别；客体的敏感度标记称之为密级。强制存取控制机制就是通过对比许可证级别和密级，依次确定主体是否能够存取客体**

* * *

**当某一用户(或某一主体)以标记`label`注册入系统时，系统要求他对任何客体的存取必须遵循如下规则:**

1.  **仅当主体的许可证级别大于或等于客体的密级时，该主体才能读取相应的客体**
2.  **仅当主体的许可证级别小于或等于客体的密级时，该主体才能写相应的客体**

#### （3）DAC与MAC共同构成DBMS的安全机制

系统首先进行**自主存取控制检查**，对通过自主存取控制检查的允许存取的数据库对象再由系统自动进行**强制存取控制检查**，只有通过强制存取控制检查的数据库对象方可存取

![](https://img-blog.csdnimg.cn/c41c3f4111c84853aa54779e045e15c1.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

### 三：视图

**视图机制：通过视图机制把要保密的数据对无权存取的用户隐藏起来，从而自动对数据提供一定程度的安全保护**

**演示：** 在某大学中，假定王平老师只能检索计算机系学生的信息，系主任张明具有检索和增删改计算机系学生信息的所有权限

    CREATE VIEW CS_Student
    AS
    SELECT *
    FROM Student
    WHERE Sdept='CS';
    
    GRANT SELECT
    ON CS_Student
    TO 王平;
    
    GRANT ALL PRIVILEGES
    ON CS_Student
    TO 张明;


### 四：审计

#### （1）基本概念

**审计：审计功能把用户对数据库的所有操作自动记录下来放入审计日志(audit log)中。审计员可以利用审计日志监控数据库中的各种行为，重现导致数据库现有状况的一系列事件，找出非法存取数据的人、时间和内容等。还可以通过对审计日志分析，对潜在的威胁提前采取措施加以防范**

*   审计**很费时间和空间**，所以DBMS往往将审计功能设置为**可选**
*   可审计的事件有**服务器事件、系统权限、语句事件及模式对象事件**，还包括**用户鉴别、DAC和MAC**
*   审计分为**用户级审计**和**系统级审计**
*   审计既能记录成功也即记录失败

#### （2）AUDIT语句和NOAUDIT语句

**`AUDIT`语句和`NOAUDIT`语句分别用来设计审计功能和取消审计功能**

**演示：**

    AUDIT ALTER,UPDATE //对SC表结构或修改SC表数据的操作进行审计
    ON SC
    
    NOAUDIT ALTER,UPDATE
    ON SC


### 五：数据加密

#### （1）基本概念

**数据加密：将明文转换密文，从而无法获知数据的内容，是防止数据库中的数据在存储和传输中失密的有效手段**

#### （2）分类

##### A：存储加密

**非透明存储加密：** 通过多个**加密函数**实现的

**透明存储加密：** 是**内核级加密保护方式**，对**用户**完全透明

*   是数据在写到磁盘时对数据进行加密，授权用户读取数据时再对其进行解密。由于数据加密对用户透明，数据库的应用程序不需要做任何修改，只需在创建表语句中说明需加密的字段即可。当对加密数据进行增、删、改、查询操作时，数据库管理系统将自动对数据进行加、解密工作。基于数据库内核的数据存储加密、解密方法性能较好，安全完备性较高

##### B：传输加密

###### ①：链路加密

对传输数据在**链路层**进行加密，它的传输信息由报头和报文两部分组成，前者是路由选择信息，而后者是传送的数据信息。这种方式对报文和报头均加密

###### ②：端到端加密

对传输数据在**发送端加密，接收端解密**。它**只加密报文，不加密报头**。与链路加密相比，它只在发送端和接收端需要密码设备，而中间节点不需要密码设备，因此它所需密码设**备数量相对较少**。但这种方式不加密报头，从而**容易被非法监听者发现并从中获取敏感信息**

## 习题

### 名词解释

*   **数据库安全性**：保护数据库以防止不合法使用所造成的数据泄露、更改或破坏
*   **用户身份鉴别**：每个用户在系统中都有一个用户标识。每个用户标识由用户名（user name）和用户标识号（UID）组成。系统内部记录着所有合法用户的标识，每次用户进入系统时，系统会核对用户的身份，只有通过鉴定后才提供相关数据库管理系统的权限
*   **存取控制**：存取控制的目的就是确保只授权给有资格的用户访问数据库的权限，其余人等无法接近数据
*   **自主存取控制（DAC）**：用户对于不同的数据库对象有不同的存取权限，不同的用户对同一对象也有不同的权限，而且用户还可将其拥有的存取权限转授给其他用户，因此自主存取控制非常灵活
*   **强制存取控制（MAC）**：每一个数据库对象被标以一定的密级，每一个用户也被授予某一个级别的许可证。对于任意一个对象，只有具有合法许可证的用户才可以存取，因此强制存取控制因此相对比较严格
*   **授权**：用户权限由数据库对象和操作类型这两个要素组成。定义一个用户的存取权限就是定义这个用户可以在哪些数据对象上进行哪些类型的操作。所谓授权就是指定义存取权限
*   **数据库角色**：是被命名的一组与数据库操作相关的权限，也即角色是权限的集合。在创建用户时如果为其赋予某种角色，那么用户就自动拥有了该数据库角色所拥有的权限，从而省去了繁琐的授权语句
*   **审计**：审计功能把用户对数据库的所有操作自动记录下来放入审计日志(audit log)中。审计员可以利用审计日志监控数据库中的各种行为，重现导致数据库现有状况的一系列事件，找出非法存取数据的人、时间和内容等。还可以通过对审计日志分析，对潜在的威胁提前采取措施加以防范

### 简答题

![](https://img-blog.csdnimg.cn/2197e3407aee431f9e293addc573769d.png)

【答案】  
数据库的安全性：保护数据库以防止不合法使用所造成的[数据泄露](https://so.csdn.net/so/search?q=%E6%95%B0%E6%8D%AE%E6%B3%84%E9%9C%B2&spm=1001.2101.3001.7020)、更改或破坏

> ![](https://img-blog.csdnimg.cn/be6f5b5d654c457b8a8593351d08167c.png)

【答案】

![](https://img-blog.csdnimg.cn/260badb0c6914d1ea98d841236b03c43.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

> ![](https://img-blog.csdnimg.cn/ccc7dccf962341aeb513825ab89614de.png)

【答案】

**用户身份鉴别**：每个用户在系统中都有一个用户标识。每个用户标识由用户名（user name）和用户标识号（UID）组成。系统内部记录着所有合法用户的标识，每次用户进入系统时，系统会核对用户的身份，只有通过鉴定后才提供相关[数据库管理系统](https://so.csdn.net/so/search?q=%E6%95%B0%E6%8D%AE%E5%BA%93%E7%AE%A1%E7%90%86%E7%B3%BB%E7%BB%9F&spm=1001.2101.3001.7020)的权限

**存取控制**：存取控制的目的就是确保只授权给有资格的用户访问数据库的权限，其余人等无法接近数据

**视图**：通过视图机制把要保密的数据对无权存取的用户隐藏起来，从而自动对数据提供一定程度的安全保护

**审计**：审计功能把用户对数据库的所有操作自动记录下来放入审计日志(audit log)中。审计员可以利用审计日志监控数据库中的各种行为，重现导致数据库现有状况的一系列事件，找出非法存取数据的人、时间和内容等。还可以通过对审计[日志分析](https://so.csdn.net/so/search?q=%E6%97%A5%E5%BF%97%E5%88%86%E6%9E%90&spm=1001.2101.3001.7020)，对潜在的威胁提前采取措施加以防范

**数据加密**：将明文转换密文，从而无法获知数据的内容，是防止数据库中的数据在存储和传输中失密的有效手段

> ![](https://img-blog.csdnimg.cn/93ea9d9cbbf64af983a7c0b20b11f5c6.png)

【答案】

**自主存取控制DAC**：用户对于不同的数据库对象有不同的存取权限，不同的用户对同一对象也有不同的权限，而且用户还可将其拥有的存取权限转授给其他用户，因此自主存取控制非常灵活

**强制存取控制MAC**：每一个数据库对象被标以一定的密级，每一个用户也被授予某一个级别的许可证。对于任意一个对象，只有具有合法许可证的用户才可以存取，因此强制存取控制因此相对比较严格

> ![](https://img-blog.csdnimg.cn/a0187c9c76a743279257fc4bcf837633.png)

【答案】

![](https://img-blog.csdnimg.cn/1ed8050255464fac9fb51412a8922c68.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)  
![](https://img-blog.csdnimg.cn/266d7cbc86c64ffba9acbdd15a667bef.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

> ![](https://img-blog.csdnimg.cn/5236dbdb8be64096aeae63d5bc48e8b4.png)

【答案】  
![](https://img-blog.csdnimg.cn/184c771d736245a788086b4d977101fd.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

### 应用题

> ![](https://img-blog.csdnimg.cn/f1a5064821df41a3a84ece637ef0c348.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

【答案】


    GRANT ALL PRIVILEGES ON Student,Class TO U1 WITH CHECK OPTION;
    
    GRANT SELECT,UPDATE(Address) ON Student TO U2
    
    GRANT SELECT ON Class to PUBLIC
    
    GRANT SELECT,UPDATE ON Student TO R1;
    
    GRANT R1 TO U1 WITH CHECK OPTION;


​    

> ![](https://img-blog.csdnimg.cn/494d032d45af4457b5fcf63ec199d515.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

*   职工：Workers
*   部门：Department

【答案】

    （1）
    GRANT SELECT ON Workers,Department TO 王明;
    
    （2）
    GRANT INSERT,DELETE ON Workers,Department TO 李勇;
    
    （3）
    GRANT SELECT ON Workers WHEN USER()=NAME TO ALL;
    
    (4)
    GRANT SELECT,UPDATE（工资）ON Workers TO 刘星;
    
    （5）
    GRANT ALTER TABLE ON Workers,Department TO 张新;
    
    （6）
    GRANT ALL PRIVILEGES ON Workers,Department TO 周平 WITH CHECK OPTION;
    
    （7）
    CREATE VIEW 部门工资 AS
     SELECT 部门.名称,MAX（工资）,MIN（工资）,AVG（工资）
     FROM 职工,部门
     WHERE 职工.部门号=部门.部门号
     GROUP BY 职工.部门号
    
    GRANT SELECT ON 部门工资 TO 杨兰;


> ![](https://img-blog.csdnimg.cn/4e84572bde404540869d5de3319d139e.png)

【答案】

*   把GRANT换成REVOKE，把TO换成FROM即可

第五章：数据库完整性
==========

## 第一、二、三节：数据库三大完整性

### 一：数据库完整性概述

#### （1）数据库完整性的基本概念

**数据库完整性：数据库的完整性是指数据的正确性和相容性**

*   **正确性**：数据是符合现实世界语义、反映当前实际状况的。例如性别只能是男或女
*   **相容性**：是指数据库同一对象在不同关系表中的数据是符合逻辑的。比如说年龄一般都在1-100岁，当然也有超过一百岁的，反正没有两百岁，三百岁成仙的人类

#### （2）数据库完整性和安全性的区别

**完整性**：是为了防止数据库中存在**不符合语义的数据**，也就是防止数据库中存在**不正确的数据**。因此，完整性检查和控制的防范对象是**不合语义的、不正确的数据，防止它们进入数据库**

**安全性**：是保护数据库**防止恶意破坏和非法存取**。因此，安全性控制的防范对象是**非法用户和非法操作，防止他们对数据库数据的非法存取**

#### （3）为维护完整性DBMS必须要实现的功能

**1.提供定义完整性约束条件的机制**

*   **完整性约束条件**：是数据库中数据必须满足的语义条件规则
*   SQL标准使用了一系列概念来描述完整性，包括关系模型的**实体完整性、参照完整性和用户定义完整性**

**2.提供完整性检查的方法**

*   **完整性检查**：检查数据是否满足完整性规则的机制

**3.进行违约处理**

### 二：实体完整性

**实体完整性：若属性A是基本关系 R R R的主属性，则属性A不能取空值**

#### （1）定义实体完整性

**定义方法：关系模型的实体完整性在`CREATE TABLE`中用`PRIMARY KEY`定义。注意**

*   **如果主码仅有一个属性（单属性）**：可以定义为**列级约束条件**也可以定义为**表级约束条件**
*   **如果主码有多个属性**：注意**仅能定义为表级约束条件**

**演示**：

如下有几个典型的例子

    将Student表中的Sno属性定义为码
    
    (1)在列级定义主码
    CREATE TABLE Student
    (
    	Sno CHAR(9) PRIMARY KEY，
    	Sname CHAR(20) NOT NULL，     
    	Ssex CHAR(2) ，
    	Sage SMALLINT，
    	Sdept CHAR(20)
    );
    
    (2)在表级定义主码
    CREATE TABLE Student
    (
    	Sno CHAR(9)，  
    	Sname CHAR(20) NOT NULL，
    	Ssex CHAR(2) ，
    	Sage SMALLINT，
    	Sdept CHAR(20)，
    	PRIMARY KEY (Sno)
    ); 
    
    (3)将SC表中的Sno，Cno属性组定义为码
    CREATE TABLE SC
    (
    	Sno CHAR(9) NOT NULL， 
    	Cno CHAR(4) NOT NULL，  
    	Grade SMALLINT，
    	PRIMARY KEY (Sno，Cno)     /*只能在表级定义主码*/
    ); 


#### （2）实体完整性检查和违约处理

**每当插入或对主码列进行更新操作时，DBMS按照实体完整性规则自动进行检查，包括**

*   **检查主码值是否唯一，如果不唯一则拒绝插入或修改**
*   **检查主码的各个属性是否为空，只要有一个为空就拒绝插入或修改**

**其中检查记录中主码值是否唯一有两种方法**

*   **全表扫描**：十分耗时  
    ![](https://img-blog.csdnimg.cn/843ceacafdd64995b3026c0f6e973d75.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)
    
*   **建立索引**：关系数据库管理系统一般都会在主码上自动建立一个索引  
    ![](https://img-blog.csdnimg.cn/f4dc9938cf224d9896cd85ee67174af4.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)
    

### 三：参照完整性

#### （1）定义参照完整性

**定义方法：关系模型的参照完整性在`CREATE TABLE`中用`FOREIGN KEY`定义，同时用`REFERENCES`短语指明这些外码参照哪些表的主码**

**演示**：

定义`sc`表的时候，其`(Sno,Cno)`是主码，分别参照`Sudent`的主码和`Course`表的主码

    CREATE TABLE SC
    (
    	Sno CHAR(9) NOT NULL,
    	Sno CHAR(4) NOT NULL,
    	Grade SMALLINT,
    	
    	PRIMARY KEY(Sno,Cno),
    	FOREIGN KEY(Sno) REFERENCES Student(Sno),
    	FOREIGN KEY(Cno) REFERENCES Course(Cno)
    );


#### （2）参照完整性检查和违约处理

##### A：破坏完整性的行为

参照完整性将表与表联系在了一起，所以对其中一个表的修改很可能会影响到另外一张表

举个例子，被参照表是`Student`，参照表是`sc`，破坏参照完整性的行为及其违约处理如下表所示

![](https://img-blog.csdnimg.cn/e4864b3c42ec4a80bda80abd90f6e55e.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

**对于参照表`sc`的行为**

*   **向`sc`表（参照表）中插入一个元组，这是会被拒绝的**。因为有可能你所插入的元组的`Sno`（外码）无法在`Student`表中找到，这就意味着在成绩表中插入了一个非本班同学的成绩，这显然是不合理的
*   **修改`sc`表（参照表）中的一个元组，这是会被拒绝的**。因为有可能你会修改该元组的`Sno`（外码），这就可能导致`Sno`无法在`Student`表中好到
*   **删除`sc`表（参照表）中的一个元组，这是可行的**。因为它无非就是一条成绩信息

**对于被参照`Student`的行为**

*   **删除`Student`表（被参照表）中的一个元组，这是会被拒绝（也有可能级联删除或设为`NULL`）的**。因为删除一个元组后，该元组所对应的`Sno`（主码）将不复存在，这就有可能导致`sc`表（参照表）中某些元组的`Sno`（外码）在`Student`表中找不到
*   **修改`Student`表（被参照表）中的一个元组，这是会被拒绝（也有可能级联删除或设为`NULL`）的** 。因为一旦修改了该元组的`Sno`属性，就会发生和上面一样的问题
*   **向`Student`表（被参照表）插入一个元组，这是可行的**。因为它无非就是一个新同学嘛

##### B：违约处理措施

###### ①：拒绝

**拒绝**：不允许该操作执行，为**默认策略**

###### ②：级联

**级联**：当删除或修改`Student`表（被参照表）的一个元组导致与`sc`表（参照表）不一致时，**则会删除或修改sc表（参照表）中的所有导致不一致的元组**

*   比如删除`Student`表中`Sno`为“201215121”的元组后，则会从`sc`表中级联删除`sc.Sno='201215121'`的所有元组
*   **注意：** 在这个例子中，按照语义环境选择级联删除是正确的，因为学生信息一旦删除了，那么成绩信息就没有存在的意义了

###### ③：设为空值

假设有下面两个关系（划线为主码）  
![](https://img-blog.csdnimg.cn/79bcb6b87c844e24b7001871b0c67c11.png)

*   参照表为`学生`表
*   被参照表为`专业`表

* * *

**设为空值**：当删除或修改`专业`表（被参照表）的一个元组时造成了不一致，则**将`学生`表（参照表）中的所有造成不一致的元组的对应属性（专业号）设为空值**

*   比如删除`专业`表中专业号为12的专业，那么接着就要把`学生`表中专业号=12的所有元组的专业号设置为空值
*   **注意**：在这个例子中，按照语义环境选择设置为空值是正确的，因为专业一旦删除，表明该学生需要重新分配专业，除非该学生毕业，否则不可能把学生信息给删除

其中关于外码**是否可以取空值**，在前面的文章已经有详细介绍：[](https://zhangxing-tech.blog.csdn.net/article/details/122539916>（数据库系统概论|王珊）第二章关系数据库-第二节、第三节：关系操作和关系完整性</a></p> 
<h3><a name=)C：SQL实现

综上，在定义完整性约束时还要给出相应的处理策略

    CREATE TABLE SC
    (
    	Sno CHAR(9)
    	Sno CHAR(4) 
    	Grade SMALLINT,//是外码也是主码，故不能取空值，实体完整性
    	PRIMARY KEY(Sno,Cno),
    	FOREIGN KEY(Sno) REFERENCES Student(Sno)
    		ON DELETE CASCADE //删除Student表的元组时，级联删除本表相应元组
    		ON UPDATE CASCADE, //更新Student表中的Sno时，级联更新本表相应元组
    	FOREIGN KEY(Cno) REFERENCES Course(Cno)
    		ON DELETE NO ACTION //删除Course表的元组造成不一致时，拒绝执行
    		ON UPDATE CASCADE //更新Course表中的Cno时，级联更新本表相应元组
    );


*   策略可以根据具体环境、语义选择

### 四：用户自定义完整性

用户自定义完整性针对某一具体关系数据库的约束条件，反映**某一具体应用所涉及的数据必须满足的语义要求**

#### （1）属性上的约束条件

##### A：不允许取空值（NOT NULL）

**演示**

    CREATE TABLE SC
    (
    	Sno CHAR(9),
    	Cno CHAR(4),
    	Grade SMALLINT NOT NULL,
    	PRIMARY KEY(Sno,Cno)//定义了实体完整性，隐含了不允许取空值，在列级中可不写
    );


##### B：列值唯一（UNIQUE）

**演示**

    CREATE TABLE DEPT
    (
    	Deptno NUMERIC(2),
    	Dname CHAR(9) UNIQUE NOT NULL, //唯一且不能取空值
    	Location CHAR(10),
    	PRIMARY KEY(Depto)
    );


##### C：满足指定条件（CHECK）

**演示**

例如`Ssex`只能取“男”或“女”

    CREATE TABLE Student
    (
    	Sno CHAR(9) PRIMARY KEY,
    	Sname CHAR(8) NOT NULL,
    	Ssex CHAR(2) CHECK(Ssex IN ('男','女')),
    	Sage SMALLINT,
    	Sdept CHAR(20)
    );


例如`Grade`的取值范围为\[0,100\]

    CREATE TABLE SC
    (
    	Sno CHAR(9),
    	Cno CHAR(4),
    	Grade SMALLINT CHECK(Grade >= 0 AND Grade <= 100),
    	
    	PRIMARY KEY(Sno,Cno),
    	FOREIGN KEY(Sno) REFERENCES Student(Sno),
    	FOREIGN KEY(Cno) REFERENCES Course(Cno)
    );


#### （2）元组上的约束条件

同属性值限制相比，元组级的限制可以设置**不同属性之间**的取值的相互约束条件

**演示**

例如，规定插入男性时，其名字不能以`Ms.`开头

    CREATE TABLE Student
    (
    	Sno Char(9),
    	Sname CHAR(8) NOT NULL,
    	Ssex CHAR(2),
    	Sage SMALLINT,
    	Sdept CHAR(20),
    	PRIMARY KEY(Sno),
    
    	CHECK(Ssex='女' OR Sname NOT LIKE 'Ms.%')
    
    );


*   是女性时条件成立可以插入
*   是男性时，同时还要判断其姓名不能以`Ms.`开头

## 第四、六、七节：约束命名子句、断言和触发器

### 一：[完整性约束](https://so.csdn.net/so/search?q=%E5%AE%8C%E6%95%B4%E6%80%A7%E7%BA%A6%E6%9D%9F&spm=1001.2101.3001.7020)命名子句（CONSTRAINT）

SQL中还提供了完整性约束命名子句`CONSTRAINT`用来对完整性约束条件进行**命名**，从而可以灵活地增加、删除一个完整性约束条件

*   还记得（数据库系统概论|王珊）第三章关系数据库标准语言SQL-第二、三节：数据定义</a>这一节讲到修改基本表中，有些选项便是关于约束条件的，命名后后续修改时直接<strong>使用名字即可</strong></li></ul> 
    
    #### （1）完整性约束命名子句
    
    **语法**
    
    ![](https://img-blog.csdnimg.cn/45bd0fa685e343b18d5e99979cd0c168.png)
    
    **演示**
    
    例如， 建立学生登记表`Student`，要求学号在90000~99999之间，姓名不能取空值，年龄小于30，性别只能是“男”或“女”
    
        CREATE TABLE Student
        (
        	Sno NUMERIC(6) CONSTRAINT C1 CHECK(Sno BETWEEN 90000 AND 99999),
        	Sname CHAR(20) CONSTRAINT C2 NOT NULL,
        	Sage NUMERIC(3) CONSTRAINT C3 CHECK(Sage < 30),
        	Ssex CHAR (2) CONSTRAINT C4 CHECK(Ssex IN ('男','女')),
        	CONSTRAINT StudentKey PRIMARY KEY(Sno)
        );
    
    
    *   因此在`Student`表上建立了StudentKey、C1、C2、C3、C4这5个约束条件
    
    例如，建立教师表`Teacher`,要求每个教师的应发工资不低于3000元。应发工资是工资列`Sal`与扣除项`Deduct`之和
    
        CREATE TABLE Teahcer
        (
        	Tno NUMERIC(4) PRIMARY KEY,
        	TName CHAR(10),
        	TSal NUMERIC(7,2),
        	TDeduct NUMERIC(7,2),
        	TDeptno NUMERIC(2),
        	
        	CONSTRAINT TeacherKey FOREIGN KEY(Tdeptno) REFERENCES DEPT(TDeptno),
        	CONSTRAINT C1 CHECK(TSal+TDeduct >= 3000)
        );
    
    
    *   因此在`Teacher`表上建立了TeacherKey、C1这2个约束条件
    
    #### （2）修改表中的完整性限制
    
    **语法**：这一点，我们在（数据库系统概论|王珊）第三章关系数据库标准语言SQL-第二、三节：数据定义</a>这一节中讲到过</p> 
    
    ![](https://img-blog.csdnimg.cn/ee787b17b1e44ecdb4361f8f76c1b841.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16))
    
    *   **`ADD`：用于增加新列，新的列级完整性约束条件和新的表级完整性约束条件**
    *   **`DROP COLUMN`：用于删除表中的列**
    *   **`DROP CONSTRAINT`：用于删除指定的完整性约束条件**
    *   **`ALTER COLUMN`：用于修改原有的列定义**
    
    **演示**
    
    例如，去除`Student`表中对性别的限制
    
        ALTER TABLE Student
        DROP CONSTRAINT C4;
    
    
    例如， 修改`Student`表中的约束条件，要求学号改为在0~100之间，年龄由小于30改为小于40
    
    *   策略就是**先删除再增加**
    
    ```sql
    ALTER TABLE Student DROP CONSTRAINT C1;
    ALTER TABLE Student ADD CONSTRAINT C1 CHECK(Sno BETWEEN 0 AND 100);
    ALTER TABLE Student DROP CONSTRAINT C3;
    ALTER TABLE Student ADD CONSTRAINT C3 CHECK(Sage < 40);
    ```
    
    
    
    ### 二：断言（ASSERTION）
    
    
    *   在高级语言，例如C++、JAVA中就在经常使用断言`assert`，所以它的作用大家应该比较熟悉
    
    在SQL中通过声明性断言可以指定**更具一般性的约束（例如涉及多表、聚集操作等）**。创建断言后，**任何对断言中所涉及关系的操作都会触发DBMS对断言的检查，任何断言为`FALSE`的操作都会被拒绝**
    
    #### （1）创建断言
    
    **语法：在SQL中，使用`CREATE ASSERTION`语句来创建断言，格式如下**
    
    ![](https://img-blog.csdnimg.cn/dee12d91bdbd463898184d806e1b1cb1.png)
    
    **演示**
    
    例如，限制数据库课程最多60名学生选修
    
        CREATE ASSERTION ASS_SC_DB_NUM 	CHECK
        (
        	60 >= 
        	(
        		SELECT count(*)
        		FROM Cource,sc
        		WHERE sc.Cno=Course.Cno AND Course.Cname='数据库'
        	)
        );
    
    
    例如，限制每一门课程最多60名学生选修
    
        CREATE ASSERTION ASS_SC_CNUM CHECK
        (
        	60 >=
        	ALL
        	(
        		SELECT count(*)
        		FROM SC
        		GROUP BY Cno
        	)
        );
    
    
    #### （2）删除断言
    
    **语法**：
    
    ![](https://img-blog.csdnimg.cn/aebea0a5dbcd47a5b3c26a2caa08d73d.png)
    
    ### 三：触发器（TRIGGER）
    
    **触发器（TRIGGER）：是用户定义在关系表上的一类由事件驱动的特殊过程，在满足一定条件或达到一定阈值时会自动触发。可以进行更为复杂的检查和操作，具有更精细和更强大的数据控制能力**
    
    #### （1）定义触发器
    
    触发器又叫做**事件-条件-动作(event- condition-action)规则**。当**特定的系统事件**(如对一个表的增、删、改操作，事务的结束等)发生时，对规则的条件进行检查，如果条件成立则执行规则中的动作，否则不执行该动作。**规则中的动作体可以很复杂，可以涉及其他表和其他数据库对象，通常是一段SQL存储过程**
    
    *   就如同古老的VB语言就是一种以事件驱动为机制的语言，例如一些控件的`CLICK`（点击）事件等等
    
    * * *
    
    **语法：SQL使用`CREATE TRIGGER`语句定义触发器，其格式如下**
    
    *   只有表的**创建者**才可以在表上创建触发器，并且一个表上只能创建有限数量的触发器
    
    ![](https://img-blog.csdnimg.cn/cbc9bf8b1ccf438f8c8099b0fa00a21c.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)
    
    *   **触发器名**：可以包含模式名，也可以不包含；**同一模式下，触发器名必须是唯一的，并且触发器名和表名必须在同一模式下**
    *   **表名**：**触发器只能定义在表上，不可在视图上**。当基本表的数据发生变化时，将激活定义在该表上相应触发事件的触发器
    *   **触发事件**：**可以是INSERT、DELETE或UPDATE，也可以是它们的组合**；同样也可以`UPDATE OF<列名,...,>`，也即进一步指明哪些列变化时需要激活触发器；\*\*`AFTER/BEFORE`\*\*是触发时机
    *   **触发器类型**：**触发器按照所触发动作的间隔尺寸可以分为行级触发器（`FOR EACH ROW`）和语句级触发器（`FOR EACH STATEMENT`）**；语句级会执行一次，行级执行的次数以表的具体行数而定
    *   **触发条件**：触发器被激活时，只有当**触发条件为真**时触发动作体才执行，否则触发动作体不执行；**如果省略WHEN触发条件，则触发动作体在触发器激活后立即执行**
    *   **触发动作体**：**触发动作体既可以是一个匿名`PL/SQL` 过程块，也可以是对已创建存储过程的调用**。如果是**行级触发器**，用户可以在过程体中使用`NEW`和`OLD`引用`UPDATE/INSERT`事件之后的新值和`UPDATE/DELETE`事件之前的旧值;如果是**语句级触发器**，则不能在触发动作体中使用`NEW`或`OLD`进行引用。**如果触发动作体执行失败，激活触发器的事件(即对数据库的增、删、改操作)就会终止执行，触发器的目标表或触发器可能影响的其他对象不发生任何变化**
    
    **演示**：
    
    【例如】当对`SC`表的`Grade`属性进行修改时，**若分数增加了10%**，则将此次操作  
    记录到另一个表`SC_ U (Sno、Cno、 Oldgrade、 Newgrade)` 中，其中`Oldgrade`是修改前的分数，`Newgrade` 是修改后的分数
    
        CREATE TRIGGER SC_T //触发器名字
        AFTER OF Grade ON SC //在对sc表的Grade更新后再触发
        
        REFERENCING
         	OLDROW AS OldTuple
          	NEWROW AS NewTuple
        FOR EACH ROW //行级触发器，也即每更新一次，下面规则就会执行一次
        WHEN (NewTuple.Grade >= 1.1*OldTuple.Grade) //触发条件为真才会执行
        	INSERT INTO SC_U (Sno,Cno,OldGrade,NewGrade)
        	VALUES(OldTuple.Sno,OldTuple.Cno,OldTuple.Grade,NewTuple.Grade)
    
    
    *   在本例中`REFERENCING`指出**引用的变量**
    *   如果触发事件是`UPDATE`操作并且有`FOR EACH ROW`子句，则可以引用的变量有`OLDROW`和`NEWROW`,分别表示**修改之前的元组和修改之后的元组**
    *   若没有`FOR EACH ROW`子句，则可以引用的变量有`OLDTABLE`和`NEW TABLE`, `OLDTABLE`表示**表中原来的内容**，`NEWTABLE`表示**表中变化后的部分**
    
    * * *
    
    【例如】将每次对`Student`表的 **插入操作所增加的学生个数** 记录到`StudentInsertLog`中
    
        CREATE TRIGGER Student_Count
        AFTER INSERT ON Student
        REFERENCING
        	NEWTABLE AS DELTA
        
        FOR EACH STATEMENT //语句级
        	INSERT INTO StudentInsertLog(Numbers)
        	SELECT COUNT(*) FROM DELTA
    
    
    *   `DELTA`是一个关系名，其模式与`Student`相同，包含的元组是`INSERT`语句增加的元组
    
    * * *
    
    【例如】定义一个`BEFORE`行级触发器，为教师表`Teacher`定义完整性规则“**教授的工资不得低于4000元，如果低于4000元，自动改为4000元**
    
        CREATE TRIGGER Insert_Or_Update_Sal
        BEFORE INSERT OR UPDATE ON Teacher
        REFERENCING NEWROW AS NewTuple
        FOR EACH ROW
        BEGIN //这是一个PL/SQL过程快
        	IF(NewTouple.Job='教授') AND (NewTouple.Sal < 4000)
        		THEN NewTouple.Sal:=4000;
        	END IF
        END;
    
    
    #### （2）激活触发器
    
    触发器的执行是由触发器事件激活的，如果同一个表上有多个触发器，激活时会按照以下顺序执行
    
    **1\. 执行该表上的`BEFORE`触发器  
    2\. 激活触发器的SQL语句  
    3\. 执行该表上的`AFTER`触发器**
    
    对于同一个表上的多个`BEFORE(AFTER)`触发器，遵循“**谁先创建谁先执行**”的原则，即按照触发器创建的时间先后顺序执行
    
    #### （3）删除触发器
    
    **语法：**
    
    ![](https://img-blog.csdnimg.cn/38bc01b559714e9b9f0ae90c856f4303.png)

## 习题

### 名词解释

*   **数据库完整性**：是为了防止数据库中存在不符合语义的数据，也就是防止数据库中存在不正确的数据。因此，完整性检查和控制的防范对象是不合语义的、不正确的数据，防止它们进入数据库
*   **完整性约束条件**：是数据库中数据必须满足的语义条件规则
*   **断言**：在SQL中通过声明性断言可以指定更具一般性的约束（例如涉及多表、聚集操作等）。创建断言后，任何对断言中所涉及关系的操作都会触发DBMS对断言的检查，任何断言为`FALSE`的操作都会被拒绝
*   **触发器（TRIGGER）**：是用户定义在关系表上的一类由事件驱动的特殊过程，在满足一定条件或达到一定阈值时会自动触发。可以进行更为复杂的检查和操作，具有更精细和更强大的数据控制能力

### 简答题

### 应用题

> ![](https://img-blog.csdnimg.cn/0d3b233c7b884556a29ebebfb05e505b.png)

【答案】

![](https://img-blog.csdnimg.cn/1eb533c1a0f24fa491e7c4d2c69e34da.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

> ![](https://img-blog.csdnimg.cn/659bcad82c794b9e9c2fb44cd565cb68.png)

![](https://img-blog.csdnimg.cn/adaaab948e6e44618ce3404bd88c9c93.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

> ![](https://img-blog.csdnimg.cn/611c3af5f8014354a453cde88bd3dd72.png)

**完整性约束条件**：是指数据库中的数据应该满足的语义约束条件。一般可以分为六类：

*   静态列级约束
*   静态元组约束
*   静态关系约束
*   动态列级约束
*   动态元组约束
*   动态关系约束

**①静态列级约束是对一个列的取值域的说明，包括以下几个方面**:

*   对**数据类型**的约束，包括数据的类型、长度、单位、精度等
    
*   对**数据格式**的约束
    
*   对**取值范围或取值集合**的约束
    
*   对**空值**的约束
    
*   其他约束
    

**②静态元组约束就是规定组成一个元组的各个列之间的约束关系**，静态元组约束只局限在单个元组上

**③静态关系约束是在一个关系的各个元组之间或者若干关系之间常常存在各种联系或约束，常见的静态关系约束有**

*   实体完整性约束
*   参照完整性约束
*   函数依赖约束

**④动态列级约束是修改列定义或列值时应满足的约束条件**，包括下面两方面:

*   修改列定义时的约束
*   修改列值时的约束

**⑤动态元组约束是指修改某个元组的值时需要参照其旧值，并且新旧值之间需要满足某种约束条件**

**⑥动态关系约束是加在关系变化前后状态上的限制条件，例如事务一致性、 原子性等约束条件**

> ![](https://img-blog.csdnimg.cn/ea556af2ce224f8196cf85335a2d0a62.png)

![](https://img-blog.csdnimg.cn/506ea2b0d56344aaa5fe82ea68c9bd1e.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

![](https://img-blog.csdnimg.cn/a7385302043341e0b0b70957d99353c2.png)

【答案】

*   外码是否可以取空值
*   需要考虑以下更新、删除问题  
    ![](https://img-blog.csdnimg.cn/f74143e9c6df4f87bb99dc5b63b3b0d8.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

![](https://img-blog.csdnimg.cn/10be3e28a5e4458988d79b27bb9fc69d.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

    CREATE TABLE Dept
    (
    	Dept NUMBER(4) PRIMARY KEY,
    	Name VARCHAR(10),
    	Manager_name VARCHAR(10),
    	Phone NUMBER(11)
    );
    
    CREATE TABLE Worker
    (
    	Nol NUMBER(4) PRIMARY KEY,
    	Name VARCHAR(10),
    	Age NUMBER(4) CHECK(W_age <= 60),
    	Job VARCHAR(10),
    	Wages NUMBER(7,2),
    	Deptno NUMBER(10),
    	
    	FOREIGN KEY(W_deptno) REFERENCES Dept(Deptno)
    );


> ![](https://img-blog.csdnimg.cn/c07f3380fe044f3494a61147f241bc5b.png)

【答案】

[实体完整性](https://so.csdn.net/so/search?q=%E5%AE%9E%E4%BD%93%E5%AE%8C%E6%95%B4%E6%80%A7&spm=1001.2101.3001.7020)

![](https://img-blog.csdnimg.cn/181dcca629c94e28a2d594e066189528.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)  
参照完整性

![](https://img-blog.csdnimg.cn/c183717df97f4e92afb495b19b77cce8.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

第六章：关系数据理论
==========

## 第一节：为什么要研究关系数据理论

**一句话，研究关系数据库理论就是为了设计出合适的关系模式，也即合适、高效的表**

### 一：概念回顾：[关系模式](https://so.csdn.net/so/search?q=%E5%85%B3%E7%B3%BB%E6%A8%A1%E5%BC%8F&spm=1001.2101.3001.7020)

*   相关文章：[（数据库系统概论|王珊）第二章关系数据库-第一节：关系数据结构及其形式化定义](https://blog.csdn.net/qq_39183034/article/details/122535012?ops_request_misc=%257B%2522request%255Fid%2522%253A%2522164300528716780271512022%2522%252C%2522scm%2522%253A%252220140713.130102334.pc%255Fblog.%2522%257D&request_id=164300528716780271512022&biz_id=0&utm_medium=distribute.pc_search_result.none-task-blog-2~blog~first_rank_ecpm_v1~rank_v31_ecpm-1-122535012.nonecase&utm_term=%E5%85%B3%E7%B3%BB%E6%A8%A1%E5%BC%8F&spm=1018.2226.3001.4450)

* * *

**关系模式：关系模式就是对关系的描述，可以表示为**

R ( U , D , D O M , F ) R(U,D,DOM,F) R(U,D,DOM,F)

*   R R R：关系名
*   U U U：组成该关系的属性名集合
*   D D D： U U U中属性所来自的域
*   D O M DOM DOM：属性向域的映像集合
*   F F F：属性间数据的依赖关系集合（此部分属于第六章：关系数据理论的内容）

**由于 D D D、 D O M DOM DOM与模式设计关系不大，所以在本章中把关系模式看作一个三元组**

R < U , F > R<U,F> R<U,F\>

*   **并且仅当 U U U上的一个关系 r r r满足 F F F时， r r r称为关系模式 R < U , F > R<U,F> R<U,F\>的一个关系**

### 二：数据依赖

**数据依赖：数据依赖是一个关系内部属性与属性之间的一种约束关系。 这种约束关系是通过属性间值的相等与否体现出来的数据间相关联系。它是现实世界属性间相互联系的抽象，是数据内在的性质，是语义的体现。主要有两种类型的数据依赖**

*   **函数依赖（FD）**：**属性间的这种依赖关系类似于数学中的函数y=f(x)，自变量x确定之后，相应的函数值y也就唯一地确定了**。比如描述一个学生的关系，可以有学号(`Sno`)、姓名(`Sname`)、 系名(`Sdept`) 等几个属性，由于一个学号只对应一个学生，一个学生只在一个系学习。因而当“学号”值确定之后，学生的姓名及所在系的值也就被唯一地确定了。**记作`Sno→Sname`, `Sno-> Sdept`**
    
*   **多值依赖（MVD）**：后面会说
    

### 三：一个例子：不遵循关系数据理论导致的问题

【例】建立一个描述学校教务的数据库，该数据库涉及的对象包括学生的学号  
(`Sno`)、所在系(`Sdept`)、 系主任姓名(`Mname`)、课程号(`Cno`)和成绩(`Grade`)。假设用一个单一的关系模式`Student`来表示，则该关系模式的属性集合为

U = ( S n o , S d e p t , M n a m e , C n o , G r a d e ) U=({Sno,Sdept,Mname,Cno,Grade}) U\=(Sno,Sdept,Mname,Cno,Grade)

**根据现实世界我们所熟知的，会有以下事实**

*   一个系有若干学生，但一个学生只属于一个系
*   一个系只有一名(正职)负责人
*   一个学生可以选修多门课程，每门课程有若干学生选修
*   每个学生学习每一门课程有一个成绩

**这样的语义限制，将会导致属性上的函数依赖**

![](https://img-blog.csdnimg.cn/58935dd86c71496992fe3f31f8a6e4e3.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)  
记作：

F = ( S n o − > S d e p t , S d e p t − > M n a m e , ( S n o , C n o ) − > G r a d e ) F=(Sno->Sdept,Sdept->Mname,(Sno,Cno)->Grade) F\=(Sno−\>Sdept,Sdept−\>Mname,(Sno,Cno)−\>Grade)

**下表是关系模式`Student`某一时刻的一个实例**

![](https://img-blog.csdnimg.cn/f718f2e6ed844908bee9f2c08bdedccf.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

**我们说，这样的关系模式是失败的，因为它存在以下问题**

*   **数据冗余**：比如，每一个系的系主任姓名重复出现，重复次数与该系所有学生的所有课程成绩出现次数相同，这将浪费大量的存储空间
*   **更新异常**：比如，某系更换系主任后，必须修改与该系学生有关的每一个元组
*   **插入异常**：如果一个系刚成立，尚无学生，则无法把这个系及其系主任的信息存入数据库
*   **删除异常**：如果某个系的学生全部毕业了，则在删除该系学生信息的同时，这个系及其系主任的信息也丢掉了

而如何解决这些问题，就是下一节：**规范化**所要讨论的内容了

## 第二节：规范化


**本节其实就干了两件事情** ：

*   首先讨论一个关系属性间不同的**依赖情况**，讨论如何根据属性间依赖情况来判定关系是否具有**某些不合适的性质**
*   通常按属性间依赖情况来区分关系规范化程度为**第一范式、第二范式、第三范式和第四范式**等，然后直观地描述如何将**具有不合适性质的关系转换为更合适的形式**

### 一：[函数依赖](https://so.csdn.net/so/search?q=%E5%87%BD%E6%95%B0%E4%BE%9D%E8%B5%96&spm=1001.2101.3001.7020)

#### （1）函数依赖

**函数依赖**：简单点说就是，**如果X能确定Y（或者说Y依赖X，记作`X->Y`）那么就不可能存在两个元组，在X相同时Y却不同**

如下在`Student`关系中，`Sno`确定`Sdept`，所以不可能出现两个相同的`Sno`却对应不同的`Sdept`  
![](https://img-blog.csdnimg.cn/1a9ac44a731c41fba05c6ebfcefbc40e.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

#### （2）平凡函数依赖与非平凡函数依赖

**平凡函数依赖与非平凡函数依赖：**

*   **非平凡函数依赖**：如果X确定Y，但Y并不是X的子集，那么则称X是Y的非平凡函数依赖
*   **平凡函数依赖**：如果X确定Y，Y是X的子集，那么则称X是Y的平凡函数依赖

如下是一个典型例子  
![](https://img-blog.csdnimg.cn/27184227b4e1454fa7dc23ff811770c7.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

**注意**  
![](https://img-blog.csdnimg.cn/3ec9472dbdff4635ac293af741cd7545.png)

#### （3）完全函数依赖与部分函数依赖

**完全函数依赖与部分函数依赖：**

*   **完全函数依赖**：要想X是Y完全函数依赖，那么X中任何一个分量都不能丢，哪怕少一个，X都无法确定Y
*   **部分函数依赖**：X是Y的部分函数依赖，则表明即便去掉X中的一个或多个分量，剩余分量也能确定Y

如下是一个经典例子

![](https://img-blog.csdnimg.cn/5f08c55170074d47a8e8324b06cc5328.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

#### （4）传递函数依赖

**传递函数依赖：如果X是Y的非平凡函数依赖，且Y不是X的函数依赖，同时Y是Z的非平凡函数依赖，则称Z对X传递函数依赖，记作**

![](https://img-blog.csdnimg.cn/fabf48d16f5749cf85bd36edef92fef0.png)

*   注意，**如果Y是X的函数依赖，则称Z直接依赖于X**

如下是一个经典例子

![](https://img-blog.csdnimg.cn/de269e229b674c14a798833a47f4030c.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

### 二：多值依赖（此部分内容看过BCNF之前再看）

#### （1）多值依赖的例子

【例】学校中**某一门课程由多个教师讲授，他们使用相同的一参考书。每个教师可以讲授多门课程，每种参考书可以供多门课程使用**。可以用一个非规范化的关系来表示教师T、课程C和参考书B之间的关系

![](https://img-blog.csdnimg.cn/b2a1d8e80a0c458a8a54fbc19bd2f05f.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_17,color_FFFFFF,t_70,g_se,x_16)  
把这张表变成一张规范化的二维表  
![](https://img-blog.csdnimg.cn/32e80c43a8d544a3aaa4da5c96497c67.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_18,color_FFFFFF,t_70,g_se,x_16)  
[关系模型](https://so.csdn.net/so/search?q=%E5%85%B3%E7%B3%BB%E6%A8%A1%E5%9E%8B&spm=1001.2101.3001.7020)Teaching（C,T,B）的码是**全码**，也即所有属性组都是[候选码](https://so.csdn.net/so/search?q=%E5%80%99%E9%80%89%E7%A0%81&spm=1001.2101.3001.7020)，或者只有一个候选码

**这样的关系会产生下面的一些问题**

*   **插入异常**：例如，某一课程(如物理)增加一名讲课教师(如周英)时，必须插入多个(这里是三个)元组: `(物理，周英，普通物理学)`，`(物理，周英，光学原理)`，`(物理，周英，物理习题集)`
*   **删除异常**：例如，某一门课(如数学)要去掉一本参考书(如微分方程)，则必须删除多个(这里是两个)元组: `(数学，李勇，微分方程)`，`(数学，张平，微分方程)`

**产生问题的原因在于多值依赖**

例如，给定（课程`C`，教师`T`），有一组参考书`B`，这组**参考书`B`仅仅是由课程`C`决定的，而与教师`T`无关**

*   例如下图中，“李永”和“王军”即便互换也是没有关系的（只要课程是物理）

![](https://img-blog.csdnimg.cn/00ad0a234ee049e38c3bf514a1472524.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

再比如，给定（课程`C`，参考书`B`），有一组教师`T`，**这组教师`T`仅仅由课程`C`决定，而与参考书`B`无关**

*   例如下图中，“普通物理学”和“光学原理”即便互换也是没有关系的，教师仍是那些（只要课程是物理）

![](https://img-blog.csdnimg.cn/a4cf0f008e374816b23b23cec00aa6d7.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

#### （2）多值依赖的定义

**多值依赖（描述型定义）：设 R ( U ) R(U) R(U)是一个属性集 U U U上的一个关系模式， X X X、 Y Y Y和 Z Z Z是 U U U的子集，并且 Z Z Z\= U U U\- X X X\- Y Y Y。那么多值依赖 X X X\->-> Y Y Y成立当且仅当对 R R R的任一关系 r r r， r r r在( X X X, Z Z Z)上的每个值对应一组 Y Y Y的值，这组值仅仅决定于 X X X，而与 Z Z Z无关**

*   例如在Teaching(C,T,B)中就有C->->T和C->->B

**多值依赖（形式化定义）：设 R ( U ) R(U) R(U)是一个属性集 U U U上的一个关系模式， X X X、 Y Y Y和 Z Z Z是 U U U的子集，并且 Z Z Z\= U U U\- X X X\- Y Y Y。在 R ( U ) R(U) R(U)的任一关系 r r r中，如果存在元组( x x x, y 1 y\_{1} y1, z 1 z\_{1} z1)和( x x x, y 2 y\_{2} y2, z 2 z\_{2} z2)，则必存在( x x x, y 2 y\_{2} y2, z 1 z\_{1} z1)和( x x x, y 1 y\_{1} y1, z 2 z\_{2} z2)。也即交换两个元组的 Y Y Y值所得两个新元组必在 r r r中，那么就称 Y Y Y多值依赖于 X X X，记作 X X X\->-> Y Y Y**

![](https://img-blog.csdnimg.cn/8c1e3037f22d47718da20948dec5de3a.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

#### （3）平凡多值依赖与非平凡多值依赖

**若 X X X\->-> Y Y Y，且 Z Z Z\= ∅ \\emptyset ∅，则称 X X X\->-> Y Y Y为平凡多值依赖**

**若 X X X\->-> Y Y Y，且 Z Z Z!= ∅ \\emptyset ∅，则称 X X X\->-> Y Y Y为非平凡多值依赖**

#### （4）多值依赖的性质

**对称性： Y Y Y多值依赖于 X X X，必有 Z Z Z多值依赖于 X X X。也即若 X X X\->-> Y Y Y， X X X\->-> Z Z Z，其中 Z Z Z\= U U U\- X X X\- Y Y Y**

**函数依赖是多值依赖的特例：若 X X X\-> Y Y Y，则有 X X X\->-> Y Y Y**

**传递性：若 X X X\->-> Y Y Y，若 Y Y Y\->=> Z Z Z，则若 X X X\->-> Z − Y Z-Y Z−Y**

#### （5）多值依赖与函数依赖的区别

*   **函数依赖规定某些元组不能出现在关系中；多值依赖要求某种形式的其它元组必须在关系中**
*   **有效性范围不同**

#### （6）多值依赖的解决方法

**解决方法仍然是模式分解**

![](https://img-blog.csdnimg.cn/80dc7edce764450ea145d971382342ea.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

### 二：码

#### （1）码的相关概念

以下面关系为例  
![](https://img-blog.csdnimg.cn/7c384cf31bda4c1897cc81198d994f3f.png)

* * *

**候选码：若关系中的某一属性组（注意是组不是某单个属性，当然有时属性组也可能只有一个属性）能唯一地标识一个元组，而其子集不能，则该属性组称之为候选码**

*   上面关系中，学号是无法区分的，因为学号虽然不重复，但一个学生可能会对应多个课程，这就导致学号无法唯一标识一个元组。**因此这里（学号，课程名）可以作为一个候选码**
*   **需要注意的是候选码不一定只有一个，可能有多个，只要满足条件即可，但在本例中确实只有一个**

**超码：能够唯一标识一条记录的属性或属性集，超码是候选码的扩充，候选码是最小的超码**

*   可以用线性代数理解，就像一个向量组秩为 r r r，再填一个能被其线性表示的向量，该向量组秩仍为 r r r
*   上面关系中，（学号、课程名）是候选码，那么它的超集，**例如（学号、课程名、姓名）、（学号、课程名、性别）就是超码**

**主码：某个能够唯一标识一条记录的最小属性集（候选码中的“人选之子”）**

*   候选码可能有多个，**但是数据库设计者在设计时会根据实际需求选择一个候选码作为主码**

**外码：是本关系的属性且不是码，而是另一个关系的主码（相信再不用我详细介绍了吧）**

**全码：这是一种特殊情况：关系的所有属性组是这个关系模式的候选码**

**主属性和非属性：包含在候选码中的属性（注意是集合，不是某个候选码）称为主属性；不包含在候选码中的属性称为非主属性**

*   上面关系中，**姓名、性别和期末分数都是非主属性**

#### （2）求解候选码

（此部分暂略，后续详细补充）

### 三：范式

**范式：关系数据库中的关系是要满足一定要求的，满足不同程度要求的为不同范式。也即范式是符合某一种级别的关系模式的集合。级别越高，表设计的就越合理**

*   第一范式（1NF）
*   第二范式（2NF）
*   第三范式（3NF）
*   BC范式（BCNF）
*   第四范式（4NF）
*   第五范式（5NF）

**它们的关系如下**  
![](https://img-blog.csdnimg.cn/da11af379efe452eabff45221bf093e9.png)

**注意：一个低一级范式的关系模式，通过模式分解可以转换为若干个高一级范式的关系模式的集合，这种过程就叫规范化**

* * *

下面的讲解中，以关系模式为例 S L C ( S n o , S d e p t , S l o c , C n o , G r a d e ) SLC(Sno,Sdept,Sloc,Cno,Grade) SLC(Sno,Sdept,Sloc,Cno,Grade)

涉及依赖关系如下

![](https://img-blog.csdnimg.cn/5a22327b7fc945929b55aa7d36b55cbc.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)  
![](https://img-blog.csdnimg.cn/ac0dd535ac1a4400b9bb2afcbdeadedd.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

#### （1）1NF

##### A：定义

**1NF**：直观讲，就是**关系中任何一列不能再分为两列或更多列**

如下关系中，**地址**这个属性就是可以再分。所以该关系不满足1NF

*   有的人可能只会写某个省某个市
*   有的人可能会写的非常详细
*   所以“地址”这个属性是可以拆分的
*   **但是如果写成“省市县”这三列，那么就不能分了，也就满足1NF了**

![](https://img-blog.csdnimg.cn/159071ab2bc34f47b53bbc602c9f56fa.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

##### B：1NF可能存在的问题

本例中SLC满足1NF，但却不是一个好的关系模式，因为会存在以下问题

*   **插入异常**：例如，插入一个学生，其`Sno`、`Sdept`、`Sloc`属性都具备，但是由于没有选课，所以没有`Cno`，而`Sno`和`Cno`是主码，主码不能为空（否则违背实体完整性），所以无法插入
*   **删除异常**：例如，某一个学生只选了一门课，假如因为某种原因这门课不选了，那么意味着`Cno`和`Grade`应该删除。但是这会导致整个元组被删除，一些不该删除的信息也被删除了
*   **更新异常**：例如，某一个学生转了专业，换了系，本来只需修改`Sdept`即可，但是Sdept->Sloc，这就导致`Sloc`也得修改。另外如果这个学生选了`k`门课，那么这意味着需要重复修改`k`次，不仅存储冗余度大，而且修改很复杂

##### C：产生这些问题的原因及解决方法

**问题原因：非主属性`Sdept`、 `Sloc`部分函数依赖于码**

![](https://img-blog.csdnimg.cn/dd91b519a64d47a8bdb2369ac35f30b0.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)  
**解决方法（2NF的处理方法）：进行模式分解，消除部分函数依赖**  
![](https://img-blog.csdnimg.cn/e1277f0525d349e2bff7c20fb18f440b.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

*   关系SC的码为(Sno,Cno)
*   关系Sno的码为(Sno)

#### （2）2NF

##### A：定义

**2NF**：直观讲，就是**一个表中只能保存一种数据，不能把多种数据保存在同一张表中。专业定义就是保证每个非主属性对码都是完全函数依赖**

其实在1NF的例子中我们可以发现，SLC表似乎有点“不对劲”，就是一张表**即在保存成绩又在保存学生的一些基本信息**，从语义上讲，这就属于**把多种数据保存在了同一张表上**。也即是把原本两个关系硬塞在了一起，这就导致(Sno,Cno)在决定`Grade`的同时，会间接影响到`Sdept`和`Sloc`

##### B：2NF可能存在的问题

在分解后的S-L关系中，它满足2NF但并不是一个好的关系模式。其中`Sloc`对`Sno`**传递函数依赖**，**这仍然会导致上面所展示的那些异常情况**

### （3）3NF

##### A：定义

**3NF**：直观讲，就是**确保表中的每一列数据都和主码直接相关，而不是间接相关**。专业定义就是**保证每个非主属性对码既不是部分函数依赖也不是传递函数依赖**

在2NF的那个例子中我们可以发现，**S-L关系中Sno和Sdept是直接关系，Sdept和Sloc是直接关系，这就导致Sno与Sloc是间接关系**。所以我们的做法依旧是**采用模式分解，消除传递函数依赖**

![](https://img-blog.csdnimg.cn/06003152c872445483eb3b7f9a9204ee.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

*   关系S-D的码是`Sno`
*   关系D-L的码是`Sdept`

##### B：注意

如果一个关系满足3NF，那么可以说在很多情况下它已经合格了。**但是在一些特殊情况下，仍然会产生一些异常情况和数据冗余**

#### （4）BCNF

##### A：定义

**BCNF**：直观讲，**BCNF是修正的第三范式，修正了每一属性对候选码的传递依赖**。BCNF一定是3NF，但3NF不一定是BCNF，想要让一个3NF成为BCNF，必须满足

*   **所有的非主属性对每一个码都是完全函数依赖**
*   **所有的主属性对每一个不包含它的码也是完全函数依赖**
*   **没有任何属性完全函数依赖于非码的任何一组属性**

##### B：判断一个3NF是否是BCNF

**方法**：

1.  找出候选码
2.  判断除候选码外是否还有其他决定因素。如果没有那么那么它就是BCNF
3.  如果还有其他决定因素且每个决定因素都包含码那么就是BCNF，否则不是

* * *

**演示**：

**【例】有关系模式S(Sno,Sname,Sdept,Sage)，其中Sname也具有唯一性**

答：这样一来，S就有两个码，且都由单属性组成，彼此不相交，其他属性不存在对码的部分和传递依赖，所以S属于3NF。又因为每一个决定因素中都包含码，所以属于BCNF

**【例】关系模式STJ(S, T, J)中，S表示学生，T表示教师，J表示课程。并且**

*   **每一名教师只教一门课**
*   **每门课有若干教师**
*   **某一学生选定某门课，就对应了一个固定的教师**

答：于是，有如下依赖

*   (S,J)->T
*   (S,T)->J
*   T->J  
    ![](https://img-blog.csdnimg.cn/7e8d6788cf3b4107952a7d5d6c506fe2.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

可见(S,J)与(S,T)都是候选码，由于没有任何非主属性对码传递依赖或部分依赖，所以STJ属于3NF。**决定因素有(S,J)、(S,T)和T，但T不包含码，所以不属于BCNF**

##### C：3NF和BCNF的关系

*   **BCNF一定是3NF，但3NF却不一定是BCNF**
*   3NF和BCNF是在函数依赖的条件下对模式分解所能达到的分离程度的测度
*   一个模式中的关系模式如果都属于BCNF,那么在函数依赖范畴内它已实现了彻底的分离，**已消除了插入和删除的异常**
*   3NF的“不彻底”性表现在可**能存在主属性对码的部分依赖和传递依赖**

#### （5）4NF（看过多值依赖再看）

**4NF：简单点说，要想满足4NF，那么该关系模式的多值依赖要么是平凡的；如果是非平凡的，就必须退化为函数依赖。也就是说非平凡又非函数依赖的多值依赖是不允许存在的**

在上面提到的Teaching(C,T,B)显然不是4NF，该关系存在 C C C\->-> T T T和 C C C\->-> B B B两个多值依赖，但是都是**非平凡的**，所以需要进行模式分解。分解为他们便是**平凡的**

![](https://img-blog.csdnimg.cn/0416e290591144978d9fc58cf67fed30.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

*   C C C\->-> T T T和 C C C\-> B B B都是平凡多值依赖

### 四：规范化小结

规范化的基本思想是**逐步消除数据依赖中不合适的部分，使模式中的各关系模式达到某种程度的“分离”，即“一事一地”的模式设计原则**。让一个关系描述一个概念、一个实体或者实体间的一种联系。若多于一个概念就把它“分离”出去。因此所谓规范化实质上是**概念的单一化**

![](https://img-blog.csdnimg.cn/2bb0ac8f89aa40e29ac59c9a2c01f822.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

第七章：数据库设计
=========

## 第一节：数据库设计概述

### 一：数据库设计定义

**数据库设计(database design)：数据库设计是指对于一个给定的应用环境，构造(设计)优化的数据库逻辑模式和物理结构，并据此建立数据库及其应用系统，使之能够有效地存储和管理数据，满足各种用户的应用需求，包括信息管理要求和数据操作要求。数据库设计的目标是为用户和各种应用系统提供一个信息基础设施和高效的运行环境**

*   **信息管理要求**：数据库中应该存储和管理哪些数据对象
*   **数据操作要求**：对数据对象需要进行哪些操作

### 二：数据库建设及特点

**数据库建设：**是指数据库应用系统从设计、实施到运行与维护的全过程（可以对比**软件生命周期**）

#### （1）数据库建设基本规律

特点之一：**三分技术、七分管理、十二分基础数据**

*   **技术**：技术很重要，也是最容易实现的，因为技术在一定时期内是很稳定的
*   **管理**：管理相比技术更为重要，这对数据库设计有直接影响
*   **数据**：基础数据的地位和作用是认为最容易忽略的，数据便是数据库这幢大楼的一砖一瓦

#### （2）结构（数据）设计和行为（处理）设计相结合

特点之二：**设计中要把数据库结构设计和对数据的处理设计密切结合起来**

*   必须强调**设计过程中数据库设计和应用系统设计的密切结合，并将其作为数据库设计的重要特点**
*   数据库设计中一定要把**结构特性**和**行为特性**结合起来

### 三：数据库设计方法

主要有：

*   **新奥尔良方法**：将数据库设计分为若干阶段和步骤
*   **基于 E-R 模型的设计方法**：概念设计阶段广泛采用
*   **基于 3NF 的设计方法**：逻辑阶段可采用的有效方法
*   **ODL（Object Definition Language）方法**：面向对象的数据库设计方法
*   **计算机辅助设计**：ORACLE Designer 2000、SYBASE PowerDesigner

### 四：数据库设计基本步骤

#### （1）6个阶段

**数据库设计分为如下6个阶段**：

*   需求分析
*   概念结构设计
*   逻辑结构设计
*   物理结构设计
*   数据库实施
*   数据库运行和维护

![](https://img-blog.csdnimg.cn/a6eb9946027043f0b3783452465e217f.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

*   **需求分析和概念结构设计可以独立于任何数据库管理系统进行**
*   **逻辑结构设计和物理结构设计与选用的数据库管理系统密切相关**

#### （2）具体描述

**需求分析阶段**：进行数据库设计首先必须**准确了解与分析用户需求**(包括数据与处理)。需求分析是整个设计过程的**基础**，也是**最困难和最耗费时间**的一步

**概念结构设计阶段**：概念结构设计是整个数据库设计的**关键**，它通过对用户需求进行**综合、归纳与抽象**，形成一个**独立于具体数据库管理系统**的概念模型

**逻辑结构设计阶段**：逻辑结构设计是将概念结构转换为**某个数据库管理系统所支持的数据模型**，并对其进行优化

**物理结构设计阶段**：物理结构设计是**为逻辑数据模型选取一个最适合应用环境的物理结构**(包括存储结构和存取方法)

**数据库实施阶段**：在数据库实施阶段，设计人员运用数据库管理系统提供的**数据库语言**及其宿主语言，根据逻辑设计和物理设计的结果**建立数据库**，编写与调试**应用程序**，组织数据入库，并进行**试运行**

**数据库运行和维护阶段**：数据库应用系统经过试运行后即可投入**正式运行**。在数据库系统运行过程中必须不断地对其进行评估、调整与修改

*   在此阶段，应该把**数据库的设计**和对**数据库中数据处理的设计**紧密结合起来

#### （3）所使用的工具

每个阶段都要用到各种工具，各种图，这一点在**软件工程**中有详细介绍

![](https://img-blog.csdnimg.cn/0175e81327c148cb850a996335a55041.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

### 五：数据库设计过程中的各级模式

**数据库设计的不同阶段会形成数据库的各级模式**

*   **需求分析阶段**：综合各个用户的**应用需求**
*   **概念结构设计阶段**：形成**概念模式（E-R图）**
*   **逻辑结构设计阶段**：将E-R图转化为具体的数据库产品所支持的数据模型，比如**关系模型**
*   形成逻辑模式，然后根据用户处理的要求、安全性的考虑，在基本表的基础上再建立必要的视图，形成数据的**外模式**
*   **物理结构设计阶段**：形成**内模式**

![](https://img-blog.csdnimg.cn/334db500e98b45db90eeb2bfa88013f8.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

## 第二节：需求分析

**注意**

*   更多可参照**软件工程**相关内容，请点击跳转[（软件工程复习核心重点）第三章需求分析](https://zhangxing-tech.blog.csdn.net/article/details/122261058)

需求分析简单地说就是**分析用户的要求**。需求分析是设计数据库的**起点**，需求分析结果是否准确反映用户的实际要求将直接影响到后面各阶段的设计，并影响到设计结果是否合理和实用

### 一：需求分析的任务

**需求分析的任务：是通过详细调查现实世界要处理的对象(组织、部门、企业等)，充分了解原系统(手工系统或计算机系统)的工作概况，明确用户的各种需求，然后在此基础上确定新系统的功能。新系统必须充分考虑今后可能的扩充和改变，不能仅仅按当前应用需求来设计数据库。调查的重点是数据和处理，要获得用户对数据库的如下要求：**

*   **信息要求**：也即数据库中需要存储哪些数据
*   **处理要求**：也即用户要完成的数据处理功能
*   **完整性与安全性要求**

### 二：需求分析的步骤和方法

![](https://img-blog.csdnimg.cn/d927e8f2fd34478f8fe1d2a10e2a4ef7.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

#### （1）步骤

1.  **调查组织结构情况**：包括了解该组织的部门组成情况、各部门的职责等，为分析信息流程做准备
2.  **调查各部分业务活动情况（重点）**：包括了解各部门输入和使用什么数据，如何加工处理这些数据，输出什么信息，输出到什么部门，输出结果的格式是什么等等
3.  **在熟悉业务活动的基础上，协助用户明确对新系统的各种要求（重点）**：包括信息要求、处理要求、完整性与安全性要求
4.  **确定新系统的边界**：对前面调查的结果进行初步分析，确定哪些功能由计算机完成或将来准备让计算机完成，哪些活动由人工完成。由计算机完成的功能就是新系统应该实现的功能

#### （2）方法

*   **跟班作业**：通过亲身参加业务工作来了解业务活动的情况
*   **开调查会**：通过与用户座谈来了解业务活动情况及用户需求
*   **请专人介绍**
*   **询问**：对某些调查中的问题可以找专人询问
*   **设计调查表请用户填写**
*   **查阅记录**：查阅与原系统有关的数据记录

### 三：[数据字典](https://so.csdn.net/so/search?q=%E6%95%B0%E6%8D%AE%E5%AD%97%E5%85%B8&spm=1001.2101.3001.7020)

#### （1）定义

**数据字典：它是关于数据库中数据的描述，即元数据，而不是数据本身。数据字典是在需求分析阶段建立，在数据库设计过程中不断修改、充实、完善的。它在数据库设计中占有很重要的地位**

#### （2）组成

##### ①：数据项

**数据项是不可再分的数据单位**，其描述包括以下内容

![](https://img-blog.csdnimg.cn/a4eb0458ce924c80b11f18b14e6c2696.png)

*   “取值范围”、“与其他数据项的逻辑关系”定义了数据的**完整性约束条件**

##### ②：数据结构

**数据结构反映了数据之间的组合关系，一个数据结构可以由若干数据项构成，也可以由若干数据结构构成，或由若干数据项和数据结构混合而成**，其描述包括以下内容

![](https://img-blog.csdnimg.cn/2504c61ebc38419c8d2fb4b2544037f5.png)

##### ③：数据流

**数据流是数据结构在系统内的传输路径**，其描述包括以下内容

![](https://img-blog.csdnimg.cn/b70ac04111f4468e91d4e7b63896c87e.png)

##### ④：数据存储

**数据存储是数据结构停留或保存的地方，也是数据流的来源或去向。他可以是手工文档或手工凭单，也可以是计算机文档**，其描述包括以下内容

![](https://img-blog.csdnimg.cn/2a59a4fbc9b0450796dcf105c273ee9a.png)

##### ⑤：处理过程

**处理过程的具体处理逻辑一般用判定表或判定树描述，数据字典中只需要描述处理过程额说明性信息即可**，其描述包括以下内容

![](https://img-blog.csdnimg.cn/dfe8f31c8e65425d955bda65f566bfd2.png)

## 第三节：概念结构设计

将需求分析得到的用户需求抽象为信息结构(即[概念模型](https://so.csdn.net/so/search?q=%E6%A6%82%E5%BF%B5%E6%A8%A1%E5%9E%8B&spm=1001.2101.3001.7020))的过程就是**概念结构设计**，它是整个数据库设计的关键

### 一：E-R模型

#### （1）两个实体之间的联系

前面的文章中就说过：**在现实世界中，事物内部以及事物之间是有联系的。实体内部的联系通常是指组成实体的各属性之间的联系，实体之间的联系通常是指不同实体型的实体集之间的联系**

**一般地，把参与联系的实体型的数目称为联系的度**

*   两个实体型之间的联系度为2,也称为**二元联系**
*   三个实体型之间的联系度为3，称为**三元联系**
*   N个实体型之间的联系|度为N,也称为**N元联系**

##### ①：一对一联系（1:1）

**一对一联系（1:1）：如果对于实体集A中的每一个实体，实体集B中至多有一个(也可以没有)实体与之联系，反之亦然，则称实体集A与实体集B具有一对一联系，记为1:1**

*   例如，**学校里一个班级只有一个正班长，而一个班长只在一个班中任职**，则班级与班长之间是1:1关系

![](https://img-blog.csdnimg.cn/f0a143ffd0fd4d98b9886dda1b6d6cd0.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

##### ②：[一对多](https://so.csdn.net/so/search?q=%E4%B8%80%E5%AF%B9%E5%A4%9A&spm=1001.2101.3001.7020)联系（1:n）

**一对多联系（1:n）：如果对于实体集A中的每一个实体，实体集B中有n个实体(n≥0)与之联系，反之，对于实体集B中的每一个实体，实体集A中至多只有一个实体与之联系，则称实体集A与实体集B有一对多联系，记为1:n。**

![](https://img-blog.csdnimg.cn/aa2702a2f21740fcb16949c0a499866c.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

*   例如，**一个班级中有若干名学生，而每个学生只在一个班级中学**习， 则班级与学生之间具有一对多联系

##### ③：多对多联系（m:n）

**多对多联系（m:n）：如果对于实体集A中的每一个实体，实体集B中有n个实体(n≥0)与之联系；反之，对于实体集B中的每一个实体，实体集A中也有m个实体(m≥0)与之联系，则称实体集A与实体集B具有多对多联系，记为m:n**

![](https://img-blog.csdnimg.cn/384d7c4cdff248c6b071104d3769ad4c.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

*   例如，**一门课程同时有若干个学生选修，而一个学生可以同时选修多门课程**，则课程与学生之间具有多对多联系。

#### （2）两个以上实体型之间的联系

两个以上实体型之间也存在着**一对一、一对多或多对多**的联系

*   例如，对于课程、教师与参考书三个实体型，如果一门课程可以有若干个教师讲授，使用若干本参考书，而每一个教师只讲一门课程，每一本参考书只供一门课程使用，则课程与教师、参考书之间的联系是**一对多**的
*   又如，有三个实体型:供应商、项目、零件，一个供应商可以供给多个项目多种零件，而每个项目可以使用多个供应商供应的零件，每种零件可由不同供应商供给，由此看出供应商、项目、零件三者之间是**多对多**的联系

![](https://img-blog.csdnimg.cn/b6833b18de274da0bedc86e4f65039fd.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_19,color_FFFFFF,t_70,g_se,x_16)

#### （3）单个实体型内的联系

同一个实体集内的各实体之间也可以存在**一对一、一对多和多对多**的联系

*   例如，职工实体型内部具有领导与被领导的联系，即某一职工 (干部)“领导”若干名职工，而一个职工仅被另外一个职工直接领导，因此这是**一对多**的联系

![](https://img-blog.csdnimg.cn/8cc96e21fcd04b8b8eaba9475b5c99dd.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

### 二：E-R图

#### （1）定义

**使用实体联系图可以建立数据模型，利用E-R图描绘的数据模型称之为E-R模型**

*   **实体：** 描述的数据对象
*   **属性：** 描述数据对象的性质
*   **联系：** 描述数据对象之间的交互方式

#### （2）符号表示

![](https://img-blog.csdnimg.cn/d14eb0afa36940dabb77f462fd3cecc6.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

#### （3）E-R模型的优点

*   **E-R模型比较接近人的思维习惯方式**
*   **E-R模型使用简单的图形符号表达，便于用户理解**

#### （4）示例

> 一个学生可选修多门课，一门课有若干学生选修;一个教师可讲授多门课，一门课只有一个教师讲授;学生选修一门课，产生成绩;学生的属性有学号、姓名等;教师的属性有教师编号，教师姓名等;课程的属性有课程号、课程名等。请画出该系统E-R图

![](https://img-blog.csdnimg.cn/7315022b370c4c0fb1f1f11b0fb66334.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

### 三：概念结构设计

#### （1）实体与属性的划分原则

概念结构设计的第一步就是**对需求分析阶段收集到的数据进行分类、 组织，确定实体、实体的属性、实体之间的联系类型，形成E-R图**。由于实体与属性之间并没有形式上可以划分的界限，所以这个看似简单的问题也时长困扰着设计人员

* * *

**划分原则：为了简化E-R图的处置，现实世界的事物能作为属性对待的尽量作为属性对待。如果能满足下述两条原则，一般均可作为属性对待**

*   ① **作为属性，不能再具有需要描述的性质，也即属性必须是不可分的数据项，不能包含其他属性**
*   ② **属性不能与其他实体具有联系，也即E-R图中所表示的联系是实体之间的联系**

【例如】职工是一个实体，职工号、姓名、年龄是职工的属性，职称如果没有与工资、岗位津贴、福利挂钩，换句话说，没有需要进一步描述的特性，则根据准则①可以作为职工实体的属性；**但如果不同的职称有不同的工资、岗位津贴和不同的附加福利，则职称作为一个实体看待就更恰当**

![](https://img-blog.csdnimg.cn/804b7ad8aa864e22818649d63b701c77.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)  
【例如】在医院中一个病人只能住在一个病房，病房号可以作为病人实体的一个属性；但如果病房还要与医生实体发生联系，即一个医生负责几个病房的病人的医疗工作，**则根据准则②病房应作为一个实体**

![](https://img-blog.csdnimg.cn/a773827f19d047ea9c64406e8cf6a530.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

#### （2）E-R图的集成

##### A：什么是E-R图的集成

**E-R图的集成：在开发一个大型信息系统时，最经常采用的策略是自顶向下地进行需求分析，然后再自底向上地设计概念结构。即首先设计各子系统的分E-R图，然后将它们集成起来，得到全局E-R图。E-R图的集成一般需要两步**

*   **合并**：解决各分E-R图之间的**冲突**，将分E-R图合并起来生成初步E-R图
*   **修改和重构**：消除不必要的**冗余**，生成基本E-R图

![](https://img-blog.csdnimg.cn/10a8a4f518414c87bc5132b134d8353d.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

##### B：第一步——合并E-R图，生成初步E-R图

**冲突：各个局部应用所面向的问题不同，且通常是由不同的设计人员进行局部视图设计，这就导致各个子系统的E-R图之间必定会存在许多不一致的地方，称之为冲突。冲突主要有三类**

*   属性冲突
*   命名冲突
*   结构冲突

###### ①：属性冲突

**主要包含以下两类冲突**

*   **属性域冲突**：即**属性值的类型、取值范围或取值集合不同**。例如零件号，有的部门把它定义为整数，有的部门把它定义为字符型，不同部门对零件号的编码也不同。又如年龄，某些部门以出生日期形式表示职工的年龄，而另一些部门用整数表示职工的年龄
*   **属性取值单位冲突**：例如，零件的重量有的以公斤为单位，有的以斤为单位，有的以克为单位

###### ②：命名冲突

命名冲突可能发生在实体、联系一级上，也可能发生在属性一级上。其中**属性的命名冲突更为常见**

**主要包含以下两类冲突**

*   **同名异义**：即不同意义的对象在不同的局部应用中具有相同的名字
*   **异名同义**：即同一意义的对象在不同的局部应用中具有不同的名字

###### ③：结构冲突

**主要包含以下三类冲突**

*   **同一对象在不同应用中具有不同的抽象**：例如，职工在某一 局部应用中被当作实体，而在另一局部应用中则被当作属性。解决方法**通常是把属性变换为实体或把实体变换为属性，使同一对象具有相同的抽象**
    
*   **同一实体在不同子系统的E-R图中所包含的属性个数和属性排列次序不完全相同（常见）**：原因是不同的局部应用关心的是该实体的不同侧面。解决方法**是使该实体的属性取各子系统的E-R图中属性的并集，再适当调整属性的次序**
    
*   **实体间的联系在不同的E-R图中为不同的类型**：如实体E1与E2在一个E-R图中是多对多联系，在另一个E-R图中是一对多联系。解决方法是**根据应用的语义对实体联系的类型进行综合或调整**
    

##### C：第二步——消除不必要的冗余，设计基本的E-R图

**冗余数据和冗余联系：在初步E-R图中可能存在一些冗余的数据和实体间冗余的联系**

*   **冗余的数据**：可由**基本数据**导出的数据
*   **冗余的联系**：可由**其他联系**导出的联系

## 第四节：逻辑结构设计

概念结构是独立于任何一种[数据模型](https://so.csdn.net/so/search?q=%E6%95%B0%E6%8D%AE%E6%A8%A1%E5%9E%8B&spm=1001.2101.3001.7020)的信息结构，逻辑结构设计的任务就是**把概念结构设计阶段设计好的基本E-R图转换为与选用数据库管理系统产品所支持的数据模型相符合的逻辑结构**

### 一：E-R图向关系模式的转换

#### （1）转换原则

**转换原则：每一个实体类型转换为一个关系模式，实体的属性就是关系的属性，实体的码就是关系的码。对于联系的转换注意：**

*   **一般1:1、1:m联系不产生新的关系模式，而是将一方实体的码加入到多方实体对应的关系模式中，联系的属性也一并加入**
*   **m:n联系要产生一个新的关系模式，该关系模式由联系涉及实体的码加上联系的属性（若有）组成**

#### （2）具体转换

##### A：同一实体间

###### ①：同一实体间1:m 联系

**可以在这个实体所对应的关系中多设一个属性，作为与该实体相联系的另一个实体的主码**

例如，下面的E-R图可以转化为如下关系模式

> 职工（工号，姓名，年龄，性别，职称，工资，领导者工号，民意测验）

![](https://img-blog.csdnimg.cn/093089fa95db45568872d1bb98ca3da4.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

###### ②：同一实体间m:n 联系

**必须为这个“联系”单独建立一个关系，该关系中至少应该包含被它所联系的双方实体的“主码”，如果联系有属性，也一并纳入该关系中。由于这个“联系”只涉及一个实体，所以加入的实体的主码不能同名**

例如，下面的E-R图可以转化为如下关系模式

> 零部件（代号，名称，价格）  
> 组装（代号，组装件代号，数量）

![](https://img-blog.csdnimg.cn/0ecf598128ac47b9a7326844494c6337.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

##### B：两实体间

###### ①：两实体间1:1联系

**一个1:1 联系可以转换为一个独立的关系模式，也可以与任意一端对应的关系模式合并**

*   **如果转换为一个独立的关系模式**：则与该联系相连的各实体的码以及联系本身的属性均转换为关系的属性，每个实体的码均是该关系的候选码
*   **如果与某一端实体对应的关系模式合并**：则需要在该关系模式的属性中加入另一个关系模式的码和联系本身的属性

例如，下面的E-R图可以转化为如下关系模式

> 工厂（厂号，厂名，地点，姓名，任期）  
> 厂长（姓名，性别，年龄）

或者

> 厂长（姓名，性别，年龄，厂号，任期）  
> 工厂（厂号，厂名，地点）

![](https://img-blog.csdnimg.cn/f3c8b6125f9b4a09a31d13345dce8a19.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

###### ②：两实体间1:m联系

**可以将“1”方实体的主码纳入“m”方实体对应的关系中作为外码，同时把联系的属性也一并纳入“m”方对应的关系中**

例如，下面的E-R图可以转化为如下关系模式

> 仓库（仓库号，地点，面积）  
> 商品（货号，品名，价格，仓库号，数量）

![](https://img-blog.csdnimg.cn/da63ad82a82a40aca6d0721353c257f8.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

###### ③：两实体间m:n联系

**必须对“联系”单独建立一个关系，该关系中至少包含被它所联系的双方实体的主码，如果联系也有属性，也一并纳入该关系中**

例如，下面的E-R图可以转化为如下关系模式

> 学生（学号，姓名，性别，年龄）  
> 课程（课程号，课程名，学时）  
> 选修（学号，课程号，成绩）

![](https://img-blog.csdnimg.cn/f2f6baf2175242eab3d37ec759c23a2c.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

###### ④：两实体间弱实体联系

**可以将被依赖实体的主码纳入弱实体中，作为弱实体的主码或主码的一部分**

例如，下面的E-R图可以转化为如下关系模式

> 职工（工号，姓名，年龄，性别，职称）  
> 亲属（工号，亲属姓名，亲属关系）

![](https://img-blog.csdnimg.cn/2430d1e9efef42778eff1b67db5a17fc.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

##### C：两个以上实体间m:n

**必须对“联系”单独建立一个关系，该关系中至少包含被它所联系的双方实体的主码，如果联系也有属性，也一并纳入该关系中**

例如，下面的E-R图可以转化为如下关系模式

> 供应商(供应商号，供应商名，地址)  
> 零件(零件号，零件名，重量)  
> 项目(项目编号，项目名称，开工日期)  
> 供应(供应商号,项目编号，零件号,零件数)

![](https://img-blog.csdnimg.cn/7143a653f0134268b635a78d6f97c914.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

### 二：数据模型的优化

数据库逻辑设计的结果**不是唯一**的。为了进一步提高数据库应用系统的性能，还应该根据应用需要适当地修改、调整数据模型的结构，这就是数据模型的优化

**关系数据模型的优化通常以规范化理论为指导，方法为:**

*   确定每个关系模式内部各个属性之间的数据依赖以及不同关系模式属性之间的**数据依赖**
*   对各个关系模式之间的数据依赖进行最小化处理，**消除冗余**的联系
*   确定各关系模式的**范式等级**
*   按照需求分析阶段得到的处理要求，确定要对哪些模式进行**合并或分解**
*   为了提高数据操作的效率和存储空间的利用率，对上述产生的关系模式进行适当的**修改、调整和重构**

### 三：设计用户子模式

将概念模型转换为全局逻辑模型后，还应该根据局部应用需求，结合具体关系[数据库管理系统](https://so.csdn.net/so/search?q=%E6%95%B0%E6%8D%AE%E5%BA%93%E7%AE%A1%E7%90%86%E7%B3%BB%E7%BB%9F&spm=1001.2101.3001.7020)的特点**设计用户的外模式**

**在定义用户外模式时可以注重考虑用户的习惯于方便**，包括以下几个方面

*   使用更**符合用户习惯**的别名
*   可以为不同级别的用户定义不同的视图，以**保证系统的安全性**
*   可将经常使用的复杂的查询定义为视图，简化**用户对系统的使用**

## 第五、六节：物理结构设计和数据库的实施和维护

### 一：物理结构设计

数据库在物理设备上的[存储结构](https://so.csdn.net/so/search?q=%E5%AD%98%E5%82%A8%E7%BB%93%E6%9E%84&spm=1001.2101.3001.7020)与存取方法称为数据库的物理结构，它依赖于选定的数据库管理系统。**为一个给定的逻辑数据模型选取一个最适合应用要求的物理结构的过程**，就是数据库的物理设计。通常分为以下两步

*   **确定数据库的物理结构**，在关系数据库中主要指存取方法和存储结构
*   **对物理结构进行评价**，评价的重点是时间和空间效率

数据库产品之间存在着很多差异，因此没有通用的物理设计方法可寻，只能给出一般的设计内容和原则：**希望设计优化的物理数据库结构，使得在数据库上运行的各种事物响应时间小，存储空间利用率高，事物吞吐率大**

通常关系数据库物理设计的内容主要有

*   **关系模式选择存取方法**
*   **设计关系**
*   **索引等数据库文件的物理存储结构**

#### （1）关系模式存取方法选择

存取方法是快速存取数据库中数据的技术。[数据库管理系统](https://so.csdn.net/so/search?q=%E6%95%B0%E6%8D%AE%E5%BA%93%E7%AE%A1%E7%90%86%E7%B3%BB%E7%BB%9F&spm=1001.2101.3001.7020)一般提供多种存取方法

*   **B+树索引存取方法的选择**
*   **hash索引存取方法的选择**
*   **聚簇存取方法的选择**

#### （2）确定数据库的存储结构

##### A：确定数据的存放位置

根据应用情况将**易变部分与稳定部分**分开存放、**存取频率较高部分与存取频率较低**部分分开存放

##### B：确定系统配置

（可做了解）

![](https://img-blog.csdnimg.cn/2ed9dbe733a843c887e6dc4d12d7db89.png)

#### （3）评价物理结构

评价物理数据库的方法完全依赖于所选用的关系数据库管理系统，主要是从**定量估算各种方案的存储空间、存取时间和维护代价入手，对估算结果进行权衡、比较，选择出一个较优的、合理的物理结构**。如果该结构不符合用户需求，则需要修改设计

### 二：数据库的实施和维护

完成数据库的物理设计之后，设计人员就要**用关系数据库管理系统提供的数据定义语言和其他实用程序将数据库逻辑设计和物理设计结果严格描述出来，成为关系数据库管理系统可以接受的源代码，再经过调试产生目标模式，然后就可以组织数据入库**了，这就是数据库实施阶段

#### （1）数据的载入和应用程序的调试

**重点有**

*   数据库系统中数据量很大，所以入库工作是相当费力的
*   为提高数据输入工作的效率和质量，应该针对具体的应用环境设计一个**数据录入子系统**，由计算机来完成数据入库的任务
*   **数据库应用程序的设计应该与数据库设计同时进行**，因此在组织数据入库的同时还要调试应用程序

#### （2）数据库的试运行

**数据库的试运行**：在原有系统的数据有一小部分已输入数据库后，就可以开始对数据库系统进行联合调试了

**重点有**

*   在数据库试运行时，还要测试系统的性能指标，**分析其是否达到设计目标**
*   在组织入库时，**先输入小批量数据做调试用，待试运行基本合格后再大批量输入数据，逐步增加数据量，逐步完成运行评价**
*   需要做好**数据库的转储和恢复工作**

#### （3）数据库的运行和维护

在数据库运行阶段，对数据库经常性的维护工作主要是由数据库管理员完成的。**数据库的维护工作主要包括以下几方面**

*   数据库的转储和恢复
*   数据库的安全性、完整性控制
*   数据库性能的监督、分析和改造
*   数据库的重组织与重构造

## 习题

### 名词解释

*   **数据库设计(database design)**：数据库设计是指对于一个给定的应用环境，构造(设计)优化的数据库逻辑模式和物理结构，并据此建立数据库及其应用系统，使之能够有效地存储和管理数据，满足各种用户的应用需求，包括信息管理要求和数据操作要求。数据库设计的目标是为用户和各种应用系统提供一个信息基础设施和高效的运行环境
*   **数据字典**：它是关于数据库中数据的描述，即元数据，而不是数据本身。数据字典是在需求分析阶段建立，在数据库设计过程中不断修改、充实、完善的。它在数据库设计中占有很重要的地位
*   **需求分析阶段**：进行数据库设计首先必须准确了解与分析用户需求(包括数据与处理)。需求分析是整个设计过程的基础，也是最困难和最耗费时间的一步
*   **概念结构设计阶段**：概念结构设计是整个数据库设计的关键，它通过对用户需求进行综合、归纳与抽象，形成一个独立于具体数据库管理系统的概念模型
*   **逻辑结构设计阶段**：逻辑结构设计是将概念结构转换为某个数据库管理系统所支持的数据模型，并对其进行优化
*   **物理结构设计阶段**：物理结构设计是为逻辑数据模型选取一个最适合应用环境的物理结构(包括存储结构和存取方法)
*   **数据库实施阶段**：在数据库实施阶段，设计人员运用数据库管理系统提供的数据库语言及其宿主语言，根据逻辑设计和物理设计的结果建立数据库，编写与调试应用程序，组织数据入库，并进行试运行
*   **数据库运行和维护阶段**：数据库应用系统经过试运行后即可投入正式运行。在数据库系统运行过程中必须不断地对其进行评估、调整与修改

### 简答题

### 应用题

> ![](https://img-blog.csdnimg.cn/f1ca8ab152224bfc9c4c618f00994682.png)

【答案】

![](https://img-blog.csdnimg.cn/ba2ca336827447d8b8da503b7e0acb8f.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

> ![](https://img-blog.csdnimg.cn/610cf7a99c184d19b1bdaf3c38ea174e.png)

*   在概念结构设计阶段，形成独立于各机器特点之外，独立于各个数据模型之外的**概念模型**
*   在逻辑结构设计阶段，将概念结构设计阶段设计好的概念模型转化为与选用DBMS产品相适应的逻辑结构，形成数据库的逻辑模式，并根据用户的需求，安全性的考虑，建立必要的视图，形成数据库的**外模式**
*   在物理结构设计阶段，根据关系数据库的特点和处理的需要，进行物理存储安排，建立索引，形成数据库的**内模式**

> ![](https://img-blog.csdnimg.cn/9c2f5b7529ba41808ce5fd068fb37ad4.png)

①：目标  
![](https://img-blog.csdnimg.cn/dfb0274c0d8542b09ae4ac617a9cce7f.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)  
②：内容  
![](https://img-blog.csdnimg.cn/9e2b7a2d6e604aadb5dc53d09491db0d.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

> ![](https://img-blog.csdnimg.cn/4045c7f03126460b89877f6d0e612340.png)

![](https://img-blog.csdnimg.cn/27d4057a0e604d67b8838d0635586f5b.png)

> ![](https://img-blog.csdnimg.cn/48b9b49bb98e42cc93e18116210c9986.png)

①：特点

*   **能真实、 充分地反映现实世界**， 包括事物和事物之间的联系， 能满足用户对数据的处理要求， 是对现实世界的一个真实模型
*   **易于理解**， 从而可以用它和不熟悉计算机的用户交换意见， 用户的积极参与是数据库设计成功的关键
*   **易于更改**， 当应用环境和应用要求改变时， 容易对概念模型修改和扩充；
*   **易于向关系、 网状、 层次等各种数据模型转换**

②：设计策略

*   **自顶向下**， 即首先定义全局概念结构的框架， 然后逐步细化
*   **自底向上**， 即首先定义各局部应用的概念结构， 然后将它们集成起来， 得到全局概念结构
*   **逐步扩张**， 首先定义最重要的核心概念结构， 然后向外扩充， 以滚雪球的方式逐步生成其他概念结构， 直至总体概念结构
*   **混合策略**， 即将自顶向下和自底向上相结合， 用自顶向下策略设计一个全局概念结构的框架， 以它为骨架集成由自底向上策略中设计的各局部概念结构

> ![](https://img-blog.csdnimg.cn/ea1cc12369cd4f37882d190f6d338ae9.png)

*   前面说过

> ![](https://img-blog.csdnimg.cn/5234145354324081a8704094c2fbcf6b.png)

![](https://img-blog.csdnimg.cn/cc9536092e95412999fb0797f062f257.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_15,color_FFFFFF,t_70,g_se,x_16)

转换为[关系模型](https://so.csdn.net/so/search?q=%E5%85%B3%E7%B3%BB%E6%A8%A1%E5%9E%8B&spm=1001.2101.3001.7020)如下  
![](https://img-blog.csdnimg.cn/99665b5957dd4e9b8307e5e123bb188f.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

> ![](https://img-blog.csdnimg.cn/89590d44a0154d5b8d1ef0f8be52a961.png)

![](https://img-blog.csdnimg.cn/2d1c18e6f4004ae0828eefa00159ecfb.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

> ![](https://img-blog.csdnimg.cn/03f8dc4820e247bd8d267b22b9cca8b8.png)

①：[逻辑结构](https://so.csdn.net/so/search?q=%E9%80%BB%E8%BE%91%E7%BB%93%E6%9E%84&spm=1001.2101.3001.7020)设计是将概念结构转换为某个数据库管理系统所支持的数据模型，并对其进行优化

②：步骤

1.  把概念模型转换成一般的数据模型
2.  把一般的数据模型转换成特定的DBMS所支持的数据模型
3.  通过优化方法将其转化为优化的数据模型。

第九章：关系查询处理和关系优化
===============

## 第一节：查询处理

**查询处理是关系数据库管理系统执行查询语句的过程，其任务是把用户提交给关系数据库管理系统的查询语句转换为高效的查询执行计划**

### 一：查询处理步骤

**关系数据库管理系统查询处理可以分为4个阶段：**

*   查询分析
*   查询检查
*   查询优化
*   查询执行

![](https://img-blog.csdnimg.cn/fb5e2957811b40b0bbdb537203e98efa.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

#### （1）查询分析

**任务：对查询语句进行扫描，分析词法、语法是否符合SQL语法规则**

*   如果没有语法错误转入下一步
*   如果有语法错误则在报告中显示错误

#### （2）查询检查

**任务：**

*   对合法的查询语句进行**语义检查**，即根据数据字典中有关的模式定义检查语句中的数据库对象，如**关系名、属性名是否存在和有效**
*   如果是对视图的操作，则要用**视图消解方法**把对视图的操作转换成对基本表的操作
*   还要对**权限**、**完整性约束**进行检查，如果违反则拒绝查询
*   检查通过后，**把SQL查询语句转化为内部表示，也即等价的关系代数表达式**
*   在此过程中，**要把数据库对象的外部名称换为内部表示**
*   RDBMS一般用**查询树**（又称为**语法分析树**）来表示扩展的关系代数表达式

#### （3）查询优化

**任务：每个查询都会有许多可供选择的执行策略和操作算法，查询优化就是选择一个高效执行的查询处理策略。按照优化的层次一般可以将查询优化分为**

*   **代数优化**：是指**关系代数表达式**的优化，也即按照一定规则，通过对关系代数表达式进行**等价变换**，改变代数表达式中操作的**次序和组合**，使查询更高效
*   **物理优化**：是指**存取路径**和**底层操作算法**的选择。选择依据可以是**基于规则的(rule based)**、**基于代价的(cost based)、基于语义的(semantic based)**

#### （4）查询执行

依据优化器得到的执行策略生成查询执行计划，由 **代码生成器(code generator)** 生成执行这个查询计划的代码，然后加以执行，回送查询结果。

### 二：实现查询操作的算法示例

#### （1）选择操作的实现

以简单的单表选择为例，如下

    SELECT* FROM STUDENT WHERE<条件表达式>


`<条件表达式>`可以有以下几种情况

*   c a s e 1 case1 case1：无条件
*   c a s e 2 case2 case2：Sno=‘201215121’
*   c a s e 3 case3 case3：Sage > 20
*   c a s e 4 case4 case4：Sdept=‘CS’ AND Sage > 20

选择操作只涉及一个关系，典型的实现方法有

##### ①：全表扫描

**思想：假设可以使用的内存块为 M M M块**

*   按照物理次序读`Student`的 M M M块到内存
*   检查内存的每个元组 t t t，如果 t t t满足选择条件，则输出 t t t
*   如果`Student`还有其他块未被处理，重复即可

**优缺点：**

*   **优点**：只需要用很少的内存（最少为1块）就可以运行，且控制简单。适用于规模较小的表
*   **缺点**：对于规模大的表进行顺序扫描，当选择率低时会使效率很低

##### ②：索引（或散列）扫描

**思想：如果选择条件中的属性上有索引（例如 B B B+树索引或 h a s h hash hash索引），可以用索引扫描。通过索引先找到满足条件的元组指针，再通过元组指针在查询的基本表中找到元组。** 一般来说，当选择率低于10%时建立索引才有意义

*   **以 c a s e case case 2为例**：Sno=‘201215121’，并且Sno上有索引，则可以使用索引得到Sno为’201215121’元组的指针，然后通过元组指针在Student表中检索到该学生
*   **以 c a s e case case 3为例**：Sage>20， 并且Sage上有B+树索引，则可以使用B+树索引找到Sage=20的索引项，以此为入口点在B+树的顺序集上得到Sage>20的所有元组指针，然后通过这些元组指针到`Student`表中检索到所有年龄大于20的学生
*   **以 c a s e case case 4为例**： Sdept=‘CS’ AND Sage>20, 如果`Sdept`和`Sage` 上都有索引，**一种算法是**，分别用上面两种方法找到Sdept='CS’的一组元组指针和Sage>20的另一组元组指针，求这两组指针的交集，再到Student表中检索，就得到计算机系年龄大于20岁的学生；**另一种算法是**，找到Sdept='CS’的一组元组指针，通过这些元组指针到Student表中检索，并对得到的元组检查另一些选择条件(如Sage>20) 是否满足，把满足条件的元组作为结果输出

#### （2）连接操作的实现

**连接操作是查询处理中最常用也是最耗时的操作之一** 。不失一般性，这里通过例子简单介绍 **等值连接(或自然连接)** 最常用的几种算法思想

    SELECT * FROM Student,SC WHERE Student.Sno=SC.Sno;


##### ①：嵌套循环方法（nested loop）

**思想：对外层循环(`Student`表)的每一个元组，检索内层循环(`SC`表)中的每一个元组，并检查这两个元组在连接属性(`Sno`) 上是否相等。如果满足连接条件，则串接后作为结果输出，直到外层循环表中的元组处理完为止**

##### ②：排序-合并方法（sort-merge join）

**思想：**

![](https://img-blog.csdnimg.cn/8fc10af072254f0f8e52d7aa679d3598.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_17,color_FFFFFF,t_70,g_se,x_16)

1.  如果参与连接的表没有排好序，首先对`Student`表和`SC`表按连接属性`Sno`**排序**
2.  取Student表中第一个 `Sno`,**依次扫描**`SC`表中具有相同`Sno`的元组，把它们连接起来
3.  当扫描到`Sno`**不相同的第 一个SC元组**时，返回`Student` 表扫描它的下一 个元组，再扫描`SC`表中具有相同`Sno`的元组，把它们连接起来

**重复上述步骤直至`Student`扫描完毕**

##### ③：索引连接（index join）

**思想：**

*   在`SC`表上已经建立了属性`Sno`的**索引**
*   对`Student`中每一个元组，由`Sno`值通过`SC`的索引查找相应的`SC`元组
*   把这些`SC`元组和`Student`元组连接起来

**循环执行第二步和第三步，直至`Student`中的元组处理完毕**

##### ④：哈希连接（hash join）

**思想：它把连接属性作为hash码，用同一个hash函数把`Student`表和`SC`表中的元组散列到hash表中**

*   **划分阶段（创建阶段）**：即创建hash表。对包含较少元组的表( 如`Student`表)进行一遍处理，把它的元组按hash函数(hash码是连接属性)分散到hash表的桶中
*   **试探阶段（连接阶段）**：对另一个表(`SC`表)进行一遍处理，把`SC`表的元组也按同一个hash函数(hash 码是连接属性)进行散列，找到适当的hash桶，并把`SC`元组与桶中来自`Student` 表并与之相匹配的元组连接起来。

## 第二节：查询优化

### 一：查询优化概述

#### （1）查询优化的地位和重要性

关系系统的查询优化既是关系[数据库管理系统](https://so.csdn.net/so/search?q=%E6%95%B0%E6%8D%AE%E5%BA%93%E7%AE%A1%E7%90%86%E7%B3%BB%E7%BB%9F&spm=1001.2101.3001.7020)实现的**关键技术**，又是关系系统的**优点所在**。**用户只要提出“干什么”，而不必指出“怎么干”**。

在非关系系统中，**用户必须了解存取路径，系统提供用户选择存取路径的手段，查询的效率由用户的存取策略决定，且系统是无法加以优化的。这就要求用户需要具有较高的数据库技术和程序设计水平**

**查询优化的优点不仅在于用户不必考虑如何最好地表达查询以获得较高的效率，而且在于系统可以比用户程序的“优化”做得更好**。这是因为：

*   优化器可以从数据字典中获得很多统计信息，但是用户程序难以获得
*   即便数据库物理统计信息改变，系统也可以进行优化从而选择相应的执行计划，但是对于非关系系统则必须要重写程序
*   优化器可以考虑数百种不同的执行计划，但程序员一般仅能考虑有限的几种可能性
*   优化器包含了很多复杂的优化技术，这样就等同于所用的使用者间接拥有了这些技术

#### （2）执行代价

目前关系数据库管理系统通过某种代价模型计算出各种查询执行策略的执行代价，然后选取**代价最小的执行方案**。一般来说：**总代价=I/O代价+CPU代价+内存代价+通信代价**

*   计算查询代价时一般用**查询处理读写的块数**作为衡量单位

### 二：一个例子

可以通过“**求选修了2号课程的学生姓名**”这样一个例子来说明为什么要进行查询优化

以下是一些**系统假设**

*   假定学生-课程数据库中有**1 000个学生记录，10 000个选课记录（平均每一个学生了选了10门课），其中选修2号课程的选课记录为50个**
    
*   有**7个内存块**（其中**分配5块用于装入`Student`表，1块用于装入`SC`表，1块用于装入中间结果**）
    
*   其中**一块可以装入10个`student`元组**（或10个`student`与SC[笛卡尔积](https://so.csdn.net/so/search?q=%E7%AC%9B%E5%8D%A1%E5%B0%94%E7%A7%AF&spm=1001.2101.3001.7020)元组）；一块也可以 **装入50个SC元组**（因为SC的列数较少）
    
*   连接方法为：**基于数据块的嵌套循环法。**
    
*   **之所以这样分配的原因**：因为嵌套循环算法需要选用占用内存少的表作为外表，student表有1000行，每块装10行，所以需要100块；SC表有10000行，每块装50行，所以需要200块。
    
*   由于student表需要100个内存块，而分配给它的只有5个，所以不可能一次全部装入内存，每次只能装入一部分，比较完了再装入另外一部分。每换一批数据，内标就需要全部重新装入以便，所以为了减少内表循环装入的次数，就必须尽可能的分配内存给外表
    
*   连接后的元组**装满一块**后就写到中间文件上
    

    SELECT Student.name
    FROM Student,SC
    WHERE Student.Sno=SC.Sno AND SC.Cno='2';
    

系统可以用多种等价的**关系代数表达式**来完成这一查询，这里只举三种情况

#### （1）情况1

![](https://img-blog.csdnimg.cn/8bd3e426e2c94131843dcdc9f7460ca0.png)

`Student`与`Sc`作**笛卡尔积**，而后作**行选择**运算（选择条件为`Student.Sno=SC.Sno AND SC.Cno='2'`），最后进行**投影操作**

![](https://img-blog.csdnimg.cn/69d8ccc8f1b04b21af1c92790fc3c433.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

##### ①：计算广义笛卡尔积

**操作**：

*   在内存中尽可能多地装入某个表(如`Student`表)的若干块，**留出一块存放另一个表(如`SC`表)的元组**；
*   然后把`SC`中的每个元组和`Student`中每个元组**连接**，连接后的元组**装满一块后就写到中间文件上**，再从`SC`中读入一块和内存中的`Student`元组连接，直到`SC`表处理完；
*   这时再一次读入若干块`Student`元组，读入一块`SC`元组，重复上述处理过程，直到把`Student`表处理完

**块数**：

*   读一遍`Student`表所需块数为= 1000 10 = 100 \\frac{1000}{10}=100 101000\=100块
*   读一遍`SC`表所需要块数为= 10000 50 = 200 \\frac{10000}{50}=200 5010000\=200块
*   由于`Student`表可用块数为5块，所以分 100 5 = 20 \\frac{100}{5}=20 5100\=20次读入
*   同时，`Student`表的每一部分读入内存时，`SC`表都需要重新读一遍，以此完成与`Student`表的连接。所以需要读入200×20=4000块
*   **所以笛卡尔积读取总块数为100+4000=4100块**
*   `Student`表和`SC`表作笛卡尔积共有 1 0 7 10^{7} 107行，每块装10行，**所以中间结果块数为 1 0 6 10^{6} 106块（写入）**

##### ②：作选择操作

**块数**：

*   **所读块数为 1 0 6 10^{6} 106块**
*   选择后的结果只有50个（无需读写）

##### ③：作投影操作

*   无需读写

**情况1读取总块数**：

**4100（读）+ 1 0 6 10^{6} 106（写）+ 1 0 6 10^{6} 106（读）。约为200万块**

#### （2）情况2

![](https://img-blog.csdnimg.cn/1794ac0d18714f92a67568241a35cead.png)  
`Student`与`Sc`作**自然连接**，而后作**行选择**运算（选择条件为`Student.Sno=SC.Sno AND SC.Cno='2'`），最后进行**投影操作**

![](https://img-blog.csdnimg.cn/77861f8f9814476b8e57817f4cbf02d8.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

##### ①：计算自然连接

**块数**：

*   首先读`Student`和`SC`，与情况1一致。因此**总块数=4100块**
*   `Student`和`SC`自然连接后右10000行，所以**中间结果块数 10000 10 \\frac{10000}{10} 1010000\=1000**块

##### ②：作选择操作

**块数**：

*   读入中间结果，**块数=1000块**

##### ③：作投影操作

*   50个结果可以不用写入

* * *

**情况2读取总块数**：

**4100（读）+ 1000 1000 1000（写）+ 1000 1000 1000（读）。共计6100块**

*   代价约为情况1的 1 488 \\frac{1}{488} 4881

#### （3）情况3

![](https://img-blog.csdnimg.cn/476cca8d7382477db2de5a901281120c.png)

首先`Sc`作**行选择**（选择条件为`SC.Cno='2'`），而后作**自然连接**运算，最后进行**投影操作**

![](https://img-blog.csdnimg.cn/fb1e0519f2de4215b4ddbe20200fae15.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

**块数**：

*   先对`SC`表作**选择操作**，**只需读一遍`SC`表，存取块数为100块**，因为满足条件的元组仅50个，**不必使用中间文件**
*   读取`Student`表，把读入的`Student`元组和内存中的`SC`元组作连接。**也只需读一遍`Student`表，共100块**，把连接结果投影输出

* * *

**情况3读取总块数**：

**100（读）+200（读）。共计300块**

*   代价约为情况1的的万分之一
*   代价约为情况2的 1 20 \\frac{1}{20} 201

### 三：代数优化和物理优化

通过上面的那个例子可以看到：经过优化，磁盘I/O涉及块数**从200万下降至300**，效率提升显著，这说明查询优化是非常有必要的。上述三种情况其有些操作是可以优化的，例如

*   **情况一**：明知在笛卡尔积后要做行选择，那**为什么不在连接时就把选择做了**，这样只会留下50个元组，也即省去了100万个块的读写操作
*   **情况二**：也是如此，在作自然连接时如果也把选择做了，就会省去1000个块的读写操作
*   **情况三**：它是先作选择再作连接，所以大大减少了块数

**因此，由情况1到情况2再到情况3这样的优化称之为代数优化；而如果对底层路径或算法进行优化则称之为物理优化。例如对于情况三，可以添加索引，继续减小代价**

## 第三节：查询优化之代数优化

### 一：[关系代数表达式](https://so.csdn.net/so/search?q=%E5%85%B3%E7%B3%BB%E4%BB%A3%E6%95%B0%E8%A1%A8%E8%BE%BE%E5%BC%8F&spm=1001.2101.3001.7020)等价变换规则

*   为了能方便阅读，就没用截图。手都麻了🤮（动动手点个赞吧🥳）  
    ![](https://img-blog.csdnimg.cn/eb444fc94a1b4defa8679beb3c0485ce.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

#### （1）连接、笛卡尔积、并、交的交换律

**笛卡尔积**

R × S ≡ S × R R×S \\equiv S×R R×S≡S×R

**并**  
R ∪ S ≡ S ∪ R R \\cup S \\equiv S \\cup R R∪S≡S∪R

**交**

R ∩ S ≡ S ∩ R R \\cap S \\equiv S \\cap R R∩S≡S∩R

**连接**

R ⋈ F S ≡ S ⋈ F R 、 R ⋈ S ≡ S ⋈ R R \\underset{F}{\\bowtie} S \\equiv S \\underset{F}{\\bowtie} R 、 R\\bowtie S \\equiv S\\bowtie R RF⋈S≡SF⋈R、R⋈S≡S⋈R

#### （2）连接、笛卡尔积、并、交的结合律

**笛卡尔积**

( R × S ) × T ≡ R × ( S × T ) (R×S) ×T\\equiv R×(S×T) (R×S)×T≡R×(S×T)

**并**  
( R ∪ S ) ∪ T ≡ R ∪ ( S ∪ T ) (R \\cup S)\\cup T \\equiv R \\cup (S\\cup T) (R∪S)∪T≡R∪(S∪T)

**交**

( R ∩ S ) ∩ T ≡ R ∩ ( S ∩ T ) (R \\cap S)\\cap T \\equiv R \\cap (S\\cap T) (R∩S)∩T≡R∩(S∩T)

**连接**

( R ⋈ F S ) ⋈ F T ≡ R ⋈ F ( S ⋈ F T ) (R \\underset{F}{\\bowtie} S) \\underset{F}{\\bowtie} T \\equiv R \\underset{F}{\\bowtie} (S \\underset{F}{\\bowtie} T) (RF⋈S)F⋈T≡RF⋈(SF⋈T)  
( R ⋈ S ) ⋈ T ≡ R ⋈ ( S ⋈ T ) (R\\bowtie S) \\bowtie T \\equiv R\\bowtie (S \\bowtie T) (R⋈S)⋈T≡R⋈(S⋈T)

#### （3）投影的串接定律

**关系的两次投影操作可以合并为一次完成（反过来就是分解）**

Π A 1 , A 2 , . . . , A n ( Π B 1 , B 2 , . . . , B m ( E ) ) ≡ Π A 1 , A 2 , . . . , A n ( E ) \\Pi\_{A\_{1},A\_{2},...,A\_{n}}(\\Pi\_{B\_{1},B\_{2},...,B\_{m}}(E)) \\equiv \\Pi\_{A\_{1},A\_{2},...,A\_{n}}(E) ΠA1,A2,...,An(ΠB1,B2,...,Bm(E))≡ΠA1,A2,...,An(E)

*   E E E是关系代数表达式
*   A i ( i = 1 , 2 , . . , n ) ， B j ( j = 1 , 2 , . . , m ) A\_{i}(i=1,2,..,n)，B\_{j}(j=1,2,..,m) Ai(i\=1,2,..,n)，Bj(j\=1,2,..,m)是属性名。并且 { A 1 , A 2 , . . . , A n } \\{ {A\_{1},A\_{2},...,A\_{n}} \\} {A1,A2,...,An}构成 { B 1 , B 2 , . . . , B m } \\{ {B\_{1},B\_{2},...,B\_{m}} \\} {B1,B2,...,Bm}的子集

#### （4）选择的串接定律

**选择的两次投影操作可以合并为一次完成（反过来就是分解）**

σ F 1 ( σ F 2 ( E ) ) ≡ σ F 1 ∧ F 2 ( E ) \\sigma\_{F1}(\\sigma\_{F2}(E)) \\equiv \\sigma\_{F1\\land F2}(E) σF1(σF2(E))≡σF1∧F2(E)

#### （5）选择与投影的交换律

σ F ( Π A 1 , A 2 , . . . , A n ( E ) ) ≡ Π A 1 , A 2 , . . . , A n ( σ F ( E ) ) \\sigma\_{F}(\\Pi\_{A\_{1},A\_{2},...,A\_{n}}(E)) \\equiv \\Pi\_{A\_{1},A\_{2},...,A\_{n}}(\\sigma\_{F}(E)) σF(ΠA1,A2,...,An(E))≡ΠA1,A2,...,An(σF(E))

*   **假设**：选择条件 F F F只涉及属性 A 1 , A 2 , . . . , A n {A\_{1},A\_{2},...,A\_{n}} A1,A2,...,An

Π A 1 , A 2 , . . . , A n ( σ F ( E ) ) ≡ Π A 1 , A 2 , . . . , A n ( σ F ( Π A 1 , A 2 , . . . , A n , B 1 , B 2 , . . . , B m ( E ) ) ) \\Pi\_{A\_{1},A\_{2},...,A\_{n}}(\\sigma\_{F}(E)) \\equiv \\Pi\_{A\_{1},A\_{2},...,A\_{n}}(\\sigma\_{F}( \\Pi\_{A\_{1},A\_{2},...,A\_{n},B\_{1},B\_{2},...,B\_{m}}(E))) ΠA1,A2,...,An(σF(E))≡ΠA1,A2,...,An(σF(ΠA1,A2,...,An,B1,B2,...,Bm(E)))

*   **假设**： F F F中有不属于 A 1 , A 2 , . . . , A n {A\_{1},A\_{2},...,A\_{n}} A1,A2,...,An的属性 B 1 , B 2 , . . . , B m {B\_{1},B\_{2},...,B\_{m}} B1,B2,...,Bm

#### （6）选择与笛卡尔积的交换律

对于 σ F ( E 1 × E 2 ) \\sigma\_{F}(E\_{1}×E\_{2}) σF(E1×E2)，有如下等价

①

σ F ( E 1 × E 2 ) ≡ σ F ( E 1 ) × E 2 \\sigma\_{F}(E\_{1}×E\_{2}) \\equiv \\sigma\_{F}(E\_{1})×E\_{2} σF(E1×E2)≡σF(E1)×E2

*   **假设**：**选择条件只与其中的一个关系有关，应该对那个关系先做选择，然后再做笛卡尔积**。例如上面 F F F中涉及的属性都是 E 1 E\_{1} E1中的属性

②

σ F ( E 1 × E 2 ) ≡ σ F 1 ( E 1 ) × σ F 2 ( E 2 ) \\sigma\_{F}(E\_{1}×E\_{2}) \\equiv \\sigma\_{F\_{1}}(E\_{1})×\\sigma\_{F\_{2}}(E\_{2}) σF(E1×E2)≡σF1(E1)×σF2(E2)

*   **假设**：**选择条件与两个关系都有关，应该先分别做选择，然后再做笛卡尔积**。例如上面 F = F 1 ∧ F 2 F=F\_{1} \\land F\_{2} F\=F1∧F2，并且 F 1 F\_{1} F1中只涉及 E 1 E\_{1} E1中的属性， F 2 F\_{2} F2中只涉及 E 2 E\_{2} E2中的属性

③

σ F ( E 1 × E 2 ) ≡ σ F 2 ( σ F 1 ( E 1 ) × E 2 ) \\sigma\_{F}(E\_{1}×E\_{2}) \\equiv \\sigma\_{F\_{2}}(\\sigma\_{F\_{1}}(E\_{1})×E\_{2}) σF(E1×E2)≡σF2(σF1(E1)×E2)

*   **假设：如果选择条件与某一部分关系有关，那么也应该先对那个关系做部分选择，然后做笛卡尔积，最后做选择**。例如上面 F = F 1 ∧ F 2 F=F\_{1} \\land F\_{2} F\=F1∧F2，并且 F 1 F\_{1} F1中只涉及 E 1 E\_{1} E1中的属性， F 2 F\_{2} F2中涉及 E 1 E\_{1} E1和 E 2 E\_{2} E2中的属性

#### （7）选择与并的分配律

σ ( E 1 ∪ E 2 ) ≡ σ F ( E 1 ) ∪ σ F ( E 2 ) \\sigma(E\_{1} \\cup E\_{2}) \\equiv \\sigma\_{F}(E\_{1}) \\cup \\sigma\_{F}(E\_{2}) σ(E1∪E2)≡σF(E1)∪σF(E2)

*   **假设**： E = E 1 ∪ E 2 E=E\_{1} \\cup E\_{2} E\=E1∪E2， E 1 E\_{1} E1和 E 2 E\_{2} E2有相同的属性名

#### （8）选择与差运算的分配律

σ ( E 1 − E 2 ) ≡ σ F ( E 1 ) − σ F ( E 2 ) \\sigma(E\_{1} - E\_{2}) \\equiv \\sigma\_{F}(E\_{1}) - \\sigma\_{F}(E\_{2}) σ(E1−E2)≡σF(E1)−σF(E2)

#### （9）选择对自然连接的分配律

σ F ( E 1 ⋈ E 2 ) ≡ σ F ( E 1 ) ⋈ σ F ( E 2 ) \\sigma\_{F}(E\_{1} \\bowtie E\_{2}) \\equiv \\sigma\_{F}(E\_{1}) \\bowtie \\sigma\_{F}(E\_{2}) σF(E1⋈E2)≡σF(E1)⋈σF(E2)

*   F F F只涉及 E 1 E\_{1} E1和 E 2 E\_{2} E2的**公共属性**

#### （10）投影与笛卡尔积的分配律

Π A 1 , A 2 , . . . , A n , B 1 , B 2 , . . . , B m ( E 1 × E 2 ) ≡ Π A 1 , A 2 , . . . , A n ( E 1 ) × Π B 1 , B 2 , . . . , B m ( E 2 ) \\Pi\_{A\_{1},A\_{2},...,A\_{n},B\_{1},B\_{2},...,B\_{m}}(E\_{1}×E\_{2}) \\equiv \\Pi\_{A\_{1},A\_{2},...,A\_{n}}(E\_{1}) × \\Pi\_{B\_{1},B\_{2},...,B\_{m}}(E\_{2}) ΠA1,A2,...,An,B1,B2,...,Bm(E1×E2)≡ΠA1,A2,...,An(E1)×ΠB1,B2,...,Bm(E2)

*   A 1 , A 2 , . . . , A n A\_{1},A\_{2},...,A\_{n} A1,A2,...,An是 E 1 E\_{1} E1的属性
*   B 1 , B 2 , . . . , B m B\_{1},B\_{2},...,B\_{m} B1,B2,...,Bm是 E 2 E\_{2} E2的属性

#### （11）投影与并的分配律

Π A 1 , A 2 , . . . , A n ( E 1 ∪ E 2 ) ≡ Π A 1 , A 2 , . . . , A n ( E 1 ) ∪ Π A 1 , A 2 , . . . , A n ( E 2 ) \\Pi\_{A\_{1},A\_{2},...,A\_{n}}(E\_{1} \\cup E\_{2}) \\equiv \\Pi\_{A\_{1},A\_{2},...,A\_{n}}(E\_{1}) \\cup \\Pi\_{A\_{1},A\_{2},...,A\_{n}}(E\_{2}) ΠA1,A2,...,An(E1∪E2)≡ΠA1,A2,...,An(E1)∪ΠA1,A2,...,An(E2)

### 二：查询树的启发式优化

*   这是对关系代数表示的查询树进行优化的方法

#### （1）典型的启发式规则

**典型的启发式规则**

*   **【规则1】选择运算应尽可能先做**：这是为了**减少中间结果的规模**
*   **【规则2】投影和选择运算同时进行**：这是为了**避免重复扫描**
*   **【规则3】将投影运算与其前后的双目运算结合起来**：这是为了**避免重复扫描**
*   **【规则4】把某些选择运算和其前面的笛卡尔积结合起来成为一个连接运算**：这是为了**减少中间结果的规模**
*   **【规则5】提取公共子表达式（公因子）**：这是为了**保存计算结果，避免重复计算**

#### （2）实现算法

*   **该算在遵循启发式规则，并应用关系代数表达式等价变换规则来优化关系表达式**
*   **该算法的输入和输出都是查询树（分别对应待优化和优化的关系表达式）**

**算法步骤**

*   **【步骤1】分解选择运算**：这是为了**便于不同的选择运算沿树的不同分枝向树叶移动，一直移动到与这个选择条件相关的关系处，使选择尽可能先做**。 σ F 1 ∧ F 2 ∧ . . . ∧ F n ( E ) ⇒ σ F 1 ( σ F 2 ( . . . ( σ F n ( E ) ) . . . ) ) \\sigma\_{F\_{1} \\land F\_{2} \\land ... \\land F\_{n}} (E)\\Rightarrow \\sigma\_{F\_{1}}(\\sigma\_{F\_{2}}(...(\\sigma\_{F\_{n}}(E))...)) σF1∧F2∧...∧Fn(E)⇒σF1(σF2(...(σFn(E))...))
*   **【步骤2】通过交换选择运算，将每个选择运算尽可能移动到叶端**：利用**规则4~9**尽可能把选择移动到树的叶端
*   **【步骤3】通过交换投影运算，将每个投影运算尽可能移动到叶端**：利用**规则3、11、10、5**尽可能把投影移动到树的叶端
*   **【步骤4】合并选择和投影的串接**：利用**规则3~5把选择和投影的串接合并成单个选择、单个投影或一个选择后面跟一个投影**。这是为了**使多个选择或投影能同时进行，或在一次扫描中全部完成**
*   **【步骤5】对内结点分组**：每一**双目运算**（ × × ×、 ⋈ \\bowtie ⋈、 ∪ \\cup ∪、 − - −）和它**所有的直接祖先的一元运算结点**（ σ \\sigma σ或 Π \\Pi Π）分为一组（如果其**后代直到叶子全是单目运算**，则也将他们并入该组）；注意当双目运算是**笛卡尔积**（ × × ×），而且**其后的选择不能与它结合为等值连接**时，则**不能**将选择与这个 × × ×并为一组

#### （3）实例演示

*   注意这是一个很重要的考点

【例】如下给出了一个SQL语句

    SELECT Student.Sname FROM Student,SC
    WHERE Student.Sno=SC.Sno AND SC.Sno='2';


**将SQL语句转为关系代数表达式**

*   先对`Student`和`SC`做笛卡尔积
*   再对中间结果做选择（条件为 `Student.Sno=SC.Sno`）
*   再对中间结果做选择（条件为`SC.Sno='2'`）
*   最后投影

**结果为**

Π S n a m e ( σ S t u d e n t . S n o = s c . C n o ∧ s c . c n o = 2 ( s t u d e n t × s c ) ) \\Pi\_{Sname}(\\sigma\_{Student.Sno=sc.Cno \\land sc.cno=2}(student × sc)) ΠSname(σStudent.Sno\=sc.Cno∧sc.cno\=2(student×sc))

**将关系代数表达式转为查询树**

![](https://img-blog.csdnimg.cn/eeaf0cbdac57409db637cfdf1effdc12.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

**查询树优化**

①**首先选择条件尽可能下移**：

*   `SC.Sno='2'`只和`SC`有关，所以它会沿着分支恰当的分支下移到`SC`的上方
*   `Student.Sno=SC.Sno`同时涉及Student和SC，所以只能待在那里

![](https://img-blog.csdnimg.cn/f8ca580b28c348728a4227fbeebfdab8.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

**②：把选择和其之前的笛卡尔积合并为等值连接，或者干脆变为自然连接**

![](https://img-blog.csdnimg.cn/ee42cb9384224aa8b08f1f9a4c98710c.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

* * *

【例】查询选修了数据库课程的女生学号与姓名，如下是SQL语句

    SELECT Student.Sno,Sname FROM Student,SC,Course
    WHERE Cname='datebase' AND Ssex='女';


**将SQL语句转为关系代数表达式**

Π S n o , S n a m e ( σ C n a m e = ′ 数据 库 ′ ∧ S s e x = ′ 女 ′ ( S C ⋈ C o u r s e ⋈ S t u d e n t ) ) \\Pi\_{Sno,Sname}(\\sigma\_{Cname='数据库' \\land Ssex='女'}(SC \\bowtie Course \\bowtie Student)) ΠSno,Sname(σCname\=′数据库′∧Ssex\=′女′(SC⋈Course⋈Student))

**将关系代数表达式转为查询树**

![](https://img-blog.csdnimg.cn/a9608f55f3fe4b00908e2c84d59f1ea1.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

**查询树优化**

**①：选择条件复杂，先分解选择条件**

![](https://img-blog.csdnimg.cn/7f2769de8b57493f824af768f1a3f7e3.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)  
**②：将选择运算尽可能移动到树的叶端**

![](https://img-blog.csdnimg.cn/517e9613e8b749ba99bb4855a2a4ae28.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)  
**③：涉及了投影运算，所以也把它尽可能移动到树的叶端**

*   投影运算下移时要保留连接属性

![](https://img-blog.csdnimg.cn/b6c5cb22d8f54517b0e2fcb56c78165b.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)  
**④：对内结点进行分组**

![](https://img-blog.csdnimg.cn/5c4d372197a34af4991abf8bf02e1659.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

## 第四节：查询优化之物理优化

代数优化改变查询语句中操作的次序和组合，但**不涉及底层的存取路径**。对于一个查询语句有许多存取方案，它们的执行效率不尽相同，因此，**仅仅进行代数优化是远远不够的**

**物理优化就是要选择高效合理的操作算法或存取路径以求得优化的查询计划。具体方法有**

*   **基于规则的启发式优化**：启发式规则是指那些在大多数情况下都适用，但不是在每种情况下都是最好的规则
*   **基于代价估算的优化**：使用优化器估算不同执行策略的代价，并选出具有最小执行代价的执行计划
*   **两者结合的优化方法**

### 一：基于启发式规则的存取路径选择优化（定性）

#### （1）选择操作的启发式规则

##### A：小关系

**对于小关系，使用全表顺序扫描，即使选择列上有索引**

##### B：大关系

启发式规则有：

*   **对于选择条件是“主码=值”的查询，查询结果最多是一个元组，可以选择主码索引。一般的RDBMS会自动建立主码索引**
*   **对于选择条件是“非主属性=值”的查询，并且选择列上有索引，同样要估算查询结果的元组数目，如果选择率<10%可以使用索引扫描方法，否则还是使用全表扫描**
*   **对于用AND连接的合取选择条件，如果有涉及这些属性的组合索引，则优先采用组合索引扫描方法**
*   **对于用OR连接的析取选择条件，一般使用全表顺序扫描**

#### （2）连接操作的启发式规则

*   **如果2个表都已经按照连接属性排序，则选用排序-合并算法**
*   **如果一个表在连接属性上有索引，则可以选用索引连接算法**
*   **如果上面2个规则都不适用，其中一个表较小，则可以选用hash join算法**
*   **最后可以选用嵌套循环算法，并选择其中较小的表，确切地讲是占用的块数(B)较少的表，作为外表(外循环的表)（具体原因在第二节已经讲过）**

### 二：基于代价估算的优化（定量）

#### （1）统计信息

基于代价的优化方法要计算各种操作算法的执行代价，它与数据库的状态密切相关。为此在[数据字典](https://so.csdn.net/so/search?q=%E6%95%B0%E6%8D%AE%E5%AD%97%E5%85%B8&spm=1001.2101.3001.7020)中存储了优化器需要的**统计信息**(database statistics), 主要包括如下几个方面：

*   **基本表**：该表的元组总数（ N N N）、元组长度（ l l l）、占用的块数（ B B B）、占用的溢出块数（ B Q BQ BQ）等
*   **基本表每个列**：该列不同值的个数（ m m m）、该列最大值、最小值，该列上是否已经建立了索引，如果有，又是哪一种索引等
*   **索引**：索引的层数（ L L L）、不同索引值的个数、索引的选择基数 S S S等

#### （2）代价估算示例

*   此部分了解即可，不做深入探究

##### A：全表扫描算法代价估算公式

![](https://img-blog.csdnimg.cn/36064a7f252f4d09bb5b46a8914156d6.png)

##### B：索引扫描算法代价估算公式

![](https://img-blog.csdnimg.cn/b23a805336174f5aaa459df8911fae00.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

##### C：嵌套循环算法代价估算公式

![](https://img-blog.csdnimg.cn/7170d8533fab4ac1a5fe4a3fe66c7807.png)

##### D：排序-合并连接算法的代价估算公式

![](https://img-blog.csdnimg.cn/75660ab710fe43488d9148fdbf626f16.png)

## 习题

### 名词解释

*   **代数优化**：是指关系代数表达式的优化，也即按照一定规则，通过对关系代数表达式进行等价变换，改变代数表达式中操作的次序和组合，使查询更高效
*   **物理优化**：是指存取路径和底层操作算法的选择。选择依据可以是基于规则的(rule based)、基于代价的(cost based)、基于语义的(semantic based)

### 简答题

> ![](https://img-blog.csdnimg.cn/ed5f937ed0504e9885f2d4206e926c32.png)

【答案】

![](https://img-blog.csdnimg.cn/f4700caf6fb64ec99c4fb51260f79931.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

![](https://img-blog.csdnimg.cn/fa8bdd4d94e24cef929acd4abc9e0465.png)  
![](https://img-blog.csdnimg.cn/e0298813f1df46f6960ea858b13f46b0.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)  
![](https://img-blog.csdnimg.cn/63d60a6ab38f49fab812ba50af3edbec.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

### 应用题

> ![](https://img-blog.csdnimg.cn/306b7cc059924d46ac2766786f895ee1.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

（1）由于一个块能装40个R的元祖，所以需要20000/40=500块

（2）所需块数为4（3个B+树和一个数据）

（3）由于1200/30=40块，所以S作为外表，假设[内存分配](https://so.csdn.net/so/search?q=%E5%86%85%E5%AD%98%E5%88%86%E9%85%8D&spm=1001.2101.3001.7020)的块数为x，那么这40块需要40/x次装入，每次装入时都要重新读取R，所以总次数为40+500×（40 / x）

（4）有序的时候：（20000 ÷ 40） + （1200 ÷30） = 500 + 40 = 540 = T（有序）  
无序的时候：T(排序) + T（有序）

> ![](https://img-blog.csdnimg.cn/47b14e1a40dc4e45984af8c6cb8342b3.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

【答案】

首先将SQL语句转为[关系代数表达式](https://so.csdn.net/so/search?q=%E5%85%B3%E7%B3%BB%E4%BB%A3%E6%95%B0%E8%A1%A8%E8%BE%BE%E5%BC%8F&spm=1001.2101.3001.7020)

Π C n a m e ( σ S t u d e n t . S d e p t = ′ I S ′ ( σ S C . C n o = C o u r s e . C n o ( σ S t u d e n t . S n o = S C . S n o ( S t u d e n t × S C ) × C o u r s e ) ) ) \\Pi\_{Cname}(\\sigma\_{Student.Sdept='IS'}(\\sigma\_{SC.Cno=Course.Cno}(\\sigma\_{Student.Sno=SC.Sno }(Student × SC) × Course))) ΠCname(σStudent.Sdept\=′IS′(σSC.Cno\=Course.Cno(σStudent.Sno\=SC.Sno(Student×SC)×Course)))

将关系代数表达式转为查询树

![](https://img-blog.csdnimg.cn/2aceee2b4c324cd396465229ad7459dc.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)  
优化

![](https://img-blog.csdnimg.cn/de8bf6f494ee422c9e9653faad945840.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

> ![](https://img-blog.csdnimg.cn/43dc95fa6ab240288b90fcaeb09df0f5.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

【答案】

（1）：对teacher表进行扫描，查看元组性别为女的数据  
（2）：可以先通过索引找到Dno = 301的，然后顺着B+树的顺序集合来得到想要的数据即可。  
（3）：和（1）几乎一样，对表进行扫面，找到满足条件的  
（4）：先对year进行处理，找到之后判断salary是否满足条件  
（5）：对work表进行扫描，看数据是否满足条件。

> ![](https://img-blog.csdnimg.cn/6cdb0aa8aff14ab1983274ad58a83c26.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)  
> ![](https://img-blog.csdnimg.cn/7cf4f17012994d1aaaf4f125e8799d73.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

【答案】

![](https://img-blog.csdnimg.cn/3831053042dd48e38dd501816cb0eb77.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

第十章：数据库恢复技术
===========

## 第一、二节：事物的基本概念和数据库恢复概述

### 一：事务的基本概念

#### （1）事务

##### A：定义

**事务：是用户定义的一个数据库操作序列。这些操作要么不做，要么全做，是一个不可分割的工作单位。例如在RDBMS中一个事务可以是一条SQL语句或整个程序。事务是数据库恢复和并发控制的基本单位**

*   **事务和程序的区别：一般来说，一个程序中包含多个事务**

##### B：事务的定义

**事务的定义：事务的开始与结束由用户显式控制。如果用户没有显式地定义事务，则由DBMS按默认规定自动划分事务。在SQL中，定义事务语句有以下三条**

*   **`BEGIN TRANSACTION`**：表示事务的**开始**
*   **`COMMIT`**：表示事务的正常结束并**提交事务的所有操作**
*   **`ROLLBACK`**：表示事务的结束，但没有正常结束，需要进行**回滚**（撤销已完成操作，使系统恢复至回滚前状态）

**注意不同数据库系统定义语句有所区别**

**SQL Server**

    BEGIN TRANSACTION
    COMMIT | ROLLBACK


**MySQL**

    START TRANSACTION
    COMMIT | ROLLBACK


**Oracle**

    START TRANSACTION NAME
    COMMIT | ROLLBACK


#### （2）事务的四个特性——ACID

##### A：数据库的ACID

###### ①：[原子性](https://so.csdn.net/so/search?q=%E5%8E%9F%E5%AD%90%E6%80%A7&spm=1001.2101.3001.7020)（Atomicity）

**原子性：事务是数据库的逻辑工作单位，事务中包含的诸多操作要么全做、要么不做。因故障未能做完的，需要有一套机制用于“撤销”那一部分已经做了的**

###### ②：一致性（Consistency）

**一致性：事务执行的结果必须是使数据库从一个一致性状态变到另一个一致性状态**

*   **一致性状态**：数据库中只包含**成功事务**提交的结果
*   **不一致状态**：数据库中包含事务**未完成**时的状态

例如银行转账业务，账户 A A A转1万元到账户 B B B,该事务包含两个操作：首先是 A A A减少一万元，其次是 B B B增加一万元，这两个操作要么全部做要么全不做，如果只做其中一个就会发生逻辑错误，数据库就处于不一致状态了

###### ③：隔离性（Isolation）

**隔离性：一个事务不能被其他事务干扰。也即一个事务的内部操作及使用的数据对其他并发事务是隔离的，并发执行的各个事务之间不能互相干扰**

比如，下列两个并发执行的事务T1和T2，如按表中所示顺序执行，则事务T1的修改被T2覆盖了，即T2干挠了T1。违背了事务的隔离性，是错误的调度

![](https://img-blog.csdnimg.cn/a5cac91200764af9a19ab078fd724334.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

###### ④：持续性（Durability）

**持续性：一个事务一旦提交，它对数据库中数据的改变就是永久性的。接下来的其他操作或故障不应该对其执行结果有任何影响**

##### B：破坏ACID的因素

主要有两类

*   **故障：没有执行完；虽然没有完，但是存储介质故障。破坏了ACID中的ACD**
*   **并发干扰：多个事务并行运行时，不同事务的操作交叉执行，互相干扰。破坏了ACID中的I**

因此这就是[DBMS](https://so.csdn.net/so/search?q=DBMS&spm=1001.2101.3001.7020)的**恢复机制**和**并发控制机制**需要解决的问题

*   本章介绍恢复机制
*   下一章介绍并发控制机制

### 二：数据库恢复概述

**定义：把数据库从因破坏或故障而导致的错误状态恢复到某个已知的正确状态的技术**

**目的：**

*   **保持事务的原子性**
*   **保持事务的持久性**

**实现：由DBMS专门的恢复子系统完成**

## 第三节：故障种类

**数据库系统中可能发生各种各样的故障，主要有以下四类**

*   事务故障
*   系统故障
*   介质故障
*   计算机病毒

### 一：事务故障

#### （1）事务故障概念

**事务故障：某个事务在运行过程中由于种种原因未运行至正常终止点就夭折了**

#### （2）事务故障原因

**事务故障出现的常见原因有**

*   业务规则要求被终止
*   输入数据有误
*   运算溢出
*   违反了某些完整性限制
*   某些应用程序出现错误
*   并行事务因发生死锁而被系统选中结束运行

#### （3）事务故障恢复

**事务故障意味着事务没有达到预期的终点(COMMIT或者显式的ROLLBACK),因此，数据库可能处于不正确状态。恢复程序要在不影响其他事务运行的情况下，强行回滚该事务，即撤销该事务已经作出的任何对数据库的修改，使得该事务好像根本没有启动一样。这类恢复操作称为事务撤销(UNDO)**

### 二：系统故障

#### （1）系统故障概念

**系统故障：是指造成系统停止运转的任何事件，使得系统需要重新启动，例如：**

*   硬件错误（CPU故障）
*   操作系统故障
*   DBMS代码错误
*   系统断电

#### （2）系统故障的破坏性

发生系统故障将导致：

*   整个系统的正常运行突然被破坏
*   所有正在运行的事务都会**非正常终止**
*   **内存**中数据库缓冲区的信息**全部丢失**
*   **外部存储设备**上的数据**未受影响**

#### （3）系统故障恢复

*   **对于尚未完成的事务**：系统**重新启动**后，恢复程序要执行**撤销（UNDO）**所有**未完成**事务
*   **对于已经完成的事务**：系统**重新启动**后，恢复程序要执行**重做（REDO）**所有**已提交**事务

### 三：介质故障

#### （1）介质故障概念

硬件故障会使存储在外存中的数据**部分丢失**或**全部丢失**。介质故障发生的可能性要小于前两种故障，**但是其破坏性却很大**

#### （2）介质故障恢复

*   **更换**或自动**切换磁介质**
*   **装入**数据库发生介质故障前某个时刻的**数据副本**
*   **重做（REDO）**自此时始的所有**成功事务**，将这些事务已提交的结果重新记入数据库

### 四：[计算机病毒](https://so.csdn.net/so/search?q=%E8%AE%A1%E7%AE%97%E6%9C%BA%E7%97%85%E6%AF%92&spm=1001.2101.3001.7020)

计算机病毒本身不属于一种故障，但是它数据库的破坏会表现为前面的故障

*   **事务故障（软故障，仅事务崩溃）**
*   **系统故障（软故障，系统崩溃，需要重启）**
*   **介质故障（硬故障，数据库文件被删除）**

* * *

总之，出现故障后，就要对数据库进行**恢复**，恢复时需要利用到**冗余数据**，或者说就是备份数据。冗余的数据包括

*   备份
*   日志
*   镜像

## 第四、五、六、七节：数据库恢复技术和数据库镜像

### 一：数据库恢复的实现技术

恢复机制涉及的两个关键点就是

*   **如何建立冗余数据**
*   **如何利用冗余数据实现数据库恢复**

其中建立冗余数据最常用的技术是

*   **数据转储**
*   **登记日志文件**

#### （1）数据转储（备份）

**数据转储：指DBA定期手动或者DBMS定期自动将整个数据库复制到存储介质上保存起来的过程。这些备用的数据称之为后备副本。当数据库遭到破坏后可以将后备副本重新装入，但是重装后的副本只能将数据库恢复到转储时的状态，要想恢复到故障发生时的状态，必须重新运行自转储以后的所有更新事物。因此，转储常和日志配合使用**

![](https://img-blog.csdnimg.cn/67e878293ed24714b0c0d070ad85e820.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

*   例如，系统在 T a T\_{a} Ta时刻停止运行事务，进行数据库转储，在 T b T\_{b} Tb时刻转储完毕，得到 T b T\_{b} Tb 时刻的数据库一致性副本。 系统运行到 T f T\_{f} Tf时刻发生故障。为恢复数据库，首先由数据库管理员重装数据库后备副本，将数据库恢复至 T b T\_{b} Tb时刻的状态，然后重新运行自 T b T\_{b} Tb~ T f T\_{f} Tf时刻的所有更新事务，这样就把数据库恢复到故障发生前的一致状态

##### A：转储的分类

###### ①：按照系统是否运行事物时分类

**静态转储：是在系统中无运行事务时进行的转储操作。即转储操作开始的时刻数据库处于一致性状态，而转储期间不允许(或不存在)对数据库的任何存取、修改活动。显然，静态转储得到的一定是一个数据一致性的副本**

*   **优点**：实现简单
*   **缺点**：转储时必须等待正在运行的用户事物结束才能进行。降低了数据库的可用性

**动态转储：是指转储期间允许对数据库进行存取或修改，也即转储和用户事物可以并发执行**

*   **优点**：不用等待正在运行的事物，增强了数据库的可用性
*   **缺点**：转储结束时后援副本上的数据库并不能保证正确有效

**因此，对于动态转储，还需要建立日志文件（log file）。这样后备副本加上日志文件就能把数据库恢复到某一时刻的正确状态了**

###### ②：按转储的范围分类

**海量转储：每次转储全部数据库**

**增量转储：每次只转储上一次转储后更新过的数据**

* * *

依据上述两种分类方式，进行组合，因此共有如下四种转储  
![](https://img-blog.csdnimg.cn/456375a0555649f4bd2f220ad0664e78.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

#### （2）登记日志文件

**日志文件：是用来记录事物对数据库更新操作的文件。主要有两种格式**

*   以**记录**为单位的日志文件
*   以**数据块**为单位的日志文件

##### A：日志文件的内容

**对于以记录为单位的日志文件**

**日志文件中需要登记的内容包括：**

*   各个事务的开始(BEGIN TRANSACTION)标记
*   各个事务的结束(COMMIT或ROLLBACK)标记
*   各个事务的所有更新操作

**每个事物的开始、结束标记和每个更新操作均为一个日志记录，其内容主要包括**

*   事务标识(标明是哪个事务)
*   操作的类型(插入、删除或修改)
*   操作对象( 记录内部标识)
*   更新前数据的旧值(对插入操作而言，此项为空值)
*   更新后数据的新值(对删除操作而言，此项为空值)

**对于以块为单位的日志文件：日志记录的内容包括事务标识和被更新的数据块。由于将更新前的整个块和更新后的整个块都放入日志文件中，操作类型和操作对象等信息就不必放入日志记录中了**

##### B：日志文件的作用

日志文件在数据库恢复中起着非常重要的作用，可以用来进行事务故障恢复和系统故障恢复，并协助后备副本进行介质故障恢复。具体作用是：

*   **事务故障**恢复和**系统故障**恢复必须用日志文件
*   在**动态转储方式**中必须建立日志文件，后备副本和日志文件结合起来才能有效地 恢复数据库
*   在**静态转储方式**中也可以建立日志文件，当数据库毁坏后可重新装入后备副本  
    把数据库恢复到转储结束时刻的正确状态，然后利用日志文件把**已完成的事务进行重做处理**，对**故障发生时尚未完成的事务进行撤销处理**。这样不必重新运行那些已完成的事务程序就可把数据库恢复到故障前某一时刻的正确状态

![](https://img-blog.csdnimg.cn/c04a0efd0c3f45ffa380a89638a31ad5.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)  
针对每一种故障，日志文件的作用如下

*   **事物故障**：利用日志撤销（UNDO）未完成事物
*   **系统故障**：利用日志撤销（UNDO）未完成事物；重做（REDO）已完成事物
*   **介质故障**：利用日志和副本恢复
*   **静态转储副本+日志恢复到故障发生前**
*   **动态转储副本+转储期间日志，可以先恢复到备份时的一致性状态，然后再利用备份后的日志还原数据**

##### C：登记日志文件

为保证数据库是可恢复的，登记日志文件时必须遵循两条原则:

*   **登记的次序严格按并发事务执行的时间次序**
*   **必须先写日志文件，后写数据库（Write Ahead Logging，WAL）**

### 二：恢复策略

#### （1）事物故障的恢复

事务故障的恢复是由**系统自动完成**的，对用户是**透明**的。系统的恢复步骤是：

1.  **反向扫描**日志文件(即从最后向前扫描日志文件)，查找该事务的**更新**操作
2.  对该事务的更新操作执行**逆操作**，即将日志记录中“**更新前的值**"写入数据库。这样，如果记录中是插入操作，则相当于做删除操作(因此时“更新前的值"为空);若记录中是删除操作，则做插入操作;若是修改操作，则相当于用修改前值代替修改后值
3.  继续反向扫描日志文件，查找该事务的其他更新操作，并做同样处理
4.  如此处理下去，直至读到此事务的**开始标记**，事务故障恢复就完成了

    LOGFILE.seek(0,SEEK_END);
    Repeat
     	LOGFILE.ReverseRead(R);
     	if R.ID=T AND R. Type=WRITE then
     	begin
     		if R.BI IS null then 执行 delete语句，删除被插入的对象
     		else if R.AI is null then 执行 insert 语句，插入被删除的对象
     		else 执行 update语句，数据对象的值从AI改回BI
     	end;
     Until R.ID=T AND R.type=STRAT;
    

#### （2）系统故障的恢复

系统故障的恢复是由系统在**重新启动时自动完成的**，**不需要用户干预**，其步骤为

1.  **正向扫描**日志文件(即从头扫描日志文件)，找出在故障发生前已经提交的事务  
    (这些事务既有`BEGIN TRANSACTION`记录，也有`COMMIT`记录)，将其事务标识记入**重做队列( `REDO-LIST`)**。同时找出**故障发生时尚未完成的事务**(这些事务只有`BEGINT RANSACTION`记录，无相应的`COMMIT`记录)，将其事务标识记入**撤销队列(`UNDO-LIST`)**
2.  **对撤销队列中的各个事务进行撤销(`UNDO`)处理**：反向扫描日志文件，对每个撤销事务的更新操作执行逆操作即将日志记录中“**更新前的值**”写入数据库
3.  **对重做队列中的各个事务进行重做`(REDO)`处理**：正向扫描日志文件，对每个重做事务重新执行日志文件登记的操作，即将日志记录中“**更新后的值**”写入数据库

#### （3）介质故障的恢复

*   装入**最新的数据库后备副本**(离故障发生时刻最近的转储副本)，使数据库恢复 到**最近一次转储时**的一致性状态
*   **装入相应的日志文件副本(转储结束时刻的日志文件副本)，重做已完成的事务**：即首先扫描日志文件，找出故障发生时已提交的事务的标识，将其记入重做队列;然后正向扫描日志文件，对重做队列中的所有事务进行重做处理。即将日志记录中“更新后的值”写入数据库

### 三：具有检查点的恢复技术

#### （1）一个问题

利用日志技术进行数据库恢复时，恢复子系统必须搜索日志，确定哪些事务需要重做，哪些事务需要撤销。一般来说，需要检查所有日志记录。这样做有两个问题

*   **搜索整个日志将耗费大量的时间**
*   **很多需要重做处理的事务实际上已经将它们的更新操作结果写到了数据库中，然而恢复子系统又重新执行了这些操作，浪费了大量时间**

为了解决这些问题，引入**具有检查点的恢复技术**

#### （2）概述

**具有检查点的恢复技术：这种技术在日志文件中增加了一类新的记录——检查点记录，增加一个重新开始文件，并让恢复子系统在登录日志文件期间动态维护日志。检查点记录内容包括**

*   **建立检查点时刻所有正在执行的事物清单**
*   **这些事物最近一个日志记录的地址**

**其中重新开始文件用来记录各个检查点记录在日志文件中的地址**

![](https://img-blog.csdnimg.cn/142b7df660a941a69849e34295460771.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

**动态维护日志文件的方法：周期性地执行建立检查点、保存数据库状态的操作。具体步骤为：**

1.  将当前日志缓冲区中的所有日志记录写入磁盘的日志文件上
2.  在日志文件中写入一个检查点记录
3.  将当前数据库缓冲区的所有数据记录写入磁盘的数据库中
4.  把检查点记录在日志文件中的地址写入一个重新开始文件

**使用检查点方法可以改善恢复效率**。当事务T在一个检查点之前提交，T对数据库所做的修改一定都已写入数据库，写入时间是在这个检查点建立之前或在这个检查点建立之时。这样，在进行恢复处理时，没有必要对事务T执行重做操作。

#### （3）利用检查点的恢复技术

**系统出现故障时，恢复子系统将根据事务的不同状态采取不同的恢复策略，如下图**

*   T 1 T\_{1} T1：在检查点之前提交
*   T 2 T\_{2} T2：在检查点之前开始执行，在检查点之后故障点之前提交
*   T 3 T\_{3} T3：在检查点之前开始执行，在故障点时还未完成
*   T 4 T\_{4} T4：在检查点之后开始执行，在故障点之前提交
*   T 5 T\_{5} T5：在检查点之后开始执行，在故障点时还未完成

![](https://img-blog.csdnimg.cn/eae380d74d014affa2426a2c69cdaf00.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

*   **T 3 T\_{3} T3和 T 5 T\_{5} T5在故障发生时还未完成，所以予以撤销;**
*   **T 2 T\_{2} T2和 T 4 T\_{4} T4在检查点之后才提交，它们对数据库所做的修改在故障发生时可能还在缓冲区中，尚未写入数据库，所以要重做;**
*   **T 1 T\_{1} T1在检查点之前已提交，所以不必执行重做操作**

**系统使用检查点方法进行恢复的步骤是：**

①：从重新开始文件中找到**最后一个检查点记录在日志文件中的地址**，由该地址在日志文件中找到**最后一个检查点记录**

②：由该检查点记录得到检查点建立时刻所有**正在执行的事务清单`ACTIVE-LIST`。建立如下两个事物队列**

*   **`UNDO-LIST`**：需要执行UNDO操作的事物集合
*   **`REDO-LIST`**：需要执行REDO操作的事物集合

③：从检查点开始**正向扫描日志文件**

*   如果有**新开始**的事物 T i T\_{i} Ti，则把 T i T\_{i} Ti暂时放入`UNDO-LIST`
*   如果有**新提交**的事物 T j T\_{j} Tj，则把 T j T\_{j} Tj从`UNDO-LIST`移到`REDO-LIST`
*   重复，直到扫描日志文件结束

④：对`UNDO-LIST`中的每个事物**执行UNDO操作**；对`REDO-LIST`中每个事物**执行REDO操作**

* * *

**用上图所示的例子，恢复步骤如下**

①：建立`ACTIVE-LIST`，很明显`ACTIVE-LIST`\={ T 2 T\_{2} T2, T 3 T\_{3} T3}。然后初始化`UNDO-LIST`\={ T 2 T\_{2} T2, T 3 T\_{3} T3}，REDO-LIST={}

②：从检查点开始正向扫描日志文件

*   第一个读到的是事物 T 4 T\_{4} T4建立，加入`UNDO-LIST`
*   第二个读到的是事物 T 2 T\_{2} T2提交，那么把 T 2 T\_{2} T2从`UNDO-LIST`移动到`REDO-LIST`
*   第三个读到的是事物 T 5 T\_{5} T5建立，加入`UNDO-LIST`
*   第四个读到的是事物 T 5 T\_{5} T5提交，那么把 T 5 T\_{5} T5从`UNDO-LIST`移动到`REDO-LIST`

③：对`UNDO-LIST`中的每个事物执行UNDO操作；对`REDO-LIST`中每个事物执行REDO操作

![](https://img-blog.csdnimg.cn/eae380d74d014affa2426a2c69cdaf00.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

### 四：数据库镜像

**数据库镜像：自动地将整个数据库或其中关键数据复制到另一个磁盘上。需要注意，在实际应用中，只对关键数据和日志文件进行镜像，而不是对整个数据库进行镜像**

*   **用于数据库恢复**：当出现**介质故障**时，可由镜像磁盘继续提供使用，同时DBMS自动利用镜像磁盘数据进行数据库的恢复，不需要关闭系统和重装数据库副本
*   **提高数据库可用性**：在**没有出现故障**时，当一个用户对某个数据加排他锁进行修改时，其他用户可以读镜像数据库的数据，而不必等待该用户释放锁

![](https://img-blog.csdnimg.cn/18179a5bd85c483ca5bccf339fa99d68.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

## 习题

### 名词解释

*   **事务**：是用户定义的一个数据库操作序列。这些操作要么不做，要么全做，是一个不可分割的工作单位。例如在RDBMS中一个事务可以是一条SQL语句或整个程序。事务是数据库恢复和并发控制的基本单位
*   **事务原子性**：事务是数据库的逻辑工作单位，事务中包含的诸多操作要么全做、要么不做。因故障未能做完的，需要有一套机制用于“撤销”那一部分已经做了的
*   **事务一致性**：事务执行的结果必须是使数据库从一个一致性状态变到另一个一致性状态
*   **事务隔离性**：一个事务不能被其他事务干扰。也即一个事务的内部操作及使用的数据对其他并发事务是隔离的，并发执行的各个事务之间不能互相干扰
*   **事务持续性**：一个事务一旦提交，它对数据库中数据的改变就是永久性的。接下来的其他操作或故障不应该对其执行结果有任何影响
*   **数据库恢复**：把数据库从因破坏或故障而导致的错误状态恢复到某个已知的正确状态的技术
*   **事务故障**：某个事务在运行过程中由于种种原因未运行至正常终止点就夭折了
*   **事务撤销(UNDO)**：事务故障意味着事务没有达到预期的终点(COMMIT或者显式的ROLLBACK),因此，数据库可能处于不正确状态。恢复程序要在不影响其他事务运行的情况下，强行回滚该事务，即撤销该事务已经作出的任何对数据库的修改，使得该事务好像根本没有启动一样
*   **系统故障**：是指造成系统停止运转的任何事件，使得系统需要重新启动
*   **数据转储**：指DBA定期手动或者通过设置使DBMS定期自动将整个数据库复制到存储介质上保存起来的过程。这些备用的数据称之为后备副本。当数据库早到破坏后可以将后备副本重新装入，但是重装后的副本只能将数据库恢复到转储时的状态，要想恢复到故障发生时的状态，必须重新运行自转储以后的所有更新事物。因此，转储常和日志配合使用
*   **静态转储**：是在系统中无运行事务时进行的转储操作。即转储操作开始的时刻数据库处于一致性状态，而转储期间不允许(或不存在)对数据库的任何存取、修改活动。显然，静态转储得到的一定是一个数据一致性的副本
*   **动态转储**：是指转储期间允许对数据库进行存取或修改，也即转储和用户事物可以并发执行
*   **数据库镜像**：自动地将整个数据库或其中关键数据复制到另一个磁盘上。需要注意，在实际应用中，只对关键数据和日志文件进行镜像，而不是对整个数据库进行镜像

### 简答题

### 应用题

> ![](https://img-blog.csdnimg.cn/563544de46d948d582df6c4a6d4de67f.png)

【答案】

事务的概念

![](https://img-blog.csdnimg.cn/25ea56c2fcab43d09bb027cd10684c7e.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)  
四个特性

![](https://img-blog.csdnimg.cn/17334ba723f744bd91276fe6042ceb49.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)  
恢复技术可以保证事务的[原子性](https://so.csdn.net/so/search?q=%E5%8E%9F%E5%AD%90%E6%80%A7&spm=1001.2101.3001.7020)和持久性

> ![](https://img-blog.csdnimg.cn/1ce6920f61e34c2dabdbf6019114e99c.png)

【答案】

事务执行的结果必须是使数据库从一个一致性状态变到另一个一致性状态。如果数据库系统运行中发生故障，有些事务尚未完成就被迫中断，这些未完成事务对数据库所做的修改有一部分已写入物理数据库，这时数据库就处于一种不正确的状态，或者说是不一致性状态。  
例如，某工厂的库存管理系统中，要把数量为Q的某种零件从仓库1移到仓库2存放，则可以定义一个事务T。T包括两个操作：Q1=Q1-Q，Q2=Q2+Q。如果T非正常终止时只做了第一个操作，则数据库就处于不一致性状态，库存量无缘无故少了Q

> ![](https://img-blog.csdnimg.cn/5897d07377dd4fb680ff15b23a95312e.png)

【答案】

如果先写了数据库修改，而在运行记录中没有登记下这个修改，则以后就无法恢复这个修改了。如果先写日志，但没有修改数据库，按日志文件恢复时只不过是多执行一次不必要的UNDO操作，并不会影响数据库的正确性。所以为了安全，一定要先写日志文件，即首先把日志记录写到日志文件中，然后写数据库的修改

> ![](https://img-blog.csdnimg.cn/ea04b48bd0c34f07ae52e4a6ddebc33b.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)  
> ![](https://img-blog.csdnimg.cn/bf91946b0c3149389dc7fabe768116a6.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

原则

![](https://img-blog.csdnimg.cn/50c17c41f6d24610923b2185ee479f8f.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

【答案】  
（1） T 1 T\_{1} T1、 T 3 T\_{3} T3重做； T 2 T\_{2} T2、 T 4 T\_{4} T4回滚

（2） T 1 T\_{1} T1重做； T 2 T\_{2} T2、 T 3 T\_{3} T3回滚

（3） T 1 T\_{1} T1重做； T 2 T\_{2} T2、 T 3 T\_{3} T3回滚

（4） T 1 T\_{1} T1重做； T 2 T\_{2} T2回滚

> ![](https://img-blog.csdnimg.cn/5efe408c7abb4156ab0d613de397d8ba.png)  
> ![](https://img-blog.csdnimg.cn/129adf37169b42e1a07ee7d222cab853.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

【答案】

（1）A=8、B=7、C=11

（2）A=10、B=0、C=11

（3）A=10、B=0、C=11

（4）A=10、B=0、C=11

（5）A=0、B=0、C=0

> ![](https://img-blog.csdnimg.cn/54fdffc7883c459e88d8725f7422cbd4.png)

【答案】

![](https://img-blog.csdnimg.cn/2a636eda7195473f849161799d03bb4c.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

> ![](https://img-blog.csdnimg.cn/8383d3f51d89456d80e0684c08c0b1da.png)

【答案】

![](https://img-blog.csdnimg.cn/17471666364c4a0999192026d4188f9d.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

> ![](https://img-blog.csdnimg.cn/4f926d1700b74631924e989aa1dbe0d1.png)

【答案】

[](https://zhangxing-tech.blog.csdn.net/article/details/122764088>点击跳转</a></p> 
<p><img src=)

[

> ![](https://img-blog.csdnimg.cn/dbed8311c1a04ca28e5304162742b27d.png)

【答案】

![](https://img-blog.csdnimg.cn/4746cb16e3d341579096fedfb8459fcd.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

](https://zhangxing-tech.blog.csdn.net/article/details/122764088>点击跳转</a></p> 

第十一章：并发控制
=========

## 第一节：并发控制概述

### 一：事务运行方式

#### （1）概述

事务的运行方式主要分为**串行**和**并行**

*   **串行**：每个时刻只有一个事务运行
*   **并行**：同一时刻可以有多个事务同时运行

串行和并行的优缺点如下表，并行效率的确很高，但是会破坏事务的隔离性。因此**要在保证一致性的前提下最大限度的提高并发度**

![](https://img-blog.csdnimg.cn/a9b164eaf8654fa1b885a4da84cc48e4.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

不过需要注意的是，在操作系统中就说到过，单处理系统中，所谓的并行实际上是**宏观上的并行运行，微观上的串行运行**，也即 **交叉并发**

*   本章探讨的并发特指交叉并发

![](https://img-blog.csdnimg.cn/bf6114c755ff4cdfb73b614568959fb6.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

我们把**允许多个用户同时使用同一个数据库的数据库系统称之为多用户数据库系统**，在这种系统中，同一时刻并发运行的事务数量相当庞大。例如我们经常在使用的12306就是一个很典型的例子

#### （2）计算

**两个事务 S S S和 T T T，其中 S S S有 m m m条指令， T T T有 n n n条指令，且每个事务内部指令的相对顺序不能错乱，那么可能的执行顺序有 R R R种**

R = C m + n m = C m m + n = ( m + n ) ! m ! n ! R=C^{m}\_{m+n}=C^{m+n}\_{m}=\\frac{(m+n)!}{m!n!} R\=Cm+nm\=Cmm+n\=m!n!(m+n)!

#### （3）调度

**调度：事务的一次执行顺序称之为一个调度，表示事务的指令在系统中执行的时间顺序、一组事务的调度必须保证**

*   包含了**所有事务**的操作指令
*   一个事务中**指令的顺序**必须保持不变

#### （4）串行调度和并发调度

*   **串行调度**：属于同一事务的指令**紧挨在一起执行**，对于有 n n n个事务的事务组，可以有 n n n!个**有效调度**
*   **并发调度**：来自不同事务的指令可以**交叉执行**。并发调度有可能会导致错误结果，**仅当并发调度等价于某个串行调度时，则称该并发调度时可串行化的、正确的**

### 二：并发控制

#### （1）并发操作带来的数据不一致性问题

**主要有三类数据不一致性问题**

*   丢失修改
*   读脏数据
*   不可重复读

> 以如下飞机订票系统中的活动序列为例  
> ①甲售票点(事务 T 1 T\_{1} T1)读出某航班的机票余额A，设A=16  
> ②乙售票点(事务 T 2 T\_{2} T2)读出同一航班的机票余额A，也为16。  
> ③甲售票点卖出一张机票，修改余额A←A-1，所以A为15，把A写回数据库。  
> ④乙售票点也卖出一-张机票，修改余额A-A-1，所以A为15，把A写回数据库。

##### A：丢失修改

**丢失修改：两个以上事务从数据库中读入同一数据并修改，其中后提交事务的提交结果破坏了先提交事务的提交结果，导致了先提交事务对数据库的修改丢失**

在上面例子中，两个事务 T 1 T\_{1} T1和 T 2 T\_{2} T2读入同一数据并修改，但是 T 2 T\_{2} T2提交的结果破坏了 T 1 T\_{1} T1提交的结果，导致 T 1 T\_{1} T1的修改被丢失

##### B：读[脏数据](https://so.csdn.net/so/search?q=%E8%84%8F%E6%95%B0%E6%8D%AE&spm=1001.2101.3001.7020)

**读脏数据：事务1修改某一数据，并将其写回磁盘；事务2读取同一数据后，事务1由于某种原因被撤销，这时事务1已修改过的数据被恢复为原值，事务2读到的不稳定的瞬间数据就与数据库中的数据产生了不一致，是不正确的数据，又称为脏数据**

例如 T 1 T\_{1} T1将C值修改为200， T 2 T\_{2} T2读到C为200，此时 T 1 T\_{1} T1由于某种原因被撤销，因此C恢复为原值100，这时 T 2 T\_{2} T2读到的C为200，属于读脏

![](https://img-blog.csdnimg.cn/0514d4be4e0a4bc0b2abf7db3bbce69a.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

##### C：[不可重复读](https://so.csdn.net/so/search?q=%E4%B8%8D%E5%8F%AF%E9%87%8D%E5%A4%8D%E8%AF%BB&spm=1001.2101.3001.7020)

**不可重复读：事物1读取数据后，事物2执行更新操作，使事物1无法再现前一次读取结果。共有三种情况**

*   事物2**修改了**事物1所读数据，当事物1再次读该数据时，得到了**与前一次不同的值**
*   事务2**删除了**其中部分记录，当事务1再次按相同条件读取数据时，发现**某些记录神秘地消失**了
*   事务2**插入了**一些记录，当事务1再次按相同条件读取数据时，发现**多了一些记录**

#### （2）并发控制概念

**并发控制：如果多个用户并发存取数据的行为不加以控制，那么极有可能破坏事务的隔离性和一致性。因此并发控制就是为了保证多用户并发操作数据库中信息时的正确性、一致性所采取的措施**

#### （3）并发控制任务

*   **对并发操作进行正确调度**
*   **保证事物的隔离性**
*   **保证数据库的一致性**

#### （4）并发控制方法

*   **加锁（Locking）**
*   **乐观假设（Optimistic）**
*   **时间戳（Timestamp）**
*   **多版本并发控制（MVCC）**

## 第二、三、四节：封锁、封锁协议活锁和死锁

### 一：封锁

#### （1）概念

**封锁：封锁就是事务 T T T在对某个数据对象（表、记录等）操作之前，先向系统发出请求，对其加锁；加锁后事务 T T T对该数据对象就有了一定的控制，在事务 T T T释放它的锁之前，其它的事务不能更新此数据对象；DBMS通常提供了多种类型的封锁，一个事务对某个数据对象加锁后究竟拥有怎样的控制是由封锁的类型决定的**

#### （2）类型

基本封锁类型有如下两种

*   **排他锁（ X X X锁）**：又称为**写锁**，若事务 T T T对数据对象 A A A加上 X X X锁，则**只允许 T T T读取和修改 A A A**，**其他任何事务都不能再对 A A A加任何类型的锁**，直到 T T T**释放** A A A上的锁
*   **共享锁（ S S S锁）**：又称为**读锁**，若事务 T T T对数据对象 A A A加上 S S S锁，则其他事务**只能再对 A A A加 S S S锁，而不能加 X X X锁**，直到 T T T**释放** A A A上的 S S S锁  
    ，

#### （3）控制方式

**排他锁与共享锁的控制方式可以用下图所示的相容矩阵来表示**

![](https://img-blog.csdnimg.cn/6d4e0362c1cc47bc90fd31b066c0561e.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

*   最左边一列表示事务 T 1 T\_{1} T1已经获得的数据对象上的锁的类型，其中横线表示没有加锁
*   最上面一行表示另一事务 T 2 T\_{2} T2对同一数据对象发出的封锁请求
*   T 2 T\_{2} T2的封锁请求能否被满足用矩阵中的 Y Y Y和 N N N表示。**其中 Y Y Y表示事务 T 2 T\_{2} T2的封锁与 T 1 T\_{1} T1已持有的锁相容，封锁请求可以满足； N N N表示 T 2 T\_{2} T2的封锁请求与 T 1 T\_{1} T1已持有的锁冲突，请求被拒绝**

### 二：封锁协议

#### （1）概念

**封锁协议：是指在运用 X X X锁和 S S S锁对数据对象加锁时需要遵照的一些规则。例如，何时申请、持续时间、和何时释放等。不同的封锁协议，为并发操作的正确调度提供了一定的保证，所能达到的系统一致性级别也是不同的。常用的封锁协议有**

*   **支持一致性维护的三级封锁协议（本节）**
*   **支持并行调度可串行化的两段锁协议/避免死锁的协议**

#### （2）三级封锁协议

##### ①：一级封锁协议

**一级封锁协议：事务 T T T在修改数据 R R R之前必须先对其加 X X X锁，直到事务结束（`COMMIT`或`ROLLBACK`）才释放**

*   **优点**：可以防止丢失修改
*   **缺点**：如果仅是读数据，是不需要加锁的。所以它不能保证可重复读和不读脏数据

![](https://img-blog.csdnimg.cn/59c0e8c8b9a14be0b4e74ae078ea1f70.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

##### ②：二级封锁协议

**二级封锁协议：是指在一级封锁协议基础上增加事务 T T T在读取数据 R R R之前必须先对其加 S S S锁，读完后即可释放 S S S锁**

*   **优点**：可以方式丢失修改和读脏数据
*   **缺点**：不能保证可重复读

![](https://img-blog.csdnimg.cn/3fe439364f1547428374cbdb766c9b08.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

##### ③：三级封锁协议

**三级封锁协议：是指在一级封锁协议基础上增加事务 T T T在读取数据 R R R之前必须先对其加 S S S锁，直到事务结束才可以释放 S S S锁**

*   **防止丢失修改和读脏数据，还防止了不可重复读**

![](https://img-blog.csdnimg.cn/de54425381384541b264d13ab2aa8306.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

* * *

**总结**

![](https://img-blog.csdnimg.cn/6c71cab2f39c45f4a7bb7bc2b334f688.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

### 三：活锁和[死锁](https://so.csdn.net/so/search?q=%E6%AD%BB%E9%94%81&spm=1001.2101.3001.7020)

一个问题的解决必然会导致另一个问题的出现。**封锁技术可以有效地解决并发操作的一致性问题，但是会带来新的问题**

*   活锁
*   死锁

#### （1）活锁

**活锁：事务 T 1 T\_{1} T1封锁数据 R R R，事务 T 2 T\_{2} T2又请求封锁 R R R，因此事务 T 2 T\_{2} T2被迫等待。此时，事务 T 3 T\_{3} T3也请求封锁 R R R，因此事务 T 3 T\_{3} T3也被迫等待。当 T 1 T\_{1} T1释放 R R R的封锁后，系统却首先批准了 T 3 T\_{3} T3的请求， T 2 T\_{2} T2只能继续等待。然后，又有别的事务到来，由于事务 T 2 T\_{2} T2的优先级可能较低，所以导致它长时间得不到服务，产生饥饿现象。这就是活锁。避免活锁可以废除特权，采用先来先服务算法**

#### （2）死锁

*   注意此部分在操作系统中属于重点内容，详细了解请点击跳转：[【专栏必读】王道考研408操作系统万字笔记（从学生角度辅助大家理解）：各章节导航及思维导图](https://zhangxing-tech.blog.csdn.net/article/details/121004242)

* * *

##### A：概念

**死锁：两个或两个以上事务均处于等待状态，每个事务都在等待其中另一个事务封锁的数据，导致任何事务都不能向前推进的现象**

![](https://img-blog.csdnimg.cn/80099df8906c4c7e91d8a8ce93096bd3.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

##### B：死锁产生的四个必要条件

*   此部分内容选自：[(王道408考研操作系统)第二章进程管理-第四节1：死锁相关概念](https://zhangxing-tech.blog.csdn.net/article/details/121447663)

###### ①：互斥条件

**互斥条件：是指只有对必须互斥使用的资源抢夺时才可能导致死锁。比如打印机设备就可能导致互斥，但是像内存、扬声器则不会**

![](https://img-blog.csdnimg.cn/24a8fb1c789b47a78a7113f895b2f154.png)

*   进程A已经获得资源，进程B只能等待

###### ②：不可剥夺条件

**不可剥夺条件：是指进程所获得的资源在未使用完之前，不能由其他进程强行夺走，只能主动释放**

![](https://img-blog.csdnimg.cn/f191d4ac73db4bbd945537c91d755032.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBA5oiR5pOm5LqGREo=,size_19,color_FFFFFF,t_70,g_se,x_16)

###### ③：持有并等待条件

**持有并等待条件：是指进程已经至少保持了一个资源，但又提出了新的资源请求，但是该资源又被其他进程占有，此时请求进程被阻塞，但是对自己持有的资源保持不放**

![](https://img-blog.csdnimg.cn/d6bff81e780b485692a0dad737a46803.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBA5oiR5pOm5LqGREo=,size_19,color_FFFFFF,t_70,g_se,x_16)

###### ④：循环等待条件

**循环剥夺条件：是指存在一种进程资源的循环等待链，链中的每一个进程已获得的资源同时被下一个进程所请求**

![](https://img-blog.csdnimg.cn/f733ae1cca804e4a9b42016947ed536f.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBA5oiR5pOm5LqGREo=,size_14,color_FFFFFF,t_70,g_se,x_16)

##### C：解决死锁的方法

解决死锁主要有下面三种方法（每一种在对应文章中都有详细介绍，限于篇幅，这里只挑取重点）

*   [(王道408考研操作系统)第二章进程管理-第四节2：死锁处理策略之预防死锁](https://zhangxing-tech.blog.csdn.net/article/details/121462546)
*   [(王道408考研操作系统)第二章进程管理-第四节2：死锁处理策略之避免死锁（银行家算法）](https://zhangxing-tech.blog.csdn.net/article/details/121483447)
*   [(王道408考研操作系统)第二章进程管理-第四节3：死锁处理策略之检测和解除](https://zhangxing-tech.blog.csdn.net/article/details/121526731)

##### 预防死锁

###### ①：破坏互斥条件

*   互斥条件是指只有对必须互斥使用的资源抢夺时才可能导致死锁。比如打印机设备就可能导致互斥，但是像内存、扬声器则不会

**破坏互斥条件：如果把只能互斥使用的资源改造为允许共享使用，则系统不会进入死锁状态。但并不是所有资源都可以改造为成共享使用的资源的，而且为了系统安全性，很多地方也是禁止改造的，所以互斥条件一般无法破坏**

###### ②：破坏不可剥夺条件

*   不可剥夺条件是指进程所获得的资源在未使用完之前，不能由其他进程强行夺走，只能主动释放

**破坏不可剥夺条件：可以有以下两种方案**

*   **方案一**：当某个进程请求新的资源得不到满足时，它**必须立即释放保持的所有资源，待以后需要时再重新申请。** 也就是说，**即使某些资源尚未使用完，也需要主动释放**
*   **方案二**：当某个进程需要的资源被其他进程占有的时候，**可以由操作系统协助，将想要的资源强行剥夺。** 这种方式一般需要考虑各个进程的**优先级**

**缺点**

*   实现起来**比较复杂**
*   释放已获得的资源可能造成前一阶段工作的失效，所以这种方法**一般只适用于易保存和恢复状态的资源，比如CPU**
*   反复申请和释放资源**会增加系统开销，降低系统吞吐量**
*   若采用方法一，意味着只要暂时得不到某个资源，之前获得的那些资源都需要放弃，以后再重新申请，**容易导致进程饥饿**

###### ③：破坏持有并等待条件（对应一次封锁法）

*   持有并等待条件：是指进程已经至少保持了一个资源，但又提出了新的资源请求，但是该资源又被其他进程占有，此时请求进程被阻塞，但是对自己持有的资源保持不放

**破坏持有并等待条件：可以采用静态分配方法。进程在运行前一次申请完它所需要的全部资源，在它的资源未得到满足前，不允许投入运行；一旦投入运行，这些资源就一直归它所有，该进程不会再请求别的任何资源**

**缺点**

*   有些资源可能只需要使用很短的时间，因此如果进程的整个运行期间都一直保持着所有资源，就会**造成严重的资源浪费，资源利用率极低**，并且该策略也有可能**导致饥饿现象**

###### ④：破坏循环等待条件（对应顺序封锁法）

*   循环剥夺条件：是指存在一种进程资源的循环等待链，链中的每一个进程已获得的资源同时被下一个进程所请求

**破坏循环等待条件：可以采用顺序资源分配方法。首先给系统中的资源进行编号，规定每个进程必须按照编号递增的顺序请求资源，编号相同的资源（也就是同类资源）一次申请完**

*   这是因为一个进程只有在已经占有小编号资源的同时，才有资格申请更大编号的资源。所以**已经持有大编号资源的进程不可能逆向申请小编号的资源**  
    ![](https://img-blog.csdnimg.cn/38ff1cdca89e4494b034d651953cfe7f.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBA5oiR5pOm5LqGREo=,size_20,color_FFFFFF,t_70,g_se,x_16)

**缺点**

*   **不方便增加新的设备**，因为**可能需要重新分配所有的编号**
*   进程实际使用资源的顺序可能和**编号递增顺序不一致**，造成**资源浪费**
*   必须**按规定次序申请资源**，为用户**编程带来了麻烦**

* * *

##### 死锁检测

###### ①：超时法

**超时法：如果一个事务的等待时间超过了规定的时限，就认为发生了死锁**

*   **优点**：实现简单
*   **缺点**：有可能误判死锁；时限标准难以把握

###### ②：等待图法（资源分配图）

两种结点

*   **进程结点：对应一个进程**
*   **资源结点：对应一类资源，其数量可能有多个**

两种边

*   **进程结点->资源结点：进程想要申请多少个资源，每条边代表一个**
*   **资源结点->进程结点：表示已经为进程分配了多少个资源，每条边代表一个**

![](https://img-blog.csdnimg.cn/a9c63480dee54f8fa50f3208b4c52d57.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBA5oiR5pOm5LqGREo=,size_20,color_FFFFFF,t_70,g_se,x_16)

*   进程 P 1 P\_{1} P1已经分得了两个 R 1 R\_{1} R1资源，又在请求一个 R 2 R\_{2} R2资源；
*   进程 P 2 P\_{2} P2已经分得了一个 R 1 R\_{1} R1资源和一个 R 2 R\_{2} R2资源，又在请求一个 R 1 R\_{1} R1资源；

判断是否发生死锁：如果系统中的可用资源数目满足进程的需求，那么这个进程暂时是不会被阻塞的，可以顺利执行；如果这个进程结束后将资源归还给了系统，就可能使某些正在等待资源的进程被激活，并顺利执行下去

比如下图中： R 2 R\_{2} R2资源的数目共有2个，其中一个分配给了 P 2 P\_{2} P2，此时 P 1 P\_{1} P1请求一个，而可用资源数目够，因此 P 1 P\_{1} P1不会被阻塞；  
![](https://img-blog.csdnimg.cn/c6dca372ec804482893e33ffb71890d4.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBA5oiR5pOm5LqGREo=,size_20,color_FFFFFF,t_70,g_se,x_16)  
R 1 R\_{1} R1资源的数目共有3个，其中2个分配给了 P 1 P\_{1} P1，一个分配给了 P 2 P\_{2} P2，所以 P 2 P\_{2} P2的请求不能满足，而 P 1 P\_{1} P1是可以顺利执行的，所以 P 2 P\_{2} P2在等待 P 1 P\_{1} P1执行完毕并归还资源后，便可以顺利执行下去

P 1 P\_{1} P1结束之后，归还资源，并且它再不会请求任何资源，因此取出和 P 1 P\_{1} P1相连的边  
![](https://img-blog.csdnimg.cn/59968a0e0fbc444381d335d75d65d3e7.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBA5oiR5pOm5LqGREo=,size_20,color_FFFFFF,t_70,g_se,x_16)

P 2 P\_{2} P2在结束之后也会归还资源  
![](https://img-blog.csdnimg.cn/eedacbaf23544790b23dc57de7b4b867.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBA5oiR5pOm5LqGREo=,size_20,color_FFFFFF,t_70,g_se,x_16)

可完全简化：按照上述过程，如果能够消除所有的边，就称此资源图可完全简化，此时一定没有发生死锁，相等于可以找到一个安全序列 P 1 P\_{1} P1\-> P 2 P\_{2} P2。如果不能消除所有边，此时就发生了死锁，而且最终还连着边的那些进程就是处于死锁状态的进程

比如下图中，开始时让 P 1 P\_{1} P1再多持有一个 R 2 R\_{2} R2资源，并且 R 2 R\_{2} R2资源又分配了一个给 P 3 P\_{3} P3  
![](https://img-blog.csdnimg.cn/9ced82660b8a457699ddbc9f89be517d.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBA5oiR5pOm5LqGREo=,size_20,color_FFFFFF,t_70,g_se,x_16)

此时 R 2 R\_{2} R2资源被分配干净，所以 P 1 P\_{1} P1在请求时被阻塞，相应 P 2 P\_{2} P2进程也会被阻塞。因此只有 P 3 P\_{3} P3能够顺利进行

![](https://img-blog.csdnimg.cn/481e0df62e8948168ea9ee5bf752fbed.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBA5oiR5pOm5LqGREo=,size_20,color_FFFFFF,t_70,g_se,x_16)  
P 3 P\_{3} P3结束之后虽然会归还1个 R 2 R\_{2} R2资源，但是仍然不满足 P 1 P\_{1} P1的需求，所以 P 1 P\_{1} P1依然被阻塞， P 2 P\_{2} P2也还是被阻塞，发生死锁

* * *

##### 死锁解除

**解除死锁：一旦检测出死锁发生，就应该立即解除死锁。注意并不是系统中所有的进程都是死锁状态，使用死锁检测算法化简资源分配图后，还连着边的那些进程就是需要进行解除的死锁进程。解除方法主要有：**

*   **资源剥夺法：挂起（暂时放到外存上）某些死锁进程，并抢占它的资源，将这些资源分配给其他的死锁进程。但是应防止被挂起的进程长时间得不到资源而饥饿**
*   **撤销进程法(终止进程法)：强制撤销部分，甚至全部死锁进程，并剥夺这些进程的资源。这种方式的优点是实现简单，但所付出的代价可能性会很大。因为有些进程可能已经运行了很长时间，已经接近结束了，一旦被终止可谓功亏一篑，以后还得从头再来**
*   **进程回退法：让一个或多个死锁进程回退到足以避免死锁的地步。这样就要求系统要记录进程的历史信息，设置还原点**

## 第五、六、七节：并发调度的可串行性、两段锁协议和封锁的粒度

### 一：可串行化调度

**可串行化调度：多个事务的并发执行是正确的，当且仅当其结果与按某一次序串行地执行这些事务时的结果相同，称这种调度策略为可串行化(serializable)调度。可串行性是并发事务正确调度的准则， 也即一个给定的并发调度，当且仅当它是可串行化的，才认为是正确调度**

例如，下面有两个事务，分别包含下列操作

> **事务 T 1 T\_{1} T1：** 读B、A=B+1、写回A；  
> **事务 T 2 T\_{2} T2：** 读A、B=A+1、写回B；

假设A、B初值均为2，两个事务最多只有两种串行执行策略

*   T 1 T\_{1} T1\-> T 2 T\_{2} T2：A=3，B=4
*   T 2 T\_{2} T2\-> T 1 T\_{1} T1：A=4，B=3

**因此事务 T 1 T\_{1} T1和 T 2 T\_{2} T2不管怎样交叉并行运行，只有两种正确的结果（如上）。其他结果均是错误的，相应调度也称之为不可串行化调度**

### 二：冲突可串行化调度

#### （1）冲突操作

**冲突操作：是指不同事务对同一个数据的读写操作和写写操作。除此之外，其他操作均为不冲突操作**

*   R i ( x ) R\_{i}(x) Ri(x)与 W j ( x ) W\_{j}(x) Wj(x)：事务 T i T\_{i} Ti读x，事务 T j T\_{j} Tj写x
*   W i ( x ) W\_{i}(x) Wi(x)与 W j ( x ) W\_{j}(x) Wj(x)：事务 T i T\_{i} Ti写x，事务 T j T\_{j} Tj写x

**另外注意各种交换**

*   **不同事务的冲突操作不可交换**
*   **同一事务内部的两个操作不可交换**
*   **不同事务，同一数据的读读操作可以交换**
*   **不同事务，不同数据，无论读写均可交换**

#### （2）可串行化调度的充分条件：冲突可串行化

**冲突可串行化：一个调度SC在保证冲突操作的次序不变的情况下，通过交换两个事务不冲突操作的次序得到另一个调度SC ‘ ^{\`} ‘，如果SC ‘ ^{\`} ‘是串行的，则称调度SC为冲突可串行化的调度。若一个调度是冲突可串行化的，那么它一定是可串行化的调度**

*   注意：**冲突可串行化调度是可串行化调度的充分条件，不是必要条件。也就是说有可能某个调度是可串行调度，但它却不是冲突可串行化调度**

例如，现在有一个调度SC1= r 1 ( A ) w 1 ( A ) r 2 ( A ) w 2 ( A ) r 1 ( B ) w 1 ( B ) r 2 ( B ) w 2 ( B ) r\_{1}(A)w\_{1}(A)r\_{2}(A)w\_{2}(A)r\_{1}(B)w\_{1}(B)r\_{2}(B)w\_{2}(B) r1(A)w1(A)r2(A)w2(A)r1(B)w1(B)r2(B)w2(B)

考察两个不同事务的交界处，看它是否满足交换的条件

![](https://img-blog.csdnimg.cn/3e76a8609586404a94d8c05abebd9f46.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)  
交换后SC1变为了SC2= r 1 ( A ) w 1 ( A ) r 1 ( B ) w 1 ( B ) r 2 ( A ) w 2 ( A ) r 2 ( B ) w 2 ( B ) r\_{1}(A)w\_{1}(A)r\_{1}(B)w\_{1}(B)r\_{2}(A)w\_{2}(A)r\_{2}(B)w\_{2}(B) r1(A)w1(A)r1(B)w1(B)r2(A)w2(A)r2(B)w2(B)，它等价于一个串行调度 T 1 T\_{1} T1\-> T 2 T\_{2} T2，**因此SC1是冲突可串行化调度，也一定是一个可串行化调度**

### 三：两段锁协议

**两段锁协议（2PL）：两段锁协议是三级封锁协议的特例，目前DBMS普遍采用该种协议实现并发调度的可串行性。具体内容如下**

*   **在对任何数据进行读、写操作之前，首先要申请并获得对该数据的封锁**
*   **在释放一个封锁之后，事务不再申请和获得任何其他封锁**

**其中“两段”是指事务分为两个阶段**

*   **第一阶段：获得封锁，也称为扩展阶段**
*   **第二阶段：释放封锁，也称为收缩阶段**

**另外还需要注意**

*   **事务遵守两段锁协议是可串行化调度的充分条件，而非必要条件**
*   **若并发事物都遵循两段锁协议，则对其的任何并发点都策略都是可串行化的**
*   **若对并发事务的一个调度是可串行化的，不一定所有事务都符合两段锁协议**

**最后注意区分两段锁协议和一次封锁法**

*   一次封锁法要求每个事务必须一次将所有要使用的数据全部加锁，否则就不能继续执行，因此**一次封锁法遵守两段锁协议**
*   但是两段锁协议并不要求事务必须一次将所有要使用的数据全部加锁，因此**遵守两段锁协议的事务可能发生死锁**

### 四：封锁的粒度

#### （1）概念

**封锁粒度(granularity)：是指封锁对象的大小。封锁对象可以是逻辑单元，也可以是物理单元。封锁粒度与系统并发度和并发控制的开销密切相关，一般来说，封锁粒度越大，数据库所能封锁的数据单元就越少，并发度越小，开销越小**

*   **逻辑单元**：元组、关系、整个数据库等
*   **物理单元**：页（数据页或索引页）、物理记录等

#### （2）选择封锁的原则

*   **需要处理多个关系的大量元组的用户事务时以数据库为封锁单位**
*   **需要处理大量元组的用户事务时以关系为封锁单元**
*   **只处理少量元组的用户事务时以元组为封锁单位**

#### （3）多粒度封锁

**多粒度封锁：在一个系统中同时支持多种封锁粒度供不同的事务选择**

##### A：多粒度树

多粒度树是以**树形结构**来表示多级封锁粒度的方法

*   **根结点**是整个数据库，表示最大的数据粒度
*   **叶结点**表示最小的数据粒度

![](https://img-blog.csdnimg.cn/cb4f195e6d3d4c539b8496d38f57ff9d.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)

##### B：多粒度封锁协议

**多粒度封锁协议：允许多粒度树中的每个结点被独立地加锁，对一个结点加锁意味着这个结点的所有后裔结点也会被加上相同类型的锁。因此，在多粒度封锁中一个数据对象可能存在如下两种封锁方式**

*   **显式封锁：直接加到数据库对象上的封锁**
*   **隐式封锁：由于上级结点加锁而使该数据对象也被加锁**

**多粒度封锁方法中，显式封锁和隐式封锁的效果是一样的，因此系统检查封锁冲突时不仅要检查显式封锁还要检查隐式封锁**

*   例如事务 T T T要对关系 R 1 R\_{1} R1加 X X X锁，系统必须搜索其**上级结点**数据库、关系 R 1 R\_{1} R1以及 R 1 R\_{1} R1的**下级结点**，即 R 1 R\_{1} R1中的每一个元组，上下搜索。如果其中某一个数据对象已经加了不相容锁，则 T T T必须等待

#### （4）意向锁

*   一般地，对某个数据对象加锁，系统要检查该数据对象上有无显式封锁与之冲突:再检查其所有上级结点，看本事务的显式封锁是否与该数据对象上的隐式封锁(即由于上级结点已加的封锁造成的)冲突;还要检查其所有下级结点，看它们的显式封锁是否与本事务的隐式封锁(将加到下级结点的封锁)冲突
*   **可以看出，这样的检查方法效率很低，因此意向锁由此诞生**

* * *

**意向锁：如果对一个结点加意向锁，则说明该结点的下层结点正在被加锁；对任一结点加锁时，必须先对它的上层结点加意向锁。有如下三种常用的意向锁**

*   **意向共享锁（IS锁）：如果对一个数据对象加IS锁，表示它的后裔结点拟(意向)加S锁**
*   **意向排他锁（IX锁）：如果对一个数据对象加IX锁，表示它的后裔结点拟(意向)加X锁**
*   **共享意向排他锁（SIX锁）：如果对一个数据对象加SIX锁，表示对它加S锁，再加IX锁，即SIX=S+IX**

* * *

锁相容矩阵

![](https://img-blog.csdnimg.cn/1a8c4c40ff284df69a49af04b606f32f.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA5b-r5LmQ5rGf5rmW,size_20,color_FFFFFF,t_70,g_se,x_16)