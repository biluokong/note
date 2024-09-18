# 入门

## 1. Go历史

参考视频：[视频教程地址open in new window](https://www.bilibili.com/video/BV1SS4y1T7kJ)

参考笔记：

- 旧版：[[码神之路知识体系 (mszlu.com)](https://www.mszlu.com/go/base/01/01.html)]

- 2024新版：[计算机通识 | 码神之路知识体系 (mszlu.com)](https://www.mszlu.com/go/new/base/00/00.html)

## 1.1 诞生时间

Go 语言起源 2007 年，并于 2009 年正式对外发布。它从 2009 年 9 月 21 日开始作为谷歌公司 20% 兼职项目，即相关员工利用 20% 的空余时间来参与 Go 语言的研发工作。

- 2007 年 9 月 20 日的下午，在谷歌山景城总部的一间办公室里，谷歌的大佬级程序员 Rob Pike在等待一个 C++ 项目构建的过程中和谷歌的另外两个大佬级程序员 Robert Griesemer和 Ken Thompson进行了一次有关设计一门新编程语言的讨论。
	- 计算机硬件技术更新频繁，性能提高很快。目前主流的编程语言发展明显落后于硬件，不能合理利用多核多CPU的优势提升软件系统性能。
	- 软件系统复杂度越来越高，维护成本越来越高，目前缺乏一个足够简洁高效的编程语言。
	- 企业运行维护很多c/c++的项目，C/C++程序运行速度虽然很快（因为采用静态编译），但是编译速度却很慢，同时还存在内存泄露的一系列困扰需要解决。

## 1.2 里程碑

- 2007年，谷歌工程师Ken Thompson、Rob Pike、Robert Griesemer开始设计一门全新的语言，这是Go语言的最初原型。
- 2009.11.10 ，Google将Go语言以开放源代码的形式向全球发布。
- 2015年8月19日 ，Go1.5版本发布，本次更新中移除了“最后残余的C代码”，请内存管理方面权威专家Rick Hudson对GC进行重新设计（重要的修正）
- 2017年2月16日 ， Go1.8版本发布
- 2017年8月24日 ， Go1.9版本发布
- 2018年2月16日 ， Go1.10版本发布
- 2018年8月24日 ， Go1.11版本发布
- 2019年2月25日 ， Go1.12版本发布
- 2019年9月03日 ， Go1.13版本发布
- 2020年2月25日 ， Go1.14版本发布
- 2020年8月11日 ， Go1.15版本发布
- 2021年2月16日 ， Go1.16版本发布
- 2021年8月16日 ， Go1.17版本发布
- 2022年3月15日， Go1.18版本发布
- 2022年8月02日， Go1.19版本发布
- 2023年2月01日， Go1.20版本发布
- 2023年08月08日，Go1.21版本发布
- 2024年02月06日，Go1.22版本发布

> 本教程使用当前最新版本1.22进行讲解

## 1.3 团队核心人员

`Ken Thompson（肯·汤普逊）`:1983年图灵奖、1998年美国国家技术奖得主，他与Dennis Ritchie是Unix系统的原创者。Thompson也发明了C语言、B语言，同时也是C语言的主要发明人。 `Rob Pike（罗布·派克）`： 加拿大人，曾是贝尔实验室的Unix团队和Plan 9操作计划的成员。他与Thompson共事多年，并共创出广泛使用的UTF-8字符编码。（ps：Go语言的图标-gopher 囊地鼠，是Rob Pike老婆制作的） `Robert Griesemer(罗伯特·格里泽默)`：曾协助制作Java的HotSpot编译器，和Chrom浏览器的JavaScript引擎V8.

![image-20220109102129263](https://www.mszlu.com/assets/image-20220109102129263.49207fae.png)

# 2. 为什么使用Go

1. 简单好记的关键词和语法。轻松上手，简单易学。
2. 更高的效率。比Java，C++等拥有更高的编译速度，同时运行效率媲美C，同时开发效率非常高。
3. 生态强大，网络上库很丰富，很多功能使用Go开发非常简单。
4. 语法检查严格，高安全性。
5. 严格的依赖管理，go mod命令。
6. Go拥有强大的编译检查、严格的编码规范和完整的软件生命周期工具，具有很强的稳定性，稳定压倒一切。
7. 跨平台交叉编译，windows就可以编译出mac，linux上可执行的程序。
8. 异步编程复杂度低，易维护，GO 语言中 Channel 设计，异步程序写起来非常自然。
9. 语言层面支持并发，`go关键字（协程）`使得go的并发效率极高。
10. 严格的语法规范，所有程序员写出来的代码都是一样的，对大团队来说，非常友好。
11. Go 的并发、性能、安全性、易于部署等特性，使它很容易成为“云原生语言”。容器和云的使用上非常广

> Go语言设计之初，确定了三大原则：`简洁性`，`可读性`，`功能性`。

# 3. 安装Go

资料中有提供windows的zip包

下载地址：https://go.dev/dl/

> 下载后，将压缩包解压

![image-20240225225505975](https://www.mszlu.com/assets/image-20240225225505975.765d46a9.png)接下来需要配置几个环境变量：

1. `GOROOT`：go语言所在的目录，用于全局执行go相关的命令

	![image-20240225225757483](https://www.mszlu.com/assets/image-20240225225757483.7da531d9.png)

	path中也需要配置

	![image-20240225225848073](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAXgAAAAcCAYAAABrj6ReAAAFBklEQVR4nO3dP2waVxwH8O9VFZ4OFoKpmByFiMZK2elUq7KEuyRLRCTPMGIPlYxUb5boVuhSwZRKSLG62Es4yYrqKewkdY2M1UxIGN9guAmW63B3HH8O3wEGgv39SNaJ8+O9xxP63fPvfmDh5uZGBYDf/3iD/b0k7p6EhHCMF2oO0Rn0vpwcrsllBpHgOfaXfu3GfQ9cIhMJ4nxfRW4pXzjf8/Rl+Hr2Q0SRU/k272e/JlJCwFYeiBfVexAkHtp74KG9XvpSzSHA0ySiORVqbtGzWJQn2Cmpi54E0dL7atETICKi2RjawTebzUXMg4iI7pDH4xkO8B6Pp//Er99CaB5B9bzkkUceeeRxSY7YO4dgV0UjpCozur4QEdGsqOmQfQ5e9bycx1yIiOiOGHHbNsALzaOZT4aIiO6OEbe5gyciume4g18IFzK7IRTDI37t96KaXkPGP9dJEdE9Y8Rt2w86GXdlASC+HUJuHQDayGY/Y6euNwoHoG608f1vMkp9z3Yhs/sYSZ/xWEEiVUO+t4nfi2rSiyfdEwN9D/UBoCEPj2Xbj7N25msccFaDUFAcroGIYtqLC6vxiYhmTNvBn9sH+O4OPhxADjUIKUULkq+9+MsIZjEgkbIOuNXDCoSycVJEcdeLf4zgHA5AjbmQzVbMQOj3opoM4elhBVtlszup53F8O4QP220IBaU7N0f9OGiXL1T0C5CIYtqN494LkuM1UHBw6sWf37mwU+/YLbGpLiOYkp23JyKyIDSPoGKMHHxk1QXpkx5Q621U9d/HtwPA4cCuHC5kXmvBvTdIAwq2ujtvEcWYCOlwYJdblxE8VBCNBRAfMae8MY+x+pl8PMM4a1D6qADrbkRs+iQiumtj5+BLVx1En4vaybAb0es2SvqOtj+IA/C78RNkHAye7xV2I9oY0abcggQXnlnmol3IbIi4bLTH62fi8UxjrUG9hXfw4hfLfLuIYjoEVf/p5uT9XlTTPRek9Boym4Fuu+qm6/YJEhFhkiqacg0J6MEmBiQK0NISBZjBater7VhXV3py3NADlxHQ7HfKQBsXjRU8XTXPRGPm8/G2guCJk9THcD9TtRtnDdDBzt+KeUHoEY25cZyqQEhVINz618MKkr6W1i4rAz8EeAOWiGxNVEWTL+hBKVUD9LSEdtTOJ65H7FjrMoL68yTHU2zj4sp8JBljnK0g+eNw0HTaz7TtxlqDcgvSunsoeEu96ZzyNbINES8sd/ptZN8bKaEW3jWcvA4ieuimq4PvpiVcePZIwbGensh/UhBcdWmBzSfi1W27zXILkm/EBSH8CElfB/9aVKDkCzVI6wEzreG0nwnHG8luDQAACo7PRPzM1AoRzdEUdfB6xYhRwQJz9xl/LqJ61YFWRQIkk7fVdCs4OG0jGhto4/eiGhP7d7lWz9swUiFO+5l0PCtO1kCTfy8P3WztTdtENgNI+swLBBHRtCaqg9dq0rV0hBYMO9h5K6Oa1HLSOKt1SyJLJ58hfNRKEHu/wuzy9L9uILVu0+4vY7RQOqkhu/64WyrptJ9Jx+vnfA0A6DdbA3jll1HSx5Dg1u4lALD8bAAR0RSMOnh+m+QcRDbX8MEnm3X7REQzxm+TnJPSiWx5s5WIaBaMuO38k6w0BQVbKe7eiWg+xv4kKxERLQd+myQR0T01sopm8J9u3+x9M58ZERHRnbL/p9tERLSUbFM0RES0nP4Hd5H5QsUK9QwAAAAASUVORK5CYII=)

2. `GOPATH`：工作目录，工程代码存放的位置，此目录下，一个文件夹就是一个工程

	![image-20240225230025960](https://www.mszlu.com/assets/image-20240225230025960.201e82ae.png)

	path中也需要配置

	![image-20240225230100040](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAXgAAAAXCAYAAAABSFSdAAAE2ElEQVR4nO3dMWwaVxzH8S9VhaeDBdtITKmciMZy2J0pHSzhLPESEckzViecIVKR2i0SlTLEdKniqZUs1epiLwYpipqpKCtOXaFgNRMSdm4w3ATLdbjjDGeIDwe7jfX7SNbBu/fwewz/+/O/Zxw6OTmxcf308y/88F0OERH5/H05rLHVal31PEREZMKGBvhoNDrwPJSvYUdXCLV2dNRRRx11/EyOoUAlmh+/JtTamfC1RURELosdXeGLIB0V3EVEPi+h1k6wAG9HVy57LiIiMkHK4EVErill8FcizMbjJKXUiNPxGPXCDTbiVzopEbnmLpTBZ1eT2IUktj8opRLYj2MsnhntBDhnTBK7kCDr7xKPUS/09/EHPP9rDAuYbp9VY6D1dL6+n1WDkcE3HqPeN89gazYoKVCLyP9EqLUzfJukX2/LDakEL2gQyltOEHwU4/fnJhUMShlYy5tU+gfGY9RzMerbNULVXqNB6XGMv567fVMJ7EyYYrHGerN/XJJb2zWWvXEdisX3Tp94jHruBhtH7/vGRLhPh8P5CFksNt3mza2a+9igVIiwm2945yB8/uIDr9ni6esYv94Js97sBnlbHU2Tm3kzeH8RkQDGzuAXZ8OU31pOY7ND3T2fXU3Adn/gBAiz8cgJ7qdBGsBiuRfcMShlDMrbfYEanKC3bZHODMn23fPPDqa4f+c0QC/eMeCgwbMDgwejyiEXMM6aK/sWzEeGfIoREblaY9fgK0dd0gtuCSQVIf2hQ8XNcAeDOG5GbfLU394vFSF9PKJPtU2ZMLcDlTzCPJyHvf0um28t0t8MKxVdzFhrbrbZI8b3Qy8wBqVhJaaBcpBb5llKeP3qSwE+ZYiI+NjRlWAlGq8GX22wtpDELgBYrOWhVMA9JkkDHJvcfW5SmZ1ijs7pi7jlmjl6Y/0Zv1+Hd8dT3JoFmr5T8RhP5jvsvXJLIalpcljcbQLNNuVMjIdxk4p/3AjpTBI742+1xl8zXdb/sLAXDKhavt8RYS1fYxncslSCbHXYezBFbsYklG+471mCjX3fJxwRkXNcaBfN5laNUL7mBCC3TOEcnfa1DyMy2KbJTXdcOfAUO7w76j2eIpdzM+CcwV7xNOhlFwwOD9peLXzXV745T3m7tyb3p2hy2Hd+rDVX25TnI2dKS+X+ck71A8XjUaWkDsVXvZJQm73jwMsQEfF82j54r0wR5va0xa5brth8a3FzNuwEuhmDhx8rsVTblGdGXBBS0+RmuvztZa4disVeoO3PaA0ezMPcva+8ssaLeZi7Nz28fv8pzlsz4FxgDJ6otCIi/6FP2Afv7iDZsrznvWw0u2BQP+ri7CqBXO5jWwctnr7ukM74+sRj1DPGYNY7SipCGou1/gw836DMZG+2BluzY/OVeeZmq1fHBxaXEuRmTi8QIiKTNn4NHnD2jjvlCSf4dln/zaSec+vYBw1vS2Tl5XtC+86Wx/6vMDt8/Y8XuIf36Qxum/yI7IKze2bwQmCxewAvhtTCLyb4mgH3Zmti4D5AmQh2IeHN7/x7ECIiF6dvk7xEi0s3+HPGJLQ1iQuMiMh49F00l6jy0hx6s1VE5CqM/5esMgaL5byydxH5byiDFxG5pvRtkiIi19TIXTRn/un2t284uYoZiYjIRLR4w79z/ZSEwhuAzwAAAABJRU5ErkJggg==)

3. `GOPROXY`：代理，由于go需要翻墙使用，需要配置代理，有好心人做了代理

![image-20240225230209876](https://www.mszlu.com/assets/image-20240225230209876.b008022e.png)

`go env` 可以检查环境变量的配置是否正确

**配置完环境变量，我们就可以开始写代码了**

# 5. 入门案例

新建一个文件夹，hello

进入hello目录，运行cmd命令

![image-20220109105824922](https://www.mszlu.com/assets/image-20220109105824922.120dae4f.png)

```go
# 运行下面的命令
go mod init hello
```



![image-20220109110047308](https://www.mszlu.com/assets/image-20220109110047308.86b0ea5c.png)

![image-20220109110126510](https://www.mszlu.com/assets/image-20220109110126510.d52d236f.png)

会生成一个go.mod文件，用于管理依赖的。

**接下来，写程序**

新建man.go

在其中输入以下内容：

```go
// package 定义包名 main 包名
package main

// import 引用库 fmt 库名
import "fmt"

// func 定义函数 main 函数名
func main() {
	// fmt 包名 . 调用 Print 函数,并且输出定义的字符串
	fmt.Print("Hello Golang")
}
```

运行以下命令:

```go
go run main.go
```

**OK,现在我们入门了~~**

# 6. 开发工具

> 工欲善其事，必先利其器，这里我们选用GoLand做为我们的开发IDE。

这里我使用的是，2022.3.4版本

**直接运行即可**

注意在设置中，go相关的配置

![image-20240225230951944](https://www.mszlu.com/assets/image-20240225230951944.932b3601.png)

因为我比较熟悉Goland，但Goland不是唯一选择，我们也可以选择`VSCode`

![image-20240225231146645](https://www.mszlu.com/assets/image-20240225231146645.3279db59.png)

# 变量

##  1. 变量声明

> Go语言是静态类型语言，因此变量（variable）是有明确类型的，编译器也会检查变量类型的正确性。

**我们从计算机系统的角度来讲，变量就是一段或者多段内存，用于存储数据**

### 1.1 标准格式

```go
var 变量名 变量类型
```

```
变量声明以关键字var开头，变量类型后置，行尾无须分号
```

**举个例子**

```go
//声明了一个名为age的变量，类型为int
var age int
```



> 如果你学过C语言，就会体会到这样声明的好处，比如C语言这样声明：int* a, b ，那么只有a是指针，b不是，这样会使人迷惑，如果想要两个变量都为指针，需要这样定义：`int *a,*b`。
>
> 在go语言中，我们使用这样的声明方式：`var a,b *int`，就可以轻松的将a，b都声明为指针。

**变量的命名规则遵循驼峰命名法，即首个单词小写，每个新单词的首字母大写，例如： startDate**

### 1.2 基本类型

**计算机中数据存储的最小单位为bit（位），0或者1**

**byte：计算机中数据的基本单元，1字节=8bit，数据在计算机中存储或者计算，至少为1个字节**

- bool
- string
- int（随系统，一般是占用4个字节）、int8(占一个字节)、int16(占两个字节)、int32(占4个字节)、int64（占8个字节）
- uint（无符号整数）、uint8、uint16、uint32、uint64、uintptr
- byte // `uint8 的别名`
- rune // `int32 的别名 代表一个 Unicode 码`
- float32、float64
- complex64、complex128

> 有符号和无符号的区别：int8 范围 -128-127，uint8 范围：0-255

当一个变量被声明之后，系统自动赋予它该类型的零值：

```
int 为 0`，`float 为 0.0`，`bool 为 false`，`string 为空字符串`，`指针为 nil
```

**所有的内存在 Go 中都是经过初始化的。**

```go
package main

import "fmt"

var age int
func main() {

	fmt.Println(age);
}
```



### 1.3 不指明变量类型

```go
//设置游戏中角色的初始等级为1
var level = 1;
```



像上面这种声明变量的方式，并没有指明类型，Go语言中，`在编译时会自动推导类型`

我们可以使用

```go
fmt.Printf("%T", level)
```

进行类型输出。

```go
package main

import "fmt"

var level = 1

func main() {
	fmt.Printf("%T",level)
}
```



### 1.4 批量格式

> 觉得每行都用 var 声明变量比较烦琐？Go语言提供了批量声明的方式

```go
var (
    a int
    b string
    c []float32
)
```



```go
package main

import "fmt"


var (
	a int
	b string
	c []float32
)
func main() {
    //%d 整数占位符，%s 字符串占位符， %f 浮点数占位符(默认精度为6)
	fmt.Printf("%d,%s,%f",a,b,c)
}
```



### 1.5 简短格式

> 我们可以省略`var`关键字，这样写起来更加便捷

```go
//i是变量名 1 是值（或者表达式）
i := 1
```



**上面讲过，如果不指明类型，直接赋值，Go会自动推导类型**

使用简短格式有以下限制：

1. 定义变量，同时显式初始化
2. 不能提供数据类型
3. 只能用在函数内部

```go
package main

import "fmt"

//不能
//aa :=1
func main() {
	aa :=1
	fmt.Println(aa)
}
```



**简短变量声明被广泛用于大部分的局部变量的声明和初始化，var 形式的声明语句往往用于需要显式指定变量类型的地方**

## 2. 初始化变量

```go
//创建了一个游戏角色 初始等级为1
var level int = 1
```



```go
//短变量声明
level := 1
```



以下的代码会出错：

```go
package main

func main() {
	
	var level int = 1
    // 再次声明并赋值 会报错 no new variables on left side of := （左边的变量已经被声明了，不能重复声明）
	level := 1
}
```



**但是有特例**

比如：`net.Dial `提供按指定协议和地址发起网络连接，这个函数有两个返回值，一个是`连接对象（conn）`，一个是`错误对象（err）`

正常的写法：

```go
package main

import (
	"fmt"
	"net"
)
func main() {

	var conn net.Conn
	var err error
	conn, err = net.Dial("tcp", "127.0.0.1:8080")
	fmt.Println(conn)
	fmt.Println(err)
}
```



短变量的写法：

```go
package main

import (
	"fmt"
	"net"
)

func main() {

	conn, err := net.Dial("tcp", "127.0.0.1:8080")
	conn1, err := net.Dial("tcp", "127.0.0.1:8080")
	fmt.Println(conn)
	fmt.Println(conn1)
	fmt.Println(err)
}
```



**在多个短变量声明和赋值中，至少有一个新声明的变量出现在左值中，即便其他变量名可能是重复声明的，编译器也不会报错**

## 3. 小demo

> 变量交换，比如a=100，b=200，交换之后 a=200，b=100

如果是你，你会怎么样进行实现呢？

**第一种**

```go
package main

import "fmt"

func main() {
	a := 100
	b := 200
	var c int
	c = b
	b = a
	a = c
	fmt.Printf("a=%d,b=%d",a,b)
}
```



**第二种**

```go
package main

import "fmt"

func main() {
	a := 100
	b := 200

	a = a^b
	b = b^a
	a = a^b
	fmt.Printf("a=%d,b=%d",a,b)
}
```



**第三种**

```go
package main

import "fmt"

func main() {
	a := 100
	b := 200
	b,a = a,b
	fmt.Printf("a=%d,b=%d",a,b)
}
```



> 应该有点体会到Go语言编程的快捷，方便以及强大了吧

## 4. 匿名变量

使用`多重赋值`时，如果`不需要在左值中接受变量`，可以使用匿名变量

比如上面的例子:

```go
package main

import (
	"fmt"
	"net"
)
func main() {

    //conn, err := net.Dial("tcp", "127.0.0.1:8080")
    //如果不想接收err的值，那么可以使用_表示，这就是匿名变量
    conn, _ := net.Dial("tcp", "127.0.0.1:8080")
	fmt.Println(conn)
}
```



> 匿名变量以“_”下划线表示
>
> 匿名变量不占用命名空间，也不会分配内存。匿名变量可以重复声明使用

**“_”本身就是一个特殊的标识符，被称为空白标识符。它可以像其他标识符那样用于变量的声明或赋值（任何类型都可以赋值给它），但任何赋给这个标识符的值都将被抛弃，因此这些值不能在后续的代码中使用，也不可以使用这个标识符作为变量对其它变量进行赋值或运算。**

```go
package main

import (
	"fmt"
	"net"
)

func main() {

	conn, _ := net.Dial("tcp", "127.0.0.1:8080")
	//匿名变量可以重复声明
	conn1, _ := net.Dial("tcp", "127.0.0.1:8080")
	// 匿名变量不可以直接开头
	// _ :=1
	fmt.Println(conn)
	fmt.Println(conn1)
}
```



## 5. 作用域

> 一个变量（常量、类型或函数）在程序中都有一定的作用范围，称之为`作用域`。

了解变量的作用域对我们学习Go语言来说是比较重要的，因为`Go语言(静态语言)会在编译时检查每个变量是否使用过，一旦出现未使用的变量，就会报编译错误`。

如果不能理解变量的作用域，就有可能会带来一些不明所以的编译错误。

根据变量定义位置的不同，可以分为以下三个类型：

- 函数内定义的变量称为局部变量
- 函数外定义的变量称为全局变量
- 函数定义中的变量称为形式参数

### 5.1 局部变量

在函数体内声明的变量称之为`局部变量`，它们的作用域`只在函数体内`，函数的参数和返回值变量都属于局部变量。

**局部变量不是一直存在的，它只在定义它的函数被调用后存在，函数调用结束后这个局部变量就会被销毁。**

```go
package main
import (
    "fmt"
)
func main() {
    //声明局部变量 a 和 b 并赋值
    var a int = 3
    var b int = 4
    //声明局部变量 c 并计算 a 和 b 的和
    c := a + b
    fmt.Printf("a = %d, b = %d, c = %d\n", a, b, c)
}
```



### 5.2 全局变量

在函数体外声明的变量称之为`全局变量`，全局变量只需要在`一个源文件中定义，就可以在所有源文件中使用`，当然，不包含这个全局变量的源文件需要使用“import”关键字引入全局变量所在的源文件之后才能使用这个全局变量。

全局变量声明`必须以 var 关键字开头`，如果想要在外部包中使用全局变量的`首字母必须大写`。

```go
package main
import "fmt"
//声明全局变量
var c int
func main() {
    //声明局部变量
    var a, b int
    //初始化参数
    a = 3
    b = 4
    c = a + b
    fmt.Printf("a = %d, b = %d, c = %d\n", a, b, c)
}
```



**Go语言程序中全局变量与局部变量名称可以相同，但是函数体内的局部变量会被优先考虑。**

```go
package main
import "fmt"
//声明全局变量
var bb float32 = 3.14
func main() {
	bb := 3
	fmt.Println(bb)
}
//执行结果 3
```



### 5.3 形式参数

在定义函数时函数名后面括号中的变量叫做`形式参数`（简称形参）。形式参数只在函数调用时才会生效，函数调用结束后就会被销毁，在函数未被调用时，函数的形参`并不占用实际的存储单元`，也没有实际值。

形式参数会作为`函数的局部变量来使用`。

```go
package main
import (
    "fmt"
)
//全局变量 a
var a int = 13
func main() {
    //局部变量 a 和 b
    var a int = 3
    var b int = 4
    fmt.Printf("main() 函数中 a = %d\n", a)
    fmt.Printf("main() 函数中 b = %d\n", b)
    c := sum(a, b)
    fmt.Printf("main() 函数中 c = %d\n", c)
}
func sum(a, b int) int {
    fmt.Printf("sum() 函数中 a = %d\n", a)
    fmt.Printf("sum() 函数中 b = %d\n", b)
    num := a + b
    return num
}
```



**至此，Go语言变量相关的知识，我们就掌握了**

# 基本类型

## 1. 整型

Go语言同时提供了有符号和无符号的整数类型。

- 有符号整型：int、int8、int64、int32、int64
- 无符号整型：uint、uint8、uint64、uint32、uint64、uintptr

> 有符号整型范围：`-2^(n-1) 到 2^(n-1)-1`
>
> 无符号整型范围: `0 到 2^n-1`

**实际开发中由于编译器和计算机硬件的不同，int 和 uint 所能表示的整数大小会在 32bit 或 64bit 之间变化。**

> uint在硬件开发中使用

用来表示 Unicode 字符的 `rune 类型`和 `int32 类型`是等价的，通常用于表示一个 `Unicode 码点`。这两个名称可以互换使用。同样，`byte` 和 `uint8` 也是等价类型，byte 类型一般用于强调数值是一个`原始的数据`而不是一个小的整数。

> 无符号的整数类型 `uintptr`，它没有指定具体的 bit 大小但是足以容纳指针。uintptr 类型只有在`底层编程`时才需要，特别是Go语言和C语言函数库或操作系统接口相交互的地方。

**在二进制传输、读写文件的结构描述时，为了保持文件的结构不会受到不同编译目标平台字节长度的影响，不要使用 int 和 uint**

## 2. 浮点型

Go语言支持两种浮点型数：

1. `float32` ： 范围 约1.4e-45 到 约3.4e38
2. `float64` ：范围约4.9e-324 到 约1.8e308

```go
floatStr1 := 3.2
//保留小数点位数
fmt.Printf("%.2f\n", floatStr1)
```



> 算术规范由 IEEE754 浮点数国际标准定义，该浮点数规范被所有现代的 CPU 支持

**通常应该优先使用 float64 类型，因为 float32 类型的累计计算误差很容易扩散，并且 float32 能精确表示的正整数并不是很大。**

```go
var f float32 = 1 << 24;
fmt.Println(f == f+1) // true
```



**浮点数在声明的时候可以只写整数部分或者小数部分**

```go
var e = .71828 // 0.71828
var f = 1.     // 1
fmt.Printf("%.5f,%.1f",e,f)
```



**很小或很大的数最好用科学计数法书写，通过 e 或 E 来指定指数部分**

```go
var avogadro = 6.02214129e23  // 阿伏伽德罗常数
var planck   = 6.62606957e-34 // 普朗克常数
fmt.Printf("%f,%.35f",avogadro,planck)
```



## 3. 布尔型

在Go语言中，以bool类型进行声明：

```go
var 变量名 bool
```



`==`,`>`,`<`，`<=`, `>=`,`&&(AND)`,`||(OR)`等都会产生bool值

```go
var aVar = 10
aVar == 5  // false
aVar == 10 // true
aVar != 5  // true
aVar != 10 // false
```



> Go语言对于值之间的比较有非常严格的限制，只有两个相同类型的值才可以进行比较，如果值的类型是接口（interface），那么它们也必须都实现了相同的接口。
>
> 如果其中一个值是`常量`，那么另外一个值可以不是常量，但是类型必须和该常量类型相同。
>
> 如果以上条件都不满足，则必须将其中一个值的类型转换为和另外一个值的类型相同之后才可以进行比较。

`&&(AND)`,`||(OR)`是具有短路行为的，如果运算符左边的值已经可以确定整个布尔表达式的值，那么运算符右边的值将不再被求值。(&&优先级高于||)

```go
var a = 10
	//因为a>11已经不满足了，所以a < 30不会走，整个表达式为false
	if(a > 11 && a < 30){
		fmt.Println("正确")
	}else{
		fmt.Println("错误")
	}

	//因为a > 5已经满足了，所以a < 30不会走，整个表达式为true
	if(a > 5 || a < 30){
		fmt.Println("正确")
	}else{
		fmt.Println("错误")
	}
```



**布尔型数据只有true和false，且不能参与任何计算以及类型转换**

## 4. 字符类型

Go语言的字符有以下两种：

- 一种是 uint8 类型，或者叫 byte 型，代表了 ASCII 码的一个字符。
- 另一种是 rune 类型，代表一个 UTF-8 字符，当需要处理中文、日文或者其他复合字符时，则需要用到 rune 类型。rune 类型等价于 int32 类型。

**byte 类型是 uint8 的别名，rune 类型是int32的别名**

**ASCII 码的一个字符占一个字节**

**ASCII** 定义 128 个字符，由码位 0 – 127 标识。它涵盖英文字母，拉丁数字和其他一些字符。

字符的定义：

```go
//使用单引号 表示一个字符
var ch byte = 'A'
//在 ASCII 码表中，A 的值是 65,也可以这么定义
var ch byte = 65
//65使用十六进制表示是41，所以也可以这么定义 \x 总是紧跟着长度为 2 的 16 进制数
var ch byte = '\x41'
//65的八进制表示是101，所以使用八进制定义 \后面紧跟着长度为 3 的八进制数
var ch byte = '\101'

fmt.Printf("%c",ch)
```



**Unicode** 是 ASCII 的超集，它定义了 1,114,112 个代码点的代码空间。 Unicode 版本 10.0 涵盖 139 个现代和历史文本集（包括符文字母，但不包括 Klingon ）以及多个符号集。

Go语言同样支持 Unicode（UTF-8）, `用rune来表示`, 在内存中使用 int 来表示。

在书写 Unicode 字符时，需要在 16 进制数之前加上前缀`\u`或者`\U`。如果需要使用到 4 字节，则使用`\u`前缀，如果需要使用到 8 个字节，则使用`\U`前缀。

```go
var ch rune = '\u0041'
	var ch1 int64 = '\U00000041'
	//格式化说明符%c用于表示字符，%v或%d会输出用于表示该字符的整数，%U输出格式为 U+hhhh 的字符串。
	fmt.Printf("%c,%c,%U",ch,ch1,ch)
```



Unicode 包中内置了一些用于测试字符的函数，这些函数的返回值都是一个布尔值，如下所示（其中 ch 代表字符）：

- 判断是否为字母：unicode.IsLetter(ch)
- 判断是否为数字：unicode.IsDigit(ch)
- 判断是否为空白符号：unicode.IsSpace(ch)

### 4.1 UTF-8 和 Unicode 有何区别？

Unicode 与 ASCII 类似，都是一种字符集。

字符集为每个字符分配一个唯一的 ID，我们使用到的所有字符在 Unicode 字符集中都有一个唯一的 ID，例如 a 在 Unicode 与 ASCII 中的编码都是 97。汉字“你”在 Unicode 中的编码为 20320，在不同国家的字符集中，字符所对应的 ID 也会不同。而无论任何情况下，Unicode 中的字符的 ID 都是不会变化的。

UTF-8 是编码规则，将 Unicode 中字符的 ID 以某种方式进行编码，UTF-8 的是一种变长编码规则，从 1 到 4 个字节不等。编码规则如下：

- 0xxxxxx 表示文字符号 0～127，兼容 ASCII 字符集。
- 从 128 到 0x10ffff 表示其他字符。

根据这个规则，拉丁文语系的字符编码一般情况下每个字符占用一个字节，而中文每个字符占用 3 个字节。

广义的 Unicode 指的是一个标准，它定义了字符集及编码规则，即 Unicode 字符集和 UTF-8、UTF-16 编码等。

## 5. 字符串型

一个字符串是一个不可改变的字节序列，字符串可以包含任意的数据，但是通常是用来包含可读的文本，字符串是 UTF-8 字符的一个序列。

字符串的定义：

```go
var mystr string = "hello"
```



**go语言从底层就支持UTF-8编码。**

> UTF-8 是一种被广泛使用的编码格式，是文本文件的标准编码。
>
> 由于该编码对占用字节长度的不定性，在Go语言中字符串也可能根据需要占用 1 至 4 个字节，这与其它编程语言不同。
>
> Go语言这样做不仅减少了内存和硬盘空间占用，同时也不用像其它语言那样需要对使用 UTF-8 字符集的文本进行编码和解码。

```
字符串是一种值类型，且值不可变，即创建某个文本后将无法再次修改这个文本的内容。
当字符为 ASCII 码表上的字符时则占用 1 个字节
```

**字符串中可以使用转义字符来实现换行、缩进等效果，常用的转义字符包括:**

1. `\n：`换行符
2. `\r：`回车符
3. `\t：`tab 键
4. `\u 或 \U：`Unicode 字符
5. \：反斜杠自身

```go
var str = "码神之路\nGo大法好"
fmt.Print(str)
```



> 如果使用``反引号，会被原样进行赋值和输出

```go
 fmt.Println(`\t 码神之路Go大法好`)  // \t 码神之路Go大法好
 fmt.Println(`\t 码神之路
 Go大法好`) //使用反引号 可以进行字符串换行
//反引号一般用在 需要将内容进行原样输出的时候 使用
```



**字符串是字节的定长数组，byte 和 rune 都是字符类型，若多个字符放在一起，就组成了字符串**

比如 `hello` ，对照 ascii 编码表，每个字母对应的编号是：104,101,108,108,111

```go
import (
    "fmt"
)

func main() {
    var mystr01 string = "hello"
    var mystr02 [5]byte = [5]byte{104, 101, 108, 108, 111}
    fmt.Printf("myStr01: %s\n", mystr01)
    fmt.Printf("myStr02: %s", mystr02)
}
```



思考：hello，码神之路 占用几个字节

```go
package main

import (
	"fmt"
)

func main() {
   //中文三字节，字母一个字节
var myStr01 string = "hello,码神之路"
fmt.Printf("mystr01: %d\n", len(myStr01))
}
```



### 5.1 字符串的应用

一般的比较运算符（==、!=、<、<=、>=、>）是通过在内存中按字节比较来实现字符串比较的，因此比较的结果是字符串自然编码的顺序。

字符串所占的字节长度可以通过函数 len() 来获取，例如 len(str)。

字符串的内容（纯字节）可以通过标准索引法来获取，在方括号`[ ]`内写入索引，索引从 0 开始计数：

- 字符串 str 的第 1 个字节：str[0]
- 第 i 个字节：str[i - 1]
- 最后 1 个字节：str[len(str)-1]

需要注意的是，这种转换方案只对纯 ASCII 码的字符串有效。

> 注意：获取字符串中某个字节的地址属于非法行为，例如 &str[i]。

ASCII字符使用`len()`函数

Unicode字符串长度使用`utf8.RuneCountInString()`函数

```go
  //如何计算字符串的长度
    str3 := "hello"
    str4 := "你好"
    fmt.Println(len(str3))  // 1个字母占1个字节
    fmt.Println(len(str4))  // 1个中文占3个字节，go从底层支持utf8
    fmt.Println(utf8.RuneCountInString(str4)) // 2
```



**字符串拼接符“+”**

两个字符串 s1 和 s2 可以通过 s := s1 + s2 拼接在一起。将 s2 追加到 s1 尾部并生成一个新的字符串 s。

```go
//因为编译器会在行尾自动补全分号，所以拼接字符串用的加号“+”必须放在第一行末尾。
	str := "第一部分 " +
		"第二部分"
```



也可以使用“+=”来对字符串进行拼接：

```go
s := "hel" + "lo,"
s += "world!"
fmt.Println(s) //输出 “hello, world!”
```



除了使用`+`进行拼接，我们也可以使用`WriteString()`

```go
	str1 := "你好,"
	str2 := "码神之路"
	var stringBuilder bytes.Buffer
	//节省内存分配，提高处理效率
	stringBuilder.WriteString(str1)
	stringBuilder.WriteString(str2)
	fmt.Println(stringBuilder.String())
```



**如果从字符串 `hello 码神之路` 中获取 `码` 该如何获取呢？**

直接索引对rune类型无效，可以使用string方法转换

```go
string([]rune(str6)[0])
```

```go
var myStr01 string = "hello,码神之路"
fmt.Println(string([]rune(myStr01)[6]))
```



**遍历**

unicode字符集使用`for range`进行遍历，ascii字符集可以使用`for range`或者`for`循环遍历

```go
	var str1 string = "hello"
	var str2 string = "hello,码神之路"
	// 遍历
	for i :=0; i< len(str1); i++{
		fmt.Printf("ascii: %c %d\n", str1[i], str1[i])
	}
	for _, s := range  str1{
		fmt.Printf("unicode: %c %d\n ", s, s)
	}
	// 中文只能用 for range
	for _, s := range  str2{
		fmt.Printf("unicode: %c %d\n ", s, s)
	}
```



**字符串的格式化**

- `print ：` 结果写到标准输出
- `Sprint：`结果会以字符串形式返回

```go
	str1 := "你好,"
	str2 := "码神之路"
	var stringBuilder bytes.Buffer
	stringBuilder.WriteString(str1)
	stringBuilder.WriteString(str2)
// Sprint 以字符串形式返回
result := fmt.Sprintf(stringBuilder.String())
fmt.Println(result)
```



```go
%c  单一字符
%T  动态类型
%v  本来值的输出
%+v 字段名+值打印
%d  十进制打印数字
%p  指针，十六进制
%f  浮点数
%b 二进制
%s string
```



**字符串查找**

如何获取字符串中的某一段字符?

- strings.Index()： 正向搜索子字符串
- strings.LastIndex()：反向搜索子字符串

```go
package main

import (
	"fmt"
	"strings"
)

func main() {
	// 查找
	tracer := "码神来了,码神bye bye"

	// 正向搜索字符串
	comma := strings.Index(tracer, ",")
	fmt.Println(",所在的位置:",comma)
	fmt.Println(tracer[comma+1:])  // 码神bye bye

	add := strings.Index(tracer, "+")
	fmt.Println("+所在的位置:",add)  // +所在的位置: -1

	pos := strings.Index(tracer[comma:], "码神")
	fmt.Println("码神，所在的位置", pos) // 码神，所在的位置 1

	fmt.Println(comma, pos, tracer[5+pos:])  // 12 1 码神bye bye
}
```



## 6. 类型转换

在必要以及可行的情况下，一个类型的值可以被转换成另一种类型的值。由于Go语言不存在隐式类型转换，因此所有的类型转换都必须显式的声明：

```go
//类型 B 的值 = 类型 B(类型 A 的值)
valueOfTypeB = type B(valueOfTypeA)
```



示例：

```go
a := 5.0
b := int(a)
```



类型转换只能在定义正确的情况下转换成功，例如从一个取值范围较小的类型转换到一个取值范围较大的类型（将 int16 转换为 int32）。

当从一个取值范围较大的类型转换到取值范围较小的类型时（将 int32 转换为 int16 或将 float32 转换为 int），会发生`精度丢失`的情况。

只有相同底层类型的变量之间可以进行相互转换（如将 int16 类型转换成 int32 类型），不同底层类型的变量相互转换时会引发编译错误（如将 bool 类型转换为 int 类型）：

```go
package main
import (
        "fmt"
        "math"
)
func main() {
        // 输出各数值范围
        fmt.Println("int8 range:", math.MinInt8, math.MaxInt8)
        fmt.Println("int16 range:", math.MinInt16, math.MaxInt16)
        fmt.Println("int32 range:", math.MinInt32, math.MaxInt32)
        fmt.Println("int64 range:", math.MinInt64, math.MaxInt64)
        // 初始化一个32位整型值
        var a int32 = 1047483647
        // 输出变量的十六进制形式和十进制值
        fmt.Printf("int32: 0x%x %d\n", a, a)
        // 将a变量数值转换为十六进制, 发生数值截断
        b := int16(a)
        // 输出变量的十六进制形式和十进制值
        fmt.Printf("int16: 0x%x %d\n", b, b)
        // 将常量保存为float32类型
        var c float32 = math.Pi
        // 转换为int类型, 浮点发生精度丢失
        fmt.Println(int(c))
}
```



```go
//结果
int8 range: -128 127
int16 range: -32768 32767
int32 range: -2147483648 2147483647
int64 range: -9223372036854775808 9223372036854775807
int32: 0x3e6f54ff 1047483647
int16: 0x54ff 21759
3
```



根据输出结果，16 位有符号整型的范围是 -32768～32767，而变量 a 的值 1047483647 不在这个范围内。1047483647 对应的十六进制为 0x3e6f54ff，转为 int16 类型后，长度缩短一半，也就是在十六进制上砍掉一半，变成 0x54ff，对应的十进制值为 21759。

浮点数在转换为整型时，会将小数部分去掉，只保留整数部分。

### 6.1 修改字符串

Golang语言的字符串是`不可变的`

修改字符串时，可以将字符串`转换为[]byte`进行修改

**[]byte和string可以通过强制类型转换**

> 案例：将8080改为8081

```go
package main

import "fmt"

func main() {

	s1 := "localhost:8080"
	fmt.Println(s1)
	// 强制类型转换 string to byte
	strByte := []byte(s1)

	// 下标修改
	strByte[len(s1)-1] = '1'
	fmt.Println(strByte)

	// 强制类型转换 []byte to string
	s2 := string(strByte)
	fmt.Println(s2)
}
```



## 7. 小练习

> 字符串替换, 比如将 "Hello, 码神之路Java教程" 替换为 "Hello, 码神之路Go教程"

思路：

1. 找到Java所在的位置
2. 根据Java的长度将其分为两部分
3. 加上Go总共三部分，进行拼接

```go
package main

import (
	"bytes"
	"fmt"
	"strings"
)

func main() {
	str1 := "Hello, 码神之路Java教程"
	source := "Java"
	target := "Go"
	index := strings.Index(str1, source)
	sourceLength := len(source)
	start := str1[:index]
	end := str1[index+sourceLength:]

	var stringBuilder bytes.Buffer
	stringBuilder.WriteString(start)
	stringBuilder.WriteString(target)
	stringBuilder.WriteString(end)
	fmt.Println(stringBuilder.String())

}
```



# 常量指针

##  1. 常量

Go语言中的常量使用关键字`const`定义，用于存储不会改变的数据，常量是在编译时被创建的，即使定义在函数内部也是如此，并且只能是`布尔型`、`数字型`（整数型、浮点型和复数）和`字符串型`。

由于编译时的限制，定义常量的表达式必须为能被编译器求值的常量表达式。

声明格式：

```go
const name [type] = value
```

例如：

```go
const pi = 3.14159
```

**type可以省略**

**和变量声明一样，可以批量声明多个常量：**

```go
const (
    e  = 2.7182818
    pi = 3.1415926
)
```



> 所有常量的运算都可以在编译期完成，这样不仅可以减少运行时的工作，也方便其他代码的编译优化，当操作数是常量时，一些运行时的错误也可以在编译时被发现，例如整数除零、字符串索引越界、任何导致无效浮点数的操作等。

常量间的所有算术运算、逻辑运算和比较运算的结果也是常量，对常量的类型转换操作或以下函数调用都是返回常量结果：len、cap、real、imag、complex 和 unsafe.Sizeof。

因为它们的值是在编译期就确定的，因此常量可以是构成类型的一部分

**如果是批量声明的常量，除了第一个外其它的常量右边的初始化表达式都可以省略，如果省略初始化表达式则表示使用前面常量的初始化表达式，对应的常量类型也是一样的。例如：**

```go
const (
    a = 1
    b
    c = 2
    d
)
fmt.Println(a, b, c, d) // "1 1 2 2"
```



### 1.1 iota 常量生成器

> 常量声明可以使用 iota 常量生成器初始化，它用于生成一组以相似规则初始化的常量，但是不用每行都写一遍初始化表达式。

**在一个 const 声明语句中，在第一个声明的常量所在的行，iota 将会被置为 0，然后在每一个有常量声明的行加1**

比如，定义星期日到星期六，从0-6

```go
const (
    Sunday  = iota //0
    Monday
    Tuesday
    Wednesday
    Thursday
    Friday
    Saturday  //6
)
```



## 2. 指针

指针（pointer）在Go语言中可以被拆分为两个核心概念：

- 类型指针，允许对这个指针类型的数据进行修改，传递数据可以直接使用指针，而无须拷贝数据，类型指针不能进行偏移和运算。
- 切片，由指向起始元素的原始指针、元素数量和容量组成。

受益于这样的约束和拆分，Go语言的指针类型变量即拥有指针高效访问的特点，又不会发生指针偏移，从而避免了非法修改关键性数据的问题。

同时，`垃圾回收`也比较容易对不会发生偏移的指针进行检索和回收。

切片比原始指针具备更强大的特性，而且更为安全。

切片在发生越界时，运行时会报出宕机，并打出堆栈，而原始指针只会崩溃。

### 2.1 如何理解指针

> var a int = 10

如果用大白话来解释上述语句：

**在内存中开辟了一片空间，空间内存放着数值10，这片空间在整个内存当中，有一个唯一的地址，用来进行标识，指向这个地址的变量就称为指针**

如果用类比的说明：

内存比作酒店，每个房间就是一块内存，上述代码表示为：定了一间房间a，让10住进了房间，房间有一个门牌号px，这个px就是房间的地址，房卡可以理解为就是指针，指向这个地址。

> 一个指针变量可以指向任何一个值的内存地址，它所指向的值的内存地址在 32 和 64 位机器上分别占用 4 或 8 个字节，占用字节的大小与所指向的值的大小无关。

当一个指针被定义后`没有分配到任何变量`时，它的默认值为 `nil`。

每个变量在运行时都拥有一个地址，这个地址代表变量在内存中的位置。

Go语言中使用在变量名前面添加`&`操作符（前缀）来获取变量的内存地址（取地址操作），格式如下：

```go
//其中 v 代表被取地址的变量，变量 v 的地址使用变量 ptr 进行接收，ptr 的类型为*T，称做 T 的指针类型，*代表指针。
ptr := &v    // v 的类型为 T
```



```go
package main
import (
    "fmt"
)
func main() {
    var cat int = 1
    var str string = "码神之路"
    fmt.Printf("%p %p", &cat, &str)
}
```



**变量、指针和地址三者的关系是，每个变量都拥有地址，指针的值就是地址**

> 当使用`&`操作符对普通变量进行取地址操作并得到变量的指针后，可以对指针使用`*`操作符，也就是指针取值

```go
// 指针与变量
	var room int = 10  // room房间 里面放的 变量10
	var ptr = &room  // 门牌号px  指针  0xc00000a0a8

	fmt.Printf("%p\n", &room)  // 变量的内存地址 0xc00000a0a8

	fmt.Printf("%T, %p\n", ptr, ptr)  // *int, 0xc00000a0a8

	fmt.Println("指针地址",ptr)   // 0xc00000a0a8
	fmt.Println("指针地址代表的值", *ptr)  // 10
```



取地址操作符`&`和取值操作符`*`是一对互补操作符，`&`取出地址，`*`根据地址取出地址指向的值

变量、指针地址、指针变量、取地址、取值的相互关系和特性如下：

- 对变量进行取地址操作使用`&`操作符，可以获得这个变量的指针变量。
- 指针变量的值是指针地址。
- 对指针变量进行取值操作使用`*`操作符，可以获得指针变量指向的原变量的值。

### 2.2 使用指针修改值

通过指针不仅可以取值，也可以修改值。

```go
package main

func main(){
    // 利用指针修改值
	var num = 10
	modifyFromPoint(num)
	fmt.Println("未使用指针，方法外",num)

	var num2 = 22
	newModifyFromPoint(&num2)  // 传入指针
	fmt.Println("使用指针 方法外",num2)
}

func modifyFromPoint(num int)  {
	// 未使用指针
	num = 10000
	fmt.Println("未使用指针，方法内:",num)
}

func newModifyFromPoint(ptr *int)  {
	// 使用指针
	*ptr = 1000   // 修改指针地址指向的值
	fmt.Println("使用指针，方法内:",*ptr)
}
```



### 2.3 创建指针的另一种方法

Go语言还提供了另外一种方法来创建指针变量，格式如下：

```go
new(类型)
```

```go
str := new(string)
*str = "码神之路Go语言教程"
fmt.Println(*str)
```



**new() 函数可以创建一个对应类型的指针，创建过程会分配内存，被创建的指针指向默认值。**

### 2.4 指针小案例

> 获取命令行的输入信息

Go语言内置的 flag 包实现了对命令行参数的解析，flag 包使得开发命令行工具更为简单。

```go
package main
// 导入系统包
import (
    "flag"
    "fmt"
)
// 定义命令行参数
var mode = flag.String("mode", "", "fast模式能让程序运行的更快")

func main() {
	// 解析命令行参数
	flag.Parse()
	fmt.Println(*mode)
}
```



## 3. 变量的生命周期

> 变量的生命周期指的是在程序运行期间变量有效存在的时间间隔。

变量的生命周期与变量的作用域有不可分割的联系：

1. 全局变量：它的生命周期和整个程序的运行周期是一致的；
2. 局部变量：它的生命周期则是动态的，从创建这个变量的声明语句开始，到这个变量不再被引用为止；
3. 形式参数和函数返回值：它们都属于局部变量，在函数被调用的时候创建，函数调用结束后被销毁。

go的内存中应用了两种数据结构用于存放变量：

1. 堆（heap）：堆是用于存放进程执行中被动态分配的内存段。它的大小并不固定，可动态扩张或缩减。当进程调用 malloc 等函数分配内存时，新分配的内存就被动态加入到堆上（堆被扩张）。当利用 free 等函数释放内存时，被释放的内存从堆中被剔除（堆被缩减）；
2. 栈(stack)：栈又称堆栈， 用来存放程序暂时创建的局部变量，也就是我们函数的大括号`{ }`中定义的局部变量。

**栈是先进后出，往栈中放元素的过程，称为入栈，取元素的过程称为出栈。**

**栈可用于内存分配，栈的分配和回收速度非常快**

在程序的编译阶段，编译器会根据实际情况`自动选择`在`栈`或者`堆`上分配局部变量的存储空间，不论使用 var 还是 new 关键字声明变量都不会影响编译器的选择。

```go
var global *int
func f() {
    var x int
    x = 1
    global = &x
}
func g() {
    y := new(int)
    *y = 1
}
```



上述代码中，函数 f 里的变量 x 必须在堆上分配，因为它在函数退出后依然可以通过包一级的 global 变量找到，虽然它是在函数内部定义的。

```
用Go语言的术语说，这个局部变量 x 从函数 f 中逃逸了。
```

相反，当函数 g 返回时，变量 y 不再被使用，也就是说可以马上被回收的。因此，y 并没有从函数 g 中逃逸，编译器可以选择在栈上分配 *y 的存储空间，也可以选择在堆上分配，然后由Go语言的 GC（垃圾回收机制）回收这个变量的内存空间。

## 4. 类型别名

> 类型别名是 Go 1.9 版本添加的新功能，主要用于解决代码升级、迁移中存在的类型兼容性问题。

格式：

```go
//TypeAlias 只是 Type 的别名，本质上 TypeAlias 与 Type 是同一个类型，就像一个孩子小时候有小名、乳名，上学后用学名，英语老师又会给他起英文名，但这些名字都指的是他本人。
type TypeAlias = Type
```



还有一种是类型定义：

```go
//定义Name为Type类型 ,定义之后 Name为一种新的类型
type Name Type
```



**类型别名与类型定义表面上看只有一个等号的差异，那么它们之间实际的区别有哪些呢？**

```go
package main
import (
    "fmt"
)
// 将NewInt定义为int类型
type NewInt int
// 将int取一个别名叫IntAlias
type IntAlias = int
func main() {
    // 将a声明为NewInt类型
    var a NewInt
    // 查看a的类型名 main.NewInt
    fmt.Printf("a type: %T\n", a)
    // 将a2声明为IntAlias类型
    var a2 IntAlias
    // 查看a2的类型名 int 
    //IntAlias 类型只会在代码中存在，编译完成时，不会有 IntAlias 类型。
    fmt.Printf("a2 type: %T\n", a2)
}
```



## 5. 注释

Go语言的注释主要分成两类，分别是单行注释和多行注释。

- 单行注释简称行注释，是最常见的注释形式，可以在任何地方使用以`//`开头的单行注释；
- 多行注释简称块注释，以`/*`开头，并以`*/`结尾，且不可以嵌套使用，多行注释一般用于包的文档描述或注释成块的代码片段。

单行注释的格式如下所示

```go
//单行注释
```

多行注释的格式如下所示

```go
/*
第一行注释
第二行注释
...
*/
```



每一个包都应该有相关注释，在使用 package 语句声明包名之前添加相应的注释，用来对包的功能及作用进行简要说明。

同时，在 package 语句之前的注释内容将被默认认为是这个包的文档说明。一个包可以分散在多个文件中，但是只需要对其中一个进行注释说明即可。

## 6. 关键字和标识符

**关键字**

关键字即是被Go语言赋予了特殊含义的单词，也可以称为保留字。

Go语言中的关键字一共有 25 个：

| break    | default     | func   | interface | select |
| -------- | ----------- | ------ | --------- | ------ |
| case     | defer       | go     | map       | struct |
| chan     | else        | goto   | package   | switch |
| const    | fallthrough | if     | range     | type   |
| continue | for         | import | return    | var    |

之所以刻意地将Go语言中的关键字保持的这么少，是为了简化在编译过程中的代码解析。

和其它语言一样，`关键字不能够作标识符使用。`

**标识符**

标识符是指Go语言对各种变量、方法、函数等命名时使用的字符序列，标识符由若干个字母、下划线`_`、和数字组成，且第一个字符必须是字母。

*下划线`_`是一个特殊的标识符，称为空白标识符*

标识符的命名需要遵守以下规则：

- 由 26 个英文字母、0~9、`_`组成；
- 不能以数字开头，例如 `var 1num int `是错误的；
- Go语言中严格区分大小写；
- 标识符不能包含空格；
- 不能以系统保留关键字作为标识符，比如 break，if 等等。

命名标识符时还需要注意以下几点：

- 标识符的命名要尽量采取简短且有意义；
- 不能和标准库中的包名重复；
- 为变量、函数、常量命名时采用驼峰命名法，例如 stuName、getVal；

在Go语言中还存在着一些特殊的标识符，叫做预定义标识符，如下表所示：

| append | bool    | byte    | cap     | close  | complex | complex64 | complex128 | uint16  |
| ------ | ------- | ------- | ------- | ------ | ------- | --------- | ---------- | ------- |
| copy   | false   | float32 | float64 | imag   | int     | int8      | int16      | uint32  |
| int32  | int64   | iota    | len     | make   | new     | nil       | panic      | uint64  |
| print  | println | real    | recover | string | true    | uint      | uint8      | uintptr |

预定义标识符一共有 36 个，主要包含Go语言中的基础数据类型和内置函数，这些预定义标识符也不可以当做标识符来使用。

## 7. 运算符优先级

> 所谓优先级，就是当多个运算符出现在同一个表达式中时，先执行哪个运算符。

Go语言有几十种运算符，被分成十几个级别，有的运算符优先级不同，有的运算符优先级相同，请看下表。

| 优先级 | 分类           | 运算符                                         | 结合性   |
| ------ | -------------- | ---------------------------------------------- | -------- |
| 1      | 逗号运算符     | ,                                              | 从左到右 |
| 2      | 赋值运算符     | =、+=、-=、*=、/=、 %=、 >=、 <<=、&=、^=、\|= | 从右到左 |
| 3      | 逻辑或         | \|\|                                           | 从左到右 |
| 4      | 逻辑与         | &&                                             | 从左到右 |
| 5      | 按位或         | \|                                             | 从左到右 |
| 6      | 按位异或       | ^                                              | 从左到右 |
| 7      | 按位与         | &                                              | 从左到右 |
| 8      | 相等/不等      | ==、!=                                         | 从左到右 |
| 9      | 关系运算符     | <、<=、>、>=                                   | 从左到右 |
| 10     | 位移运算符     | <<、>>                                         | 从左到右 |
| 11     | 加法/减法      | +、-                                           | 从左到右 |
| 12     | 乘法/除法/取余 | *（乘号）、/、%                                | 从左到右 |
| 13     | 单目运算符     | !、*（指针）、& 、++、--、+（正号）、-（负号） | 从右到左 |
| 14     | 后缀运算符     | ( )、[ ]、->                                   | 从左到右 |

**注意：优先级值越大，表示优先级越高。**

一下子记住所有运算符的优先级并不容易，还好Go语言中大部分运算符的优先级和数学中是一样的，大家在以后的编程过程中也会逐渐熟悉起来。如果实在搞不清，可以加括号，就像下面这样：

```go
d := a + (b * c)
```

括号的优先级是最高的，括号中的表达式会优先执行，这样各个运算符的执行顺序就一目了然了。

## 8. 字符串与其他数据类型的转换

1. 整数 与 字符串

	```go
	// 字符串与其他类型的转换
	// str 转 int
	newStr1 := "1"
	intValue, _ := strconv.Atoi(newStr1)
	fmt.Printf("%T,%d\n", intValue, intValue)  // int,1
	
	// int 转 str
	intValue2 := 1
	strValue := strconv.Itoa(intValue2)
	fmt.Printf("%T, %s\n", strValue, strValue)
	```

2. 浮点数 与字符串

	```java
	    // str 转  float
	    string3 := "3.1415926"
	    f,_ := strconv.ParseFloat(string3, 32)
	    fmt.Printf("%T, %f\n", f, f)  // float64, 3.141593
	    //float 转 string
		floatValue := 3.1415926
		//4个参数，1：要转换的浮点数 2. 格式标记（b、e、E、f、g、G）
		//3. 精度 4. 指定浮点类型（32:float32、64:float64）
		// 格式标记：
		// ‘b’ (-ddddp±ddd，二进制指数)
		// ‘e’ (-d.dddde±dd，十进制指数)
		// ‘E’ (-d.ddddE±dd，十进制指数)
		// ‘f’ (-ddd.dddd，没有指数)
		// ‘g’ (‘e’:大指数，‘f’:其它情况)
		// ‘G’ (‘E’:大指数，‘f’:其它情况)
		//
		// 如果格式标记为 ‘e’，‘E’和’f’，则 prec 表示小数点后的数字位数
		// 如果格式标记为 ‘g’，‘G’，则 prec 表示总的数字位数（整数部分+小数部分）
		formatFloat := strconv.FormatFloat(floatValue, 'f', 2, 64)
		fmt.Printf("%T,%s",formatFloat,formatFloat)
	```


## 9. 练习：开发一款游戏

>  //捕获标准输入，并转换为字符串  reader := bufio.NewReader(os.Stdin)  input, err := reader.ReadString('\n')
>
>  if err != nil {
>
>  //如果有错误 退出
>
>  panic(err)  }
>
> 需求：能打怪升级

```go
package main

import (
	"bufio"
	"fmt"
	"os"
)

var level = 1
var ex = 0
func main()  {
	fmt.Println("请输入你的角色名字")
	//捕获标准输入，并转换为字符串
	reader := bufio.NewReader(os.Stdin)
	input, err := reader.ReadString('\n')
	if err != nil {
		panic(err)
	}
	//删除最后的\n
	name := input[:len(input)-1]
	fmt.Printf("角色创建成功,%s,欢迎你来到码神游戏,目前角色等级%d \n",name,level)
	s := `你遇到了一个怪物，请选择是战斗还是逃跑?
	1.战斗
	2.逃跑`
	fmt.Printf("%s \n",s)
	for {
		input, err := reader.ReadString('\n')
		if err != nil {
			panic(err)
		}
		selector := input[:len(input)-1]
		switch selector {
		case "1":
			ex += 10
			fmt.Printf("杀死了怪物，获得了%d经验 \n",ex)
			computeLevel()
			fmt.Printf("您现在的等级为%d \n",level)
		case "2":
			fmt.Printf("你选择了逃跑\n")
			fmt.Printf("%s \n",s)
		case "exit":
			fmt.Println("你退出了游戏")
			//退出
			os.Exit(1)
		default:
			fmt.Println("你的输入我不认识，请重新输入")
		}
	}
}

func computeLevel() {
	if ex < 20 {
		level = 1
	}else if ex < 40{
		level = 2
	}else if ex < 200{
		level = 3
	}else {
		level = 4
	}
}
```

# 数组切片

##  1. 数组

数组是一个由固定长度的特定类型元素组成的序列，一个数组可以由零个或多个元素组成。

**因为数组的长度是固定的，所以在Go语言中很少直接使用数组。**

**Go语言数组的声明：**

```go
var 数组变量名 [元素数量]Type
```

- 数组变量名：数组声明及使用时的变量名。
- 元素数量：数组的元素数量，可以是一个表达式，但最终通过编译期计算的结果必须是整型数值，元素数量不能含有到运行时才能确认大小的数值。
- Type：可以是任意基本类型，包括数组本身，类型为数组本身时，可以实现多维数组。

例子：

```go
//默认数组中的值是类型的默认值
var arr [3]int
```



**从数组中取值：**

1. 通过索引下标取值，索引从0开始

	```go
		fmt.Println(arr[0])
		fmt.Println(arr[1])
		fmt.Println(arr[2])
	```



2. for range获取

	```go
	for index,value := range arr{
			fmt.Printf("索引:%d,值：%d \n",index,value)
	}
	```



**给数组赋值:**

1. 初始化的时候赋值

	```go
	var arr [3]int = [3]int{1,2,3}
	//如果第三个不赋值，就是默认值0
	var arr [3]int = [3]int{1,2}
	//可以使用简短声明
	arr := [3]int{1,2,3}
	//如果不写数据数量，而使用...，表示数组的长度是根据初始化值的个数来计算
	arr := [...]int{1,2,3}
	```



2. 通过索引下标赋值

	```go
		var arr [3]int
		arr[0] = 5
		arr[1] = 6
		arr[2] = 7
	```



> 一定要注意，数组是定长的，不可更改，在编译阶段就决定了

`小技巧：` 如果觉的每次写 `[3]int` 有点麻烦，你可以为 `[3]int` 定义一个新的类型。

```go
	type arr3 [3]int
	//这样每次用arr3 代替[3]int，注意前面学过 定义一个类型后 arr3就是一个新的类型
	var arr arr3
	arr[0] = 2
	for index,value := range arr{
		fmt.Printf("索引:%d,值：%d \n",index,value)
	}
```



**如果想要只初始化第三个值怎么写？**

```go
	//2 给索引为2的赋值 ，所以结果是 0,0,3
	arr := [3]int{2:3}
	for index,value := range arr{
		fmt.Printf("索引:%d,值：%d \n",index,value)
	}
```



**数组比较**

如果两个数组类型相同（包括数组的长度，数组中元素的类型）的情况下，我们可以直接通过较运算符（`==`和`!=`）来判断两个数组是否相等，只有当两个数组的所有元素都是相等的时候数组才是相等的，不能比较两个类型不同的数组，否则程序将无法完成编译。

```go
a := [2]int{1, 2}
b := [...]int{1, 2}
c := [2]int{1, 3}
fmt.Println(a == b, a == c, b == c) // "true false false"
d := [3]int{1, 2}
fmt.Println(a == d) // 编译错误：无法比较 [2]int == [3]int
```



## 2. 多维数组

Go语言中允许使用多维数组，因为数组属于值类型，所以多维数组的所有维度都会在创建时自动初始化零值，多维数组尤其适合管理具有父子关系或者与坐标系相关联的数据。

声明多维数组的语法如下所示：

```go
//array_name 为数组的名字，array_type 为数组的类型，size1、size2 等等为数组每一维度的长度。
var array_name [size1][size2]...[sizen] array_type
```



二维数组是最简单的多维数组，二维数组本质上是由多个一维数组组成的。

```go
// 声明一个二维整型数组，两个维度的长度分别是 4 和 2
var array [4][2]int
// 使用数组字面量来声明并初始化一个二维整型数组
array = [4][2]int{{10, 11}, {20, 21}, {30, 31}, {40, 41}}
// 声明并初始化数组中索引为 1 和 3 的元素
array = [4][2]int{1: {20, 21}, 3: {40, 41}}
// 声明并初始化数组中指定的元素
array = [4][2]int{1: {0: 20}, 3: {1: 41}}
```



取值：

1. 通过索引下标取值

	```go
	fmt.Println(array[1][0])
	```

2. 循环取值

	```go
	for index,value := range array{
			fmt.Printf("索引:%d,值：%d \n",index,value)
		}
	```


**赋值：**

```go
// 声明一个 2×2 的二维整型数组
var array [2][2]int
// 设置每个元素的整型值
array[0][0] = 10
array[0][1] = 20
array[1][0] = 30
array[1][1] = 40
```



只要类型一致，就可以将多维数组互相赋值，如下所示，多维数组的类型包括每一维度的长度以及存储在元素中数据的类型：

```go
// 声明两个二维整型数组 [2]int [2]int
var array1 [2][2]int  
var array2 [2][2]int
// 为array2的每个元素赋值
array2[0][0] = 10
array2[0][1] = 20
array2[1][0] = 30
array2[1][1] = 40
// 将 array2 的值复制给 array1
array1 = array2
```



因为数组中每个元素都是一个值，所以可以独立复制某个维度，如下所示：

```go
// 将 array1 的索引为 1 的维度复制到一个同类型的新数组里
var array3 [2]int = array1[1]
// 将数组中指定的整型值复制到新的整型变量里
var value int = array1[1][0]
```



## 3. 切片

`切片（Slice）`与数组一样，也是可以容纳若干类型相同的元素的容器。

与数组不同的是，无法通过切片类型来确定其值的长度。

每个切片值都会将数组作为其底层数据结构。

我们也把这样的数组称为`切片的底层数组`。

`切片（slice）`是对数组的一个连续片段的引用，所以切片是一个引用类型。

这个片段可以是`整个数组`，也可以是由起始和终止索引标识的一些`项的子集`，需要注意的是，`终止索引标识的项`不包括在切片内(左闭右开的区间)。

Go语言中切片的内部结构包含`地址`、`大小`和`容量`，切片一般用于快速地操作一块数据集合。

**从连续内存区域生成切片是常见的操作，格式如下：**

```go
slice [开始位置 : 结束位置]
```

语法说明如下：

- slice：表示目标切片对象；
- 开始位置：对应目标切片对象的索引；
- 结束位置：对应目标切片的结束索引。

**从数组生成切片，代码如下：**

```go
var a  = [3]int{1, 2, 3}
//a[1:2] 生成了一个新的切片
fmt.Println(a, a[1:2])
```



从数组或切片生成新的切片拥有如下特性：

- 取出的元素数量为：结束位置 - 开始位置；
- 取出元素不包含结束位置对应的索引，切片最后一个元素使用 slice[len(slice)] 获取；
- 当缺省开始位置时，表示从连续区域开头到结束位置`(a[:2])`；
- 当缺省结束位置时，表示从开始位置到整个连续区域末尾`(a[0:])`；
- 两者同时缺省时，与切片本身等效`(a[:])`；
- 两者同时为 0 时，等效于空切片，一般用于切片复位`(a[0:0])`。

**注意：超界会报运行时错误，比如数组长度为3，则结束位置最大只能为3**

> 切片在指针的基础上增加了大小，约束了切片对应的内存区域，切片使用中无法对切片内部的地址和大小进行手动调整，因此切片比指针更安全、强大。

**示例**

> 切片和数组密不可分，如果将数组理解为一栋办公楼，那么切片就是把不同的连续楼层出租给使用者，出租的过程需要选择开始楼层和结束楼层，这个过程就会生成切片

```go
var highRiseBuilding [30]int
for i := 0; i < 30; i++ {
     highRiseBuilding[i] = i + 1
}
// 区间
fmt.Println(highRiseBuilding[10:15])
// 中间到尾部的所有元素
fmt.Println(highRiseBuilding[20:])
// 开头到中间指定位置的所有元素
fmt.Println(highRiseBuilding[:2])
```



### 3.1 直接声明新的切片

除了可以从原有的数组或者切片中生成切片外，也可以`声明一个新的切片`，`每一种类型都可以拥有其切片类型`，表示多个相同类型元素的连续集合。

**切片类型声明格式如下：**

```go
//name 表示切片的变量名，Type 表示切片对应的元素类型。
var name []Type
```



```go
// 声明字符串切片
var strList []string
// 声明整型切片
var numList []int
// 声明一个空切片
var numListEmpty = []int{}
// 输出3个切片
fmt.Println(strList, numList, numListEmpty)
// 输出3个切片大小
fmt.Println(len(strList), len(numList), len(numListEmpty))
// 切片判定空的结果
fmt.Println(strList == nil)
fmt.Println(numList == nil)
fmt.Println(numListEmpty == nil)
```



**切片是动态结构，只能与 nil 判定相等，不能互相判定相等。声明新的切片后，可以使用 append() 函数向切片中添加元素。**

```go
	var strList []string
	// 追加一个元素
	strList = append(strList,"码神之路")
	fmt.Println(strList)
```



###  函数构造切片

如果需要动态地创建一个切片，可以使用 make() 内建函数，格式如下：

```go
make( []Type, size, cap )
```

`Type` 是指切片的元素类型，`size` 指的是为这个类型分配多少个元素，`cap `为预分配的元素数量，这个值设定后不影响 size，只是能提前分配空间，`降低多次分配空间造成的性能问题`。

```go
a := make([]int, 2)
b := make([]int, 2, 10)
fmt.Println(a, b)
//容量不会影响当前的元素个数，因此 a 和 b 取 len 都是 2
//但如果我们给a 追加一个 a的长度就会变为3
fmt.Println(len(a), len(b))
```



> 使用 make() 函数生成的切片一定发生了内存分配操作，但给定开始与结束位置（包括切片复位）的切片只是将新的切片结构指向已经分配好的内存区域，设定开始与结束位置，不会发生内存分配操作。

### 3.3 思考题

```go
	var numbers4 = [...]int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
	myslice := numbers4[4:6]
	//这打印出来长度为2
	fmt.Printf("myslice为 %d, 其长度为: %d\n", myslice, len(myslice))
	myslice = myslice[:cap(myslice)]
	//为什么 myslice 的长度为2，却能访问到第四个元素
	fmt.Printf("myslice的第四个元素为: %d", myslice[3])
```



## 4. 切片复制

Go语言的内置函数 copy() 可以将一个数组切片复制到另一个数组切片中，如果加入的两个数组切片不一样大，就会按照其中较小的那个数组切片的元素个数进行复制。

copy() 函数的使用格式如下：

```go
copy( destSlice, srcSlice []T) int
```

其中 `srcSlice `为数据来源切片，`destSlice `为复制的目标（也就是将 srcSlice 复制到 destSlice），`目标切片必须分配过空间且足够承载复制的元素个数`，并且来源和目标的`类型必须一致`，copy() 函数的返回值表示实际发生复制的元素个数。

下面的代码展示了使用 copy() 函数将一个切片复制到另一个切片的过程：

```go
slice1 := []int{1, 2, 3, 4, 5}
slice2 := []int{5, 4, 3}
copy(slice2, slice1) // 只会复制slice1的前3个元素到slice2中
copy(slice1, slice2) // 只会复制slice2的3个元素到slice1的前3个位置
```



**切片的引用和复制操作对切片元素的影响:**

```go
package main
import "fmt"
func main() {
    // 设置元素数量为1000
    const elementCount = 1000
    // 预分配足够多的元素切片
    srcData := make([]int, elementCount)
    // 将切片赋值
    for i := 0; i < elementCount; i++ {
        srcData[i] = i
    }
    // 引用切片数据 切片不会因为等号操作进行元素的复制
    refData := srcData
    // 预分配足够多的元素切片
    copyData := make([]int, elementCount)
    // 将数据复制到新的切片空间中
    copy(copyData, srcData)
    // 修改原始数据的第一个元素
    srcData[0] = 999
    // 打印引用切片的第一个元素 引用数据的第一个元素将会发生变化
    fmt.Println(refData[0])
    // 打印复制切片的第一个和最后一个元素 由于数据是复制的，因此不会发生变化。
    fmt.Println(copyData[0], copyData[elementCount-1])
    // 复制原始数据从4到6(不包含)
    copy(copyData, srcData[4:6])
    for i := 0; i < 5; i++ {
        fmt.Printf("%d ", copyData[i])
    }
}
```



## 5. map

map 是一种无序的`键值对`的集合。

map 最重要的一点是通过 key 来快速检索数据，key 类似于索引，指向数据的值。

map 是一种集合，所以我们可以像迭代数组和切片那样迭代它。不过，map 是无序的，我们无法决定它的返回顺序，这是因为 map 是使用 hash 表来实现的。

map 是引用类型，可以使用如下方式声明：

```go
//[keytype] 和 valuetype 之间允许有空格。
var mapname map[keytype]valuetype
```



其中：

- mapname 为 map 的变量名。
- keytype 为键类型。
- valuetype 是键对应的值类型。

> 在声明的时候不需要知道 map 的长度，因为 map 是可以动态增长的，未初始化的 map 的值是 nil，使用函数 len() 可以获取 map 中 键值对的数目。

```go
package main
import "fmt"
func main() {
    var mapLit map[string]int
    var mapAssigned map[string]int
    mapLit = map[string]int{"one": 1, "two": 2}
    mapAssigned = mapLit
    //mapAssigned 是 mapList 的引用，对 mapAssigned 的修改也会影响到 mapList 的值。
    mapAssigned["two"] = 3
    fmt.Printf("Map literal at \"one\" is: %d\n", mapLit["one"])
    fmt.Printf("Map assigned at \"two\" is: %d\n", mapLit["two"])
    fmt.Printf("Map literal at \"ten\" is: %d\n", mapLit["ten"])
}
```



**map的另外一种创建方式：**

```go
make(map[keytype]valuetype)
```

**切记不要使用new创建map，否则会得到一个空引用的指针**

map 可以根据新增的 key-value 动态的伸缩，因此它不存在固定长度或者最大限制，但是也可以选择标明 map 的初始容量 capacity，格式如下：

```go
make(map[keytype]valuetype, cap)
```

例如：

```go
map2 := make(map[string]int, 100)
```

```
当 map 增长到容量上限的时候，如果再增加新的 key-value，map 的大小会自动加 1，所以出于性能的考虑，对于大的 map 或者会快速扩张的 map，即使只是大概知道容量，也最好先标明。
```

**既然一个 key 只能对应一个 value，而 value 又是一个原始类型，那么如果一个 key 要对应多个值怎么办？**

答案是：使用`切片`

例如，当我们要处理 unix 机器上的所有进程，以父进程（pid 为整形）作为 key，所有的子进程（以所有子进程的 pid 组成的切片）作为 value。

通过将 value 定义为 []int 类型或者其他类型的切片，就可以优雅的解决这个问题，示例代码如下所示：

```go
mp1 := make(map[int][]int)
mp2 := make(map[int]*[]int)
```



### 5.1 遍历map

map 的遍历过程使用 for range 循环完成，代码如下：

```go
scene := make(map[string]int)
scene["cat"] = 66
scene["dog"] = 4
scene["pig"] = 960
for k, v := range scene {
    fmt.Println(k, v)
}
```



**注意：map是无序的，不要期望 map 在遍历时返回某种期望顺序的结果**

### 5.2 删除

使用 delete() 内建函数从 map 中删除一组键值对，delete() 函数的格式如下：

```go
delete(map, 键)
```

map 为要删除的 map 实例，键为要删除的 map 中键值对的键。

```go
scene := make(map[string]int)
// 准备map数据
scene["cat"] = 66
scene["dog"] = 4
scene["pig"] = 960
delete(scene, "dog")
for k, v := range scene {
    fmt.Println(k, v)
}
```



**Go语言中并没有为 map 提供任何清空所有元素的函数、方法，清空 map 的唯一办法就是重新 make 一个新的 map，不用担心垃圾回收的效率，Go语言中的并行垃圾回收效率比写一个清空函数要高效的多。**

**注意map 在并发情况下，只读是线程安全的，同时读写是线程不安全的。**

### 5.3 线程安全的map

并发情况下读写 map 时会出现问题，代码如下：

```go
// 创建一个int到int的映射
m := make(map[int]int)
// 开启一段并发代码
go func() {
    // 不停地对map进行写入
    for {
        m[1] = 1
    }
}()
// 开启一段并发代码
go func() {
    // 不停地对map进行读取
    for {
        _ = m[1]
    }
}()
// 无限循环, 让并发程序在后台执行
for {
}
```



运行代码会报错，输出如下：

```
fatal error: concurrent map read and map write
```

错误信息显示，并发的 map 读和 map 写，也就是说使用了两个并发函数不断地对 map 进行读和写而发生了竞态问题，map 内部会对这种并发操作进行检查并提前发现。

需要并发读写时，一般的做法是加锁，但这样性能并不高，Go语言在 1.9 版本中提供了一种效率较高的并发安全的 `sync.Map`，sync.Map 和 map 不同，不是以语言原生形态提供，而是在 sync 包下的特殊结构。

sync.Map 有以下特性：

- 无须初始化，直接声明即可。
- sync.Map 不能使用 map 的方式进行取值和设置等操作，而是使用 sync.Map 的方法进行调用，Store 表示存储，Load 表示获取，Delete 表示删除。
- 使用 Range 配合一个回调函数进行遍历操作，通过回调函数返回内部遍历出来的值，Range 参数中回调函数的返回值在需要继续迭代遍历时，返回 true，终止迭代遍历时，返回 false。

```go
package main
import (
      "fmt"
      "sync"
)
func main() {
    //sync.Map 不能使用 make 创建
    var scene sync.Map
    // 将键值对保存到sync.Map
    //sync.Map 将键和值以 interface{} 类型进行保存。
    scene.Store("greece", 97)
    scene.Store("london", 100)
    scene.Store("egypt", 200)
    // 从sync.Map中根据键取值
    fmt.Println(scene.Load("london"))
    // 根据键删除对应的键值对
    scene.Delete("london")
    // 遍历所有sync.Map中的键值对
    //遍历需要提供一个匿名函数，参数为 k、v，类型为 interface{}，每次 Range() 在遍历一个元素时，都会调用这个匿名函数把结果返回。
    scene.Range(func(k, v interface{}) bool {
        fmt.Println("iterate:", k, v)
        return true
    })
}
```



**sync.Map 为了保证并发安全有一些性能损失，因此在非并发情况下，使用 map 相比使用 sync.Map 会有更好的性能。**

## 6. nil

在Go语言中，布尔类型的零值（初始值）为 false，数值类型的零值为 0，字符串类型的零值为空字符串`""`，而指针、切片、映射、通道、函数和接口的零值则是 nil。

nil和其他语言的null是不同的。

**nil 标识符是不能比较的**

```go
package main
import (
    "fmt"
)
func main() {
    //invalid operation: nil == nil (operator == not defined on nil)
    fmt.Println(nil==nil)
}
```



**nil 不是关键字或保留字**

nil 并不是Go语言的关键字或者保留字，也就是说我们可以定义一个名称为 nil 的变量，比如下面这样：

```go
//但不提倡这样做
var nil = errors.New("my god")
```



**nil 没有默认类型**

```go
package main
import (
    "fmt"
)
func main() {
    //error :use of untyped nil
    fmt.Printf("%T", nil)
    print(nil)
}
```



**不同类型 nil 的指针是一样的**

```go
package main
import (
    "fmt"
)
func main() {
    var arr []int
    var num *int
    fmt.Printf("%p\n", arr)
    fmt.Printf("%p", num)
}
```



**nil 是 map、slice、pointer、channel、func、interface 的零值**

```go
package main
import (
    "fmt"
)
func main() {
    var m map[int]string
    var ptr *int
    var c chan int
    var sl []int
    var f func()
    var i interface{}
    fmt.Printf("%##v\n", m)
    fmt.Printf("%##v\n", ptr)
    fmt.Printf("%##v\n", c)
    fmt.Printf("%##v\n", sl)
    fmt.Printf("%##v\n", f)
    fmt.Printf("%##v\n", i)
}
```



**零值是Go语言中变量在声明之后但是未初始化被赋予的该类型的一个默认值。**

**不同类型的 nil 值占用的内存大小可能是不一样的**

```go
package main
import (
    "fmt"
    "unsafe"
)
func main() {
    var p *struct{}
    fmt.Println( unsafe.Sizeof( p ) ) // 8
    var s []int
    fmt.Println( unsafe.Sizeof( s ) ) // 24
    var m map[int]bool
    fmt.Println( unsafe.Sizeof( m ) ) // 8
    var c chan string
    fmt.Println( unsafe.Sizeof( c ) ) // 8
    var f func()
    fmt.Println( unsafe.Sizeof( f ) ) // 8
    var i interface{}
    fmt.Println( unsafe.Sizeof( i ) ) // 16
}
```



**具体的大小取决于编译器和架构**

## 7. new和make

make 关键字的主要作用是创建 slice、map 和 Channel 等内置的数据结构，而 new 的主要作用是为类型申请一片内存空间，并返回指向这片内存的指针。

1. make 分配空间后，会进行初始化，new分配的空间被清零
2. new 分配返回的是指针，即类型 *Type。make 返回引用，即 Type；
3. new 可以分配任意类型的数据；

# 流程控制

```go
    // 条件不满足 执行
}
```



```go
	x := 5
	if x <= 0 {
		fmt.Println("为真进入这里")
        //go语言格式要求很严，else必须写在}后面
    }else{
        fmt.Println("为假进入这里")
    }
```



如果存在第三个分支，则可以使用下面这种三个独立分支的形式：

```go
if condition1 {
    // condition1 满足 执行
} else if condition2 {
    // condition1 不满足 condition2满足 执行
}else {
    // condition1和condition2都不满足 执行
}
```



> else if 分支的数量是没有限制的，但是为了代码的可读性，还是不要在 if 后面加入太多的 else if 结构

**if语句可以嵌套：**

```go
/* 定义局部变量 */
   var a int = 100
   var b int = 200
   /* 判断条件 */
   if a == 100 {
       /* if 条件语句为 true 执行 */
       if b == 200 {
          /* if 条件语句为 true 执行 */
          fmt.Printf("a 的值为 100 ， b 的值为 200\n" )
       }
   }
```



### 1.1 特殊写法

if 还有一种特殊的写法，可以在 if 表达式之前添加一个执行语句，再根据变量值进行判断，代码如下：

```go
if a := 10; a >5 {
    fmt.Println(a)
    return
}
```



这种写法可以将返回值与判断放在一行进行处理，而且返回值的作用范围被限制在 if、else 语句组合中。

> 在编程中，变量的作用范围越小，所造成的问题可能性越小，每一个变量代表一个状态，有状态的地方，状态就会被修改，函数的局部变量只会影响一个函数的执行，但全局变量可能会影响所有代码的执行状态，因此限制变量的作用范围对代码的稳定性有很大的帮助。

## 2. for

> go语言中的循环语句只支持 for 关键字，这个其他语言是不同的。

```go
sum := 0
//i := 0; 赋初值，i<10 循环条件 如果为真就继续执行 ；i++ 后置执行 执行后继续循环
for i := 0; i < 10; i++ {
    sum += i
}
```



第二种写法：

```go
sum := 0
for {
    sum++
    if sum > 100 {
        //break是跳出循环
        break
    }
}
```



**上述的代码，如果没有break跳出循环，那么其将无限循环**

第三种写法：

```go
n := 10
for n>0 {
    n--
    fmt.Println(n)
}
```



我们来看下面一种写法：

```go
step := 2
//初值可以省略，但是;必须有，但是这样写step的作用域就比较大了，脱离了for循环
for ; step > 0; step-- {
    fmt.Println(step)
}
```



进一步简化代码，将 if 判断整合到 for 中，变为下面的代码：

```go
step := 2
for step > 0 {
    step--
    fmt.Println(step)
}
```



**结束循环的方式：**

1. return

	```go
	step := 2
	for step > 0 {
	    step--
	    fmt.Println(step)
	    //执行一次就结束了
	    return
	}
	//不会执行
	fmt.Println("结束之后的语句....")
	```



2. break

	```go
	step := 2
	for step > 0 {
	    step--
	    fmt.Println(step)
	    //跳出循环,还会继续执行循环外的语句
	    break
	}
	//会执行
	fmt.Println("结束之后的语句....")
	```

3. painc

	```go
	step := 2
	for step > 0 {
			step--
			fmt.Println(step)
			//报错了，直接结束
			panic("出错了")
		}
		//不会执行
		fmt.Println("结束之后的语句....")		
	```

4. goto

	```go
	package main
	import "fmt"
	func main() {
	    for x := 0; x < 10; x++ {
	        for y := 0; y < 10; y++ {
	            if y == 2 {
	                // 跳转到标签
	                goto breakHere
	            }
	        }
	    }
	    // 手动返回, 避免执行进入标签
	    return
	    // 标签
	breakHere:
	    fmt.Println("done")
	}
	```


### 2.1 代码优化

```go
package main

func length(s string) int {
	println("call length.")
	return len(s)
}

func main() {
	s := "abcd"
    // 这样写会多次调佣length函数
	for i:= 0; i < length(s); i++ {     
		println(i, s[i])
	}
}
```



优化：

```go
package main

func length(s string) int {
	println("call length.")
	return len(s)
}

func main() {
	s := "abcd"
    // 这样写会多次调佣length函数
	for i,n:= 0,length(s); i <n; i++ {     
		println(i, s[i])
	}
}
```



### 2.2 案例

> 输出九九乘法表

```go
package main
import "fmt"
func main() {
    // 遍历, 决定处理第几行
    for y := 1; y <= 9; y++ {
        // 遍历, 决定这一行有多少列
        for x := 1; x <= y; x++ {
            fmt.Printf("%d*%d=%d ", x, y, x*y)
        }
        // 手动生成回车
        fmt.Println()
    }
}
```



## 3. for range

> for range 结构是Go语言特有的一种的迭代结构，for range 可以遍历数组、切片、字符串、map 及管道（channel）

```go
for key, val := range coll {
    ...
}
```



**`val `始终为集合中对应索引的`值拷贝`，因此它一般只具有只读性质，对它所做的任何修改都不会影响到集合中原有的值**

遍历map:

```go
m := map[string]int{
    "hello": 100,
    "world": 200,
}
for key, value := range m {
    fmt.Println(key, value)
}
```



字符串也可以使用for range:

```go
	str := "码神之路"
	//因为一个字符串是 Unicode 编码的字符（或称之为 rune ）集合
	//char 实际类型是 rune 类型
	for pos, char := range str {
		fmt.Println(pos,char)
	}
```



每个 rune 字符和索引在 for range 循环中是一一对应的，它能够自动根据 UTF-8 规则识别 Unicode 编码的字符。

通过 for range 遍历的返回值有一定的规律：

- 数组、切片、字符串返回索引和值。
- map 返回键和值。
- channel只返回管道内的值。

## 4. switch

> switch 语句用于基于不同条件执行不同动作，每一个 case 分支都是唯一的，从上至下逐一测试，直到匹配为止。
>
> switch 分支表达式可以是任意类型，不限于常量。可省略 break，默认自动终止。

switch 语句的语法如下：

```go
switch var1 {
    case val1:
        ...
    case val2:
        ...
    default:
        ...
}
```



`变量 var1` 可以是任何类型，而 val1 和 val2 则可以是`同类型的任意值`。

类型不被局限于常量或整数，但必须是相同的类型；或者最终结果为相同类型的表达式。

您可以同时测试多个可能符合条件的值，使用逗号分割它们，例如：case val1, val2, val3。

```go
/* 定义局部变量 */
	var grade string = "B"
	var score int = 90

	switch score {
		case 90: grade = "A"
		case 80: grade = "B"
		case 50,60,70 : grade = "C"
		default: grade = "D"
	}
	//swtich后面如果没有条件表达式，则会对true进行匹配
	//swtich后面如果没有条件表达式，则会对true进行匹配
	switch {
		case grade == "A" :
			fmt.Printf("优秀!\n" )
		case grade == "B", grade == "C" :
			fmt.Printf("良好\n" )
		case grade == "D" :
			fmt.Printf("及格\n" )
		case grade == "F":
			fmt.Printf("不及格\n" )
		default:
			fmt.Printf("差\n" )
	}
	fmt.Printf("你的等级是 %s\n", grade )
```



> Go里面switch默认相当于每个case最后带有break，匹配成功后不会自动向下执行其他case，而是跳出整个switch, 那么如何做到执行完一个case之后，进入下一个case而不是跳出swtich呢？

答案是：`fallthrough`

```go
var s = "hello"
switch {
case s == "hello":
    fmt.Println("hello")
    fallthrough
case s != "world":
    fmt.Println("world")
}
```



注意事项：

1. 加了fallthrough后，会直接运行【紧跟的后一个】case或default语句，不论条件是否满足都会执行

	```go
	var s = "hello"
	switch {
	case s == "hello":
	    fmt.Println("hello")
	    fallthrough
	case s == "world":
	    fmt.Println("world")
	}
	```



## 5. goto

> goto 语句通过标签进行代码间的无条件跳转，同时 goto 语句在快速跳出循环、避免重复退出上也有一定的帮助，使用 goto 语句能简化一些代码的实现过程。

**使用 goto 退出多层循环**

传统写法：

```go
package main
import "fmt"
func main() {
    var breakAgain bool
    // 外循环
    for x := 0; x < 10; x++ {
        // 内循环
        for y := 0; y < 10; y++ {
            // 满足某个条件时, 退出循环
            if y == 2 {
                // 设置退出标记
                breakAgain = true
                // 退出本次循环
                break
            }
        }
        // 根据标记, 还需要退出一次循环
        if breakAgain {
                break
        }
    }
    fmt.Println("done")
}
```



使用goto的写法：

```go
package main
import "fmt"
func main() {
    for x := 0; x < 10; x++ {
        for y := 0; y < 10; y++ {
            if y == 2 {
                // 跳转到标签
                goto breakHere
            }
        }
    }
    // 手动返回, 避免执行进入标签
    return
    // 标签
breakHere:
    fmt.Println("done")
}
```



使用 goto 语句后，无须额外的变量就可以快速退出所有的循环

**使用 goto 集中处理错误**

多处错误处理 `存在代码重复` 例如：

```go
package main

import (
	"errors"
	"fmt"
	"os"
)


func main() {
	err := firstCheckError()
	if err != nil {
		fmt.Println(err)
		exitProcess()
	}
	err = secondCheckError()
	if err != nil {
		fmt.Println(err)
		exitProcess()
	}
	fmt.Println("done")
}

func secondCheckError() interface{} {
	return errors.New("错误2")
}

func exitProcess() {
	//退出
	os.Exit(1)
}

func firstCheckError() interface{} {
	return errors.New("错误1")
}
```



使用goto：

```go
package main

import (
	"errors"
	"fmt"
	"os"
)


func main() {
	err := firstCheckError()
	if err != nil {
		fmt.Println(err)
		goto onExit
	}
	err = secondCheckError()
	if err != nil {
		fmt.Println(err)
		goto onExit
	}
	fmt.Println("done")
	return
	onExit:
		exitProcess()
}

func secondCheckError() interface{} {
	return errors.New("错误2")
}

func exitProcess() {
	fmt.Println("exit")
	//退出
	os.Exit(1)
}

func firstCheckError() interface{} {
	return errors.New("错误1")
}
```



## 6. break

> break 语句可以结束 for、switch 和 select 的代码块，另外 break 语句还可以在语句后面添加`标签`，表示退出某个标签对应的代码块，`标签`要求必须定义在对应的 `for`、`switch` 和 `select `的代码块上。

```go
package main
import "fmt"
func main() {
OuterLoop:
    for i := 0; i < 2; i++ {
        for j := 0; j < 5; j++ {
            switch j {
            case 2:
                fmt.Println(i, j)
                break OuterLoop
            case 3:
                fmt.Println(i, j)
                break OuterLoop
            }
        }
    }
}
```



## 7. continue

> continue 语句可以结束当前循环，开始下一次的循环迭代过程，仅限在 for 循环内使用，在 continue 语句后添加`标签`时，表示开始`标签对应的循环`

```go
package main
import "fmt"
func main() {
OuterLoop:
    for i := 0; i < 2; i++ {
        for j := 0; j < 5; j++ {
            switch j {
            case 2:
                fmt.Println(i, j)
                continue OuterLoop
            }
        }
    }
}
```

# 函数

## 1. 函数

函数是组织好的、可重复使用的、用来实现单一或相关联功能的代码段，其可以提高应用的模块性和代码的重复利用率。

Go 语言支持普通函数、匿名函数和闭包，从设计上对函数进行了优化和改进，让函数使用起来更加方便。

Go 语言的函数属于“一等公民”（first-class），也就是说：

- 函数本身可以作为值进行传递。
- 支持匿名函数和闭包（closure）。
- 函数可以满足接口。

**函数定义:**

```go
func function_name( [parameter list] ) [return_types] {
   函数体
}
```



- func：函数由 func 开始声明
- function_name：函数名称，函数名和参数列表一起构成了函数签名。
- parameter list：参数列表，参数就像一个占位符，当函数被调用时，你可以将值传递给参数，这个值被称为`实际参数`。参数列表指定的是参数类型、顺序、及参数个数。参数是可选的，也就是说函数也可以不包含参数。
- return_types：`返回类型，函数返回一列值`。return_types 是该列值的数据类型。有些功能不需要返回值，这种情况下 return_types 不是必须的。
- 函数体：函数定义的代码集合。

示例：

```go
package main

import "fmt"

func main() {
	fmt.Println(max(1, 10))
	fmt.Println(max(-1, -2))
}
//类型相同的相邻参数，参数类型可合并。
func max(n1, n2 int) int {
	if n1 > n2 {
		return n1
	}
	return n2
}
```



**Go语言是编译型语言，所以函数编写的顺序是无关紧要的，鉴于可读性的需求，最好把 main() 函数写在文件的前面，其他函数按照一定逻辑顺序进行编写（例如函数被调用的顺序）。**

**返回值可以为多个：**

```go
func test(x, y int, s string) (int, string) {
    // 类型相同的相邻参数，参数类型可合并。 多返回值必须用括号。
    n := x + y          
    return n, fmt.Sprintf(s, n)
}
```



### 1.1 函数做为参数

> 函数做为一等公民，可以做为参数传递。

```go
func test(fn func() int) int {
    return fn()
}
func fn()  int{
	return 200
}
func main() {
    //这是直接使用匿名函数
    s1 := test(func() int { return 100 }) 
    //这是传入一个函数
    s1 := test(fn)
	fmt.Println(s1)
}
```



**在将函数做为参数的时候，我们可以使用类型定义，将函数定义为类型，这样便于阅读**

```go
// 定义函数类型。
type FormatFunc func(s string, x, y int) string

func format(fn FormatFunc, s string, x, y int) string {
	return fn(s, x, y)
}
func formatFun(s string,x,y int) string  {
	return fmt.Sprintf(s,x,y)
}
func main() {
    s2 := format(formatFun,"%d, %d",10,20)
	fmt.Println(s2)
}
```



有返回值的函数，必须有明确的终止语句，否则会引发编译错误。

### 1.2 函数返回值

> 函数返回值可以有多个，同时Go支持对返回值命名

```go
//多个返回值 用括号扩起来
func sum(a,b int) (int,int)  {
	return a,b
}
func main(){
    a,b := sum(2,3)
	fmt.Println(a,b)
}
```



```go
package main

import "fmt"
//支持返回值 命名 ，默认值为类型零值,命名返回参数可看做与形参类似的局部变量,由return隐式返回
func f1() (names []string, m map[string]int, num int) {
   m = make(map[string]int)
   m["k1"] = 2

   return
}

func main() {
   a, b, c := f1()
   fmt.Println(a, b, c)
}
```



### 1.3 参数

> 函数定义时指出，函数定义时有参数，该变量可称为函数的形参。
>
> 形参就像定义在函数体内的局部变量。

但当`调用函数`，传递过来的变量就是函数的`实参`，函数可以通过两种方式来传递参数：

1. 值传递：指在调用函数时将实际参数复制一份传递到函数中，这样在函数中如果对参数进行修改，将不会影响到实际参数。

	```go
	func swap(x, y int) int {
	       ... ...
	  }
	```



2. 引用传递：是指在调用函数时将实际参数的地址传递到函数中，那么在函数中对参数所进行的修改，将影响到实际参数。

	```go
	package main
	
	import (
		"fmt"
	)
	
	/* 定义相互交换值的函数 */
	func swap(x, y *int) {
		*x,*y = *y,*x
	}
	
	func main() {
		var a, b int = 1, 2
		/*
		   调用 swap() 函数
		   &a 指向 a 指针，a 变量的地址
		   &b 指向 b 指针，b 变量的地址
		*/
		swap(&a, &b)
	
		fmt.Println(a, b)
	}
	```



在默认情况下，Go 语言使用的是值传递，即在调用过程中不会影响到实际参数。

> `注意1：`无论是值传递，还是引用传递，传递给函数的都是变量的副本，不过，值传递是值的拷贝。引用传递是地址的拷贝，一般来说，地址拷贝更为高效。而值拷贝取决于拷贝的对象大小，对象越大，则性能越低。
>
> `注意2：`map、slice、chan、指针、interface默认以引用的方式传递。

**不定参数传值**

不定参数传值 就是函数的参数不是固定的，后面的类型是固定的。（可变参数）

Golang 可变参数本质上就是 slice。只能有一个，且必须是最后一个。

在参数赋值时可以不用用一个一个的赋值，可以直接传递一个数组或者切片。

格式:

```go
  func myfunc(args ...int) {    //0个或多个参数
  }

  func add(a int, args…int) int {    //1个或多个参数
  }

  func add(a int, b int, args…int) int {    //2个或多个参数
  }
```



**注意：其中args是一个slice，我们可以通过arg[index]依次访问所有参数,通过len(arg)来判断传递参数的个数.**

```go
package main

import (
    "fmt"
)

func test(s string, n ...int) string {
    var x int
    for _, i := range n {
        x += i
    }

    return fmt.Sprintf(s, x)
}

func main() {
    s := []int{1, 2, 3}
    res := test("sum: %d", s...)    // slice... 展开slice
    println(res)
}
```



## 2. 匿名函数

> 匿名函数是指不需要定义函数名的一种函数实现方式。

在Go里面，函数可以像普通变量一样被传递或使用，Go语言支持随时在代码里定义匿名函数。

匿名函数由一个不带函数名的函数声明和函数体组成。匿名函数的优越性在于可以直接使用函数内的变量，不必声明。

匿名函数的定义格式如下：

```go
func(参数列表)(返回参数列表){
    函数体
}
```



示例：

```go
package main

import (
    "fmt"
    "math"
)

func main() {
    //这里将一个函数当做一个变量一样的操作。
    getSqrt := func(a float64) float64 {
        return math.Sqrt(a)
    }
    fmt.Println(getSqrt(4))
}
```



**在定义时调用匿名函数**

匿名函数可以在声明后调用，例如：

```go
func(data int) {
    fmt.Println("hello", data)
}(100) //(100)，表示对匿名函数进行调用，传递参数为 100。
```



**匿名函数用作回调函数**

匿名函数作为回调函数的设计在Go语言也比较常见

```go
package main
import (
    "fmt"
)
// 遍历切片的每个元素, 通过给定函数进行元素访问
func visit(list []int, f func(int)) {
    for _, v := range list {
        f(v)
    }
}
func main() {
    // 使用匿名函数打印切片内容
    visit([]int{1, 2, 3, 4}, func(v int) {
        fmt.Println(v)
    })
}
```



**返回多个匿名函数**

```go
package main

import "fmt"

func FGen(x, y int) (func() int, func(int) int) {

	//求和的匿名函数
	sum := func() int {
		return x + y
	}

	// (x+y) *z 的匿名函数
	avg := func(z int) int {
		return (x + y) * z
	}
	return sum, avg
}

func main() {

	f1, f2 := FGen(1, 2)
	fmt.Println(f1())
	fmt.Println(f2(3))
}
```



## 3. 闭包

> 所谓“闭包”，指的是一个拥有许多变量和绑定了这些变量的环境的表达式（通常是一个函数），因而这些变量也是该表达式的一部分。
>
> 闭包=函数+引用环境

示例：

```go
package main
import (
	"fmt"
)
// 创建一个玩家生成器, 输入名称, 输出生成器
func playerGen(name string) func() (string, int) {
	// 血量一直为150
	hp := 150
	// 返回创建的闭包
	return func() (string, int) {
		// 将变量引用到闭包中
		return name, hp
	}
}

// 创建一个玩家生成器, 输入名称, 输出生成器
func playerGen1() func(string) (string, int) {
	// 血量一直为150
	hp := 150
	// 返回创建的闭包
	return func(name string) (string, int) {
		// 将变量引用到闭包中
		return name, hp
	}
}
func main() {
	// 创建一个玩家生成器
	generator := playerGen("码神")
	// 返回玩家的名字和血量
	name, hp := generator()
	// 打印值
	fmt.Println(name, hp)

	generator1 := playerGen1()
	name1,hp1 := generator1("码神")
	// 打印值
	fmt.Println(name1, hp1)
}
```



## 4. 延迟调用

> Go语言的 defer 语句会将其后面跟随的语句进行延迟处理

**defer特性:**

1. 关键字 defer 用于注册延迟调用。
2. 这些调用直到 return 前才被执。因此，可以用来做资源清理。
3. 多个defer语句，按先进后出的方式执行。
4. defer语句中的变量，在defer声明时就决定了。

**defer的用途：**

1. 关闭文件句柄
2. 锁资源释放
3. 数据库连接释放

**go 语言的defer功能强大，对于资源管理非常方便，但是如果没用好，也会有陷阱。**

```go
package main

import "fmt"

func main() {
	var whatever = [5]int{1,2,3,4,5}

	for i := range whatever {
		defer fmt.Println(i)
	}
}
```



看下面的示例：

```go
package main

import (
	"log"
	"time"
)

func main() {
	start := time.Now()
	log.Printf("开始时间为：%v", start)
  defer log.Printf("时间差：%v", time.Since(start))  // Now()此时已经copy进去了
    //不受这3秒睡眠的影响
	time.Sleep(3 * time.Second)

	log.Printf("函数结束")
}
```



- Go 语言中所有的`函数调用都是传值的`
- 调用 defer 关键字会`立刻拷贝函数中引用的外部参数` ，包括start 和time.Since中的Now
- defer的函数在`压栈的时候也会保存参数的值，并非在执行时取值`。

如何解决上述问题：使用defer fun()

```go
package main

import (
	"log"
	"time"
)

func main() {
	start := time.Now()
	log.Printf("开始时间为：%v", start)
	defer func() {
		log.Printf("开始调用defer")
		log.Printf("时间差：%v", time.Since(start))
		log.Printf("结束调用defer")
	}()
	time.Sleep(3 * time.Second)

	log.Printf("函数结束")
}
```



**因为拷贝的是`函数指针`,函数属于引用传递**

在来看一个问题：

```go
package main

import "fmt"

func main() {
	var whatever = [5]int{1,2,3,4,5}
	for i,_ := range whatever {
        //函数正常执行,由于闭包用到的变量 i 在执行的时候已经变成4,所以输出全都是4.
		defer func() { fmt.Println(i) }()
	}
}
```



怎么解决：

```go
package main

import "fmt"

func main() {
	var whatever = [5]int{1,2,3,4,5}
	for i,_ := range whatever {
		i := i
		defer func() { fmt.Println(i) }()
	}
}
```



## 5. 异常处理

> Go语言中使用 panic 抛出错误，recover 捕获错误。

异常的使用场景简单描述：Go中可以抛出一个panic的异常，然后在defer中通过recover捕获这个异常，然后正常处理。

**panic：**

1. 内置函数
2. 假如函数F中书写了panic语句，会终止其后要执行的代码，在panic所在函数F内如果存在要执行的defer函数列表，按照defer的逆序执行
3. 返回函数F的调用者G，在G中，调用函数F语句之后的代码不会执行，假如函数G中存在要执行的defer函数列表，按照defer的逆序执行
4. 直到goroutine整个退出，并报告错误

**recover：**

1. 内置函数
2. 用来捕获panic，从而影响应用的行为

> golang 的错误处理流程：当一个函数在执行过程中出现了异常或遇到 panic()，正常语句就会立即终止，然后执行 defer 语句，再报告异常信息，最后退出 goroutine。如果在 defer 中使用了 recover() 函数,则会捕获错误信息，使该错误信息终止报告。

**注意:**

1. 利用recover处理panic指令，defer 必须放在 panic 之前定义，另外 recover 只有在 defer 调用的函数中才有效。否则当panic时，recover无法捕获到panic，无法防止panic扩散。
2. recover 处理异常后，逻辑并不会恢复到 panic 那个点去，函数跑到 defer 之后的那个点。
3. 多个 defer 会形成 defer 栈，后定义的 defer 语句会被最先调用。

```go
package main

func main() {
    test()
}

func test() {
    defer func() {
        if err := recover(); err != nil {
            println(err.(string)) // 将 interface{} 转型为具体类型。
        }
    }()

    panic("panic error!")
}
```



由于 panic、recover 参数类型为 interface{}，因此可抛出任何类型对象。

```go
 func panic(v interface{})
 func recover() interface{}
```



**延迟调用中引发的错误，可被后续延迟调用捕获，但仅最后一个错误可被捕获:**

```go
package main

import "fmt"

func test() {
    defer func() {
        // defer panic 会打印
        fmt.Println(recover())
    }()

    defer func() {
        panic("defer panic")
    }()

    panic("test panic")
}

func main() {
    test()
}
```



**如果需要保护代码段，可将代码块重构成匿名函数，如此可确保后续代码被执 ：**

```go
package main

import "fmt"

func test(x, y int) {
    var z int

    func() {
        defer func() {
            if recover() != nil {
                z = 0
            }
        }()
        panic("test panic")
        z = x / y
        return
    }()

    fmt.Printf("x / y = %d\n", z)
}

func main() {
    test(2, 1)
}
```



**除用 panic 引发中断性错误外，还可返回 error 类型错误对象来表示函数调用状态:**

```go
type error interface {
    Error() string
}
```



标准库 `errors.New` 和 `fmt.Errorf `函数用于创建实现 error 接口的错误对象。通过判断错误对象实例来确定具体错误类型。

```go
package main

import (
    "errors"
    "fmt"
)

var ErrDivByZero = errors.New("division by zero")

func div(x, y int) (int, error) {
    if y == 0 {
        return 0, ErrDivByZero
    }
    return x / y, nil
}

func main() {
    defer func() {
        fmt.Println(recover())
    }()
    switch z, err := div(10, 0); err {
    case nil:
        println(z)
    case ErrDivByZero:
        panic(err)
    }
}
```



**Go实现类似 try catch 的异常处理:**

```go
package main

import "fmt"

func Try(fun func(), handler func(interface{})) {
    defer func() {
        if err := recover(); err != nil {
            handler(err)
        }
    }()
    fun()
}

func main() {
    Try(func() {
        panic("test panic")
    }, func(err interface{}) {
        fmt.Println(err)
    })
}
```



**如何区别使用 panic 和 error 两种方式?**

惯例是:导致关键流程出现不可修复性错误的使用 panic，其他使用 error。

## 6. defer和time

###  defer

`defer`是go语言中，一个特殊的关键字，用于`延迟调用`。

> 什么叫`延迟调用？`

让函数或方法（跟在defer后的函数，我们一般称之为延迟函数）在当前函数执行完毕后但在在`return`或者`panic之前`执行。

比如：

```go
func main() {
	x := 10
	defer func() {
		x++
        //这里打印11
		fmt.Println("我后执行：", x)
	}()
    //这里打印10
	fmt.Println("我先执行：", x)
	return
}
```



> defer有以下规则：

- 延迟函数的参数在defer语句出现时就已经确定

	```go
	func main() {
		x := 10
		defer func(x int) {
	        //打印10 因为x传参时，值为10
			fmt.Println("我后执行：", x)
		}(x)
		x++
	    fmt.Println("我先执行：", x)
		return
	}
	func deferTest() {
		var a = 1
	    //输出1
		defer fmt.Println(a)
		a = 2
		return
	}
	```

	

- 延迟函数执行按后进先出顺序执行， 即先出现的defer最后执行

	```go
	func main() {
		x := 10
		defer func(x int) {
			fmt.Println("我后执行1：", x)
		}(x)
		defer func(x int) {
	        //后进先出 这个会先于我后执行1执行
			fmt.Println("我后执行2：", x)
		}(x)
		x++
		fmt.Println("我先执行：", x)
		return
	}
	```

	

- 延迟函数可以操作主函数的具名返回值

	```go
	func main() {
	    //打印2 return i 并不是一个原子操作
	    //return会分两步 1-设值 2-return
	    //所以result为先被赋值为i=1，然后result++，最后返回 
		x := deferTest()
		fmt.Println(x)
	}
	func deferTest() (result int) {
		i := 1
		defer func() {
			result++
		}()
		return i
	}
	```

	

- 如果 defer 执行的函数为 nil, 那么会在最终调用函数的产生 panic

	```go
	var a func()
	
	func deferTest() *int {
		i := 1
		defer a()
		return &i
	}
	```

	

测试：

```go
func main() {
	x := deferTest()
	fmt.Println(x)	// 输出1
}
func deferTest() int {
	i := 1
	defer func() {
		i++
	}()
    //当返回值不是具名返回值是，此时依然会存在一个匿名的返回值，假设变量名为x
    // 则返回过程为：x=i -> i++ -> 返回x，所以返回值为1
	return i
}
```



```go
func main() {
	x := deferTest()
	fmt.Println(*x)	// 输出2
}
func deferTest() *int {
	i := 1
	defer func() {
		i++
	}()
	return &i
}
```



```go
func main() {
	x := deferTest()
	fmt.Println(*x)	// 输出2
}

func deferTest() *int {
	i := 1
	defer func(x *int) {
		*x++
	}(&i)
	return &i
}
```

> 注意: defer一定要定义在`return或panic之前`，否则会不执行。

```go
func main() {
    //defer不会执行
    //主动调用os.Exit不会执行defer
	defer func() {
		fmt.Println("defer")
	}()
    //退出进程
	os.Exit(-1)
}
```

### 2. time

在编写程序时，经常会用到时间，go语言的标准库time包提供了对时间的一系列操作。

这里我们只是简单了解一下

```go
func main() {
    //当前的时间
    t := time.Now()
    //格式化 这个是格式 2006-01-02 15:04:05
    fmt.Println(t.Format("2006-01-02 15:04:05")) //小口决，612345
}
```

秒值，毫秒值：

```go
func main() {
	//当前的时间
	t := time.Now()
	//毫秒值
	milli := t.UnixMilli()
	//秒值
	sencond := t.Unix()
	fmt.Printf("毫秒值:%d, 秒值:%d \n", milli, sencond)
}
```

时间相加相减：

```go
func main() {
	//当前的时间
	t := time.Now()
	fmt.Println(t.Format("2006-01-02 15:04:05"))
	after20s := t.Add(20 * time.Second)
	fmt.Println(after20s.Format("2006-01-02 15:04:05"))
	sub := after20s.Sub(t)
	fmt.Printf("相减时间:%v \n", sub)
}
```

休眠：

```go
func main() {
    //阻塞当前的go程x时间，x<=0时立即 释放
	time.Sleep(2 * time.Second)
	fmt.Println("等2秒打印出来")
}
```

经过一段时间后返回：

```go
func main() {
	ch := make(chan struct{})
	go wait(ch)
	select {
	case <-ch:
		fmt.Println("wait执行成功")
	case <-time.After(2 * time.Second):
		fmt.Println("wait等待时间已经超过2秒，超时了")
	}
}

func wait(ch chan struct{}) {
	time.Sleep(3 * time.Second)
	ch <- struct{}{}
}
```

# 结构体

##  1. 结构体

> Go语言可以通过自定义的方式形成新的类型，结构体就是这些类型中的一种复合类型，结构体是由零个或多个任意类型的值聚合成的实体，每个值都可以称为结构体的成员。

结构体成员也可以称为“字段”，这些字段有以下特性：

- 字段拥有自己的类型和值；
- 字段名必须唯一；
- 字段的类型也可以是结构体，甚至是字段所在结构体的类型。

使用关键字 **type** 可以将各种基本类型定义为自定义类型，基本类型包括整型、字符串、布尔等。结构体是一种复合的基本类型，通过 type 定义为自定义类型后，使结构体更便于使用。

结构体的定义格式如下：

```go
type 类型名 struct {
    字段1 字段1类型
    字段2 字段2类型
    …
}
```



- 类型名：标识自定义结构体的名称，在同一个包内不能重复。
- struct{}：表示结构体类型，`type 类型名 struct{}`可以理解为将 struct{} 结构体定义为类型名的类型。
- 字段1、字段2……：表示结构体字段名，结构体中的字段名必须唯一。
- 字段1类型、字段2类型……：表示结构体各个字段的类型。

示例：

```go
type Point struct {
    X int
    Y int
}
```



颜色的红、绿、蓝 3 个分量可以使用 byte 类型:

```go
type Color struct {
    R, G, B byte
}
```



**结构体的定义只是一种内存布局的描述，只有当结构体实例化时，才会真正地分配内存**

### 1.1 实例化

实例化就是根据结构体定义的格式创建一份与格式一致的内存区域，结构体实例与实例间的内存是完全独立的。

**基本的实例化形式:**

结构体本身是一种类型，可以像整型、字符串等类型一样，以 var 的方式声明结构体即可完成实例化。

```go
var ins T
```

`T `为结构体类型，`ins `为结构体的实例。

```go
package main

import "fmt"

type Point struct {
	X int
	Y int
}
func main() {
    //使用.来访问结构体的成员变量,结构体成员变量的赋值方法与普通变量一致。
	var p Point
	p.X = 1
	p.Y = 2
	fmt.Printf("%v,x=%d,y=%d",p,p.X,p.Y )
}
```



```go
package main

import "fmt"

type Point struct {
	X int
	Y int
}
func main() {

	var p Point
	//p.X = 1
	//p.Y = 2
    //如果不赋值 结构体中的变量会使用零值初始化
	fmt.Printf("%v,x=%d,y=%d",p,p.X,p.Y )
}
```



```go
package main

import "fmt"

type Point struct {
	X int
	Y int
}
func main() {
	//可以使用
	var p = Point{
		X: 1,
		Y: 2,
	}
    var p = Point{
		1,
		2,
	}
	fmt.Printf("%v,x=%d,y=%d",p,p.X,p.Y )
}
```



**创建指针类型的结构体：**

Go语言中，还可以使用 new 关键字对类型（包括结构体、整型、浮点数、字符串等）进行实例化，结构体在实例化后会形成指针类型的结构体。

```go
ins := new(T)
```

- T 为类型，可以是结构体、整型、字符串等。
- ins：T 类型被实例化后保存到 ins 变量中，ins 的类型为 *T，属于指针。

下面的例子定义了一个玩家（Player）的结构，玩家拥有名字、生命值和魔法值：

```go
type Player struct{
    Name string
    HealthPoint int
    MagicPoint int
}
tank := new(Player)
tank.Name = "码神"
tank.HealthPoint = 300
```



**new 实例化的结构体实例在成员赋值上与基本实例化的写法一致。**

**取结构体的地址实例化:**

在Go语言中，对结构体进行`&`取地址操作时，视为对该类型进行一次 new 的实例化操作，取地址格式如下：

```go
ins := &T{}
```

其中：

- T 表示结构体类型。
- ins 为结构体的实例，类型为 *T，是指针类型。

示例：

```go
package main

import "fmt"

type Command struct {
	Name    string    // 指令名称
	Var     *int      // 指令绑定的变量
	Comment string    // 指令的注释
}

func newCommand(name string, varRef *int, comment string) *Command {
	return &Command{
		Name:    name,
		Var:     varRef,
		Comment: comment,
	}
}

var version = 1
func main() {
	cmd := newCommand(
		"version",
		&version,
		"show version",
	)
	fmt.Println(cmd)
}
```



### 1.2 匿名结构体

匿名结构体没有类型名称，无须通过 type 关键字定义就可以直接使用。

```go
ins := struct {
    // 匿名结构体字段定义
    字段1 字段类型1
    字段2 字段类型2
    …
}{
    // 字段值初始化
    初始化字段1: 字段1的值,
    初始化字段2: 字段2的值,
    …
}
```



- 字段1、字段2……：结构体定义的字段名。
- 初始化字段1、初始化字段2……：结构体初始化时的字段名，可选择性地对字段初始化。
- 字段类型1、字段类型2……：结构体定义字段的类型。
- 字段1的值、字段2的值……：结构体初始化字段的初始值。

```go
package main
import (
	"fmt"
)
// 打印消息类型, 传入匿名结构体
func printMsgType(msg *struct {
	id   int
	data string
}) {
	// 使用动词%T打印msg的类型
	fmt.Printf("%T\n, msg:%v", msg,msg)
}
func main() {
	// 实例化一个匿名结构体
	msg := &struct {  // 定义部分
		id   int
		data string
	}{  // 值初始化部分
		1024,
		"hello",
	}
	printMsgType(msg)
}
```



## 2. 方法

在Go语言中，结构体就像是类的一种`简化形式`，那么类的方法在哪里呢？

在Go语言中有一个概念，它和方法有着同样的名字，并且大体上意思相同，Go 方法是作用在接收器（receiver）上的一个函数，接收器是某种类型的变量，因此方法是一种特殊类型的函数。

接收器类型可以是（几乎）任何类型，不仅仅是结构体类型，任何类型都可以有方法，甚至可以是函数类型，可以是 int、bool、string 或数组的别名类型，但是接收器不能是一个接口类型，因为接口是一个抽象定义，而方法却是具体实现，如果这样做了就会引发一个编译错误`invalid receiver type…`

接收器也不能是一个指针类型，但是它可以是任何其他允许类型的指针。

**一个类型加上它的方法等价于面向对象中的一个类**

在Go语言中，类型的`代码`和绑定在它上面的`方法`的代码可以`不放置在一起`，它们可以存在不同的源文件中，唯一的要求是它们必须是`同一个包的`。

> 类型 T（或 T）上的所有方法的集合叫做类型 T（或 T）的方法集。

在面向对象的语言中，类拥有的方法一般被理解为类可以做的事情。在Go语言中“方法”的概念与其他语言一致，只是Go语言建立的“接收器”强调方法的作用对象是接收器，也就是类实例，而函数没有作用对象。

**为结构体添加方法：**

> 需求：将物品放入背包

面向对象的写法：

 将背包做为一个对象，将物品放入背包的过程作为“方法”

```go
package main

import "fmt"

type Bag struct {
	items []int
}
func (b *Bag) Insert(itemid int) {
	b.items = append(b.items, itemid)
}
func main() {
	b := new(Bag)
	b.Insert(1001)
	fmt.Println(b.items)
}
```



**(b\*Bag) 表示接收器，即 Insert 作用的对象实例。每个方法只能有一个接收器**

### 2.1 接收器

接收器的格式如下：

```go
func (接收器变量 接收器类型) 方法名(参数列表) (返回参数) {
    函数体
}
```



- 接收器变量：接收器中的参数变量名在命名时，官方建议使用接收器类型名的第一个小写字母，而不是 self、this 之类的命名。例如，Socket 类型的接收器变量应该命名为 s，Connector 类型的接收器变量应该命名为 c 等。
- 接收器类型：接收器类型和参数类似，可以是指针类型和非指针类型。
- 方法名、参数列表、返回参数：格式与函数定义一致。

接收器根据接收器的类型可以分为`指针接收器`、`非指针接收器`，两种接收器在使用时会产生不同的效果，根据效果的不同，两种接收器会被用于不同性能和功能要求的代码中。

**指针类型的接收器:**

指针类型的接收器由一个结构体的指针组成，更接近于面向对象中的 this 或者 self。

由于指针的特性，调用方法时，`修改接收器指针的任意成员变量，在方法结束后，修改都是有效的`。

示例：

使用结构体定义一个属性（Property），为属性添加 SetValue() 方法以封装设置属性的过程，通过属性的 Value() 方法可以重新获得属性的数值，使用属性时，通过 SetValue() 方法的调用，可以达成修改属性值的效果：

```go
package main
import "fmt"
// 定义属性结构
type Property struct {
    value int  // 属性值
}
// 设置属性值
func (p *Property) SetValue(v int) {
    // 修改p的成员变量
    p.value = v
}
// 取属性值
func (p *Property) Value() int {
    return p.value
}
func main() {
    // 实例化属性
    p := new(Property)
    // 设置值
    p.SetValue(100)
    // 打印值
    fmt.Println(p.Value())
}
```



**非指针类型的接收器:**

当方法作用于非指针接收器时，Go语言会在代码运行时将接收器的值复制一份，在非指针接收器的方法中可以获取接收器的成员值，但`修改后无效`。

点（Point）使用结构体描述时，为点添加 Add() 方法，这个方法不能修改 Point 的成员 X、Y 变量，而是在计算后返回新的 Point 对象，Point 属于小内存对象，在函数返回值的复制过程中可以极大地提高代码运行效率:

```go
package main
import (
    "fmt"
)
// 定义点结构
type Point struct {
    X int
    Y int
}
// 非指针接收器的加方法
func (p Point) Add(other Point) Point {
    // 成员值与参数相加后返回新的结构
    return Point{p.X + other.X, p.Y + other.Y}
}
func main() {
    // 初始化点
    p1 := Point{1, 1}
    p2 := Point{2, 2}
    // 与另外一个点相加
    result := p1.Add(p2)
    // 输出结果
    fmt.Println(result)
}
```



**在计算机中，小对象由于值复制时的速度较快，所以适合使用非指针接收器，大对象因为复制性能较低，适合使用指针接收器，在接收器和参数间传递时不进行复制，只是传递指针。**

## 3. 二维矢量模拟玩家移动

在游戏中，一般使用二维矢量保存玩家的位置，使用矢量运算可以计算出玩家移动的位置，本例子中，首先实现二维矢量对象，接着构造玩家对象，最后使用矢量对象和玩家对象共同模拟玩家移动的过程。

**实现二维矢量结构:**

矢量是数学中的概念，二维矢量拥有两个方向的信息，同时可以进行加、减、乘（缩放）、距离、单位化等计算，在计算机中，使用拥有 X 和 Y 两个分量的 Vec2 结构体实现数学中二维向量的概念。

```go
package main
import "math"
type Vec2 struct {
    X, Y float32
}
// 加
func (v Vec2) Add(other Vec2) Vec2 {
    return Vec2{
        v.X + other.X,
        v.Y + other.Y,
    }
}
// 减
func (v Vec2) Sub(other Vec2) Vec2 {
    return Vec2{
        v.X - other.X,
        v.Y - other.Y,
    }
}
// 乘 缩放或者叫矢量乘法，是对矢量的每个分量乘上缩放比，Scale() 方法传入一个参数同时乘两个分量，表示这个缩放是一个等比缩放
func (v Vec2) Scale(s float32) Vec2 {
    return Vec2{v.X * s, v.Y * s}
}
// 距离 计算两个矢量的距离，math.Sqrt() 是开方函数，参数是 float64，在使用时需要转换，返回值也是 float64，需要转换回 float32
func (v Vec2) DistanceTo(other Vec2) float32 {
    dx := v.X - other.X
    dy := v.Y - other.Y
    return float32(math.Sqrt(float64(dx*dx + dy*dy)))
}
// 矢量单位化
func (v Vec2) Normalize() Vec2 {
    mag := v.X*v.X + v.Y*v.Y
    if mag > 0 {
        oneOverMag := 1 / float32(math.Sqrt(float64(mag)))
        return Vec2{v.X * oneOverMag, v.Y * oneOverMag}
    }
    return Vec2{0, 0}
}
```



**实现玩家对象：**

玩家对象负责存储玩家的当前位置、目标位置和速度，使用 MoveTo() 方法为玩家设定移动的目标，使用 Update() 方法更新玩家位置，在 Update() 方法中，通过一系列的矢量计算获得玩家移动后的新位置。

1. 使用矢量减法，将目标位置（targetPos）减去当前位置（currPos）即可计算出位于两个位置之间的新矢量
2. 使用 Normalize() 方法将方向矢量变为模为 1 的单位化矢量，这里需要将矢量单位化后才能进行后续计算
3. 获得方向后，将单位化方向矢量根据速度进行等比缩放，速度越快，速度数值越大，乘上方向后生成的矢量就越长（模很大）
4. 将缩放后的方向添加到当前位置后形成新的位置

```go
package main
type Player struct {
    currPos   Vec2    // 当前位置
    targetPos Vec2    // 目标位置
    speed     float32 // 移动速度
}
// 移动到某个点就是设置目标位置
//逻辑层通过这个函数告知玩家要去的目标位置，随后的移动过程由 Update() 方法负责
func (p *Player) MoveTo(v Vec2) {
    p.targetPos = v
}
// 获取当前的位置
func (p *Player) Pos() Vec2 {
    return p.currPos
}

//判断玩家是否到达目标点，玩家每次移动的半径就是速度（speed），因此，如果与目标点的距离小于速度，表示已经非常靠近目标，可以视为到达目标。
func (p *Player) IsArrived() bool {
    // 通过计算当前玩家位置与目标位置的距离不超过移动的步长，判断已经到达目标点
    return p.currPos.DistanceTo(p.targetPos) < p.speed
}
// 逻辑更新
func (p *Player) Update() {
    if !p.IsArrived() {
        // 计算出当前位置指向目标的朝向
        //数学中，两矢量相减将获得指向被减矢量的新矢量
        dir := p.targetPos.Sub(p.currPos).Normalize()
        // 添加速度矢量生成新的位置
        newPos := p.currPos.Add(dir.Scale(p.speed))
        // 移动完成后，更新当前位置
        p.currPos = newPos
    }
}
// 创建新玩家
func NewPlayer(speed float32) *Player {
    return &Player{
        speed: speed,
    }
}
```



**处理移动逻辑：**

将 Player 实例化后，设定玩家移动的最终目标点，之后开始进行移动的过程，这是一个不断更新位置的循环过程，每次检测玩家是否靠近目标点附近，如果还没有到达，则不断地更新位置，让玩家朝着目标点不停的修改当前位置，如下代码所示：

```go
package main
import "fmt"

func main() {
	// 实例化玩家对象，并设速度为0.5
	p := NewPlayer(0.5)
	// 让玩家移动到3,1点
	p.MoveTo(Vec2{3, 1})
	// 如果没有到达就一直循环
	for !p.IsArrived() {
		// 更新玩家位置
		p.Update()
		// 打印每次移动后的玩家位置
		fmt.Println(p.Pos())
	}
	fmt.Printf("到达了：%v",p.Pos())
}
```



## 4. 给任意类型添加方法

Go语言可以对任何类型添加方法，给一种类型添加方法就像给结构体添加方法一样，因为结构体也是一种类型。

**为基本类型添加方法：**

在Go语言中，使用 type 关键字可以定义出新的自定义类型，之后就可以为自定义类型添加各种方法了。我们习惯于使用面向过程的方式判断一个值是否为 0，例如：

```go
if  v == 0 {
    // v等于0
}
```



如果将 v 当做整型对象，那么判断 v 值就可以增加一个 IsZero() 方法，通过这个方法就可以判断 v 值是否为 0，例如：

```go
if  v.IsZero() {
    // v等于0
}
```



为基本类型添加方法的详细实现流程如下：

```go
package main
import (
    "fmt"
)
// 将int定义为MyInt类型
type MyInt int
// 为MyInt添加IsZero()方法
func (m MyInt) IsZero() bool {
    return m == 0
}
// 为MyInt添加Add()方法
func (m MyInt) Add(other int) int {
    return other + int(m)
}
func main() {
    var b MyInt
    fmt.Println(b.IsZero())
    b = 1
    fmt.Println(b.Add(2))
}
```



## 5. 匿名字段

结构体可以包含一个或多个匿名（或内嵌）字段，即这些字段没有显式的名字，只有字段的类型是必须的，此时类型也就是字段的名字。

匿名字段本身可以是一个结构体类型，即结构体可以包含内嵌结构体。

Go语言中的继承是通过内嵌或组合来实现的，所以可以说，在Go语言中，相比较于继承，组合更受青睐。

```go
package main

import "fmt"

type User struct {
    id   int
    name string
}

type Manager struct {
    User
}

func (self *User) ToString() string { // receiver = &(Manager.User)
    return fmt.Sprintf("User: %p, %v", self, self)
}

func main() {
    m := Manager{User{1, "Tom"}}
    fmt.Printf("Manager: %p\n", &m)
    fmt.Println(m.ToString())
}
```



类似于重写的功能：

```go
package main

import "fmt"

type User struct {
    id   int
    name string
}

type Manager struct {
    User
    title string
}

func (self *User) ToString() string {
    return fmt.Sprintf("User: %p, %v", self, self)
}

func (self *Manager) ToString() string {
    return fmt.Sprintf("Manager: %p, %v", self, self)
}

func main() {
    m := Manager{User{1, "Tom"}, "Administrator"}

    fmt.Println(m.ToString())

    fmt.Println(m.User.ToString())
}
```

# 接口/IO操作

## 1. 接口

在Go语言中接口（interface）是一种类型，一种抽象的类型。

interface是一组method的集合，接口做的事情就像是定义一个协议（规则），只要一台机器有洗衣服和甩干的功能，我就称它为洗衣机。不关心属性（数据），只关心行为（方法）。

**接口（interface）是一种类型**

接口类型是对其它类型行为的抽象和概括；因为接口类型不会和特定的实现细节绑定在一起，通过这种抽象的方式我们可以让我们的函数更加灵活和更具有适应能力。

接口是双方约定的一种合作协议。接口实现者不需要关心接口会被怎样使用，调用者也不需要关心接口的实现细节。接口是一种类型，也是一种抽象结构，不会暴露所含数据的格式、类型及结构。

### 1.1 为什么要使用接口

```go
type Cat struct{}

func (c Cat) Say() string { return "喵喵喵" }

type Dog struct{}

func (d Dog) Say() string { return "汪汪汪" }

func main() {
    c := Cat{}
    fmt.Println("猫:", c.Say())
    d := Dog{}
    fmt.Println("狗:", d.Say())
}
```



上面的代码中定义了猫和狗，然后它们都会叫，你会发现main函数中明显有重复的代码，如果我们后续再加上猪、青蛙等动物的话，我们的代码还会一直重复下去。那我们能不能把它们当成“能叫的动物”来处理呢？

像类似的例子在我们编程过程中会经常遇到：

比如一个网上商城可能使用支付宝、微信、银联等方式去在线支付，我们能不能把它们当成“支付方式”来处理呢？

比如三角形，四边形，圆形都能计算周长和面积，我们能不能把它们当成“图形”来处理呢？

比如销售、行政、程序员都能计算月薪，我们能不能把他们当成“员工”来处理呢？

Go语言中为了解决类似上面的问题，就设计了接口这个概念。接口区别于我们之前所有的具体类型，接口是一种抽象的类型。当你看到一个接口类型的值时，你不知道它是什么，唯一知道的是通过它的方法能做什么。

### 1.2 接口定义

> Go语言提倡面向接口编程。

每个接口类型由数个方法组成。接口的形式代码如下：

```go
type 接口类型名 interface{
    方法名1( 参数列表1 ) 返回值列表1
    方法名2( 参数列表2 ) 返回值列表2
    …
}
```



对各个部分的说明：

- 接口类型名：使用 type 将接口定义为自定义的类型名。Go语言的接口在命名时，一般会在单词后面添加 er，如有写操作的接口叫 Writer，有字符串功能的接口叫 Stringer，有关闭功能的接口叫 Closer 等。
- 方法名：当方法名首字母是大写时，且这个接口类型名首字母也是大写时，这个方法可以被接口所在的包（package）之外的代码访问。
- 参数列表、返回值列表：参数列表和返回值列表中的参数变量名可以被忽略

```go
type Writer interface{
    //大写字母开头 意味着别的包 也可以访问
    Write([]byte) error
}
```



### 1.3 接口实现条件

如果一个任意类型 T 的方法集为一个接口类型的方法集的超集，则我们说类型 T 实现了此接口类型。

T 可以是一个非接口类型，也可以是一个接口类型。

实现关系在Go语言中是隐式的。两个类型之间的实现关系不需要在代码中显式地表示出来。Go语言中没有类似于 implements 的关键字。 Go编译器将自动在需要的时候检查两个类型之间的实现关系。

接口定义后，需要实现接口，调用方才能正确编译通过并使用接口。

接口的实现需要遵循两条规则才能让接口可用：

1. 接口的方法与实现接口的类型方法格式一致

	> 在类型中添加与接口签名一致的方法就可以实现该方法。
	>
	> 签名包括方法中的名称、参数列表、返回参数列表。
	>
	> 也就是说，只要实现接口类型中的方法的名称、参数列表、返回参数列表中的任意一项与接口要实现的方法不一致，那么接口的这个方法就不会被实现。

	示例：

	```go
	package main
	import (
	    "fmt"
	)
	// 定义一个数据写入器
	type DataWriter interface {
	    WriteData(data interface{}) error
	}
	// 定义文件结构，用于实现DataWriter
	type file struct {
	}
	// 实现DataWriter接口的WriteData方法
	func (d *file) WriteData(data interface{}) error {
	    // 模拟写入数据
	    fmt.Println("WriteData:", data)
	    return nil
	}
	func main() {
	    // 实例化file
	    f := new(file)
	    // 声明一个DataWriter的接口
	    var writer DataWriter
	    // 将接口赋值f，也就是*file类型
	    writer = f
	    // 使用DataWriter接口进行数据写入
	    writer.WriteData("data")
	}
	```



	**当类型无法实现接口时，编译器会报错：**
	
	1. 函数名不一致导致的报错
	2. 实现接口的方法签名不一致导致的报错

2. 接口中所有方法均被实现

	当一个接口中有多个方法时，只有这些方法都被实现了，接口才能被正确编译并使用。

	```go
	// 定义一个数据写入器
	type DataWriter interface {
	    WriteData(data interface{}) error
	    // 新增一个方法 能否写入
	    CanWrite() bool
	}
	```



	在此运行上述的程序，就会报错：
	
	```go
	cannot use f (type *file) as type DataWriter in assignment:
		*file does not implement DataWriter (missing CanWrite method)
	```



	需要在 file 中实现 CanWrite() 方法才能正常使用 DataWriter()。
	
	Go语言的接口实现是隐式的，无须让实现接口的类型写出实现了哪些接口。
	
	**这个设计被称为非侵入式设计。**

### 1.4 类型与接口的关系

> 在Go语言中类型和接口之间有一对多和多对一的关系

**一个类型可以实现多个接口**

一个类型可以同时实现多个接口，而接口间彼此独立，不知道对方的实现。

例如，狗可以叫，也可以动。

我们就分别定义Sayer接口和Mover接口，如下：

```go
// Sayer 接口
type Sayer interface {
    say()
}

// Mover 接口
type Mover interface {
    move()
}
```



dog既可以实现Sayer接口，也可以实现Mover接口。

```go
type dog struct {
    name string
}

// 实现Sayer接口
func (d dog) say() {
    fmt.Printf("%s会叫汪汪汪\n", d.name)
}

// 实现Mover接口
func (d dog) move() {
    fmt.Printf("%s会动\n", d.name)
}

func main() {
    var x Sayer
    var y Mover

    var a = dog{name: "旺财"}
    x = a
    y = a
    x.say()
    y.move()
}
```



**多个类型实现同一接口**

Go语言中不同的类型还可以实现同一接口 首先我们定义一个Mover接口，它要求必须有一个move方法。

```go
// Mover 接口
type Mover interface {
    move()
}
```



例如狗可以动，汽车也可以动，可以使用如下代码实现这个关系：

```go
type dog struct {
    name string
}

type car struct {
    brand string
}

// dog类型实现Mover接口
func (d dog) move() {
    fmt.Printf("%s会跑\n", d.name)
}

// car类型实现Mover接口
func (c car) move() {
    fmt.Printf("%s速度70迈\n", c.brand)
}
```



这个时候我们在代码中就可以把狗和汽车当成一个会动的物体来处理了，不再需要关注它们具体是什么，只需要调用它们的move方法就可以了。

```go
func main() {
    var x Mover
    var a = dog{name: "旺财"}
    var b = car{brand: "保时捷"}
    x = a
    x.move()
    x = b
    x.move()
}
```



并且一个接口的方法，不一定需要由一个类型完全实现，接口的方法可以通过在类型中嵌入其他类型或者结构体来实现。

```go
// WashingMachine 洗衣机
type WashingMachine interface {
    wash()
    dry()
}

// 甩干器
type dryer struct{}

// 实现WashingMachine接口的dry()方法
func (d dryer) dry() {
    fmt.Println("甩一甩")
}

// 海尔洗衣机
type haier struct {
    dryer //嵌入甩干器
}

// 实现WashingMachine接口的wash()方法
func (h haier) wash() {
    fmt.Println("洗刷刷")
}
```



**接口嵌套**

接口与接口间可以通过嵌套创造出新的接口

```go
// Sayer 接口
type Sayer interface {
    say()
}

// Mover 接口
type Mover interface {
    move()
}

// 接口嵌套
type animal interface {
    Sayer
    Mover
}
```



嵌套得到的接口的使用与普通接口一样，这里我们让cat实现animal接口：

```go
type cat struct {
    name string
}

func (c cat) say() {
    fmt.Println("喵喵喵")
}

func (c cat) move() {
    fmt.Println("猫会动")
}

func main() {
    var x animal
    x = cat{name: "花花"}
    x.move()
    x.say()
}
```



### 1.5 空接口

空接口是指没有定义任何方法的接口。

因此任何类型都实现了空接口。

空接口类型的变量可以存储任意类型的变量。

```go
func main() {
    // 定义一个空接口x
    var x interface{}
    s := "码神之路"
    x = s
    fmt.Printf("type:%T value:%v\n", x, x)
    i := 100
    x = i
    fmt.Printf("type:%T value:%v\n", x, x)
    b := true
    x = b
    fmt.Printf("type:%T value:%v\n", x, x)
}
```



#### 1.5.1 空接口的应用

**空接口作为函数的参数**

使用空接口实现可以接收任意类型的函数参数。

```go
// 空接口作为函数参数
func show(a interface{}) {
    fmt.Printf("type:%T value:%v\n", a, a)
}
```



**空接口作为map的值**

使用空接口实现可以保存任意值的字典。

```go
// 空接口作为map值
    var studentInfo = make(map[string]interface{})
    studentInfo["name"] = "李白"
    studentInfo["age"] = 18
    studentInfo["married"] = false
    fmt.Println(studentInfo)
```



#### 1.5.2 类型断言

空接口可以存储任意类型的值，那我们如何获取其存储的具体数据呢？

**接口值**

一个接口的值（简称接口值）是由一个具体类型和具体类型的值两部分组成的。

这两部分分别称为`接口的动态类型`和`动态值`。

想要判断空接口中的值这个时候就可以使用类型断言，其语法格式：

```go
x.(T)
```

其中：

1. x：表示类型为interface{}的变量
2. T：表示断言x可能是的类型。

**该语法返回两个参数，第一个参数是x转化为T类型后的变量，第二个值是一个布尔值，若为true则表示断言成功，为false则表示断言失败。**

```go
func main() {
    var x interface{}
    x = "码神之路"
    v, ok := x.(string)
    if ok {
        fmt.Println(v)
    } else {
        fmt.Println("类型断言失败")
    }
}
```



上面的示例中如果要断言多次就需要写多个if判断，这个时候我们可以使用switch语句来实现：

```go
func justifyType(x interface{}) {
    switch v := x.(type) {
    case string:
        fmt.Printf("x is a string，value is %v\n", v)
    case int:
        fmt.Printf("x is a int is %v\n", v)
    case bool:
        fmt.Printf("x is a bool is %v\n", v)
    default:
        fmt.Println("unsupport type！")
    }
}
```



因为空接口可以存储任意类型值的特点，所以空接口在Go语言中的使用十分广泛。

> 关于接口需要注意的是，只有当有两个或两个以上的具体类型必须以相同的方式进行处理时才需要定义接口。不要为了接口而写接口，那样只会增加不必要的抽象，导致不必要的运行时损耗。

## 2. I/O操作

I/O操作也叫输入输出操作。其中I是指Input，O是指Output，用于读或者写数据的，有些语言中也叫流操作，是指数据通信的通道。

Golang 标准库对 IO 的抽象非常精巧，各个组件可以随意组合，可以作为接口设计的典范。

io包中提供I/O原始操作的一系列接口。

它主要包装了一些已有的实现，如 os 包中的那些，并将这些抽象成为实用性的功能和一些其他相关的接口。

由于这些接口和原始的操作以不同的实现包装了低级操作，客户不应假定它们对于并行执行是安全的。

**io库比较常用的接口有三个，分别是Reader，Writer和Closer。**

### 2.1 Reader

Reader接口的定义，Read()方法用于读取数据。

```go
type Reader interface {
        Read(p []byte) (n int, err error)
}
```



io.Reader 表示一个读取器，它将数据从某个资源读取到传输缓冲区。在缓冲区中，数据可以被流式传输和使用。

- 对于要用作读取器的类型，它必须实现 io.Reader 接口的唯一一个方法 Read(p []byte)。
- 换句话说，只要实现了 Read(p []byte) ，那它就是一个读取器。
- Read() 方法有两个返回值，一个是读取到的字节数，一个是发生错误时的错误。

通过 string.NewReader(string) 创建一个字符串读取器，然后流式地按字节读取：

```go
package main

import (
	"io"
	"log"
	"os"
	"strings"
)

func main() {

	reader := strings.NewReader("mszlu test123 123")
	// 每次读取4个字节
	p := make([]byte, 4)
	for {

		n, err := reader.Read(p)
		if err != nil {
			if err == io.EOF {
				log.Printf("读完了:eof错误 :%d", n)
				break
			}
			log.Printf("其他错误:%v", err)
			os.Exit(2)
		}
		log.Printf("[读取到的字节数为:%d][内容:%v]", n, string(p[:n]))
	}

}
```



```go
 [读取到的字节数为:4][内容:mszl]
 [读取到的字节数为:4][内容:u te]
 [读取到的字节数为:4][内容:st12]
 [读取到的字节数为:4][内容:3 12]
 [读取到的字节数为:1][内容:3]
 读完了:eof错误 :0
```



- 最后一次返回的 n 值有可能小于缓冲区大小。
- io.EOF 来表示输入流已经读取到头

strings.Reader.Read方法:

```go
func (r *Reader) Read(b []byte) (n int, err error) {
	if r.i >= int64(len(r.s)) {
		return 0, io.EOF
	}
	r.prevRune = -1
	n = copy(b, r.s[r.i:])
	r.i += int64(n)
	return
}
```



#### 2.1.1 文件操作相关API

- 根据提供的文件名创建新的文件，返回一个文件对象，默认权限是0666

  ~~~go
  func Create(name string) (file *File, err Error)
  ~~~

- 根据文件描述符创建相应的文件，返回一个文件对象

  ~~~go
  func NewFile(fd uintptr, name string) *File
  ~~~

- 只读方式打开一个名称为name的文件

  ~~~go
  func Open(name string) (file *File, err Error)
  ~~~

- 打开名称为name的文件，flag是打开的方式，只读、读写等，perm是权限

  ~~~go
  func OpenFile(name string, flag int, perm uint32) (file *File, err Error)
  ~~~

- 写入byte类型的信息到文件

	~~~go
	func (file *File) Write(b []byte) (n int, err Error)
	~~~

- 在指定位置开始写入byte类型的信息

  ~~~go
  func (file *File) WriteAt(b []byte, off int64) (n int, err Error)
  ~~~

- 写入string信息到文件

  ~~~go
  func (file *File) WriteString(s string) (ret int, err Error)
  ~~~

- 读取数据到b中

  ~~~go
  func (file *File) Read(b []byte) (n int, err Error)
  ~~~

- 从off开始读取数据到b中

  ~~~go
  func (file *File) ReadAt(b []byte, off int64) (n int, err Error)
  ~~~

- 删除文件名为name的文件-

  ~~~go
  func Remove(name string) Error
  ~~~

  

#### 2.1.2 读文件

```go
type Closer interface {
    Close() error
}
```



`os.Open()`函数能够打开一个文件，返回一个`*File`和一个`err`。对得到的文件实例调用`Close()`方法能够关闭文件。

文件读取可以用file.Read()，读到文件末尾会返回io.EOF的错误

```go
package main

import (
    "fmt"
    "io"
    "os"
)

func main() {
    // 打开文件
    file, err := os.Open("./xxx.txt")
    if err != nil {
        fmt.Println("open file err :", err)
        return
    }
    defer file.Close()
    // 定义接收文件读取的字节数组
    var buf [128]byte
    var content []byte
    for {
        n, err := file.Read(buf[:])
        if err == io.EOF {
            // 读取结束
            break
        }
        if err != nil {
            fmt.Println("read file err ", err)
            return
        }
        content = append(content, buf[:n]...)
    }
    fmt.Println(string(content))
}
```



### 2.2 Writer

```go
type Writer interface {
    //Write() 方法有两个返回值，一个是写入到目标资源的字节数，一个是发生错误时的错误。
    Write(p []byte) (n int, err error)
}
```



- io.Writer 表示一个写入器，它从缓冲区读取数据，并将数据写入目标资源。
- 对于要用作编写器的类型，必须实现 io.Writer 接口的唯一一个方法 Write(p []byte)
- 同样，只要实现了 Write(p []byte) ，那它就是一个编写器。

写文件：

```go
package main

import (
    "fmt"
    "os"
)

func main() {
    // 新建文件
    file, err := os.Create("./test.txt")
    if err != nil {
        fmt.Println(err)
        return
    }
    defer file.Close()
    for i := 0; i < 5; i++ {
        file.WriteString("ab\n")
        file.Write([]byte("cd\n"))
    }
}
```



### 2.3 bufio

- bufio包实现了带缓冲区的读写，是对文件读写的封装
- bufio缓冲写数据

| 模式        | 含义     |
| ----------- | -------- |
| os.O_WRONLY | 只写     |
| os.O_CREATE | 创建文件 |
| os.O_RDONLY | 只读     |
| os.O_RDWR   | 读写     |
| os.O_TRUNC  | 清空     |
| os.O_APPEND | 追加     |

**bufio读写数据**

```go
package main

import (
    "bufio"
    "fmt"
    "io"
    "os"
)

func wr() {
    // 参数2：打开模式，所有模式d都在上面
    // 参数3是权限控制
    // w写 r读 x执行   w  2   r  4   x  1
    //特殊权限位，拥有者位，同组用户位，其余用户位
    file, err := os.OpenFile("./xxx.txt", os.O_CREATE|os.O_WRONLY, 0666)
    if err != nil {
        return
    }
    defer file.Close()
    // 获取writer对象
    writer := bufio.NewWriter(file)
    for i := 0; i < 10; i++ {
        writer.WriteString("hello\n")
    }
    // 刷新缓冲区，强制写出
    writer.Flush()
}

func re() {
    file, err := os.Open("./xxx.txt")
    if err != nil {
        return
    }
    defer file.Close()
    reader := bufio.NewReader(file)
    for {
        line, _, err := reader.ReadLine()
        if err == io.EOF {
            break
        }
        if err != nil {
            return
        }
        fmt.Println(string(line))
    }

}

func main() {
    re()
}
```



### 2.4 ioutil工具包

- ioutil库包含在io目录下，它的主要作用是`作为一个工具包`，里面有一些比较实用的函数
- 比如 `ReadAll(从某个源读取数据)、ReadFile（读取文件内容）、WriteFile（将数据写入文件）、ReadDir（获取目录）`

```go
package main

import (
   "fmt"
   "io/ioutil"
)

func wr() {
   err := ioutil.WriteFile("./yyy.txt", []byte("码神之路"), 0666)
   if err != nil {
      fmt.Println(err)
      return
   }
}

func re() {
   content, err := ioutil.ReadFile("./yyy.txt")
   if err != nil {
      fmt.Println(err)
      return
   }
   fmt.Println(string(content))
}

func main() {
   re()
}
```



### 2.5 实现一个cat命令

使用文件操作相关知识，模拟实现linux平台cat命令的功能。

```go
package main

import (
    "bufio"
    "flag"
    "fmt"
    "io"
    "os"
)

// cat命令实现
func cat(r *bufio.Reader) {
    for {
        buf, err := r.ReadBytes('\n') //注意是字符
        if err == io.EOF {
            break
        }
        fmt.Fprintf(os.Stdout, "%s", buf)
    }
}

func main() {
    flag.Parse() // 解析命令行参数
    if flag.NArg() == 0 {
        // 如果没有参数默认从标准输入读取内容
        cat(bufio.NewReader(os.Stdin))
    }
    // 依次读取每个指定文件的内容并打印到终端
    for i := 0; i < flag.NArg(); i++ {
        f, err := os.Open(flag.Arg(i))
        if err != nil {
            fmt.Fprintf(os.Stdout, "reading from %s failed, err:%v\n", flag.Arg(i), err)
            continue
        }
        cat(bufio.NewReader(f))
    }
}
```

# 包

## 1. 包

Go语言是使用包来组织源代码的，包（package）是多个 Go 源码的集合，是一种高级的代码复用方案。Go语言中为我们提供了很多内置包，如 fmt、os、io 等。

任何源代码文件必须属于某个包，同时源码文件的第一行有效代码必须是`package pacakgeName `语句，通过该语句声明自己所在的包。

### 1.1 包的基本概念

Go语言的包借助了目录树的组织形式，一般包的名称就是其源文件所在目录的名称，虽然Go语言没有强制要求包名必须和其所在的目录名同名，但还是建议包名和所在目录同名，这样结构更清晰。

包可以定义在很深的目录中，包名的定义是不包括目录路径的，但是包在引用时一般使用全路径引用。

包的习惯用法：

- 包名一般是小写的，使用一个简短且有意义的名称。
- 包名一般要和所在的目录同名，也可以不同，包名中不能包含`- `等特殊符号。
- 包名为 main 的包为应用程序的入口包，编译不包含 main 包的源码文件时不会得到可执行文件。
- 一个文件夹下的所有源码文件只能属于同一个包，同样属于同一个包的源码文件不能放在多个文件夹下。

### 1.2 包的导入

要在代码中引用其他包的内容，需要使用 import 关键字导入使用的包。具体语法如下：

```go
import "包的路径"
```

注意事项：

- import 导入语句通常放在源码文件开头包声明语句的下面；
- 导入的包名需要使用双引号包裹起来；

包的导入有两种写法，分别是单行导入和多行导入。

**单行导入**

```go
import "包 1 的路径"
import "包 2 的路径"
```



**多行导入**

```go
import (
    "包 1 的路径"
    "包 2 的路径"
)
```



### 1.3 包的导入路径

包的绝对路径就是`GOROOT/src/`或`GOPATH`后面包的存放路径，如下所示：

```go
import "lab/test"
import "database/sql/driver"
import "database/sql"
```



上面代码的含义如下：

- test 包是自定义的包，其源码位于`GOPATH/lab/test `目录下；
- driver 包的源码位于`GOROOT/src/database/sql/driver `目录下；
- sql 包的源码位于`GOROOT/src/database/sql `目录下。

### 1.4 包的引用格式

包的引用有四种格式，下面以 fmt 包为例来分别演示一下这四种格式。

1. 标准引用格式

```go
import "fmt"
```

此时可以用`fmt.`作为前缀来使用 fmt 包中的方法，这是常用的一种方式。

```go
package main
import "fmt"
func main() {
    fmt.Println("码神之路")
}
```



2. 自定义别名引用格式


在导入包的时候，我们还可以为导入的包设置别名，如下所示：

```go
import F "fmt"
```

其中 F 就是 fmt 包的别名，使用时我们可以使用`F.`来代替标准引用格式的`fmt.`来作为前缀使用 fmt 包中的方法

```go
package main
import F "fmt"
func main() {
    F.Println("码神之路")
}
```



3. 省略引用格式

```go
import . "fmt"
```

这种格式相当于把 fmt 包直接合并到当前程序中，在使用 fmt 包内的方法是可以不用加前缀`fmt.`，直接引用。

```go
package main
import . "fmt"
func main() {
    //不需要加前缀 fmt.
    Println("码神之路")
}
```



4. 匿名引用格式


在引用某个包时，如果只是希望执行包初始化的 init 函数，而不使用包内部的数据时，可以使用匿名引用格式，如下所示：

```go
import _ "fmt"
```

匿名导入的包与其他方式导入的包一样都会被编译到可执行文件中。

使用标准格式引用包，但是代码中却没有使用包，编译器会报错。如果包中有 init 初始化函数，则通过`import _ "包的路径" `这种方式引用包，仅执行包的初始化函数，即使包没有 init 初始化函数，也不会引发编译器报错。

```go
package main
import (
    _ "database/sql"
    "fmt"
)
func main() {
    fmt.Println("码神之路")
}
```

注意：

- 一个包可以有多个 init 函数，包加载时会执行全部的 init 函数，但并不能保证执行顺序，所以不建议在一个包中放入多个 init 函数，将需要初始化的逻辑放到一个 init 函数里面。
- 包不能出现环形引用的情况，比如包 a 引用了包 b，包 b 引用了包 c，如果包 c 又引用了包 a，则编译不能通过。
- 包的重复引用是允许的，比如包 a 引用了包 b 和包 c，包 b 和包 c 都引用了包 d。这种场景相当于重复引用了 d，这种情况是允许的，并且 Go 编译器保证包 d 的 init 函数只会执行一次。

## 2. go mod

go module 是Go语言从 1.11 版本之后官方推出的版本管理工具，并且从 Go1.13 版本开始，go module 成为了Go语言默认的依赖管理工具。

Modules 官方定义为：

> Modules 是相关 Go 包的集合，是源代码交换和版本控制的单元。Go语言命令直接支持使用 Modules，包括记录和解析对其他模块的依赖性，Modules 替换旧的基于 GOPATH 的方法，来指定使用哪些源文件。

使用go module之前需要设置环境变量：

1. GO111MODULE=on
2. GOPROXY=[https://goproxy.io,directopen in new window](https://goproxy.io,direct/)
3. GOPROXY=https://goproxy.cn,direct(国内的七牛云提供)

**GO111MODULE 有三个值：off, on和auto（默认值）。**

- GO111MODULE=off，go命令行将不会支持module功能，寻找依赖包的方式将会沿用旧版本那种通过vendor目录或者GOPATH模式来查找。
- GO111MODULE=on，go命令行会使用modules，而一点也不会去GOPATH目录下查找。
- GO111MODULE=auto，默认值，go命令行将会根据当前目录来决定是否启用module功能。这种情况下可以分为两种情形：
	- 当前目录在GOPATH之外且该目录包含go.mod文件 开启
	- 当处于 GOPATH 内且没有 go.mod 文件存在时其行为会等同于 GO111MODULE=off
- 如果不使用 Go Modules, go get 将会从模块代码的 master 分支拉取
- 而若使用 Go Modules 则你可以利用 Git Tag 手动选择一个特定版本的模块代码

**go mod 有以下命令：**

| 命令     | 说明                                                         |
| -------- | ------------------------------------------------------------ |
| download | download modules to local cache(下载依赖包)                  |
| edit     | edit go.mod from tools or scripts（编辑go.mod)               |
| graph    | print module requirement graph (打印模块依赖图)              |
| init     | initialize new module in current directory（在当前目录初始化mod） |
| tidy     | add missing and remove unused modules(拉取缺少的模块，移除不用的模块) |
| vendor   | make vendored copy of dependencies(将依赖复制到vendor下)     |
| verify   | verify dependencies have expected content (验证依赖是否正确） |
| why      | explain why packages or modules are needed(解释为什么需要依赖) |

- 常用的有 `init tidy edit`

**使用go get命令下载指定版本的依赖包：**

执行`go get `命令，在下载依赖包的同时还可以指定依赖包的版本。

- 运行`go get -u`命令会将项目中的包升级到最新的次要版本或者修订版本；
- 运行`go get -u=patch`命令会将项目中的包升级到最新的修订版本；
- 运行`go get [包名]@[版本号]`命令会下载对应包的指定版本或者将对应包升级到指定的版本。

> 提示：`go get [包名]@[版本号]`命令中版本号可以是 x.y.z 的形式，例如 go get foo@v1.2.3，也可以是 git 上的分支或 tag，例如 go get foo@master，还可以是 git 提交时的哈希值，例如 go get foo@e3702bed2。

### 2.1 项目中使用

1. 在 GOPATH 目录下新建一个目录，并使用`go mod init`初始化生成 go.mod 文件。

	go.mod 文件一旦创建后，它的内容将会被 go toolchain 全面掌控，go toolchain 会在各类命令执行时，比如`go get`、`go build`、`go mod`等修改和维护 go.mod 文件。

	go.mod 提供了 module、require、replace 和 exclude 四个命令：

	- module 语句指定包的名字（路径）；
	- require 语句指定的依赖项模块；
	- replace 语句可以替换依赖项模块；
	- exclude 语句可以忽略依赖项模块。

	初始化生成的 go.mod 文件如下所示：

	```go
	module hello
	
	go 1.13
	```



2. 添加依赖。

	新建一个 main.go 文件，写入以下代码：

	```go
	package main
	import (
	    "net/http"
	    "github.com/labstack/echo"
	)
	func main() {
	    e := echo.New()
	    e.GET("/", func(c echo.Context) error {
	        return c.String(http.StatusOK, "Hello, World!")
	    })
	    e.Logger.Fatal(e.Start(":1323"))
	}
	```



执行`go mod tidy`运行代码会发现 go mod 会自动查找依赖自动下载

```go
go: finding module for package github.com/labstack/echo
go: found github.com/labstack/echo in github.com/labstack/echo v3.3.10+incompatible
go: finding module for package github.com/stretchr/testify/assert
go: finding module for package github.com/labstack/gommon/log
go: finding module for package github.com/labstack/gommon/color
go: finding module for package golang.org/x/crypto/acme/autocert
go: found github.com/labstack/gommon/color in github.com/labstack/gommon v0.3.1
go: found github.com/labstack/gommon/log in github.com/labstack/gommon v0.3.1
go: found golang.org/x/crypto/acme/autocert in golang.org/x/crypto v0.0.0-20220112180741-5e0467b6c7ce
go: found github.com/stretchr/testify/assert in github.com/stretchr/testify v1.7.0
```

go.mod中的内容：

```go
module learning09

go 1.17

require github.com/labstack/echo v3.3.10+incompatible

require (
	github.com/labstack/gommon v0.3.1 // indirect
	github.com/mattn/go-colorable v0.1.11 // indirect
	github.com/mattn/go-isatty v0.0.14 // indirect
	github.com/valyala/bytebufferpool v1.0.0 // indirect
	github.com/valyala/fasttemplate v1.2.1 // indirect
	golang.org/x/crypto v0.0.0-20220112180741-5e0467b6c7ce // indirect
	golang.org/x/net v0.0.0-20211112202133-69e39bad7dc2 // indirect
	golang.org/x/sys v0.0.0-20211103235746-7861aae1554b // indirect
	golang.org/x/text v0.3.6 // indirect
)
```

**go module 安装 package 的原则是先拉取最新的 release tag，若无 tag 则拉取最新的 commit**

go 会自动生成一个 go.sum 文件来记录 dependency tree。

执行脚本`go run main.go`，就可以运行项目。

可以使用命令`go list -m -u all`来检查可以升级的 package，使用`go get -u need-upgrade-package`升级后会将新的依赖版本更新到 go.mod ，

比如：`go get -u github.com/labstack/gommon`

也可以使用`go get -u`升级所有依赖。



3. 一般使用包之前，是首先执行`go get`命令，先下载依赖。比如 `github.com/labstack/echo`

**使用 replace 替换无法直接获取的 package：**

由于某些已知的原因，并不是所有的 package 都能成功下载，比如：golang.org 下的包。

modules 可以通过在 go.mod 文件中使用 replace 指令替换成 github 上对应的库，比如：

```go
replace (
    golang.org/x/crypto v0.0.0-20190313024323-a1f597ede03a => github.com/golang/crypto v0.0.0-20190313024323-a1f597ede03a
)
```



或者

```go
replace golang.org/x/crypto v0.0.0-20190313024323-a1f597ede03a => github.com/golang/crypto v0.0.0-20190313024323-a1f597ede03a
```

> `go install`命令将项目打包安装为可执行文件，在安装在GOPATH的bin目录下，go install执行的项目 必须有main方法

# 并发

##  1. 并发

> 有人把Go语言比作 21 世纪的C语言，第一是因为Go语言设计简单，第二则是因为 21 世纪最重要的就是并发程序设计，而 Go 从语言层面就支持并发。同时实现了自动垃圾回收机制。

先来了解一些概念：

**进程/线程**

进程是程序在操作系统中的一次执行过程，系统进行资源分配和调度的一个独立单位。

线程是进程的一个执行实体，是 CPU 调度和分派的基本单位，它是比进程更小的能独立运行的基本单位。

一个进程可以创建和撤销多个线程，同一个进程中的多个线程之间可以并发执行。

**并发/并行**

多线程程序在单核心的 cpu 上运行，称为并发；

多线程程序在多核心的 cpu 上运行，称为并行。

并发与并行并不相同，并发主要由切换时间片来实现“同时”运行，并行则是直接利用多核实现多线程的运行，Go程序可以设置使用核心数，以发挥多核计算机的能力。

**协程/线程**

协程：独立的栈空间，共享堆空间，调度由用户自己控制，本质上有点类似于用户级线程，这些用户级线程的调度也是自己实现的。

线程：一个线程上可以跑多个协程，协程是轻量级的线程。

## 2. Goroutine

> Goroutine 一般将其翻译为Go协程，也就是说Go语言在语言层面就实现了协程的支持。

在java/c++中我们要实现并发编程的时候，我们通常需要自己维护一个线程池，并且需要自己去包装一个又一个的任务，同时需要自己去调度线程执行任务并维护上下文切换，这一切通常会耗费程序员大量的心智。那么能不能有一种机制，程序员只需要定义很多个任务，让系统去帮助我们把这些任务分配到CPU上实现并发执行呢？

Go语言中的goroutine就是这样一种机制， goroutine是由Go的运行时（runtime）调度和管理的。

Go程序会智能地将 goroutine 中的任务合理地分配给每个CPU。

Go语言之所以被称为现代化的编程语言，就是因为它在语言层面已经内置了调度和上下文切换的机制。

在Go语言编程中你不需要去自己写进程、线程、协程，你的技能包里只有一个技能–goroutine，当你需要让某个任务并发执行的时候，你只需要把这个任务包装成一个函数，开启一个goroutine去执行这个函数就可以了，就是这么简单粗暴。

### 2.1 使用

Go语言中使用goroutine非常简单，只需要在调用函数的时候在前面加上go关键字，就可以为一个函数创建一个goroutine。

一个goroutine必定对应一个函数，可以创建多个goroutine去执行相同的函数。

```go
go 函数名( 参数列表 )
```

- 函数名：要调用的函数名。
- 参数列表：调用函数需要传入的参数。

**启动单个goroutine**

```go
func hello() {
    fmt.Println("Hello Goroutine!")
}
func main() {
    hello()
    fmt.Println("main goroutine done!")
}
```



这个示例中hello函数和下面的语句是串行的，执行的结果是打印完Hello Goroutine!后打印main goroutine done!。

接下来我们在调用hello函数前面加上关键字go，也就是启动一个goroutine去执行hello这个函数。

```go
func main() {
    go hello() // 启动一个goroutine去执行hello函数
    fmt.Println("main goroutine done!")
}
```



这一次的执行结果只打印了main goroutine done!，并没有打印Hello Goroutine!。

```
为什么呢？
```

在程序启动时，Go程序就会为main()函数创建一个默认的goroutine。

当main()函数返回的时候该goroutine就结束了，所有在main()函数中启动的goroutine会一同结束，main函数所在的goroutine就像是权利的游戏中的夜王，其他的goroutine都是异鬼，夜王一死它转化的那些异鬼也就全部GG了。

所以我们要想办法让main函数等一等hello函数，最简单粗暴的方式就是time.Sleep了。

```go
func main() {
    go hello() // 启动一个goroutine去执行hello函数
    fmt.Println("main goroutine done!")
    time.Sleep(time.Second)
}
```



执行上面的代码你会发现，这一次先打印main goroutine done!，然后紧接着打印Hello Goroutine!。

首先为什么会先打印main goroutine done!是因为我们在创建新的goroutine的时候需要花费一些时间，而此时main函数所在的goroutine是继续执行的。

**启动多个goroutine**

```go
package main

import (
	"fmt"
	"time"
)

func hello(i int) {
	fmt.Println("Hello Goroutine!" , i)
}

func main()  {
	for i := 0; i < 10; i++ {
		go hello(i)
	}
	fmt.Println("main goroutine done!")
	time.Sleep(time.Second * 2)
}
```



多次执行上面的代码，会发现每次打印的数字的顺序都不一致。这是因为10个goroutine是并发执行的，而goroutine的调度是随机的。

> 问题：主协程 退出了，子协程还会执行吗？

**OS线程（操作系统线程）一般都有固定的栈内存（通常为2MB）,一个goroutine的栈在其生命周期开始时只有很小的栈（典型情况下2KB），goroutine的栈不是固定的，他可以按需增大和缩小，goroutine的栈大小限制可以达到1GB，虽然极少会用到这个大。所以在Go语言中一次创建十万左右的goroutine也是可以的。**

### 2.1 GMP

GPM是Go语言运行时（runtime）层面的实现，是go语言自己实现的一套调度系统。区别于操作系统调度OS线程。

- G很好理解，就是个goroutine的，里面除了存放本goroutine信息外 还有与所在P的绑定等信息。
- P管理着一组goroutine队列，P里面会存储当前goroutine运行的上下文环境（函数指针，堆栈地址及地址边界），P会对自己管理的goroutine队列做一些调度（比如把占用CPU时间较长的goroutine暂停、运行后续的goroutine等等）当自己的队列消费完了就去全局队列里取，如果全局队列里也消费完了会去其他P的队列里抢任务。
- M是Go运行时（runtime）对操作系统内核线程的虚拟， M与内核线程一般是一一映射的关系， 一个groutine最终是要放到M上执行的；

P与M一般也是一一对应的。他们关系是： P管理着一组G挂载在M上运行。当一个G长久阻塞在一个M上时，runtime会新建一个M，阻塞G所在的P会把其他的G 挂载在新建的M上。当旧的G阻塞完成或者认为其已经死掉时 回收旧的M。

P的个数是通过runtime.GOMAXPROCS设定（最大256），Go1.5版本之后默认为物理线程数。 在并发量大的时候会增加一些P和M，但不会太多，切换太频繁的话得不偿失。

单从线程调度讲，Go语言相比起其他语言的优势在于OS线程是由OS内核来调度的，goroutine则是由Go运行时（runtime）自己的调度器调度的，这个调度器使用一个称为m:n调度的技术（复用/调度m个goroutine到n个OS线程）。 其一大特点是goroutine的调度是在`用户态`下完成的， 不涉及内核态与用户态之间的频繁切换，包括内存的分配与释放，都是在用户态维护着一块大的内存池， 不直接调用系统的malloc函数（除非内存池需要改变），成本比调度OS线程低很多。 另一方面充分利用了多核的硬件资源，近似的把若干goroutine均分在物理线程上， 再加上本身goroutine的超轻量，以上种种保证了go调度方面的性能。

## 3. runtime包

**runtime.Gosched()**

让出CPU时间片，重新等待安排任务(大概意思就是本来计划的好好的周末出去烧烤，但是你妈让你去相亲,两种情况第一就是你相亲速度非常快，见面就黄不耽误你继续烧烤，第二种情况就是你相亲速度特别慢，见面就是你侬我侬的，耽误了烧烤，但是还馋就是耽误了烧烤你还得去烧烤)

```go
package main

import (
    "fmt"
    "runtime"
)

func main() {
    go func(s string) {
        for i := 0; i < 2; i++ {
            fmt.Println(s)
        }
    }("world")
    // 主协程
    for i := 0; i < 2; i++ {
        // 切一下，再次分配任务
        runtime.Gosched()
        fmt.Println("hello")
    }
}
```



**runtime.Goexit()**

退出当前协程(一边烧烤一边相亲，突然发现相亲对象太丑影响烧烤，果断让她滚蛋，然后也就没有然后了)

```go
package main

import (
    "fmt"
    "runtime"
)

func main() {
    go func() {
        defer fmt.Println("A.defer")
        func() {
            defer fmt.Println("B.defer")
            // 结束协程
            runtime.Goexit()
            defer fmt.Println("C.defer")
            fmt.Println("B")
        }()
        fmt.Println("A")
    }()
    for {
    }
}
```



**runtime.GOMAXPROCS**

Go运行时的调度器使用GOMAXPROCS参数来确定需要使用多少个OS线程来同时执行Go代码。默认值是机器上的CPU核心数。例如在一个8核心的机器上，调度器会把Go代码同时调度到8个OS线程上（GOMAXPROCS是m:n调度中的n）。

Go语言中可以通过runtime.GOMAXPROCS()函数设置当前程序并发时占用的CPU逻辑核心数。

Go1.5版本之前，默认使用的是单核心执行。Go1.5版本之后，默认使用全部的CPU逻辑核心数。

我们可以通过将任务分配到不同的CPU逻辑核心上实现并行的效果，这里举个例子：

```go
func a() {
    for i := 1; i < 10; i++ {
        fmt.Println("A:", i)
    }
}

func b() {
    for i := 1; i < 10; i++ {
        fmt.Println("B:", i)
    }
}

func main() {
    runtime.GOMAXPROCS(1)
    go a()
    go b()
    time.Sleep(time.Second)
}
```



两个任务只有一个逻辑核心，此时是做完一个任务再做另一个任务。

将逻辑核心数设为2，此时两个任务并行执行，代码如下。

```go
func a() {
    for i := 1; i < 10; i++ {
        fmt.Println("A:", i)
    }
}

func b() {
    for i := 1; i < 10; i++ {
        fmt.Println("B:", i)
    }
}

func main() {
    runtime.GOMAXPROCS(2)
    go a()
    go b()
    time.Sleep(time.Second)
}
```



Go语言中的操作系统线程和goroutine的关系：

- 1.一个操作系统线程对应用户态多个goroutine。
- 2.go程序可以同时使用多个操作系统线程。
- 3.goroutine和OS线程是多对多的关系，即m:n。

## 4.Channel

单纯地将函数并发执行是没有意义的。函数与函数间需要交换数据才能体现并发执行函数的意义。

虽然可以使用共享内存进行数据交换，但是共享内存在不同的goroutine中容易发生竞态问题。为了保证数据交换的正确性，必须使用互斥量对内存进行加锁，这种做法势必造成性能问题。

Go语言的并发模型是CSP（Communicating Sequential Processes），提倡通过通信共享内存而不是通过共享内存而实现通信。

如果说goroutine是Go程序并发的执行体，channel就是它们之间的连接。channel是可以让一个goroutine发送特定值到另一个goroutine的通信机制。

Go 语言中的通道（channel）是一种特殊的类型。通道像一个传送带或者队列，总是遵循先入先出（First In First Out）的规则，保证收发数据的顺序。每一个通道都是一个具体类型的导管，也就是声明channel的时候需要为其指定元素类型。

**channel是一种类型，一种引用类型。声明通道类型的格式如下：**

```go
  var 变量 chan 类型
```

```go
 var ch1 chan int   // 声明一个传递整型的通道
    var ch2 chan bool  // 声明一个传递布尔型的通道
    var ch3 chan []int // 声明一个传递int切片的通道
```



### 4.1 创建channel

通道是引用类型，通道类型的空值是nil。

```go
var ch chan int
fmt.Println(ch) // <nil>
```



声明通道后需要使用make函数初始化之后才能使用。

创建channel的格式如下：

```go
  make(chan 元素类型, [缓冲大小])
```

channel的缓冲大小是可选的。

```go
ch4 := make(chan int)
ch5 := make(chan bool)
ch6 := make(chan []int)
```



### 4.2 channel操作

通道有发送（send）、接收(receive）和关闭（close）三种操作。

发送和接收都使用`<-`符号。

现在我们先使用以下语句定义一个通道：

```go
ch := make(chan int)
```

**发送：**

将一个值发送到通道中。

```go
ch <- 10 // 把10发送到ch中
```

**接收:**

从一个通道中接收值。

```go
x := <- ch // 从ch中接收值并赋值给变量x
<-ch       // 从ch中接收值，忽略结果
```



**关闭：**

我们通过调用内置的close函数来关闭通道。

```go
close(ch)
```

关于关闭通道需要注意的事情是，只有在通知接收方goroutine所有的数据都发送完毕的时候才需要关闭通道。通道是可以被垃圾回收机制回收的，它和关闭文件是不一样的，在结束操作之后关闭文件是必须要做的，但关闭通道不是必须的。

关闭后的通道有以下特点：

1. 对一个关闭的通道再发送值就会导致panic。
2. 对一个关闭的通道进行接收会一直获取值直到通道为空。
3. 对一个关闭的并且没有值的通道执行接收操作会得到对应类型的零值。
4. 关闭一个已经关闭的通道会导致panic。

### 4.3 无缓冲的通道

无缓冲的通道又称为阻塞的通道。我们来看一下下面的代码：

```go
func main() {
    ch := make(chan int)
    ch <- 10
    fmt.Println("发送成功")
}
```



上面这段代码能够通过编译，但是执行的时候会出现以下错误：

```go
fatal error: all goroutines are asleep - deadlock!
```

```
为什么会出现deadlock错误呢？
```

因为我们使用ch := make(chan int)创建的是无缓冲的通道，无缓冲的通道只有在有人接收值的时候才能发送值。就像你住的小区没有快递柜和代收点，快递员给你打电话必须要把这个物品送到你的手中，简单来说就是无缓冲的通道必须有接收才能发送。

上面的代码会阻塞在ch <- 10这一行代码形成死锁，那如何解决这个问题呢？

一种方法是启用一个goroutine去接收值，例如：

```go
func recv(c chan int) {
    ret := <-c
    fmt.Println("接收成功", ret)
}
func main() {
    ch := make(chan int)
    go recv(ch) // 启用goroutine从通道接收值
    ch <- 10
    fmt.Println("发送成功")
}
```



无缓冲通道上的发送操作会阻塞，直到另一个goroutine在该通道上执行接收操作，这时值才能发送成功，两个goroutine将继续执行。相反，如果接收操作先执行，接收方的goroutine将阻塞，直到另一个goroutine在该通道上发送一个值。

使用无缓冲通道进行通信将导致发送和接收的goroutine同步化。因此，无缓冲通道也被称为同步通道。

### 4.4 有缓冲的通道

我们可以在使用make函数初始化通道的时候为其指定通道的容量，例如：

```go
func main() {
    ch := make(chan int, 1) // 创建一个容量为1的有缓冲区通道
    ch <- 10
    fmt.Println("发送成功")
}
```



只要通道的容量大于零，那么该通道就是有缓冲的通道，通道的容量表示通道中能存放元素的数量。就像你小区的快递柜只有那么个多格子，格子满了就装不下了，就阻塞了，等到别人取走一个快递员就能往里面放一个。

我们可以使用内置的len函数获取通道内元素的数量，使用cap函数获取通道的容量，虽然我们很少会这么做。

### 

可以通过内置的close()函数关闭channel（如果你的管道不往里存值或者取值的时候一定记得关闭管道）

```go
package main

import "fmt"

func main() {
    c := make(chan int)
    go func() {
        for i := 0; i < 5; i++ {
            c <- i
        }
        close(c)
    }()
    for {
        if data, ok := <-c; ok {
            fmt.Println(data)
        } else {
            break
        }
    }
    fmt.Println("main结束")
}
```



**注意:关闭已经关闭的channel会引发panic。**

### 4.6 如何优雅的从通道循环取值

当通过通道发送有限的数据时，我们可以通过close函数关闭通道来告知从该通道接收值的goroutine停止等待。当通道被关闭时，往该通道发送值会引发panic，从该通道里接收的值一直都是类型零值。那如何判断一个通道是否被关闭了呢？

我们来看下面这个例子：

```go
func main() {
    ch1 := make(chan int)
    ch2 := make(chan int)
    // 开启goroutine将0~100的数发送到ch1中
    go func() {
        for i := 0; i < 100; i++ {
            ch1 <- i
        }
        close(ch1)
    }()
    // 开启goroutine从ch1中接收值，并将该值的平方发送到ch2中
    go func() {
        for {
            i, ok := <-ch1 // 通道关闭后再取值ok=false
            if !ok {
                break
            }
            ch2 <- i * i
        }
        close(ch2)
    }()
    // 在主goroutine中从ch2中接收值打印
    for i := range ch2 { // 通道关闭后会退出for range循环
        fmt.Println(i)
    }
}
```



从上面的例子中我们看到有两种方式在接收值的时候判断通道是否被关闭，我们通常使用的是for range的方式。

### 4.7 单向通道

有的时候我们会将通道作为参数在多个任务函数间传递，很多时候我们在不同的任务函数中使用通道都会对其进行限制，比如限制通道在函数中只能发送或只能接收。

Go语言中提供了单向通道来处理这种情况。例如，我们把上面的例子改造如下：

```go
func counter(out chan<- int) {
    for i := 0; i < 100; i++ {
        out <- i
    }
    close(out)
}

func squarer(out chan<- int, in <-chan int) {
    for i := range in {
        out <- i * i
    }
    close(out)
}
func printer(in <-chan int) {
    for i := range in {
        fmt.Println(i)
    }
}

func main() {
    ch1 := make(chan int)
    ch2 := make(chan int)
    go counter(ch1)
    go squarer(ch2, ch1)
    printer(ch2)
}
```



1. `chan<- int`是一个只能发送的通道，可以发送但是不能接收；
2. `<-chan int`是一个只能接收的通道，可以接收但是不能发送。

在函数传参及任何赋值操作中将双向通道转换为单向通道是可以的，但反过来是不可以的。

## 5. select

在某些场景下我们需要同时从多个通道接收数据。通道在接收数据时，如果没有数据可以接收将会发生阻塞。你也许会写出如下代码使用遍历的方式来实现：

```go
for{
    // 尝试从ch1接收值
    data, ok := <-ch1
    // 尝试从ch2接收值
    data, ok := <-ch2
    …
}
```



这种方式虽然可以实现从多个通道接收值的需求，但是运行性能会差很多。为了应对这种场景，Go内置了select关键字，可以同时响应多个通道的操作。

select的使用类似于switch语句，它有一系列case分支和一个默认的分支。每个case会对应一个通道的通信（接收或发送）过程。select会一直等待，直到某个case的通信操作完成时，就会执行case分支对应的语句。具体格式如下：

```go
select {
    case <-chan1:
       // 如果chan1成功读到数据，则进行该case处理语句
    case chan2 <- 1:
       // 如果成功向chan2写入数据，则进行该case处理语句
    default:
       // 如果上面都没有成功，则进入default处理流程
    }
```



**select可以同时监听一个或多个channel，直到其中一个channel ready**

```go
package main

import (
   "fmt"
   "time"
)

func test1(ch chan string) {
   time.Sleep(time.Second * 5)
   ch <- "test1"
}
func test2(ch chan string) {
   time.Sleep(time.Second * 2)
   ch <- "test2"
}

func main() {
   // 2个管道
   output1 := make(chan string)
   output2 := make(chan string)
   // 跑2个子协程，写数据
   go test1(output1)
   go test2(output2)
   // 用select监控
   select {
   case s1 := <-output1:
      fmt.Println("s1=", s1)
   case s2 := <-output2:
      fmt.Println("s2=", s2)
   }
}
```



**如果多个channel同时ready，则随机选择一个执行**

```go
package main

import (
	"fmt"
)

func main() {
	// 创建2个管道
	intChan := make(chan int, 1)
	stringChan := make(chan string, 1)
	go func() {
		//time.Sleep(2 * time.Second)
		intChan <- 1
	}()
	go func() {
		stringChan <- "hello"
	}()
	select {
	case value := <-intChan:
		fmt.Println("int:", value)
	case value := <-stringChan:
		fmt.Println("string:", value)
	}
	fmt.Println("main结束")
}
```



**可以用于判断管道是否存满**

```go
package main

import (
   "fmt"
   "time"
)

// 判断管道有没有存满
func main() {
   // 创建管道
   output1 := make(chan string, 10)
   // 子协程写数据
   go write(output1)
   // 取数据
   for s := range output1 {
      fmt.Println("res:", s)
      time.Sleep(time.Second)
   }
}

func write(ch chan string) {
   for {
      select {
      // 写数据
      case ch <- "hello":
         fmt.Println("write hello")
      default:
         fmt.Println("channel full")
      }
      time.Sleep(time.Millisecond * 500)
   }
}
```



## 6. 并发安全和锁

有时候在Go代码中可能会存在多个goroutine同时操作一个资源（临界区），这种情况会发生竞态问题（数据竞态）。类比现实生活中的例子有十字路口被各个方向的的汽车竞争；还有火车上的卫生间被车厢里的人竞争。

举个例子：

```go
var x int64
var wg sync.WaitGroup

func add() {
    for i := 0; i < 5000; i++ {
        x = x + 1
    }
    wg.Done()
}
func main() {
    wg.Add(2)
    go add()
    go add()
    wg.Wait()
    fmt.Println(x)
}
```



上面的代码中我们开启了两个goroutine去累加变量x的值，这两个goroutine在访问和修改x变量的时候就会存在数据竞争，导致最后的结果与期待的不符。

### 6.1 互斥锁

互斥锁是一种常用的控制共享资源访问的方法，它能够保证同时只有一个goroutine可以访问共享资源。Go语言中使用sync包的Mutex类型来实现互斥锁。

使用互斥锁来修复上面代码的问题：

```go
var x int64
var wg sync.WaitGroup
var lock sync.Mutex

func add() {
    for i := 0; i < 5000; i++ {
        lock.Lock() // 加锁
        x = x + 1
        lock.Unlock() // 解锁
    }
    wg.Done()
}
func main() {
    wg.Add(2)
    go add()
    go add()
    wg.Wait()
    fmt.Println(x)
}
```



使用互斥锁能够保证同一时间有且只有一个goroutine进入临界区，其他的goroutine则在等待锁；当互斥锁释放后，等待的goroutine才可以获取锁进入临界区，多个goroutine同时等待一个锁时，唤醒的策略是随机的。

### 6.2 读写互斥锁

互斥锁是完全互斥的，但是有很多实际的场景下是读多写少的，当我们并发的去读取一个资源不涉及资源修改的时候是没有必要加锁的，这种场景下使用读写锁是更好的一种选择。读写锁在Go语言中使用sync包中的RWMutex类型。

读写锁分为两种：读锁和写锁。当一个goroutine获取读锁之后，其他的goroutine如果是获取读锁会继续获得锁，如果是获取写锁就会等待；当一个goroutine获取写锁之后，其他的goroutine无论是获取读锁还是写锁都会等待。

读写锁示例：

```go
var (
    x      int64
    wg     sync.WaitGroup
    lock   sync.Mutex
    rwlock sync.RWMutex
)

func write() {
    // lock.Lock()   // 加互斥锁
    rwlock.Lock() // 加写锁
    x = x + 1
    time.Sleep(10 * time.Millisecond) // 假设读操作耗时10毫秒
    rwlock.Unlock()                   // 解写锁
    // lock.Unlock()                     // 解互斥锁
    wg.Done()
}

func read() {
    // lock.Lock()                  // 加互斥锁
    rwlock.RLock()               // 加读锁
    time.Sleep(time.Millisecond) // 假设读操作耗时1毫秒
    rwlock.RUnlock()             // 解读锁
    // lock.Unlock()                // 解互斥锁
    wg.Done()
}

func main() {
    start := time.Now()
    for i := 0; i < 10; i++ {
        wg.Add(1)
        go write()
    }

    for i := 0; i < 1000; i++ {
        wg.Add(1)
        go read()
    }

    wg.Wait()
    end := time.Now()
    fmt.Println(end.Sub(start))
}
```



需要注意的是读写锁非常适合读多写少的场景，如果读和写的操作差别不大，读写锁的优势就发挥不出来。

## 7. 原子操作

代码中的加锁操作因为涉及内核态的上下文切换会比较耗时、代价比较高。针对`基本数据类型`我们还可以使用原子操作来保证并发安全，因为原子操作是Go语言提供的方法它在用户态就可以完成，因此性能比加锁操作更好。Go语言中原子操作由内置的标准库sync/atomic提供。

**atomic包**

| 方法                                                         | 解释           |
| ------------------------------------------------------------ | -------------- |
| func LoadInt32(addr *int32) (val int32) func LoadInt64(addr `*int64`) (val int64) func LoadUint32(addr`*uint32`) (val uint32) func LoadUint64(addr`*uint64`) (val uint64) func LoadUintptr(addr`*uintptr`) (val uintptr) func LoadPointer(addr`*unsafe.Pointer`) (val unsafe.Pointer) | 读取操作       |
| func StoreInt32(addr `*int32`, val int32) func StoreInt64(addr `*int64`, val int64) func StoreUint32(addr `*uint32`, val uint32) func StoreUint64(addr `*uint64`, val uint64) func StoreUintptr(addr `*uintptr`, val uintptr) func StorePointer(addr `*unsafe.Pointer`, val unsafe.Pointer) | 写入操作       |
| func AddInt32(addr `*int32`, delta int32) (new int32) func AddInt64(addr `*int64`, delta int64) (new int64) func AddUint32(addr `*uint32`, delta uint32) (new uint32) func AddUint64(addr `*uint64`, delta uint64) (new uint64) func AddUintptr(addr `*uintptr`, delta uintptr) (new uintptr) | 修改操作       |
| func SwapInt32(addr `*int32`, new int32) (old int32) func SwapInt64(addr `*int64`, new int64) (old int64) func SwapUint32(addr `*uint32`, new uint32) (old uint32) func SwapUint64(addr `*uint64`, new uint64) (old uint64) func SwapUintptr(addr `*uintptr`, new uintptr) (old uintptr) func SwapPointer(addr `*unsafe.Pointer`, new unsafe.Pointer) (old unsafe.Pointer) | 交换操作       |
| func CompareAndSwapInt32(addr `*int32`, old, new int32) (swapped bool) func CompareAndSwapInt64(addr `*int64`, old, new int64) (swapped bool) func CompareAndSwapUint32(addr `*uint32`, old, new uint32) (swapped bool) func CompareAndSwapUint64(addr `*uint64`, old, new uint64) (swapped bool) func CompareAndSwapUintptr(addr `*uintptr`, old, new uintptr) (swapped bool) func CompareAndSwapPointer(addr `*unsafe.Pointer`, old, new unsafe.Pointer) (swapped bool) | 比较并交换操作 |

比较下互斥锁和原子操作的性能：

```go
var x int64
var l sync.Mutex
var wg sync.WaitGroup

// 普通版加函数
func add() {
    // x = x + 1
    x++ // 等价于上面的操作
    wg.Done()
}

// 互斥锁版加函数
func mutexAdd() {
    l.Lock()
    x++
    l.Unlock()
    wg.Done()
}

// 原子操作版加函数
func atomicAdd() {
    atomic.AddInt64(&x, 1)
    wg.Done()
}

func main() {
    start := time.Now()
    for i := 0; i < 10000; i++ {
        wg.Add(1)
        // go add()       // 普通版add函数 不是并发安全的
        // go mutexAdd()  // 加锁版add函数 是并发安全的，但是加锁性能开销大
        go atomicAdd() // 原子操作版add函数 是并发安全，性能优于加锁版
    }
    wg.Wait()
    end := time.Now()
    fmt.Println(x)
    fmt.Println(end.Sub(start))
}
```



atomic包提供了底层的原子级内存操作，对于同步算法的实现很有用。这些函数必须谨慎地保证正确使用。除了某些特殊的底层应用，使用通道或者sync包的函数/类型实现同步更好。

## 8. GMP 原理与调度

### 8.1 Golang “调度器” 的由来

**单进程时代不需要调度器**

我们知道，一切的软件都是跑在操作系统上，真正用来干活 (计算) 的是 CPU。早期的操作系统每个程序就是一个进程，直到一个程序运行完，才能进行下一个进程，就是 “单进程时代”

一切的程序只能串行发生。

![image-20220117211726117](https://www.mszlu.com/assets/image-20220117211726117.0dfb1289.png)

早期的单进程操作系统，面临 2 个问题：

1. 单一的执行流程，计算机只能一个任务一个任务处理。
2. 进程阻塞所带来的 CPU 时间浪费。

那么能不能有多个进程来宏观一起来执行多个任务呢？

后来操作系统就具有了最早的并发能力：多进程并发，当一个进程阻塞的时候，切换到另外等待执行的进程，这样就能尽量把 CPU 利用起来，CPU 就不浪费了。

**多进程 / 线程时代有了调度器需求**

![image-20220117211807937](https://www.mszlu.com/assets/image-20220117211807937-16424254885341.66774905.png)

在多进程 / 多线程的操作系统中，就解决了阻塞的问题，因为一个进程阻塞 cpu 可以立刻切换到其他进程中去执行，而且调度 cpu 的算法可以保证在运行的进程都可以被分配到 cpu 的运行时间片。这样从宏观来看，似乎多个进程是在同时被运行。

但新的问题就又出现了，进程拥有太多的资源，进程的创建、切换、销毁，都会占用很长的时间，CPU 虽然利用起来了，但如果进程过多，CPU 有很大的一部分都被用来进行进程调度了。

怎么才能提高 CPU 的利用率呢？

对于 Linux 操作系统来讲，cpu 对进程的态度和线程的态度是一样的。

![image-20220117211843478](https://www.mszlu.com/assets/image-20220117211843478.e4fd0a25.png)

很明显，CPU 调度切换的是进程和线程。尽管线程看起来很美好，但实际上多线程开发设计会变得更加复杂，要考虑很多同步竞争等问题，如锁、竞争冲突等。

**协程来提高 CPU 利用率**

多进程、多线程已经提高了系统的并发能力，但是在当今互联网高并发场景下，为每个任务都创建一个线程是不现实的，因为会消耗大量的内存 (进程虚拟内存会占用 4GB [32 位操作系统], 而线程也要大约 4MB)。

大量的进程 / 线程出现了新的问题

- 高内存占用
- 调度的高消耗 CPU

好了，然后工程师们就发现，其实一个线程分为 “内核态 “线程和” 用户态 “线程。

一个 “用户态线程” 必须要绑定一个 “内核态线程”，但是 CPU 并不知道有 “用户态线程” 的存在，它只知道它运行的是一个 “内核态线程”(Linux 的 PCB 进程控制块)。

![image-20220117211943753](https://www.mszlu.com/assets/image-20220117211943753.abbd09f5.png)

我们再去细化去分类一下，内核线程依然叫 “线程 (thread)”，用户线程叫 “协程 (co-routine)”.

![image-20220117212046043](https://www.mszlu.com/assets/image-20220117212046043-16424256466862.9fdd802b.png)

既然一个协程 (co-routine) 可以绑定一个线程 (thread)，那么能不能多个协程 (co-routine) 绑定一个或者多个线程 (thread) 上呢。

有 三种协程和线程的映射关系：

1. N:1 关系

	N 个协程绑定 1 个线程，优点就是协程在用户态线程即完成切换，不会陷入到内核态，这种切换非常的轻量快速。但也有很大的缺点，1 个进程的所有协程都绑定在 1 个线程上

	缺点：

	- 某个程序用不了硬件的多核加速能力
	- 一旦某协程阻塞，造成线程阻塞，本进程的其他协程都无法执行了，根本就没有并发的能力了。

	![image-20220117212220768](https://www.mszlu.com/assets/image-20220117212220768-16424257416353.9edcd1c8.png)

2. 1:1 关系

	1 个协程绑定 1 个线程，这种最容易实现。协程的调度都由 CPU 完成了，不存在 N:1 缺点，

	缺点：

	- 协程的创建、删除和切换的代价都由 CPU 完成，有点略显昂贵了。

	![image-20220117212310553](https://www.mszlu.com/assets/image-20220117212310553.f18ea8e7.png)

3. M:N 关系

	M 个协程绑定 N 个线程，是 N:1 和 1:1 类型的结合，克服了以上 2 种模型的缺点，但实现起来最为复杂。

	![image-20220117212351050](https://www.mszlu.com/assets/image-20220117212351050.8c83a20a.png)

	协程跟线程是有区别的，线程由 CPU 调度是抢占式的，协程由用户态调度是协作式的，一个协程让出 CPU 后，才执行下一个协程。

### 8.2 Go 语言的协程 goroutine

Go 为了提供更容易使用的并发方法，使用了 goroutine 和 channel。goroutine 来自协程的概念，让一组可复用的函数运行在一组线程之上，即使有协程阻塞，该线程的其他协程也可以被 runtime 调度，转移到其他可运行的线程上。最关键的是，程序员看不到这些底层的细节，这就降低了编程的难度，提供了更容易的并发。

Go 中，协程被称为 goroutine，它非常轻量，一个 goroutine 只占几 KB，并且这几 KB 就足够 goroutine 运行完，这就能在有限的内存空间内支持大量 goroutine，支持了更多的并发。虽然一个 goroutine 的栈只占几 KB，但实际是可伸缩的，如果需要更多内容，runtime 会自动为 goroutine 分配。

Goroutine 特点：

- 占用内存更小（几 kb）
- 调度更灵活 (runtime 调度)

**被废弃的 goroutine 调度器**

Go 目前使用的调度器是 2012 年重新设计的，因为之前的调度器性能存在问题，所以使用 4 年就被废弃了，那么我们先来分析一下被废弃的调度器是如何运作的？

![image-20220117212626926](https://www.mszlu.com/assets/image-20220117212626926.87532200.png)

来看看被废弃的 golang 调度器是如何实现的？

![image-20220117212644414](https://www.mszlu.com/assets/image-20220117212644414.c4c8d70e.png)

M 想要执行、放回 G 都必须访问全局 G 队列，并且 M 有多个，即多线程访问同一资源需要加锁进行保证互斥 / 同步，所以全局 G 队列是有互斥锁进行保护的。

老调度器有几个缺点：

- 创建、销毁、调度 G 都需要每个 M 获取锁，这就形成了激烈的锁竞争。
- M 转移 G 会造成延迟和额外的系统负载。比如当 G 中包含创建新协程的时候，M 创建了 G’，为了继续执行 G，需要把 G’交给 M’执行，也造成了很差的局部性，因为 G’和 G 是相关的，最好放在 M 上执行，而不是其他 M’。
- 系统调用 (CPU 在 M 之间的切换) 导致频繁的线程阻塞和取消阻塞操作增加了系统开销。

### 8.3 Goroutine 调度器的 GMP 模型的设计思想

新调度器中，除了 M (thread) 和 G (goroutine)，又引进了 P (Processor)。

![image-20220117212938198](https://www.mszlu.com/assets/image-20220117212938198.a5cbcebd.png)

Processor，它包含了运行 goroutine 的资源，如果线程想运行 goroutine，必须先获取 P，P 中还包含了可运行的 G 队列。

**GMP 模型**

在 Go 中，线程是运行 goroutine 的实体，调度器的功能是把可运行的 goroutine 分配到工作线程上。

![image-20220117213038841](https://www.mszlu.com/assets/image-20220117213038841.1812b796.png)

- 全局队列（Global Queue）：存放等待运行的 G。
- P 的本地队列：同全局队列类似，存放的也是等待运行的 G，存的数量有限，不超过 256 个。新建 G’时，G’优先加入到 P 的本地队列，如果队列满了，则会把本地队列中一半的 G 移动到全局队列。
- P 列表：所有的 P 都在程序启动时创建，并保存在数组中，最多有 GOMAXPROCS(可配置) 个。
- M：线程想运行任务就得获取 P，从 P 的本地队列获取 G，P 队列为空时，M 也会尝试从全局队列拿一批 G 放到 P 的本地队列，或从其他 P 的本地队列偷一半放到自己 P 的本地队列。M 运行 G，G 执行之后，M 会从 P 获取下一个 G，不断重复下去。

Goroutine 调度器和 OS 调度器是通过 M 结合起来的，每个 M 都代表了 1 个内核线程，OS 调度器负责把内核线程分配到 CPU 的核上执行。

**有关 P 和 M 的个数问题**

1. P 的数量：

- 由启动时环境变量 $GOMAXPROCS 或者是由 runtime 的方法 GOMAXPROCS() 决定。这意味着在程序执行的任意时刻都只有 $GOMAXPROCS 个 goroutine 在同时运行。

1. M 的数量:

- go 语言本身的限制：go 程序启动时，会设置 M 的最大数量，默认 10000. 但是内核很难支持这么多的线程数，所以这个限制可以忽略。
- runtime/debug 中的 SetMaxThreads 函数，设置 M 的最大数量
- 一个 M 阻塞了，会创建新的 M。

M 与 P 的数量没有绝对关系，一个 M 阻塞，P 就会去创建或者切换另一个 M，所以，即使 P 的默认数量是 1，也有可能会创建很多个 M 出来。

**P 和 M 何时会被创建**

1. P 何时创建：在确定了 P 的最大数量 n 后，运行时系统会根据这个数量创建 n 个 P。
2. M 何时创建：没有足够的 M 来关联 P 并运行其中的可运行的 G。比如所有的 M 此时都阻塞住了，而 P 中还有很多就绪任务，就会去寻找空闲的 M，而没有空闲的，就会去创建新的 M。

**调度器的设计策略**

复用线程：避免频繁的创建、销毁线程，而是对线程的复用。

- work stealing 机制

当本线程无可运行的 G 时，尝试从其他线程绑定的 P 偷取 G，而不是销毁线程。

- hand off 机制

当本线程因为 G 进行系统调用阻塞时，线程释放绑定的 P，把 P 转移给其他空闲的线程执行。

利用并行：GOMAXPROCS 设置 P 的数量，最多有 GOMAXPROCS 个线程分布在多个 CPU 上同时运行。GOMAXPROCS 也限制了并发的程度，比如 GOMAXPROCS = 核数/2，则最多利用了一半的 CPU 核进行并行。

抢占：在 coroutine 中要等待一个协程主动让出 CPU 才执行下一个协程，在 Go 中，一个 goroutine 最多占用 CPU 10ms，防止其他 goroutine 被饿死，这就是 goroutine 不同于 coroutine 的一个地方。

全局 G 队列：在新的调度器中依然有全局 G 队列，但功能已经被弱化了，当 M 执行 work stealing 从其他 P 偷不到 G 时，它可以从全局 G 队列获取 G。

**go func () 调度流程**

![image-20220117213303500](https://www.mszlu.com/assets/image-20220117213303500.cec19e53.png)

从上图我们可以分析出几个结论：

1. 我们通过 go func () 来创建一个 goroutine；
2. 有两个存储 G 的队列，一个是局部调度器 P 的本地队列、一个是全局 G 队列。新创建的 G 会先保存在 P 的本地队列中，如果 P 的本地队列已经满了就会保存在全局的队列中；
3. G 只能运行在 M 中，一个 M 必须持有一个 P，M 与 P 是 1：1 的关系。M 会从 P 的本地队列弹出一个可执行状态的 G 来执行，如果 P 的本地队列为空，就会想其他的 MP 组合偷取一个可执行的 G 来执行；
4. 一个 M 调度 G 执行的过程是一个循环机制；
5. 当 M 执行某一个 G 时候如果发生了 syscall 或则其余阻塞操作，M 会阻塞，如果当前有一些 G 在执行，runtime 会把这个线程 M 从 P 中摘除 (detach)，然后再创建一个新的操作系统的线程 (如果有空闲的线程可用就复用空闲线程) 来服务于这个 P；
6. 当 M 系统调用结束时候，这个 G 会尝试获取一个空闲的 P 执行，并放入到这个 P 的本地队列。如果获取不到 P，那么这个线程 M 变成休眠状态， 加入到空闲线程中，然后这个 G 会被放入全局队列中。

**调度器的生命周期**

![image-20220117213542371](https://www.mszlu.com/assets/image-20220117213542371.0557f7c8.png)



## 9. context包

并发是Go语言编程的特色，有效的管理并发对构建稳定健壮的程序至关重要，在Golang中，提供了context标准库，用于管理goroutine的生命周期，传递上下文，控制超时取消等操作。

我们先来看一个案例，体会一下context的作用：

> 假设我们需要从多个api接口中并发的获取数据，如果某个接口超时，就将其请求取消

```go
func main() {
	http.HandleFunc("/users", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("users"))
	})
	http.HandleFunc("/products", func(w http.ResponseWriter, r *http.Request) {
		time.Sleep(5 * time.Second)
		w.Write([]byte("products"))
	})
	http.HandleFunc("/orders", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("orders"))
	})
	err := http.ListenAndServe(":80", nil)
	if err != nil {
		log.Fatalln(err)
	}
}
```



```go
func main() {
	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()
	urls := []string{
		"http://api.mszlu.com/users",
		"http://api.mszlu.com/products",
		"http://api.mszlu.com/orders",
	}
	results := make(chan string)
	for _, url := range urls {
		go fetchAPI(ctx, url, results)
	}
	for range urls {
		fmt.Println(<-results)
	}
}

func fetchAPI(ctx context.Context, url string, results chan string) {
	req, err := http.NewRequestWithContext(ctx, "GET", url, nil)
	if err != nil {
		results <- fmt.Sprintf("create request error，url=%s,err=%v", url, err)
		return
	}
	client := http.DefaultClient
	response, err := client.Do(req)
	if err != nil {
		results <- fmt.Sprintf("making request error，url=%s,err=%v", url, err)
		return
	}
	defer response.Body.Close()
	results <- fmt.Sprintf("response content, url=%s, status=%d", url, response.StatusCode)
}
```



### 创建根context

- `context.Background()`：可以创建一个`非nil`，`空值`的Context对象，不能发出取消信号，线程安全，通常作为`根Context`，用于派生其他Context。

- `context.TODO()`: 和`context.Background()`一样，一般做为占位符存在。

	![img](https://www.mszlu.com/assets/b42cfe76176debdf47d04a589f120f37.7b36351c.png)

> 当一个context被取消后，其派生的context会同样被取消

> context是线程安全的

### value context

> context可以在多个goroutines之间传值，`context.WithValue()`用来在context中存储键值对，它返回一个新的Context，这个新的Context携带了一个键值对。

```go
func main() {
	ctx := context.Background()
	ctx = context.WithValue(ctx, "userId", 123)
	//这样传参 可以避免显示传递值
	go performTask(ctx)
	time.Sleep(time.Second)
}

func performTask(ctx context.Context) {
	userId := ctx.Value("userId")
	fmt.Println("userId:", userId)
    //ctx = context.WithValue(ctx, "userId", newValue) 多个协程中修改同一个key，会引起数据竟态问题
}
```



### cancel Context

> 通过`context.WithCancel`创建的context可以发出取消信号。
>
> 通过取消信号，我们可以终止相关的goroutines，从而避免资源泄露（未能正确释放导致无法回收）。

```go
func main() {
	ctx, cancel := context.WithCancel(context.Background())
	go performTask(ctx)
	time.Sleep(2 * time.Second)
	cancel()
	time.Sleep(1 * time.Second)
}

func performTask(ctx context.Context) {
	for {
		select {
		case <-ctx.Done():
			fmt.Println("Task cancelled")
			return
		default:
			// Perform task operation
			fmt.Println("Performing task...")
			time.Sleep(500 * time.Millisecond)
		}
	}
}
```



> `context.WithoutCancel()`创建的context在parentContext被取消时，其不会被取消

```go
func main() {
	ctx, cancel := context.WithCancel(context.Background())
	ctx = context.WithoutCancel(ctx)
	go performTask(ctx)
	time.Sleep(2 * time.Second)
	cancel()
	time.Sleep(5 * time.Second)
}

func performTask(ctx context.Context) {
	for {
		select {
		case <-ctx.Done():
			fmt.Println("Task cancelled")
			return
		default:
			// Perform task operation
			fmt.Println("Performing task...")
			time.Sleep(500 * time.Millisecond)
		}
	}
}
```



### Timeout Context

> `context.WithTimeout`用于创建一个带有超时的上下文，这个上下文会在指定的超时时间之后自动取消

context有四个方法：

- Deadline() : 返回超时的截止时间
- Done()： 上下文完成时或者取消后会调用
- Err()：Done()返回后，使用Err可以获得结束原因
- Value()：获取键值

> **注意：**如果父 `context` 有一个截止时间，那么子 `context` 的截止时间将是父 `context` 的截止时间和子 `context` 自己的截止时间中较早的那个。

```go
func main() {
    // 创建一个带有超时的上下文
    ctx, cancel := context.WithTimeout(context.Background(), 2*time.Second)
    defer cancel() // 在程序结束前调用 cancel 函数释放资源

    // 启动一个任务
    go task(ctx)

    // 等待一段时间，超时后任务会被取消
    time.Sleep(3 * time.Second)
    fmt.Println("Main goroutine: Done")
}

func task(ctx context.Context) {
    select {
    case <-time.After(3 * time.Second):
        fmt.Println("Task: Finished")
    case <-ctx.Done():
        fmt.Println("Task: Context cancelled or timed out")
    }
}
```



> `context.WithTimeoutCause()`和`context.WithTimeout()`区别就是错误信息可以自定义

### Deadline Context

> `context.WithDeadline()`和`context.WithTimeout`一样，区别在于时间的表示方式，`context.WithDeadline()`时间需要时一个具体的时刻

```go
func main() {
    //适合用在需要在某个时间之前终止操作的场景
 ctx, cancel := context.WithDeadline(context.Background(), time.Now().Add(2*time.Second))
 defer cancel()

 go performTask(ctx)

 time.Sleep(3 * time.Second)
}

func performTask(ctx context.Context) {
 select {
 case <-ctx.Done():
  fmt.Println("Task completed or deadline exceeded:", ctx.Err())
  return
 }
}
```

> `context.WithDeadlineCause()`这个函数和`WithDeadline`用法一样，唯一的区别是可以自定义错误信息。

### AfterFunc

> `context.AfterFunc`是在`parent contenxt`完成或者取消后，执行一个函数，会返回一个`stop`函数，用于停止`parent contenxt`和func的关联，返回true代表成功取消，false代表context已经完成或者取消。

```go
func main() {
	ctx, cancel := context.WithTimeout(context.Background(), 2*time.Second)
	defer cancel() // 确保在函数结束时取消context
	// 设置一个2秒后执行的函数
	stop := context.AfterFunc(ctx, func() {
		fmt.Println("AfterFunc executed")
	})
	go performTask(ctx, stop)
	// 阻塞主goroutine，防止程序立即退出
	time.Sleep(3 * time.Second)
}

func performTask(ctx context.Context, stop func() bool) {
	select {
	case <-ctx.Done():
		fmt.Println("Context canceled:", ctx.Err())
		fmt.Println("stop:", stop())
	}
}
```



### 注意的一些问题

- `不传递上下文：`如果一个函数创建了上下文，但并没有传递给其他函数或协程，这些函数和协程无法响应上下文相关的处理操作。
- `忘记调用取消函数：`使用有取消函数的上下文时，记得取消
- `协程泄露：`有上下文的协程需要检查Done channel，当接收到到信号时及时清理资源和退出
- `过度使用context.Background：`没有取消和超时功能，很可能引起问题
- `传递nil的上下文：`不要传递nil的上下文，会导致panic
- `阻塞调用：`应该将阻塞操作（比如IO）包装成使用上下文检查的调用，可以避免被挂起
- `过度使用上下文：`上下文也并不是所有场景都使用，比如处理全局资源或者共享状态等，可能更使用使用锁或者channel
- `上下文存储在结构体中`：应该将context显式的传递给需要的函数，否则可能会引起数据竞态，生命周期管理等问题

# 网络编程

##  1. 互联网协议介绍

互联网的核心是一系列协议，总称为”互联网协议”（Internet Protocol Suite），正是这一些协议规定了电脑如何连接和组网。我们理解了这些协议，就理解了互联网的原理。

### 1.1 互联网分层模型

互联网的逻辑实现被分为好几层。每一层都有自己的功能，就像建筑物一样，每一层都靠下一层支持。用户接触到的只是最上面的那一层，根本不会感觉到下面的几层。要理解互联网就需要自下而上理解每一层的实现的功能。

![image-20220116002821959](https://www.mszlu.com/assets/image-20220116002821959.dcbb4d51.png)

互联网按照不同的模型划分会有不用的分层，但是不论按照什么模型去划分，越往上的层越靠近用户，越往下的层越靠近硬件。

在软件开发中我们使用最多的是上图中将互联网划分为五个分层的模型：

1. 物理层
2. 数据链路层
3. 网络层
4. 传输层
5. 应用层

**物理层**

我们的电脑要与外界互联网通信，需要先把电脑连接网络，我们可以用双绞线、光纤、无线电波等方式。这就叫做”实物理层”，它就是把电脑连接起来的物理手段。它主要规定了网络的一些电气特性，作用是负责传送0和1的电信号。

**数据链路层**

单纯的0和1没有任何意义，所以我们使用者会为其赋予一些特定的含义，规定解读电信号的方式：例如：多少个电信号算一组？每个信号位有何意义？这就是”数据链接层”的功能，它在”物理层”的上方，确定了物理层传输的0和1的分组方式及代表的意义。早期的时候，每家公司都有自己的电信号分组方式。逐渐地，一种叫做”以太网”（Ethernet）的协议，占据了主导地位。

以太网规定，一组电信号构成一个数据包，叫做”帧”（Frame）。每一帧分成两个部分：标头（Head）和数据（Data）。其中”标头”包含数据包的一些说明项，比如发送者、接收者、数据类型等等；”数据”则是数据包的具体内容。”标头”的长度，固定为18字节。”数据”的长度，最短为46字节，最长为1500字节。因此，整个”帧”最短为64字节，最长为1518字节。如果数据很长，就必须分割成多个帧进行发送。

那么，发送者和接收者是如何标识呢？以太网规定，连入网络的所有设备都必须具有”网卡”接口。数据包必须是从一块网卡，传送到另一块网卡。网卡的地址，就是数据包的发送地址和接收地址，这叫做MAC地址。每块网卡出厂的时候，都有一个全世界独一无二的MAC地址，长度是48个二进制位，通常用12个十六进制数表示。前6个十六进制数是厂商编号，后6个是该厂商的网卡流水号。有了MAC地址，就可以定位网卡和数据包的路径了。

我们会通过ARP协议来获取接收方的MAC地址，有了MAC地址之后，如何把数据准确的发送给接收方呢？其实这里以太网采用了一种很”原始”的方式，它不是把数据包准确送到接收方，而是向本网络内所有计算机都发送，让每台计算机读取这个包的”标头”，找到接收方的MAC地址，然后与自身的MAC地址相比较，如果两者相同，就接受这个包，做进一步处理，否则就丢弃这个包。这种发送方式就叫做”广播”（broadcasting）。

**网络层**

按照以太网协议的规则我们可以依靠MAC地址来向外发送数据。理论上依靠MAC地址，你电脑的网卡就可以找到身在世界另一个角落的某台电脑的网卡了，但是这种做法有一个重大缺陷就是以太网采用广播方式发送数据包，所有成员人手一”包”，不仅效率低，而且发送的数据只能局限在发送者所在的子网络。也就是说如果两台计算机不在同一个子网络，广播是传不过去的。这种设计是合理且必要的，因为如果互联网上每一台计算机都会收到互联网上收发的所有数据包，那是不现实的。

因此，必须找到一种方法区分哪些MAC地址属于同一个子网络，哪些不是。如果是同一个子网络，就采用广播方式发送，否则就采用”路由”方式发送。这就导致了”网络层”的诞生。它的作用是引进一套新的地址，使得我们能够区分不同的计算机是否属于同一个子网络。这套地址就叫做”网络地址”，简称”网址”。

“网络层”出现以后，每台计算机有了两种地址，一种是MAC地址，另一种是网络地址。两种地址之间没有任何联系，MAC地址是绑定在网卡上的，网络地址则是网络管理员分配的。网络地址帮助我们确定计算机所在的子网络，MAC地址则将数据包送到该子网络中的目标网卡。因此，从逻辑上可以推断，必定是先处理网络地址，然后再处理MAC地址。

规定网络地址的协议，叫做IP协议。它所定义的地址，就被称为IP地址。目前，广泛采用的是IP协议第四版，简称IPv4。IPv4这个版本规定，网络地址由32个二进制位组成，我们通常习惯用分成四段的十进制数表示IP地址，从0.0.0.0一直到255.255.255.255。

根据IP协议发送的数据，就叫做IP数据包。IP数据包也分为”标头”和”数据”两个部分：”标头”部分主要包括版本、长度、IP地址等信息，”数据”部分则是IP数据包的具体内容。IP数据包的”标头”部分的长度为20到60字节，整个数据包的总长度最大为65535字节。

**传输层**

有了MAC地址和IP地址，我们已经可以在互联网上任意两台主机上建立通信。但问题是同一台主机上会有许多程序都需要用网络收发数据，比如QQ和浏览器这两个程序都需要连接互联网并收发数据，我们如何区分某个数据包到底是归哪个程序的呢？也就是说，我们还需要一个参数，表示这个数据包到底供哪个程序（进程）使用。这个参数就叫做”端口”（port），它其实是每一个使用网卡的程序的编号。每个数据包都发到主机的特定端口，所以不同的程序就能取到自己所需要的数据。

“端口”是0到65535之间的一个整数，正好16个二进制位。0到1023的端口被系统占用，用户只能选用大于1023的端口。有了IP和端口我们就能实现唯一确定互联网上一个程序，进而实现网络间的程序通信。

我们必须在数据包中加入端口信息，这就需要新的协议。最简单的实现叫做UDP协议，它的格式几乎就是在数据前面，加上端口号。UDP数据包，也是由”标头”和”数据”两部分组成：”标头”部分主要定义了发出端口和接收端口，”数据”部分就是具体的内容。UDP数据包非常简单，”标头”部分一共只有8个字节，总长度不超过65,535字节，正好放进一个IP数据包。

UDP协议的优点是比较简单，容易实现，但是缺点是可靠性较差，一旦数据包发出，无法知道对方是否收到。为了解决这个问题，提高网络可靠性，TCP协议就诞生了。TCP协议能够确保数据不会遗失。它的缺点是过程复杂、实现困难、消耗较多的资源。TCP数据包没有长度限制，理论上可以无限长，但是为了保证网络的效率，通常TCP数据包的长度不会超过IP数据包的长度，以确保单个TCP数据包不必再分割。

**应用层**

应用程序收到”传输层”的数据，接下来就要对数据进行解包。由于互联网是开放架构，数据来源五花八门，必须事先规定好通信的数据格式，否则接收方根本无法获得真正发送的数据内容。”应用层”的作用就是规定应用程序使用的数据格式，例如我们TCP协议之上常见的Email、HTTP、FTP等协议，这些协议就组成了互联网协议的应用层。

如下图所示，发送方的HTTP数据经过互联网的传输过程中会依次添加各层协议的标头信息，接收方收到数据包之后再依次根据协议解包得到数据。

![image-20220116003106034](https://www.mszlu.com/assets/image-20220116003106034.19968e6c.png)

## 2. socket编程

Socket是BSD UNIX的进程通信机制，通常也称作”套接字”，用于描述IP地址和端口，是一个通信链的句柄。Socket可以理解为TCP/IP网络的API，它定义了许多函数或例程，程序员可以用它们来开发TCP/IP网络上的应用程序。电脑上运行的应用程序通常通过”套接字”向网络发出请求或者应答网络请求。

### 2.1 socket图解

Socket是应用层与TCP/IP协议族通信的中间软件抽象层。在设计模式中，Socket其实就是一个门面模式，它把复杂的TCP/IP协议族隐藏在Socket后面，对用户来说只需要调用Socket规定的相关函数，让Socket去组织符合指定的协议数据然后进行通信。

![image-20220116004006489](https://www.mszlu.com/assets/image-20220116004006489.37318919.png)

- Socket又称“套接字”，应用程序通常通过“套接字”向网络发出请求或者应答网络请求
- 常用的Socket类型有两种：流式Socket和数据报式Socket，流式是一种面向连接的Socket，针对于面向连接的TCP服务应用，数据报式Socket是一种无连接的Socket，针对于无连接的UDP服务应用
- TCP：比较靠谱，面向连接，比较慢
- UDP：不是太靠谱，比较快

### 2.2 TCP编程

TCP/IP(Transmission Control Protocol/Internet Protocol) 即传输控制协议/网间协议，是一种面向连接（连接导向）的、可靠的、基于字节流的传输层（Transport layer）通信协议，因为是面向连接的协议，数据像水流一样传输，会存在`黏包`问题。

**TCP服务端**

一个TCP服务端可以同时连接很多个客户端，例如世界各地的用户使用自己电脑上的浏览器访问淘宝网。因为Go语言中创建多个goroutine实现并发非常方便和高效，所以我们可以每建立一次连接就创建一个goroutine去处理。

TCP服务端程序的处理流程：

1. 监听端口
2. 接收客户端请求建立连接
3. 创建goroutine处理连接。

我们使用Go语言的net包实现的TCP服务端代码如下：

```go
// 处理函数
func process(conn net.Conn) {
    defer conn.Close() // 关闭连接
    for {
        reader := bufio.NewReader(conn)
        var buf [128]byte
        n, err := reader.Read(buf[:]) // 读取数据
        if err != nil {
            fmt.Println("read from client failed, err:", err)
            break
        }
        recvStr := string(buf[:n])
        fmt.Println("收到client端发来的数据：", recvStr)
        conn.Write([]byte(recvStr)) // 发送数据
    }
}

func main() {
    listen, err := net.Listen("tcp", "127.0.0.1:20000")
    if err != nil {
        fmt.Println("listen failed, err:", err)
        return
    }
    for {
        conn, err := listen.Accept() // 建立连接
        if err != nil {
            fmt.Println("accept failed, err:", err)
            continue
        }
        go process(conn) // 启动一个goroutine处理连接
    }
}
```



**TCP客户端**

一个TCP客户端进行TCP通信的流程如下：

1. 建立与服务端的连接
2. 进行数据收发
3. 关闭连接

使用Go语言的net包实现的TCP客户端代码如下：

```go
// 客户端
func main() {
    conn, err := net.Dial("tcp", "127.0.0.1:20000")
    if err != nil {
        fmt.Println("err :", err)
        return
    }
    defer conn.Close() // 关闭连接
    inputReader := bufio.NewReader(os.Stdin)
    for {
        input, _ := inputReader.ReadString('\n') // 读取用户输入
        inputInfo := strings.Trim(input, "\r\n")
        if strings.ToUpper(inputInfo) == "Q" { // 如果输入q就退出
            return
        }
        _, err = conn.Write([]byte(inputInfo)) // 发送数据
        if err != nil {
            return
        }
        buf := [512]byte{}
        n, err := conn.Read(buf[:])
        if err != nil {
            fmt.Println("recv failed, err:", err)
            return
        }
        fmt.Println(string(buf[:n]))
    }
}
```



### 2.3 UDP编程

UDP协议（User Datagram Protocol）中文名称是用户数据报协议，是OSI（Open System Interconnection，开放式系统互联）参考模型中一种无连接的传输层协议，不需要建立连接就能直接进行数据发送和接收，属于不可靠的、没有时序的通信，但是UDP协议的实时性比较好，通常用于视频直播相关领域。

**UDP服务端**

使用Go语言的net包实现的UDP服务端代码如下：

```go
// UDP server端
func main() {
    listen, err := net.ListenUDP("udp", &net.UDPAddr{
        IP:   net.IPv4(0, 0, 0, 0),
        Port: 30000,
    })
    if err != nil {
        fmt.Println("listen failed, err:", err)
        return
    }
    defer listen.Close()
    for {
        var data [1024]byte
        n, addr, err := listen.ReadFromUDP(data[:]) // 接收数据
        if err != nil {
            fmt.Println("read udp failed, err:", err)
            continue
        }
        fmt.Printf("data:%v addr:%v count:%v\n", string(data[:n]), addr, n)
        _, err = listen.WriteToUDP(data[:n], addr) // 发送数据
        if err != nil {
            fmt.Println("write to udp failed, err:", err)
            continue
        }
    }
}
```



**UDP客户端**

使用Go语言的net包实现的UDP客户端代码如下：

```go
// UDP 客户端
func main() {
    socket, err := net.DialUDP("udp", nil, &net.UDPAddr{
        IP:   net.IPv4(0, 0, 0, 0),
        Port: 30000,
    })
    if err != nil {
        fmt.Println("连接服务端失败，err:", err)
        return
    }
    defer socket.Close()
    sendData := []byte("Hello server")
    _, err = socket.Write(sendData) // 发送数据
    if err != nil {
        fmt.Println("发送数据失败，err:", err)
        return
    }
    data := make([]byte, 4096)
    n, remoteAddr, err := socket.ReadFromUDP(data) // 接收数据
    if err != nil {
        fmt.Println("接收数据失败，err:", err)
        return
    }
    fmt.Printf("recv:%v addr:%v count:%v\n", string(data[:n]), remoteAddr, n)
}
```



## 3. http编程

### 3.1 web工作流程

- Web服务器的工作原理可以简单地归纳为
	- 客户机通过TCP/IP协议建立到服务器的TCP连接
	- 客户端向服务器发送HTTP协议请求包，请求服务器里的资源文档
	- 服务器向客户机发送HTTP协议应答包，如果请求的资源包含有动态语言的内容，那么服务器会调用动态语言的解释引擎负责处理“动态内容”，并将处理得到的数据返回给客户端
	- 客户机与服务器断开。由客户端解释HTML文档，在客户端屏幕上渲染图形结果

### 3.2 HTTP协议

- 超文本传输协议(HTTP，HyperText Transfer Protocol)是互联网上应用最为广泛的一种网络协议，它详细规定了浏览器和万维网服务器之间互相通信的规则，通过因特网传送万维网文档的数据传送协议
- HTTP协议通常承载于TCP协议之上

**HTTP服务端**

```go
package main

import (
    "fmt"
    "net/http"
)

func main() {
    //http://127.0.0.1:8000/go
    // 单独写回调函数
    http.HandleFunc("/go", myHandler)
    // addr：监听的地址
    // handler：回调函数
    http.ListenAndServe("127.0.0.1:8000", nil)
}

// handler函数
func myHandler(w http.ResponseWriter, r *http.Request) {
    fmt.Println(r.RemoteAddr, "连接成功")
    // 请求方式：GET POST DELETE PUT UPDATE
    fmt.Println("method:", r.Method)
    // /go
    fmt.Println("url:", r.URL.Path)
    fmt.Println("header:", r.Header)
    fmt.Println("body:", r.Body)
    // 回复
    w.Write([]byte("你好，码神之路"))
}
```



**HTTP客户端**

```go
package main

import (
    "fmt"
    "io"
    "net/http"
)

func main() {
    //resp, _ := http.Get("http://www.baidu.com")
    //fmt.Println(resp)
    resp, _ := http.Get("http://127.0.0.1:8000/go")
    defer resp.Body.Close()
    // 200 OK
    fmt.Println(resp.Status)
    fmt.Println(resp.Header)

    buf := make([]byte, 1024)
    for {
        // 接收服务端信息
        n, err := resp.Body.Read(buf)
        if err != nil && err != io.EOF {
            fmt.Println(err)
            return
        } else {
            fmt.Println("读取完毕")
            res := string(buf[:n])
            fmt.Println(res)
            break
        }
    }
}
```



## 4. WebSocket编程

- WebSocket是一种在单个TCP连接上进行全双工通信的协议
- WebSocket使得客户端和服务器之间的数据交换变得更加简单，允许服务端主动向客户端推送数据
- 在WebSocket API中，浏览器和服务器只需要完成一次握手，两者之间就直接可以创建持久性的连接，并进行双向数据传输
- 需要安装第三方包：
	- cmd中：go get -u -v github.com/gorilla/websocket

### 4.1 聊天室的小例子

在同一级目录下新建四个go文件`connection.go|data.go|hub.go|server.go`

**运行**

```go
go run server.go hub.go data.go connection.go
```

运行之后执行local.html文件

##### server.go文件代码

```go
package main

import (
    "fmt"
    "net/http"

    "github.com/gorilla/mux"
)

func main() {
    router := mux.NewRouter()
    go h.run()
    router.HandleFunc("/ws", myws)
    if err := http.ListenAndServe("127.0.0.1:8080", router); err != nil {
        fmt.Println("err:", err)
    }
}
```



##### hub.go文件代码

```go
package main

import "encoding/json"

var h = hub{
    c: make(map[*connection]bool),
    u: make(chan *connection),
    b: make(chan []byte),
    r: make(chan *connection),
}

type hub struct {
    c map[*connection]bool
    b chan []byte
    r chan *connection
    u chan *connection
}

func (h *hub) run() {
    for {
        select {
        case c := <-h.r:
            h.c[c] = true
            c.data.Ip = c.ws.RemoteAddr().String()
            c.data.Type = "handshake"
            c.data.UserList = user_list
            data_b, _ := json.Marshal(c.data)
            c.sc <- data_b
        case c := <-h.u:
            if _, ok := h.c[c]; ok {
                delete(h.c, c)
                close(c.sc)
            }
        case data := <-h.b:
            for c := range h.c {
                select {
                case c.sc <- data:
                default:
                    delete(h.c, c)
                    close(c.sc)
                }
            }
        }
    }
}
```



##### data.go文件代码

```go
package main

type Data struct {
    Ip       string   `json:"ip"`
    User     string   `json:"user"`
    From     string   `json:"from"`
    Type     string   `json:"type"`
    Content  string   `json:"content"`
    UserList []string `json:"user_list"`
}
```



##### connection.go文件代码

```go
package main

import (
    "encoding/json"
    "fmt"
    "net/http"

    "github.com/gorilla/websocket"
)

type connection struct {
    ws   *websocket.Conn
    sc   chan []byte
    data *Data
}

var wu = &websocket.Upgrader{ReadBufferSize: 512,
    WriteBufferSize: 512, CheckOrigin: func(r *http.Request) bool { return true }}

func myws(w http.ResponseWriter, r *http.Request) {
    ws, err := wu.Upgrade(w, r, nil)
    if err != nil {
        return
    }
    c := &connection{sc: make(chan []byte, 256), ws: ws, data: &Data{}}
    h.r <- c
    go c.writer()
    c.reader()
    defer func() {
        c.data.Type = "logout"
        user_list = del(user_list, c.data.User)
        c.data.UserList = user_list
        c.data.Content = c.data.User
        data_b, _ := json.Marshal(c.data)
        h.b <- data_b
        h.r <- c
    }()
}

func (c *connection) writer() {
    for message := range c.sc {
        c.ws.WriteMessage(websocket.TextMessage, message)
    }
    c.ws.Close()
}

var user_list = []string{}

func (c *connection) reader() {
    for {
        _, message, err := c.ws.ReadMessage()
        if err != nil {
            h.r <- c
            break
        }
        json.Unmarshal(message, &c.data)
        switch c.data.Type {
        case "login":
            c.data.User = c.data.Content
            c.data.From = c.data.User
            user_list = append(user_list, c.data.User)
            c.data.UserList = user_list
            data_b, _ := json.Marshal(c.data)
            h.b <- data_b
        case "user":
            c.data.Type = "user"
            data_b, _ := json.Marshal(c.data)
            h.b <- data_b
        case "logout":
            c.data.Type = "logout"
            user_list = del(user_list, c.data.User)
            data_b, _ := json.Marshal(c.data)
            h.b <- data_b
            h.r <- c
        default:
            fmt.Print("========default================")
        }
    }
}

func del(slice []string, user string) []string {
    count := len(slice)
    if count == 0 {
        return slice
    }
    if count == 1 && slice[0] == user {
        return []string{}
    }
    var n_slice = []string{}
    for i := range slice {
        if slice[i] == user && i == count {
            return slice[:count]
        } else if slice[i] == user {
            n_slice = append(slice[:i], slice[i+1:]...)
            break
        }
    }
    fmt.Println(n_slice)
    return n_slice
}
```



##### local.html文件代码

```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <style>
        p {
            text-align: left;
            padding-left: 20px;
        }
    </style>
</head>
<body>
<div style="width: 800px;height: 600px;margin: 30px auto;text-align: center">
    <h1>演示聊天室</h1>
    <div style="width: 800px;border: 1px solid gray;height: 300px;">
        <div style="width: 200px;height: 300px;float: left;text-align: left;">
            <p><span>当前在线:</span><span id="user_num">0</span></p>
            <div id="user_list" style="overflow: auto;">
            </div>
        </div>
        <div id="msg_list" style="width: 598px;border:  1px solid gray; height: 300px;overflow: scroll;float: left;">
        </div>
    </div>
    <br>
    <textarea id="msg_box" rows="6" cols="50" onkeydown="confirm(event)"></textarea><br>
    <input type="button" value="发送" onclick="send()">
</div>
</body>
</html>
<script type="text/javascript">
    var uname = prompt('请输入用户名', 'user' + uuid(8, 16));
    var ws = new WebSocket("ws://127.0.0.1:8080/ws");
    ws.onopen = function () {
        var data = "系统消息：建立连接成功";
        listMsg(data);
    };
    ws.onmessage = function (e) {
        var msg = JSON.parse(e.data);
        var sender, user_name, name_list, change_type;
        switch (msg.type) {
            case 'system':
                sender = '系统消息: ';
                break;
            case 'user':
                sender = msg.from + ': ';
                break;
            case 'handshake':
                var user_info = {'type': 'login', 'content': uname};
                sendMsg(user_info);
                return;
            case 'login':
            case 'logout':
                user_name = msg.content;
                name_list = msg.user_list;
                change_type = msg.type;
                dealUser(user_name, change_type, name_list);
                return;
        }
        var data = sender + msg.content;
        listMsg(data);
    };
    ws.onerror = function () {
        var data = "系统消息 : 出错了,请退出重试.";
        listMsg(data);
    };
    function confirm(event) {
        var key_num = event.keyCode;
        if (13 == key_num) {
            send();
        } else {
            return false;
        }
    }
    function send() {
        var msg_box = document.getElementById("msg_box");
        var content = msg_box.value;
        var reg = new RegExp("\r\n", "g");
        content = content.replace(reg, "");
        var msg = {'content': content.trim(), 'type': 'user'};
        sendMsg(msg);
        msg_box.value = '';
    }
    function listMsg(data) {
        var msg_list = document.getElementById("msg_list");
        var msg = document.createElement("p");
        msg.innerHTML = data;
        msg_list.appendChild(msg);
        msg_list.scrollTop = msg_list.scrollHeight;
    }
    function dealUser(user_name, type, name_list) {
        var user_list = document.getElementById("user_list");
        var user_num = document.getElementById("user_num");
        while(user_list.hasChildNodes()) {
            user_list.removeChild(user_list.firstChild);
        }
        for (var index in name_list) {
            var user = document.createElement("p");
            user.innerHTML = name_list[index];
            user_list.appendChild(user);
        }
        user_num.innerHTML = name_list.length;
        user_list.scrollTop = user_list.scrollHeight;
        var change = type == 'login' ? '上线' : '下线';
        var data = '系统消息: ' + user_name + ' 已' + change;
        listMsg(data);
    }
    function sendMsg(msg) {
        var data = JSON.stringify(msg);
        ws.send(data);
    }
    function uuid(len, radix) {
        var chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'.split('');
        var uuid = [], i;
        radix = radix || chars.length;
        if (len) {
            for (i = 0; i < len; i++) uuid[i] = chars[0 | Math.random() * radix];
        } else {
            var r;
            uuid[8] = uuid[13] = uuid[18] = uuid[23] = '-';
            uuid[14] = '4';
            for (i = 0; i < 36; i++) {
                if (!uuid[i]) {
                    r = 0 | Math.random() * 16;
                    uuid[i] = chars[(i == 19) ? (r & 0x3) | 0x8 : r];
                }
            }
        }
        return uuid.join('');
    }
</script>
```

# 数据操作

## 1. go 操作mysql

### 1.1 表准备

```sql
CREATE TABLE `user` (
    `user_id` int(11) NOT NULL AUTO_INCREMENT,
    `username` varchar(255) DEFAULT NULL,
    `sex` varchar(255) DEFAULT NULL,
    `email` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`user_id`)
  ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
```



> mysql的前置知识，我们这里就不讲了，可自行去学习mysql教程

### 1.2 insert操作

> 首先，需要引入mysql驱动
>
> ```go
> _ "github.com/go-sql-driver/mysql"
> ```
>
> 1

```go
package main

import (
	"database/sql"
	"fmt"
	_ "github.com/go-sql-driver/mysql"
	"log"
	"time"
)
var DB *sql.DB
func init()  {
	db,err := sql.Open("mysql","root:root@tcp(localhost:3306)/go_learn")
	if err != nil {
		panic(err)
	}
	//最大空闲连接数，默认不配置，是2个最大空闲连接
	db.SetMaxIdleConns(5)
	//最大连接数，默认不配置，是不限制最大连接数
	db.SetMaxOpenConns(100)
	// 连接最大存活时间
	db.SetConnMaxLifetime(time.Minute * 3)
	//空闲连接最大存活时间
	db.SetConnMaxIdleTime(time.Minute * 1)
	err = db.Ping()
	if err != nil {
		log.Println("数据库连接失败")
		db.Close()
		panic(err)
	}
	DB = db

}

func save()  {
	r,err := DB.Exec("insert into user (username,sex,email) values(?,?,?)","test001","man","001@test.com")
	if err != nil {
		log.Println("执行sql语句出错")
		panic(err)
	}
	id, err := r.LastInsertId()
	if err != nil {
		panic(err)
	}
	fmt.Println("插入成功:",id)
}
func main()  {
	defer DB.Close()
	save()
}
```



### 1.3 Select操作

```go
type User struct {
	UserId   int    `db:"user_id"`
	Username string `db:"username"`
	Sex      string `db:"sex"`
	Email    string `db:"email"`
}

func query(id int)  (*User,error) {
	rows, err := DB.Query("select * from user where user_id=? limit 1", id)
	if err != nil{
		log.Println("查询出现错误:",err)
		return nil,errors.New(err.Error())
	}
	user := new(User)
	for rows.Next() {
		if err := rows.Scan(&user.UserId,&user.Username,&user.Sex,&user.Email); err != nil{
			log.Println("scan error:",err)
			return nil,errors.New(err.Error())
		}
	}
	return user,nil
}
```



### 1.4 Update

```go
func update(username string, id int)  {
	ret, err := DB.Exec("update user set username=? where user_id=?", username, id)
	if err != nil {
		log.Println("更新出现问题:",err)
		return
	}
	affected, _ := ret.RowsAffected()
	fmt.Println("更新成功的行数:",affected)
}
```



### 1.5 Delete

```go
func delete(id int)  {
	ret, err := DB.Exec("delete from user where user_id=?", id)
	if err != nil {
		log.Println("删除出现问题:",err)
		return
	}
	affected, _ := ret.RowsAffected()
	fmt.Println("删除成功的行数:",affected)
}
```



### 1.6 事务

mysql事务特性：

1. 原子性
2. 一致性
3. 隔离性
4. 持久性

```go
func insertTx(username string)  {
	tx, err := DB.Begin()
	if err != nil {
		log.Println("开启事务错误:",err)
		return
	}
	ret, err := tx.Exec("insert into user (username,sex,email) values (?,?,?)", username, "man", "test@test.com")
	if err != nil {
		log.Println("事务sql执行出错:",err)
		return
	}
	id, _ := ret.LastInsertId()
	fmt.Println("插入成功:",id)
	if username == "lisi" {
		fmt.Println("回滚...")
		_ = tx.Rollback()
	}else {
		_ = tx.Commit()
	}

}
```



## 2. go操作Redis

> redis不另行介绍，默认会，如果不了解，先去学习redis教程

安装：go get github.com/go-redis/redis/v8

```go
package main

import (
	"context"
	"fmt"
	"github.com/go-redis/redis/v8"
)

func main()  {
	ctx := context.Background()

	rdb := redis.NewClient(&redis.Options{
		Addr:	  "localhost:6379",
		Password: "", // no password set
		DB:		  0,  // use default DB
	})

	err := rdb.Set(ctx, "key", "value", 0).Err()
	if err != nil {
		panic(err)
	}

	val, err := rdb.Get(ctx, "key").Result()
	if err != nil {
		panic(err)
	}
	fmt.Println("key", val)

	val2, err := rdb.Get(ctx, "key2").Result()
	if err == redis.Nil {
		fmt.Println("key2 does not exist")
	} else if err != nil {
		panic(err)
	} else {
		fmt.Println("key2", val2)
	}
}
```

# 测试

为了确保软件开发的质量，开发人员需要借助测试来确保代码的正确性。

测试分为两步：

- 单元测试：对最小的可测试单元进行测试，通常是一个方法或者函数。
- 集成测试：软件整体性的测试或者多个组件模块合并在一起进行测试。

> 开发人员在开发完成后，应该进行单元测试，用于保证最小化单元的正确性

## 单元测试

`单元测试(unit testing)`是软件开发过程中必不可少的一个步骤，是对软件中最小可测试单元进行检查和验证，在Go语言中一般指`方法或者函数`。

大家可以想象一下以下场景：

- 只修改了一处代码，上线后，导致项目大面积崩溃。
- 其他同事修改了你的一处代码，上线后，导致应用挂掉。
- 做了一处性能优化，上线后导致问题或者要进行成本很大的线上测试。
- 写了几千行的代码，在做集成测试时发现了问题，浪费了好几天的时间进行调试（可能最后发现只是某一个地方的单词写错了）。
- 写完代码才发现业务流程设计不合理。
- 提交代码后，导致其他同事的代码不能运行
- 等等

> 开发人员在写完代码后，必须进行测试后，才能提交代码

### Go语言单元测试

Golang提供了语言级别的单元测试，通过引入`testing`包和执行`go test`命令来实现单元测试。

- 测试文件命名以`xxx_test.go`命名。（会被`go test`识别，并且不会被`go build`编译）
- 测试方法以`Test[^a-z]开头`，命名符合驼峰或者snake(下划线)风格，建议风格保持统一。
- 测试方法参数为` t *testing.T` 或` b *testing.B`或` f *testing.F`。
- 测试文件和被测试文件必须在一个包中。

案例：

```go
func Add(a, b int) int {
	return a + b
}
```



```go
//这是自动生成的测试用例代码，采用了`Table Driven`的组织方式
func TestAdd(t *testing.T) {
	type args struct {
		a int
		b int
	}
	tests := []struct {
		name string
		args args
		want int
	}{
		{
			name: "positive number",
			args: args{
				a: 1,
				b: 2,
			},
			want: 3,
		},
		{
			name: "negative number",
			args: args{
				a: -1,
				b: -2,
			},
			want: -3,
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if got := Add(tt.args.a, tt.args.b); got != tt.want {
				t.Errorf("Add() = %v, want %v", got, tt.want)
			}
		})
	}
}
```



- `go test` 会执行该包下面的所有测试用例
- `-v`会显示每个用例的测试结果
- `-cover`会显示测试覆盖率（测试代码是否覆盖了代码的所有逻辑）
- `-run TestAdd`可以指定要运行的测试用例，支持部分正则表达式
- `-count` 运行测试的次数, `go test -count 2`
- `-timeout` 设置运行测试的超时时间，`go test -timeout 1s`

> 填充的数据，我们可以借助各种`AI助理`，快速生成填充数据，比如`chatgpt`等

### Table Driven

`表驱动法（Table-Driven Method）`是一种基于数据表的程序设计方法。

Golang采用了`Table-Driven`组织测试。

Table Driven主要分成三个部分：

- **测试用例的定义**：即每一个测试用例需要有什么。
- **具体的测试用例**：你设计的每一个测试用例都在这里。
- **执行测试用例**：这里面还包括了对测试结果进行断言。

> 了解即可，测试用例并不强求使用`Table Driven`，只是建议。

### go test命令

`go test`命令详情：

| 参数                                   | 说明                                                         |
| -------------------------------------- | ------------------------------------------------------------ |
| `-bench regexp`                        | 仅运行与正则表达式匹配的基准测试。默认不运行任何基准测试。使用 `-bench .` 或 `-bench=` 来运行所有基准测试。 |
| `-benchtime t`                         | 运行每个基准测试足够多的迭代，以达到指定的时间 `t`（例如 `-benchtime 1h30s`）。默认为1秒（1s）。特殊语法 `Nx` 表示运行基准测试 `N` 次（例如 `-benchtime 100x`）。 |
| `-count n`                             | 运行每个测试、基准测试和模糊测试 `n` 次（默认为1次）。如果设置了 `-cpu`，则为每个 `GOMAXPROCS` 值运行 `n` 次。示例总是运行一次。`-count` 不适用于通过 `-fuzz` 匹配的模糊测试。 |
| `-cover`                               | 启用覆盖率分析。                                             |
| `-covermode set,count,atomic`          | 设置覆盖率分析的 mode。默认为 "set"，如果启用了 `-race`，则为 "atomic"。 |
| `-coverpkg pattern1,pattern2,pattern3` | 对匹配模式的包应用覆盖率分析。默认情况下，每个测试仅分析正在测试的包。 |
| `-cpu 1,2,4`                           | 指定一系列的 `GOMAXPROCS` 值，在这些值上执行测试、基准测试或模糊测试。默认为当前的 `GOMAXPROCS` 值。`-cpu` 不适用于通过 `-fuzz` 匹配的模糊测试。 |
| `-failfast`                            | 在第一个测试失败后不启动新的测试。                           |
| `-fullpath`                            | 在错误消息中显示完整的文件名。                               |
| `-fuzz regexp`                         | 运行与正则表达式匹配的模糊测试。当指定时，命令行参数必须精确匹配主模块中的一个包，并且正则表达式必须精确匹配该包中的一个模糊测试。 |
| `-fuzztime t`                          | 在模糊测试期间运行足够多的模糊目标迭代，以达到指定的时间 `t`（例如 `-fuzztime 1h30s`）。默认为永远运行。特殊语法 `Nx` 表示运行模糊目标 `N` 次（例如 `-fuzztime 1000x`）。 |
| `-fuzzminimizetime t`                  | 在每次最小化尝试期间运行足够多的模糊目标迭代，以达到指定的时间 `t`（例如 `-fuzzminimizetime 30s`）。默认为60秒。特殊语法 `Nx` 表示运行模糊目标 `N` 次（例如 `-fuzzminimizetime 100x`）。 |
| `-json`                                | 以 JSON 格式记录详细输出和测试结果。这以机器可读的格式呈现 `-v` 标志的相同信息。 |
| `-list regexp`                         | 列出与正则表达式匹配的测试、基准测试、模糊测试或示例。不会运行任何测试、基准测试、模糊测试或示例。 |
| `-parallel n`                          | 允许并行执行调用 `t.Parallel` 的测试函数，以及运行种子语料库时的模糊目标。此标志的值是同时运行的最大测试数。 |
| `-run regexp`                          | 仅运行与正则表达式匹配的测试、示例和模糊测试。               |
| `-short`                               | 告诉长时间运行的测试缩短其运行时间。默认情况下是关闭的，但在 all.bash 中设置，以便在安装 Go 树时可以运行健全性检查，但不花费时间运行详尽的测试。 |
| `-shuffle off,on,N`                    | 随机化测试和基准测试的执行顺序。默认情况下是关闭的。如果 `-shuffle` 设置为 `on`，则使用系统时钟种子随机化器。如果 `-shuffle` 设置为整数 `N`，则 `N` 将用作种子值。在这两种情况下，种子将报告以便复现。 |
| `-skip regexp`                         | 仅运行与正则表达式不匹配的测试、示例、模糊测试和基准测试。   |
| `-timeout d`                           | 如果测试二进制文件运行时间超过持续时间 `d`，则发生 panic。如果 `d` 为0，则禁用超时。默认为10分钟（10m）。 |
| `-v`                                   | 详细输出：记录所有运行的测试。即使测试成功，也打印所有来自 `Log` 和 `Logf` 调用的文本。 |
| `-vet list`                            | 配置在 "go test" 期间对 "go vet" 的调用，以使用由逗号分隔的 vet 检查列表。如果列表为空，"go test" 使用被认为总是值得解决的精选检查列表运行 "go vet"。如果列表为 |

可以通过`go help test`查看帮助信息。

### Helper

`t.Helper()`用于标注当前的函数为`测试辅助函数`。

在编写一些复杂的测试代码时，可能需要调用一些辅助函数用于设置或验证测试条件，这些辅助函数本身并不是测试的主要部分，`go test`运行输出中，会忽略`辅助函数`。

比如：

```go
// 这是一个测试辅助函数，它设置了测试需要的一些初始条件
func setupTest(t *testing.T) (int, int) {
	t.Helper() // 标记这个函数为测试辅助函数
	// 这里可以是任何设置测试环境的代码
	t.Errorf("setupTest error")
	return 10, 20 // 例如，返回两个用于测试的整数
}

// 这是一个测试函数
func TestAdd(t *testing.T) {
	a, b := setupTest(t) // 调用测试辅助函数来设置测试数据
	got := Add(a, b)
	want := 30
	if got != want {
		t.Errorf("Add(%d, %d) = %d; want %d", a, b, got, want)
	}
}
```



> 测试发生错误后，并不会输出`setupTest`的调用信息，而是显示错误位置在`TestAdd`中，这也有个好处，当有多个测试函数调用`helper函数时`，可以准确的知道发生错误的是哪个测试函数。

> **注意：**辅助函数最好不要返回error

## 基准测试

以`Benchmark`开头的测试函数为基准测试函数，用于测试一段程序运行时的性能。

- 参数为`*testing.B`

使用`go test -bench` 来开启基准测试，默认不运行。

比如测试以下`Sprintf`和`Format`的性能：

```go
func BenchmarkSprintf(b *testing.B) {
	num := 10
    //重置计时器，确保从一个一致的状态开始
    //基准测试函数 必须
    //在真正执行时重置，可以忽略准备期的开销
	b.ResetTimer()
    //b.N就是执行的次数
	for i := 0; i < b.N; i++ {
		fmt.Sprintf("%d", num)
	}
}

func BenchmarkFormat(b *testing.B) {
	num := int64(10)
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		strconv.FormatInt(num, 10)
	}
}
```



运行`go test -bench .`，得到以下结果：

```golang
goos: windows //操作系统
goarch: amd64 /cpu架构
pkg: testLearn // 当前目录
cpu: Intel(R) Core(TM) i9-14900K //CPU信息
BenchmarkSprintf-32     42520923                27.78 ns/op
BenchmarkFormat-32      1000000000               0.9868 ns/op
PASS
```



- `32`代表`GOMAXPROCS`即最大CPU核心数，即`P`的数量，当前CPU是24核32线程。
- `42520923`: 表示迭代次数
- `27.78 ns/op`:表示每次花费的纳秒

> CPU数可以使用 `-cpu=num`选项进行调整，执行的次数可以通过`-benchtime=100x`这样进行指定

### 内存测试

> 在一些情况下，我们想要测试内存占用，可以加`-benchmem`选项

比如：

```go
func newSlice(n int) []int {
	rand.Seed(time.Now().UnixNano())
	// 注意，这里在生成切片的时候并没有指定容量
	nums := make([]int, 0)
	for i := 0; i < n; i++ {
		nums = append(nums, rand.Int())
	}
	return nums
}
func newSliceWithCap(n int) []int {
	rand.Seed(time.Now().UnixNano())
	// 注意，这里在生成切片的时候指定了容量
	nums := make([]int, 0, n)
	for i := 0; i < n; i++ {
		nums = append(nums, rand.Int())
	}
	return nums
}
```



```go
func BenchmarkNewSlice(b *testing.B) {
	for n := 0; n < b.N; n++ {
		newSlice(1000000)
	}
}

func BenchmarkNewSliceWithCap(b *testing.B) {
	for n := 0; n < b.N; n++ {
		newSliceWithCap(1000000)
	}
}
```



```go
D:\go\project\hello\testLearn> go test -benchmem -bench .
goos: windows
goarch: amd64
pkg: testLearn
cpu: Intel(R) Core(TM) i9-14900K
BenchmarkNewSlice-32                  85(运行次数)          14064528 ns/op  （每次运行时间）     41678148 B/op （每次操作分配的内存，字节单位）        38 allocs/op（每次操作进行内存分配的次数）
BenchmarkNewSliceWithCap-32          100          11062605 ns/op         8003586 B/op          1 allocs/op
PASS
```

为了更准确的测试性能，go提供了控制计时器：

- `b.ResetTimer():`重置计时
- `b.StopTimer():` 停止计时
- `b.StartTimer():`开始计时

## 模糊测试

`模糊测试`就是输入一些非预期的输入并监测异常结果来发现问题，Golang已经在1.18版本中将模糊测试添加进了标准库。

比如：

```go
func Div(a, b int) int {
    //如果测试的数据b忽略了0，那么就会埋下隐患
	return a / b
}
```



```go
//go test  -fuzz .
//运行模糊测试，会发现b为0的异常
func FuzzDiv(f *testing.F) {
	f.Fuzz(func(t *testing.T, a, b int) {
		Div(a, b)
	})
}
```



> go的模糊测试允许提供一些初始语料，比如：

```go
func FuzzDiv(f *testing.F) {
	testcases := []struct {
		a, b int
	}{
		{10, 2},
		{5, 3},
		{-6, 3},
		{-6, -3},
	}
	for _, v := range testcases {
		f.Add(v.a, v.b)
	}
	f.Fuzz(func(t *testing.T, a, b int) {
		Div(a, b)
	})
}
```

# 版本更新

## for循环

1.22版本for循环的内容有更新。

1. for range不再使用共享变量：

```go
func main() {
	var slice []int = []int{1, 2, 3, 4, 5}
	for index, value := range slice {
		go func() {
            //1.22版本这里会输出 1,2,3,4,5顺序不一定
            //1.22版本以前，index和value是共享变量，结果大概率会都输出5
            //这里原因是1.22版本每次循环 index，value会创建新的变量，而不是共享变量了
			fmt.Printf("index:%d,value:%d \n", index, value)
		}()
	}
	for {
	}
}
```

2. for循环开始支持整型的循环：

~~~go
func main() {
    //go1.22版本 支持整型的循环
    //注意更新IDE版本，比如goland需要安装新版
	for i := range 10 {
		fmt.Println(i)
	}
}
~~~

