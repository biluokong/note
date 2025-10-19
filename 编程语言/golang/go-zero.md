#  快速入门

[点击直达-视频教程地址open in new window](https://www.bilibili.com/video/BV1vRxzefExM/)

## 1. 介绍

> go-zero 是一个集成了各种工程实践的 web 和 RPC框架。通过弹性设计保障了大并发服务端的稳定性，经受了充分的实战检验。

### 1.1 web框架

快速高效开发`web应用`的工具或软件：

- web应用有`动态网站`，`网络应用`，`网络服务`等，比如抖音，B站，淘宝，在线银行，医疗系统，政务服务，微信，各种网站等等
- 支持`HTTP协议`
- 支持`Websocket协议`

### 1.2 RPC

`RPC（Remote Procedure Call Protocol）`远程过程调用协议。一种通过网络从远程计算机程序上请求服务，而不需要了解底层网络技术的协议。

![img](go-zeroimg/650581-20190115005410199-1032695557.eaed7045.png)

> RPC是两个进程间的通信，可以跨设备，RPC框架需要保证在调用远端服务或资源时，就像调用本地应用程序一样方便

### 1.3 微服务

![image-20240912222051264](go-zeroimg/image-20240912222051264.01e5b497.png)

微服务是由多个功能模块（小服务）组成，共同完成一件事（组成可用的一整个系统），各个服务之间使用`RPC`进行通信。

- 好处就在于各个服务是独立的个体，其代表了一种编程思维方式，服务需要具备独立性，扩展性，容错性，高可用性等，适用于高并发等大型系统
- 坏处就是复杂性大大提高，管理维护变得困难

> 要构建一个微服务系统，需要如下手段：

- 服务治理
  - 服务注册发现
- 服务调用
  - RPC
  - REST
- 服务网关
- 服务容错
  - 限流
  - 熔断
  - 降级
- 链路追踪
- 负载均衡
- 监控报警
- 分布式配置中心
- 分布式事务
- 分布式任务调度
- 分布式文件存储
- 消息队列
- Docker
- 云原生

## 2. 安装

要想使用`go-zero`框架，需要安装以下环境：

- golang：这里我们安装最新版`go1.23`版本
- goctl：goctl是go-zero框架的内置脚手架，可以一键生成代码、文档、部署 k8s yaml、dockerfile 等。
- protoc
  - `protobuf`是一种数据序列化和反序列化标准，谷歌出品，和`json`，`xml`类似，性能非常高。
  - `protoc`命令是protobuf的编译器，将`.proto`后缀的文件编译成`对应的开发语言文件`
  - `protoc-gen-go`是protoc的一个插件，用于生成go语言代码（protoc原生不支持生成go语言文件）
  - `protoc-gen-go-grpc`是protoc的`go grpc`插件，可以生成grpc相关的go语言文件。
- IDE插件
  - goland或者vscode插件市场搜`goctl`
  - 用于支持go-zero框架中`api描述语言`

### 2.1 安装方式

#### 2.1.1 goctl安装

```bash
go install github.com/zeromicro/go-zero/tools/goctl@latest
#验证版本
goctl --version
```

![image-20240911224511250](go-zeroimg/image-20240911224511250.c7de0452.png)

#### 2.1.2 protoc相关安装

```bash
##快捷安装
goctl env check --install --verbose --force
```

**手动安装：**

- 打开`https://github.com/protocolbuffers/protobuf/releases`
- 下载对应的版本（我这里是windows电脑），下载[protoc-28.0-win64.zipopen in new window](https://github.com/protocolbuffers/protobuf/releases/download/v28.0/protoc-28.0-win64.zip)
- 解压，并设置环境变量即可
- 使用`protoc --version`验证
- `go install google.golang.org/protobuf/cmd/protoc-gen-go@latest`
- `go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest`

![image-20240911224428004](go-zeroimg/image-20240911224428004.25e9b130.png)

## 3. 快速入门

> 框架的目的是为了帮助开发人员快速高效的开发应用程序

1. 创建一个目录`gozero-learn`做为工作目录

2. 在当前目录打开`命令行工具`

3. 运行`goctl api new hello01`命令

   ![image-20240911224625412](go-zeroimg/image-20240911224625412.e4b39143.png)

4. 生成如下代码：

   ![image-20240911224703789](go-zeroimg/image-20240911224703789.f99b7869.png)

5. 进入`hello01`，运行`go mod tidy`下载依赖

6. 在logic目录下的`hello01logic.go`中写入如下代码：

   ```go
   func (l *Hello01Logic) Hello01(req *types.Request) (resp *types.Response, err error) {
   	// todo: add your logic here and delete this line
   	resp = &types.Response{
   		Message: "hello " + req.Name,
   	}
   	return
   }
   ```

7. 将`hello01.go`改为`main.go`并运行main函数

   ![image-20240911225211661](go-zeroimg/image-20240911225211661.23c7f085.png)

8. 访问`http://localhost:8888/form/you`

> `goctl api new xxx`可以快捷生成一个最小化的http服务，但我们希望`form`后面的name可以任意输入，就需要修改代码

- 修改`hello01.api`

  ```go
  type Request {
  	Name string `path:"name"`
  }
  ```

- 重新生成代码，运行命令`goctl api go --api hello01.api --dir .`

  - `--api`：指定api文件
  - `--dir`：指定go文件生成的目录

  ![image-20240911230324358](go-zeroimg/image-20240911230324358.ca6e72a1.png)

- 重新运行访问即可

> 至此我们初步学会了go-zero

## 4. 目录说明

```go
example
├── etc
│   └── example.yaml
├── main.go
└── internal
    ├── config
    │   └── config.go
    ├── handler
    │   ├── xxxhandler.go
    │   └── xxxhandler.go
    ├── logic
    │   └── xxxlogic.go
    ├── svc
    │   └── servicecontext.go
    └── types
        └── types.go
```

- example：单个服务目录，一般是某微服务名称
- etc：静态配置文件目录
- main.go：程序启动入口文件
- internal：单个服务内部文件，其可见范围仅限当前服务
- config：静态配置文件对应的结构体声明目录
- handler：handler 目录，可选，一般 http 服务会有这一层做路由管理，`handler` 为固定后缀
- logic：业务目录，所有业务编码文件都存放在这个目录下面，`logic` 为固定后缀
- svc：依赖注入目录，所有 logic 层需要用到的依赖都要在这里进行显式注入
- types：结构体存放目录

# 配置文件

## 1. 格式

> 在生成的代码中，配置文件位于`etc`目录下，格式为`yml`，`yml`是最为常用的配置文件格式，go-zero支持多种配置文件格式：

- `yml`或者`yaml`
- `toml`
- `json`

### 1.1 读取YML配置

配置文件：

```yaml
Name: hello01-api
Host: 0.0.0.0
Port: 8888
```

配置文件对应的结构定义：

```go
type Config struct {
	Name string
	Host string
	Port int
}
```

读取配置文件：

```go
//定义配置文件路径
var configFile = flag.String("f", "etc/hello01-api.yaml", "the config file")

func main() {
	flag.Parse()
	//加载配置
	var c config.Config
	conf.MustLoad(*configFile, &c)
	
	server := rest.MustNewServer(rest.RestConf{
		Host: c.Host,
		Port: c.Port,
	})
	defer server.Stop()

	ctx := svc.NewServiceContext(c)
	handler.RegisterHandlers(server, ctx)

	fmt.Printf("Starting server at %s:%d...\n", c.Host, c.Port)
	server.Start()
}
```

### 1.2 RestConf

`rest.RestConf`是go-zero提供的配置映射实体，提供了一些默认的配置，方便我们使用。

```go
RestConf struct {
		service.ServiceConf
		Host     string `json:",default=0.0.0.0"`
		Port     int
		CertFile string `json:",optional"`
		KeyFile  string `json:",optional"`
		Verbose  bool   `json:",optional"`
		MaxConns int    `json:",default=10000"`
		MaxBytes int64  `json:",default=1048576"`
		// milliseconds
		Timeout      int64         `json:",default=3000"`
		CpuThreshold int64         `json:",default=900,range=[0:1000)"`
		Signature    SignatureConf `json:",optional"`
		// There are default values for all the items in Middlewares.
		Middlewares MiddlewaresConf
		// TraceIgnorePaths is paths blacklist for trace middleware.
		TraceIgnorePaths []string `json:",optional"`
	}
```

### 1.3 小写

使用SpringBoot的java开发人员比较熟悉，SpringBoot使用yml配置文件，都是小写。

**在go-zero中如何实现小写呢？**

很简单，只需要将`yml`配置文件改为小写即可，go-zero在`conf.MustLoad`中已经支持。

**如果想要将`myProp`这个配置读入Config中的`prop`字段中呢？**

```yaml
myProp: myValue
```

我们可以加入如下的tag：

```go
type Config struct {
	Name string
	Host string
	Port int
	Prop string `json:"myProp"`
}
```

> 这时候，大家可能会奇怪，为什么加`json`的tag可以实现？

我们翻看源码可以知道：

```go
//在处理yml配置文件时，是将其转为json进行处理
func LoadFromYamlBytes(content []byte, v any) error {
	b, err := encoding.YamlToJson(content)
	if err != nil {
		return err
	}

	return LoadFromJsonBytes(b, v)
}
```

### 1.4 默认值

如果想给默认值，处理方式和`json`一样

```go
type Config struct {
	Name      string
	Host      string
	Port      int
	Prop      string `json:"myProp"`
	NoConfStr string `json:"noConfStr,default=默认值"`
}
```

> 由于json解析的特性，如果配置文件没有对应字段的配置就会报错，所以我们需要设置`默认值`或者设置为`可选`

```go
type Config struct {
	Name      string
	Host      string
	Port      int
    //配置文件可以没有myProp这个配置，不会报错，Prop的值为零值
	Prop      string `json:"myProp,optional"`
	NoConfStr string `json:"noConfStr,default=默认值"`
}
```

### 1.5 读取JSON配置

> 读取方式和yml方式一样

```
hello01-api.json
{
  "name": "hello01-api",
  "host": "0.0.0.0",
  "port": 8888,
  "myProp": "myValue"
}
```

```go
type Config struct {
	Name      string
	Host      string
	Port      int
	Prop      string `json:"myProp,optional"`
	NoConfStr string `json:"noConfStr,default=默认值"`
}
```

```go
var configFile = flag.String("f", "etc/hello01-api.json", "the config file")

func main() {
	flag.Parse()

	var c config.Config
	conf.MustLoad(*configFile, &c)

	server := rest.MustNewServer(rest.RestConf{
		Host: c.Host,
		Port: c.Port,
	})
	defer server.Stop()

	ctx := svc.NewServiceContext(c)
	handler.RegisterHandlers(server, ctx)

	fmt.Printf("Starting server at %s:%d...\n", c.Host, c.Port)
	server.Start()
}
```

### 1.6 读取toml配置

翻看源码：

```go
func LoadFromTomlBytes(content []byte, v any) error {
	b, err := encoding.TomlToJson(content)
	if err != nil {
		return err
	}

	return LoadFromJsonBytes(b, v)
}
```

> 处理方式和json，yml都一样

```toml
name="hello01-api"
host="0.0.0.0"
port=8888
[database]
url="postgres://postgres:postgres@localhost:5432/postgres"
```

```go
type Config struct {
	Name      string
	Host      string
	Port      int
	Prop      string `json:"myProp,optional"`
	NoConfStr string `json:"noConfStr,default=默认值"`
	Database  Database
}
type Database struct {
	Url string
}
```

```go
package main


var configFile = flag.String("f", "etc/hello01-api.toml", "the config file")

func main() {
	flag.Parse()

	var c config.Config
	conf.MustLoad(*configFile, &c)

	server := rest.MustNewServer(rest.RestConf{
		Host: c.Host,
		Port: c.Port,
	})
	defer server.Stop()

	ctx := svc.NewServiceContext(c)
	handler.RegisterHandlers(server, ctx)

	fmt.Printf("Starting server at %s:%d...\n", c.Host, c.Port)
	server.Start()
}
```

## 2. 自定义配置

> go-zero提供了默认的一些配置，方面我们使用，如果我们想要自己定义配置，只要在Config结构体中添加对应的字段即可

```yaml
name: hello01-api
host: 0.0.0.0
port: 8888
customConfig:
  age: 18
  address: "中国"
```

```go
type Config struct {
	Name         string
	Host         string
	Port         int
	CustomConfig CustomConfig
}

type CustomConfig struct {
	Age     int
	Address string
}
```

## 3. 指定配置文件

在部署时，`配置文件并不会打包到二进制包中`，我们需要指定配置文件，通过命令行参数的形式指定

```bash
# 执行文件 -f etc/hello01-api.json
# go run main.go -f etc/hello01-api.json
```

#  web开发一

## 1. 代码分析

> 我们先来分析一下自动生成的代码，了解go-zero开发的基本逻辑

```go
//服务上下文 依赖注入，需要用到的依赖都在此进行注入，比如配置，数据库连接，redis连接等
ctx := svc.NewServiceContext(c)
//注册路由
handler.RegisterHandlers(server, ctx)
```

handler：

```go
func Hello01Handler(svcCtx *svc.ServiceContext) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
        //请求参数
		var req types.Request
        //解析参数
		if err := httpx.Parse(r, &req); err != nil {
			httpx.ErrorCtx(r.Context(), w, err)
			return
		}
		//注入serviceContext
		l := logic.NewHello01Logic(r.Context(), svcCtx)
        //业务逻辑实现
		resp, err := l.Hello01(&req)
        //返回响应结果
		if err != nil {
			httpx.ErrorCtx(r.Context(), w, err)
		} else {
      		//返回json数据
			httpx.OkJsonCtx(r.Context(), w, resp)
		}
	}
}
```

所以用go-zero开发，遵循以下步骤：

1. 编写`api`文件
2. 生成代码
3. 编写logic代码

## 2. 注册登录

> 接下来，我们以一个注册登录接口的例子，来讲解使用go-zero开发web应用

### 2.1 编写api文件

user.api

```go
syntax = "v1"

type RegisterReq {
	//代表可以接收json参数 并且是必填参数 注意 go-zero不支持多tag
	Username string `json:"username"`
	Password string `json:"password"`
}

type RegisterResp {}

type LoginReq {
	Username string `json:"username"`
	Password string `json:"password"`
}
type LoginResp {
	Token string `json:"token"`
}
@server (
	//代表当前service的代码会放在account目录下
	//这里注意 冒汗要紧贴着key
	group: account
	//路由前缀
	prefix: v1
)
//影响配置文件名称和主文件名称
service user-api {
	//handler中的函数名称
	@handler register
	post /user/register (RegisterReq) returns (RegisterResp)
	@handler login
	post /user/login (LoginReq) returns (LoginResp)
}
```

```bash
//生成代码
# goctl api go --api user.api --dir .
```

### 2.2 添加数据库支持

sql：

```sql
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `register_time` datetime NOT NULL,
  `last_login_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;
```

配置：

```yaml
Name: user-api
Host: 0.0.0.0
Port: 8888
mysqlConfig:
  datasource: "root:root@tcp(127.0.0.1:3306)/zero_test?charset=utf8mb4&parseTime=True&loc=Local"
  connectTimeout: 10
```

```go
type Config struct {
	rest.RestConf
	MysqlConfig MysqlConfig
}

type MysqlConfig struct {
	DataSource     string
	ConnectTimeout int64
}
```

初始化数据库连接：

```go
package db

import (
	"context"
	"github.com/zeromicro/go-zero/core/stores/sqlx"
	"time"
	"user-api/internal/config"
)

func NewMysql(mysqlConfig config.MysqlConfig) sqlx.SqlConn {
	mysql := sqlx.NewMysql(mysqlConfig.DataSource)
	db, err := mysql.RawDB()
	if err != nil {
		panic(err)
	}
	cxt, cancel := context.WithTimeout(context.Background(), time.Second*time.Duration(mysqlConfig.ConnectTimeout))
	defer cancel()
	err = db.PingContext(cxt)
	if err != nil {
		panic(err)
	}
	db.SetMaxOpenConns(100)
	db.SetMaxIdleConns(10)
	return mysql
}
```

注入serviceContext：

```go
type ServiceContext struct {
	Config config.Config
	Conn   sqlx.SqlConn
}

func NewServiceContext(c config.Config) *ServiceContext {
	sqlConn := db.NewMysql(c.MysqlConfig)
	return &ServiceContext{
		Config: c,
		Conn:   sqlConn,
	}
}
```

使用`goctl model`命令生成代码

```bash
# go get github.com/go-sql-driver/mysql
# goctl model mysql ddl --src user.sql --dir .
```

### 2.3 编写代码逻辑

```go
func (l *RegisterLogic) Register(req *types.RegisterReq) (resp *types.RegisterResp, err error) {
	userModel := user.NewUserModel(l.svcCtx.Conn)
	u, err := userModel.FindByUsername(l.ctx, req.Username)
	if err != nil {
		l.Logger.Error("Register FindByUsername err: ", err)
		return nil, err
	}
	if u != nil {
		//代表已经注册
		return nil, errors.New("此用户名已经注册")
	}
	_, err = userModel.Insert(l.ctx, &user.User{
		Username:      req.Username,
		Password:      req.Password,
		RegisterTime:  time.Now(),
		LastLoginTime: time.Now(),
	})
	if err != nil {
		return nil, err
	}
	return
}
```

```go
func (m *customUserModel) FindByUsername(ctx context.Context, username string) (*User, error) {
	query := fmt.Sprintf("select %s from %s where `username` = ? limit 1", userRows, m.table)
	var resp User
	err := m.conn.QueryRowCtx(ctx, &resp, query, username)
	switch err {
	case nil:
		return &resp, nil
	case sql.ErrNoRows, sqlx.ErrNotFound:
		return nil, nil
	default:
		return nil, err
	}
}
```

### 2.4 处理响应

> 上述代码我们在测试时，发现成功的时候返回null，有错误时返回错误信息，状态为400，在实际开发的过程中，我们期望返回格式化的响应信息，比如json，类似下面这样：

```json
{
    code: 200,
    msg: "success",
    data: null
}
```

```go
{
    code: 10100,
    msg: "fail",
    data: null
}
```

根据返回的code进行业务逻辑的处理，注意此时http的状态为`200`

如果http的状态为：

- 400，参数格式有问题
- 401，未认证
- 403，无权限
- 404，找不到接口
- 500，服务器错误

这些错误，可以进行统一的处理，`我们需要将其和业务逻辑错误分开处理`

#### 2.4.1 自定义error

```go
package biz

type Error struct {
	Code int    `json:"code"`
	Msg  string `json:"msg"`
}

func NewError(code int, msg string) *Error {
	return &Error{
		Code: code,
		Msg:  msg,
	}
}

func (e *Error) Error() string {
	return e.Msg
}
```

```go
package biz

const Ok = 200

var (
	DBError         = NewError(10000, "数据库错误")
	AlreadyRegister = NewError(10100, "用户已注册")
)
```

#### 2.4.2 统一返回

```go
package biz

type Result struct {
	Code int    `json:"code"`
	Msg  string `json:"msg"`
	Data any    `json:"data"`
}

func Success(data any) *Result {
	return &Result{
		Code: Ok,
		Msg:  "success",
		Data: data,
	}
}

func Fail(err *Error) *Result {
	return &Result{
		Code: err.Code,
		Msg:  err.Msg,
	}
}
```

#### 2.4.3 统一错误处理

```go
// httpx.SetErrorHandler 仅在调用了 httpx.Error 处理响应时才有效。
	httpx.SetErrorHandler(func(err error) (int, any) {
		switch e := err.(type) {
		case *biz.Error:
			return http.StatusOK, biz.Fail(e)
		default:
			return http.StatusInternalServerError, nil
		}
	})
```

```go
func (l *RegisterLogic) Register(req *types.RegisterReq) (resp *types.RegisterResp, err error) {
	userModel := user.NewUserModel(l.svcCtx.Conn)
	u, err := userModel.FindByUsername(l.ctx, req.Username)
	if err != nil {
		l.Logger.Error("Register FindByUsername err: ", err)
		return nil, biz.DBError
	}
	if u != nil {
		//代表已经注册
		return nil, biz.AlreadyRegister
	}
	_, err = userModel.Insert(l.ctx, &user.User{
		Username:      req.Username,
		Password:      req.Password,
		RegisterTime:  time.Now(),
		LastLoginTime: time.Now(),
	})
	if err != nil {
		return nil, err
	}
	return
}
```

```go
httpx.OkJsonCtx(r.Context(), w, biz.Success(resp))
```

#### 2.4.4 zero扩展包

> 关于`code和msg`这种形式，go-zero在`https://github.com/zeromicro/x`扩展包中做了支持

1. 导入扩展包依赖

   ```go
   go get github.com/zeromicro/x
   ```

2. 看一下扩展包中，我们需要用到的结构

   ```go
   package errors
   
   import "fmt"
   
   // CodeMsg is a struct that contains a code and a message.
   // It implements the error interface.
   type CodeMsg struct {
   	Code int
   	Msg  string
   }
   
   func (c *CodeMsg) Error() string {
   	return fmt.Sprintf("code: %d, msg: %s", c.Code, c.Msg)
   }
   
   // New creates a new CodeMsg.
   func New(code int, msg string) error {
   	return &CodeMsg{Code: code, Msg: msg}
   }
   ```

   
   
   ```go
   // BaseResponse is the base response struct.
   type BaseResponse[T any] struct {
   	// Code represents the business code, not the http status code.
   	Code int `json:"code" xml:"code"`
   	// Msg represents the business message, if Code = BusinessCodeOK,
   	// and Msg is empty, then the Msg will be set to BusinessMsgOk.
   	Msg string `json:"msg" xml:"msg"`
   	// Data represents the business data.
   	Data T `json:"data,omitempty" xml:"data,omitempty"`
   }
   ```
   
   
   
3. 将我们自定义的内容，换成扩展包的实现

   ```go
   package biz
   
   import "github.com/zeromicro/x/errors"
   
   const Ok = 200
   
   //var (
   //	DBError         = NewError(10000, "数据库错误")
   //	AlreadyRegister = NewError(10100, "用户已注册")
   //)
   
   var (
   	DBError         = errors.New(10000, "数据库错误")
   	AlreadyRegister = errors.New(10100, "用户已注册")
   )
   ```

   
   
   ```go
   import (
   	"github.com/zeromicro/go-zero/rest/httpx"
   	xhttp "github.com/zeromicro/x/http"
   	"net/http"
   	"user-api/internal/logic/account"
   	"user-api/internal/svc"
   	"user-api/internal/types"
   )
   
   func RegisterHandler(svcCtx *svc.ServiceContext) http.HandlerFunc {
   	return func(w http.ResponseWriter, r *http.Request) {
   		var req types.RegisterReq
   		if err := httpx.Parse(r, &req); err != nil {
   			xhttp.JsonBaseResponseCtx(r.Context(), w, err)
   			return
   		}
   
   		l := account.NewRegisterLogic(r.Context(), svcCtx)
   		resp, err := l.Register(&req)
   		if err != nil {
   			xhttp.JsonBaseResponseCtx(r.Context(), w, err)
   		} else {
   			xhttp.JsonBaseResponseCtx(r.Context(), w, resp)
   		}
   	}
   }
   ```
   
   
   
4. 去掉`httpx.SetErrorHandler`，然后测试即可

> 问题1：这样返回的成功code，默认为0，如果想变更需要修改源码来实现
>
> 问题2：handler的代码需要修改模板，要不然每次都需要重新变更

- 建议使用自定义方式
- 如果使用扩展包，建议fork代码后使用，维护方便

### 2.5 登录实现

> 登录逻辑为：
>
> - 校验用户名密码
> - 生成token

token生成：

```go
// @secretKey: JWT 加解密密钥
// @iat: 时间戳
// @seconds: 过期时间，单位秒
// @payload: 数据载体
func GetJwtToken(secretKey string, iat, seconds int64, payload any) (string, error) {
	claims := make(jwt.MapClaims)
	claims["exp"] = iat + seconds
	claims["iat"] = iat
	claims["userId"] = payload
	token := jwt.New(jwt.SigningMethodHS256)
	token.Claims = claims
	return token.SignedString([]byte(secretKey))
}
```

jwt相关配置：

```yaml
Auth:
  # 必须是8位以上
  secret: "secret123456"
  expire: 3600
```

```go
type Config struct {
	rest.RestConf
	MysqlConfig MysqlConfig
	Auth        Auth
}

type MysqlConfig struct {
	DataSource     string
	ConnectTimeout int64
}

type Auth struct {
	Secret string
	Expire int64
}
```

登录逻辑代码：

```go
func (l *LoginLogic) Login(req *types.LoginReq) (resp *types.LoginResp, err error) {
	// todo: add your logic here and delete this line
	userModel := user.NewUserModel(l.svcCtx.Conn)
	u, err := userModel.FindByUsernameAndPwd(l.ctx, req.Username, req.Password)
	if err != nil {
		l.Logger.Error(err)
		return nil, biz.DBError
	}
	if u == nil {
		return nil, biz.NameOrPwdError
	}
	//登录成功 生成token
	secret := l.svcCtx.Config.Auth.Secret
	expire := l.svcCtx.Config.Auth.Expire
	token, err := biz.GetJwtToken(secret, time.Now().Unix(), expire, u.Id)
	if err != nil {
		l.Logger.Error(err)
		return nil, biz.TokenError
	}
	resp = &types.LoginResp{
		Token: token,
	}
	return
}
```

### 2.6 获取用户信息

> 登录成功后，前端获取到token，通过token请求用户信息，go-zero框架已经支持jwt，只需要添加少量代码，就可以支持jwt认证

```go
server.AddRoutes(
		[]rest.Route{
			{
				Method:  http.MethodGet,
				Path:    "/user/info",
				Handler: account.GetUserInfoHandler(serverCtx),
			},
		},
		rest.WithPrefix("/v1"),
    	//开启jwt认证
		rest.WithJwt(serverCtx.Config.Auth.Secret),
	)
```

```go
syntax = "v1"

type RegisterReq {
	//代表可以接收json参数 并且是必填参数 注意 go-zero不支持多tag
	Username string `json:"username"`
	Password string `json:"password"`
}

type RegisterResp {}

type LoginReq {
	Username string `json:"username"`
	Password string `json:"password"`
}

type LoginResp {
	Token string `json:"token"`
}

type UserInfoResp {
	Id       int64  `json:"id"`
	Username string `json:"username"`
}

@server (
	//代表当前service的代码会放在account目录下
	//这里注意 冒汗要紧贴着key
	group: account
	//路由前缀
	prefix: v1
)
//影响配置文件名称和主文件名称
service user-api {
	//handler中的函数名称
	@handler register
	post /user/register (RegisterReq) returns (RegisterResp)

	@handler login
	post /user/login (LoginReq) returns (LoginResp)

	@handler getUserInfo
	get /user/info returns (UserInfoResp)
}
```

逻辑代码：

```go
func (l *GetUserInfoLogic) GetUserInfo() (resp *types.UserInfoResp, err error) {
	//如果认证通过 可以从ctx中获取jwt payload
	userId, err := l.ctx.Value("userId").(json.Number).Int64()
	if err != nil {
		return nil, biz.InvalidToken
	}
	u, err := user.NewUserModel(l.svcCtx.Conn).FindOne(l.ctx, userId)
	if err != nil && (errors.Is(err, user.ErrNotFound) ||
		errors.Is(err, sql.ErrNoRows)) {
		return nil, biz.UserNotExist
	}
	resp = &types.UserInfoResp{
		Id:       userId,
		Username: u.Username,
	}
	return
}
```

在HTTP请求添加名为`Authorization`的header，形式如下

```html
//这里注意 Bearer后面只有一个空格
Authorization: Bearer <token>
```

> 至此 我们完成了基本的web开发，具备了使用go-zero开发web应用的能力

# web开发

## 1. 跨域

> 跨域是浏览器基于`同源策略`的一种安全手段。

同源：

- 协议相同（`protocol`）
- 主机相同（`host`）
- 端口相同（`port`）

> 当访问`不是同源`的服务地址时，就会发生跨域问题

![image](go-zeroimg/p758750.1bbb9d08.png)

### 1.1 go-zero跨域配置

1. 第一种

   ```go
   server := rest.MustNewServer(c.RestConf,
   		rest.WithCors("http://localhost:5173"))
   ```

2. 第二种

   - 在有些情况下，我们需要传递一些自定义的`header`，这时候仍旧会出现跨域问题
   - 所以我们需要自定义跨域的header

   ```go
   server := rest.MustNewServer(c.RestConf,
   		rest.WithCorsHeaders("xxxx"),
   	)
   ```

3. 第三种

   - 如果我们既想要自定义header，又想要控制跨域的域名

   ```go
   server := rest.MustNewServer(c.RestConf,
           //顺序不能颠倒
   		rest.WithCors("http://localhost:5173"),
   		rest.WithCorsHeaders("xxxx"),
   	)
   ```

4. 第四种

   - 如果想要自定义跨域

     ```go
     server := rest.MustNewServer(c.RestConf,
     		rest.WithCustomCors(func(header http.Header) {
     			var allowOrigin = "Access-Control-Allow-Origin"
     			var allOrigins = "http://localhost:5173"
     			var allowMethods = "Access-Control-Allow-Methods"
     			var allowHeaders = "Access-Control-Allow-Headers"
     			var exposeHeaders = "Access-Control-Expose-Headers"
     			var methods = "GET, HEAD, POST, PATCH, PUT, DELETE, OPTIONS"
     			var allowHeadersVal = "xxxx, Content-Type, Origin, X-CSRF-Token, Authorization, AccessToken, Token, Range"
     			var exposeHeadersVal = "Content-Length, Access-Control-Allow-Origin, Access-Control-Allow-Headers"
     			var maxAgeHeader = "Access-Control-Max-Age"
     			var maxAgeHeaderVal = "86400"
     			header.Set(allowOrigin, allOrigins)
     			header.Set(allowMethods, methods)
     			header.Set(allowHeaders, allowHeadersVal)
     			header.Set(exposeHeaders, exposeHeadersVal)
     			header.Set(maxAgeHeader, maxAgeHeaderVal)
     		}, func(w http.ResponseWriter) {
     
     		}),
     	)
     ```

## 2. 请求参数

### 2.1 form表单

```go
type Request struct {
    Name    string  `form:"name"` // 必填参数
    Age     int     `form:"age,optional"` // optional定义非必填参数
}


var req Request
err := httpx.Parse(r, &req) // 解析参数
```

### 2.2 json

```go
type Request struct {
    Name string `json:"name"`
    Age  int    `json:"age"`
}

var req Request
err := httpx.Parse(r, &req) // 解析参数
```

### 2.3 path

```go
type Request struct {
    Name string `path:"name"`
}

// Path定义
rest.Route{
    Method:  http.MethodGet,
    Path:    "/user/:name",
    Handler: handle,
}

var req Request
err := httpx.Parse(r, &req) // 解析参数
```

### 2.4 header参数

```go
type Request struct {
    Authorization string `header:"authorization"`
}

var req Request
err := httpx.Parse(r, &req) // 解析参数
```

### 2.5 参数默认值

```go
type Request struct {
    Age int `form:"age,default=18"`
}

var req Request
err := httpx.Parse(r, &req) // 解析参数
```

### 2.6 参数枚举值

```go
type Request struct {
    Age int `form:"age,options=18|19"`
}

var req Request
err := httpx.Parse(r, &req) // 解析参数
```

### 2.7 参数区间定义

```go
type Request struct {
    Age int `form:"age,range=[18:35)"`
}

var req Request
err := httpx.Parse(r, &req) // 解析参数
```

## 3. 中间件

### 3.1 内置中间件

- 鉴权管理中间件 AuthorizeHandler
- 熔断中间件 BreakerHandler
- 内容安全中间件 ContentSecurityHandler
- 解密中间件 CryptionHandler
- 压缩管理中间件 GunzipHandler
- 日志中间件 LogHandler
- ContentLength 管理中间件 MaxBytesHandler
- 限流中间件 MaxConnsHandler
- 指标统计中间件 MetricHandler
- 普罗米修斯指标中间件 PrometheusHandler
- panic 恢复中间件 RecoverHandler
- 负载监控中间件 SheddingHandler
- 超时中间件 TimeoutHandler
- 链路追踪中间件 TraceHandler

```go
type MiddlewaresConf struct {
    Trace      bool `json:",default=true"`
    Log        bool `json:",default=true"`
    Prometheus bool `json:",default=true"`
    MaxConns   bool `json:",default=true"`
    Breaker    bool `json:",default=true"`
    Shedding   bool `json:",default=true"`
    Timeout    bool `json:",default=true"`
    Recover    bool `json:",default=true"`
    Metrics    bool `json:",default=true"`
    MaxBytes   bool `json:",default=true"`
    Gunzip     bool `json:",default=true"`
}
```

```go
Name: HelloWorld.api
Host: 127.0.0.1
Port: 8080
Middlewares:
  Metrics: false
```

### 3.2 自定义中间件

```go
server := rest.MustNewServer(rest.RestConf{})
defer server.Stop()

server.Use(middleware)

// 自定义的中间件
func middleware(next http.HandlerFunc) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        w.Header().Add("X-Middleware", "static-middleware")
        next(w, r)
    }
}
```

## 4. redis集成

### 4.1 docker-compose部署配置

```docker
version: '3.3'
services:
  redis:
    container_name: zero-redis-node
    image: redis:latest
    restart: always
    ports:
      - "6379:6379"
    volumes:
      - ./volume/redis/dаta:/root/redis
    environment:
      - REDIS_PASSWORD=mszlu
      - REDIS_PORT=6379
      - REDIS_DATABASES=16
  redis-cluster-master:
    image: redis:latest
    container_name: redis-cluster-master
    restart: always
    command: redis-server --port 7000 --requirepass mszlu  --appendonly yes
    ports:
      - 7000:7000
    volumes:
      - ./volume/redis-cluster/data:/data
    networks:
      - redis-cluster
  redis-cluster-slave1:
    image: redis:latest
    container_name: redis-slave-1
    restart: always
    command: redis-server --slaveof redis-cluster-master 7000 --port 7001  --requirepass mszlu --masterauth mszlu  --appendonly yes
    ports:
      - 7001:7001
    depends_on:
      - master
    volumes:
      - ./volume/redis-cluster/data:/data
    networks:
      - redis-cluster
networks:
  redis-cluster:
```

### 4.2 单节点

go-zero内置配置：

```go
RedisConf struct {
		Host     string
		Type     string `json:",default=node,options=node|cluster"`
		Pass     string `json:",optional"`
		Tls      bool   `json:",optional"`
		NonBlock bool   `json:",default=true"`
		// PingTimeout is the timeout for ping redis.
		PingTimeout time.Duration `json:",default=1s"`
	}
```

- Host：Redis 服务地址 `ip:port`, 如果是 Redis Cluster 则为 `ip1:port1,ip2:port2,ip3:port3`
- Type：node 单节点 Redis ，cluster Redis 集群
- Pass：认证密码
- Tls：是否开启tls
- NonBlock：是否以非阻塞模式启动
- PingTimeout：ping超时时间，用于检测redis是否连接成功

```go
go get github.com/redis/go-redis/v9
```

```yaml
RedisConfig:
  Host: "127.0.0.1:6379"
  Pass: "mszlu"
  Type: "node"
  Tls: false
  NonBlock: false
  PingTimeout: 1s
```

```go
package db

import "github.com/zeromicro/go-zero/core/stores/redis"

func NewRedis(conf redis.RedisConf) *redis.Redis {
	return redis.MustNewRedis(conf)
}
```

servicecontext中注入：

```go
package svc

import (
	"github.com/zeromicro/go-zero/core/stores/redis"
	"github.com/zeromicro/go-zero/core/stores/sqlx"
	"user-api/internal/config"
	"user-api/internal/db"
)

type ServiceContext struct {
	Config      config.Config
	Conn        sqlx.SqlConn
	RedisClient *redis.Redis
}

func NewServiceContext(c config.Config) *ServiceContext {
	sqlConn := db.NewMysql(c.MysqlConfig)
	redisClient := db.NewRedis(c.RedisConfig)
	return &ServiceContext{
		Config:      c,
		Conn:        sqlConn,
		RedisClient: redisClient,
	}
}
```

改造登录代码：

```go
func (l *LoginLogic) Login(req *types.LoginReq) (resp *types.LoginResp, err error) {
	// todo: add your logic here and delete this line
	userModel := user.NewUserModel(l.svcCtx.Conn)
	u, err := userModel.FindByUsernameAndPwd(l.ctx, req.Username, req.Password)
	if err != nil {
		l.Logger.Error(err)
		return nil, biz.DBError
	}
	if u == nil {
		return nil, biz.NameOrPwdError
	}
	//登录成功 生成token
	secret := l.svcCtx.Config.Auth.Secret
	expire := l.svcCtx.Config.Auth.Expire
	token, err := biz.GetJwtToken(secret, time.Now().Unix(), expire, u.Id)
	if err != nil {
		l.Logger.Error(err)
		return nil, biz.TokenError
	}
    //把token存入redis
	err = l.svcCtx.RedisClient.SetexCtx(context.Background(), "token:"+token, strconv.FormatInt(u.Id, 10), int(expire))
	if err != nil {
		return nil, biz.RedisError
	}
	resp = &types.LoginResp{
		Token: token,
	}
	return
}
```

测试

### 4.3 集群

集群方式只需要改配置即可，go-zero对集群和单机做了适配。

go-zero内置redis的缺陷：

- 不能选择redis数据库
- 不能配置连接池
- 对原生go-redis配置项不能自定义

> 实际开发中，如果对配置项需要精细化控制，建议直接使用go-redis库即可，并且自行对go-redis进行封装

#  gRPC

## 1. gRPC讲解

![微服务云架构示意图](go-zeroimg/dgm-1200x625-microsvcs-cloud-architecture-2X-11AUG23.6fcacc97.png)

> 我们回顾一下微服务，`微服务架构将应用构建为一系列小型，松散耦合且可独立部署的服务`，每项服务均旨在执行特定业务功能，可通过定义`明确的API与其他服务进行通信`。

- 微服务之间通信的方式为`RPC`
- 在Golang的体系中，`gRPC`是使用最广的RPC框架。
- `gRPC`基于HTTP/2.0，采用`Protobuf`作为数据序列化协议。
- `gRPC`具有语言中立的特点
- `go-zero`框架对GRPC已经支持，可以轻松的开发gRPC应用

### 1.1 proto文件

> 在使用Protobuf之前，我们需要编写proto格式的文件

```protobuf
//指定正在使用proto3语法
syntax = "proto3";
//消息类型 用于传输的数据格式的定义
//每个字段必须指定字段编号： 1到536870911之间的一个数字，需要唯一，19000到19999是保留编号不能使用
message SearchRequest {
  string query = 1;
  int32 page_number = 2;
  int32 results_per_page = 3;
}
message SearchResponse{}
//可以导入其他proto文件 使用其他proto文件定义的消息
import "myproject/other_protos.proto";
//包定义 防止消息类型之间的名称冲突
package foo.bar
//定义RPC服务接口 
service SearchService {
  rpc Search(SearchRequest) returns (SearchResponse);
}
```

## 2. gRPC案例

> `rpc`分为`server端`和`client端`：
>
> - server端提供`rpc服务`，为`服务提供方`
> - client端为`服务消费方`
> - RPC框架的目的是让远程调用变得和本地调用一样方便

### 2.1 server端

1. 先生成proto文件

   ```go
   goctl rpc -o greet.proto
   ```

   ```protobuf
   //语法版本
   syntax = "proto3";
   //包定义 对go无效
   package greet;
   //生成go文件的包名
   option go_package="./greet";
   //消息体 需要传输的数据结构
   message Request {
     string ping = 1;
   }
   //消息体 需要传输的数据结构
   message Response {
     string pong = 1;
   }
   //服务名称以及服务定义
   service Greet {
     rpc Ping(Request) returns(Response);
   }
   ```

2. 生成gRPC服务端

   ```go
   $ goctl rpc protoc greet.proto --go_out=./grpc-server  --go-grpc_out=./grpc-server  --zrpc_out=./grpc-server
   ```

   - `go_out: `proto生成的go代码所在的目录，proto本身的命令参数
   - `go-grpc_out：`proto生成的grpc代码所在的目录，proto本身的命令参数，和`go_out`必须同一个目录
   - `zrpc_out：` `goctl rpc`自带的命令，go-zero生成的代码所在的目录

3. 拉取依赖

   ```bash
   # cd grpc-server
   # go mod tidy
   ```

4. 编写代码逻辑

   ```go
   func (l *PingLogic) Ping(in *greet.Request) (*greet.Response, error) {
   	// todo: add your logic here and delete this line
   
   	return &greet.Response{
   		Pong: "pong",
   	}, nil
   }
   ```

5. 修改配置文件，去掉etcd配置，采用直连模式

   ```go
   Name: greet.rpc
   ListenOn: 0.0.0.0:8080
   #Etcd:
   #  Hosts:
   #  - 127.0.0.1:2379
   #  Key: greet.rpc
   ```

6. 启动服务

观察生成的代码：

```go
s := zrpc.MustNewServer(c.RpcServerConf, func(grpcServer *grpc.Server) {
      // 向grpc注册服务
		greet.RegisterGreetServer(grpcServer, server.NewGreetServer(ctx))

		if c.Mode == service.DevMode || c.Mode == service.TestMode {
            //注册反射服务，在gRPC中，反射是一种机制，允许客户端在不知道服务定义（即.proto文件）的情况下查询服务端上的gRPC服务信息。
			reflection.Register(grpcServer)
		}
	})
	defer s.Stop()
```

### 2.2 grpcurl

> 上述我们注册了`反射服务`，可以使用`grpcurl`来进行测试

#### 2.2.1 安装

去`https://github.com/fullstorydev/grpcurl/releases `下载。

下载完成后，配置环境变量或者直接放在`GOPATH的bin`目录下即可。

![image-20240926191922091](go-zeroimg/image-20240926191922091.19625511.png)

#### 2.2.2 基本使用

```yaml
Name: greet.rpc
ListenOn: 0.0.0.0:8080
Mode: dev #开发模式 用于反射服务可用
```

```bash
# 获取grpc服务列表 -plaintext选项代表使用http连接
# grpcurl -plaintext localhost:8080 list
greet.Greet
grpc.health.v1.Health
grpc.reflection.v1.ServerReflection
grpc.reflection.v1alpha.ServerReflection
```

```bash
# 获取grpc服务的方法
# grpcurl -plaintext localhost:8080 list greet.Greet
greet.Greet.Ping
```

```bash
# 获取服务细节 或者 方法细节
# grpcurl -plaintext localhost:8080 describe
greet.Greet is a service:
service Greet {
  rpc Ping ( .greet.Request ) returns ( .greet.Response );
}
# grpcurl -plaintext localhost:8080 describe greet.Greet
greet.Greet is a service:
service Greet {
  rpc Ping ( .greet.Request ) returns ( .greet.Response );
}
```

```bash
# 获取类型信息
# grpcurl -plaintext localhost:8080 describe greet.Request
greet.Request is a message:
message Request {
  string ping = 1;
}
```

```bash
# 调用方法
# grpcurl -d {\"ping\":\"ping\"} -plaintext  localhost:8080 greet.Greet/Ping
# 或者使用 -d @  这种是流式输入，windows用先回车 crtl+z结束输入 其他一般用 先回车 crtl+d结束输入
# grpcurl -d @ -plaintext  localhost:8080 greet.Greet/Ping
{"ping":"ping"}
```

> 经过测试，我们发现grpc服务可以正常使用

### 2.4 client端

1. 创建`grpc-client`目录，在目录下，新建`etc`目录和`client.go`

2. `client.go`内容

   ```go
   package main
   
   import (
   	"context"
   	"github.com/zeromicro/go-zero/core/conf"
   	"github.com/zeromicro/go-zero/zrpc"
   	"gozero-learn/grpc-server/greet"
   	"log"
   )
   
   func main() {
   	var clientConf zrpc.RpcClientConf
   	conf.MustLoad("grpc-client/etc/client.yaml", &clientConf)
   	conn := zrpc.MustNewClient(clientConf)
   	client := greet.NewGreetClient(conn.Conn())
   	resp, err := client.Ping(context.Background(), &greet.Request{Ping: "ping"})
   	if err != nil {
   		log.Fatal(err)
   		return
   	}
   
   	log.Println(resp)
   }
   ```

3. `client.yaml`配置文件内容：

   ```yaml
   Target: 127.0.0.1:8080
   ```

4. 运行进行测试

#### 2.4.1 原生支持

```go
func main() {
	var clientConf zrpc.RpcClientConf
	conf.MustLoad("grpc-client/etc/client.yaml", &clientConf)
	//conn := zrpc.MustNewClient(clientConf)
	conn, err := grpc.NewClient("127.0.0.1:8080", grpc.WithTransportCredentials(insecure.NewCredentials()))
	if err != nil {
		log.Fatal(err)
	}
	client := greet.NewGreetClient(conn)
	resp, err := client.Ping(context.Background(), &greet.Request{Ping: "ping"})
	if err != nil {
		log.Fatal(err)
		return
	}
	log.Println(resp)
}
```

## 3. 配置文件说明

> 在使用`gRPC`服务时，我们会用到`go-zero`内置的`RpcClientConf`配置和`RpcServerConf`配置

- RpcSeverConf：
  
  - ServiceConf: 基础服务配置
  - ListenOn: 监听地址
  - Etcd: etcd 配置项
  - Auth: 是否开启 Auth
  - Redis: rpc 认证，仅当 Auth 为 true 生效
  - Timeout: 超时时间
  - Middlewares: 启用中间件
  - Health: 是否开启健康检查
  
- RpcClientConf
  
  ：

  - Etcd: 服务发现配置，当需要使用 etcd 做服务发现时配置
  - Endpoints: RPC Server 地址列表，用于直连，当需要直连 rpc server 集群时配置
  - Target: 域名解析地址，名称规则请参考
  - App: rpc 认证的 app 名称，仅当 rpc server 开启认证时配置
  - Token: rpc 认证的 token，仅当 rpc server 开启认证时配置
  - NonBlock: 是否阻塞模式,当值为 true 时，不会阻塞 rpc 链接
  - Timeout: 超时时间
  - KeepaliveTime: 保活时间
  - Middlewares: 是否启用中间件

## 4. 使用etcd

### 4.1 服务发现

![服务发现概述](go-zeroimg/NameService1.1bb3d508.png)

> 注册中心是服务发现的核心，是包含服务实例数据(例如ip地址，端口等)的数据库。所以注册中心需要一个高可用的分布式键/值存储，例如Etcd，Zookeeper，Consul等。

- Etcd更加稳定可靠
- 在服务发现的实现上，Etcd使用的是节点租约(Lease)
- Etcd支持稳定的watch
- Etcd支持mvcc
- Etcd支持更大的数据规模，支持存储百万到千万级别的key
- Etcd性能更好

### 4.2 docker-compose配置

```yaml
version: "3.5"
services:
  Etcd:
    container_name: etcd3-go-zero
    image: bitnami/etcd:3.5.6
    deploy:
      replicas: 1
      restart_policy:
        condition: on-failure
    environment:
      - ALLOW_NONE_AUTHENTICATION=yes
      - ETCD_SNAPSHOT_COUNT=10000
      - ETCD_QUOTA_BACKEND_BYTES=6442450944
    privileged: true
    volumes:
      - ./volumes/etcd/data:/bitnami/etcd/data
    ports:
      - 2379:2379
      - 2380:2380
```

### 4.3 使用etcd做为注册中心

- server端：

  ```yaml
  Etcd:
    Hosts:
    - 127.0.0.1:2379
    Key: greet.rpc
  ```

- client端：

  ```yaml
  #Target: 127.0.0.1:8080
  Etcd:
    Hosts:
    - 127.0.0.1:2379
    Key: greet.rpc
  ```

如果使用`grpc`原生支持：

```go
func main() {
	var clientConf zrpc.RpcClientConf
	conf.MustLoad("grpc-client/etc/client.yaml", &clientConf)
	//conn := zrpc.MustNewClient(clientConf)
	conn, err := grpc.NewClient("etcd://127.0.0.1:2379/greet.rpc", grpc.WithTransportCredentials(insecure.NewCredentials()))
	if err != nil {
		log.Fatal(err)
	}
	client := greet.NewGreetClient(conn)
	resp, err := client.Ping(context.Background(), &greet.Request{Ping: "ping"})
	if err != nil {
		log.Fatal(err)
		return
	}
	log.Println(resp)
}
```

#  中间件

> go-zero框架中内置了很多中间件，我们分别介绍一下这些中间件的作用和如何使用

- 鉴权管理中间件 AuthorizeHandler
- 熔断中间件 BreakerHandler
- 内容安全中间件 ContentSecurityHandler
- 解密中间件 CryptionHandler
- 压缩管理中间件 GunzipHandler
- 日志中间件 LogHandler
- ContentLength 管理中间件 MaxBytesHandler
- 限流中间件 MaxConnsHandler
- 指标统计中间件 MetricHandler
- 普罗米修斯指标中间件 PrometheusHandler
- panic 恢复中间件 RecoverHandler
- 负载监控中间件 SheddingHandler
- 超时中间件 TimeoutHandler
- 链路追踪中间件 TraceHandler

## 1. 鉴权管理中间件

> 这部分就是之前使用的jwt认证，当携带token时，会解析token，判断token是否有效

```go
func Authorize(secret string, opts ...AuthorizeOption) func(http.Handler) http.Handler {
	var authOpts AuthorizeOptions
	for _, opt := range opts {
		opt(&authOpts)
	}

	parser := token.NewTokenParser()
	return func(next http.Handler) http.Handler {
		return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
            //解析token
			tok, err := parser.ParseToken(r, secret, authOpts.PrevSecret)
			if err != nil {
				unauthorized(w, r, err, authOpts.Callback)
				return
			}

			if !tok.Valid {
				unauthorized(w, r, errInvalidToken, authOpts.Callback)
				return
			}
			//获取jwt中的payload
			claims, ok := tok.Claims.(jwt.MapClaims)
			if !ok {
				unauthorized(w, r, errNoClaims, authOpts.Callback)
				return
			}

			ctx := r.Context()
			for k, v := range claims {
				switch k {
				case jwtAudience, jwtExpire, jwtId, jwtIssueAt, jwtIssuer, jwtNotBefore, jwtSubject:
					// ignore the standard claims
				default:
                    //将数据放入上下文
					ctx = context.WithValue(ctx, k, v)
				}
			}

			next.ServeHTTP(w, r.WithContext(ctx))
		})
	}
}
```

## 2. 熔断中间件

> 断路器又叫熔断器，是一种保护机制，用于保护服务调用链路中的服务不被过多的请求压垮。当服务调用链路中的某个服务出现异常时，断路器会将该服务的调用请求拒绝，从而保护服务调用链路中的其他服务不被压垮。

![img](go-zeroimg/081bafee6d761a596b64be95b8993c6e3c931ea4_2_690x283.aeb38448.png)

![img](go-zeroimg/bba826237846459e09f27c61d501ebd7646282b1_2_690x433.553aa153.jpeg)

- go-zero 中采用滑动窗口来进行数据采集，目前是以 10s 为一个窗口，单个窗口有40个桶，然后将窗口内采集的数据采用的是 `google sre 算法`计算是否开启熔断
- HTTP 以`请求方法+路由`作为统计维度，用 `HTTP 状态码 500` 作为错误采集指标进行统计
- gRPC 客户端以` rpc 方法名`作为统计维度，用 grpc 的错误码为 `codes.DeadlineExceeded`, `codes.Internal`, `codes.Unavailable`, `codes.DataLoss`, `codes.Unimplemented` 作为错误采集指标进行统计
- gRPC 服务端以` rpc 方法`名称作为统计维度，用 `grpc 的错误`作为错误采集指标进行统计

```go
func BreakerHandler(method, path string, metrics *stat.Metrics) func(http.Handler) http.Handler {
    //path和method是route的 get /user/info
	brk := breaker.NewBreaker(breaker.WithName(strings.Join([]string{method, path}, breakerSeparator)))
	return func(next http.Handler) http.Handler {
		return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
            //判断请求是否允许通过
			promise, err := brk.Allow()
			if err != nil {
				metrics.AddDrop()
				logx.Errorf("[http] dropped, %s - %s - %s",
					r.RequestURI, httpx.GetRemoteAddr(r), r.UserAgent())
				w.WriteHeader(http.StatusServiceUnavailable)
				return
			}

			cw := response.NewWithCodeResponseWriter(w)
			defer func() {
				if cw.Code < http.StatusInternalServerError {
					promise.Accept()
				} else {
					promise.Reject(fmt.Sprintf("%d %s", cw.Code, http.StatusText(cw.Code)))
				}
			}()
			next.ServeHTTP(cw, r)
		})
	}
}
```

修改代码进行断路器测试：

```go
func (l *GetUserInfoLogic) GetUserInfo() (resp *types.UserInfoResp, err error) {
	userId, err := l.ctx.Value("userId").(json.Number).Int64()
	if err != nil {
		return nil, biz.TokenError
	}
	if userId <= 5 {
		return nil, errors.New("熔断错误测试")
	}
    ...
}
```

> 请求接口，返回500错误，请求一定次数后，返回503（服务不可用），断路器生效

关闭：

```yaml
Middlewares:
 # 控制断路器是否开启
  Breaker: false
```

## 3. 内容安全中间件

```go
// LimitContentSecurityHandler returns a middleware to verify content security.
func LimitContentSecurityHandler(limitBytes int64, decrypters map[string]codec.RsaDecrypter,
	tolerance time.Duration, strict bool, callbacks ...UnsignedCallback) func(http.Handler) http.Handler {
	if len(callbacks) == 0 {
		callbacks = append(callbacks, handleVerificationFailure)
	}

	return func(next http.Handler) http.Handler {
		return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			switch r.Method {
			case http.MethodDelete, http.MethodGet, http.MethodPost, http.MethodPut:
				header, err := security.ParseContentSecurity(decrypters, r)
				if err != nil {
					logx.Errorf("Signature parse failed, X-Content-Security: %s, error: %s",
						r.Header.Get(contentSecurity), err.Error())
					executeCallbacks(w, r, next, strict, httpx.CodeSignatureInvalidHeader, callbacks)
				} else if code := security.VerifySignature(r, header, tolerance); code != httpx.CodeSignaturePass {
					logx.Errorf("Signature verification failed, X-Content-Security: %s",
						r.Header.Get(contentSecurity))
					executeCallbacks(w, r, next, strict, code, callbacks)
				} else if r.ContentLength > 0 && header.Encrypted() {
                    //解密中间件
					LimitCryptionHandler(limitBytes, header.Key)(next).ServeHTTP(w, r)
				} else {
					next.ServeHTTP(w, r)
				}
			default:
				next.ServeHTTP(w, r)
			}
		})
	}
}
```

> 采用RSA加密算法，客户端使用公钥对消息进行加密，服务端使用私钥对消息进行解密

配置项：

```go
// A SignatureConf is a signature config.
	SignatureConf struct {
		Strict      bool          `json:",default=false"`
		Expiry      time.Duration `json:",default=1h"`
		PrivateKeys []PrivateKeyConf
	}
	// A PrivateKeyConf is a private key config.
	PrivateKeyConf struct {
		Fingerprint string
		KeyFile     string
	}
```

开启签名：

```go
@server (
	//代表当前service的代码会放在account目录下
	//这里注意 冒汗要紧贴着key
	group: account
	//路由前缀
	prefix: v1
	//开启jwt认证
	jwt: Auth
	//开启签名认证
	signature: true
)
```

```go
server.AddRoutes(
		[]rest.Route{
			{
				Method:  http.MethodGet,
				Path:    "/user/info",
				Handler: account.GetUserInfoHandler(serverCtx),
			},
		},
		rest.WithJwt(serverCtx.Config.Auth.AccessSecret),
		rest.WithSignature(serverCtx.Config.Signature),
		rest.WithPrefix("/v1"),
	)
```

设置签名未通过的处理：

```go
	server := rest.MustNewServer(
		c.RestConf,
		rest.WithCors("*"),
        rest.WithCorsHeaders("X-Content-Security"),
		rest.WithUnsignedCallback(func(w http.ResponseWriter, r *http.Request, next http.Handler, strict bool, code int) {
			fmt.Println("-------------签名未通过")
		}),
	)
```

配置：

```yaml
Signature:
  PrivateKeys:
    - Fingerprint: "kQz7qW/LWL+10KatnBaX3A=="
      KeyFile: "etc/pri.key"
```

```go
-----BEGIN RSA PRIVATE KEY-----
MIICXQIBAAKBgQCyeDYV2ieOtNDi6tuNtAbmUjN9pTHluAU5yiKEz8826QohcxqU
KP3hybZBcm60p+rUxMAJFBJ8Dt+UJ6sEMzrf1rOFYOImVvORkXjpFU7sCJkhnLMs
/kxtRzcZJG6ADUlG4GDCNcZpY/qELEvwgm2kCcHitGC2mO8opFFFHTR0aQIDAQAB
AoGAcENv+jT9VyZkk6karLuG75DbtPiaN5+XIfAF4Ld76FWVOs9V88cJVON20xpx
ixBphqexCMToj8MnXuHJEN5M9H15XXx/9IuiMm3FOw0i6o0+4V8XwHr47siT6T+r
HuZEyXER/2qrm0nxyC17TXtd/+TtpfQWSbivl6xcAEo9RRECQQDj6OR6AbMQAIDn
v+AhP/y7duDZimWJIuMwhigA1T2qDbtOoAEcjv3DB1dAswJ7clcnkxI9a6/0RDF9
0IEHUcX9AkEAyHdcegWiayEnbatxWcNWm1/5jFnCN+GTRRFrOhBCyFr2ZdjFV4T+
acGtG6omXWaZJy1GZz6pybOGy93NwLB93QJARKMJ0/iZDbOpHqI5hKn5mhd2Je25
IHDCTQXKHF4cAQ+7njUvwIMLx2V5kIGYuMa5mrB/KMI6rmyvHv3hLewhnQJBAMMb
cPUOENMllINnzk2oEd3tXiscnSvYL4aUeoErnGP2LERZ40/YD+mMZ9g6FVboaX04
0oHf+k5mnXZD7WJyJD0CQQDJ2HyFbNaUUHK+lcifCibfzKTgmnNh9ZpePFumgJzI
EfFE5H+nzsbbry2XgJbWzRNvuFTOLWn4zM+aFyy9WvbO
-----END RSA PRIVATE KEY-----
```

前端添加头信息：

```go
'X-Content-Security':"key=kQz7qW/LWL+10KatnBaX3A==; secret=Ar5FnHunK82kPeM1eQHpaBHjsjas4ruT8cB/Ht+St44nX7fsLU968vkqvaIJ/+uH4gAeaSwf9+NeTxFcFecl+rBrp5uLnLKMsPzEsXaoBPd33nFxwWcpQ4RR4Z4y2KxcIRZ2Fkj2iEqKFdpLgPQ/giSmh9uZddOjDJpdgs76Yw0=; signature=oyJlQyfBDkRWtJOoG8fKiCXaDvAswRGTtGzFf6Avjy4=",
```

访问测试。

生成`X-Content-Security`的代码：

```go
package biz

import (
	"bytes"
	"crypto/hmac"
	"crypto/md5"
	"crypto/sha256"
	"encoding/base64"
	"fmt"
	"github.com/zeromicro/go-zero/core/iox"
	"io"
	"log"
	"net/http"
	"os"
	"strconv"
	"strings"
	"testing"
	"time"

	"github.com/stretchr/testify/assert"
	"github.com/zeromicro/go-zero/core/codec"
	"github.com/zeromicro/go-zero/core/fs"
)

const (
	pubKey = `-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCyeDYV2ieOtNDi6tuNtAbmUjN9
pTHluAU5yiKEz8826QohcxqUKP3hybZBcm60p+rUxMAJFBJ8Dt+UJ6sEMzrf1rOF
YOImVvORkXjpFU7sCJkhnLMs/kxtRzcZJG6ADUlG4GDCNcZpY/qELEvwgm2kCcHi
tGC2mO8opFFFHTR0aQIDAQAB
-----END PUBLIC KEY-----`
	priKey = `-----BEGIN RSA PRIVATE KEY-----
MIICXQIBAAKBgQCyeDYV2ieOtNDi6tuNtAbmUjN9pTHluAU5yiKEz8826QohcxqU
KP3hybZBcm60p+rUxMAJFBJ8Dt+UJ6sEMzrf1rOFYOImVvORkXjpFU7sCJkhnLMs
/kxtRzcZJG6ADUlG4GDCNcZpY/qELEvwgm2kCcHitGC2mO8opFFFHTR0aQIDAQAB
AoGAcENv+jT9VyZkk6karLuG75DbtPiaN5+XIfAF4Ld76FWVOs9V88cJVON20xpx
ixBphqexCMToj8MnXuHJEN5M9H15XXx/9IuiMm3FOw0i6o0+4V8XwHr47siT6T+r
HuZEyXER/2qrm0nxyC17TXtd/+TtpfQWSbivl6xcAEo9RRECQQDj6OR6AbMQAIDn
v+AhP/y7duDZimWJIuMwhigA1T2qDbtOoAEcjv3DB1dAswJ7clcnkxI9a6/0RDF9
0IEHUcX9AkEAyHdcegWiayEnbatxWcNWm1/5jFnCN+GTRRFrOhBCyFr2ZdjFV4T+
acGtG6omXWaZJy1GZz6pybOGy93NwLB93QJARKMJ0/iZDbOpHqI5hKn5mhd2Je25
IHDCTQXKHF4cAQ+7njUvwIMLx2V5kIGYuMa5mrB/KMI6rmyvHv3hLewhnQJBAMMb
cPUOENMllINnzk2oEd3tXiscnSvYL4aUeoErnGP2LERZ40/YD+mMZ9g6FVboaX04
0oHf+k5mnXZD7WJyJD0CQQDJ2HyFbNaUUHK+lcifCibfzKTgmnNh9ZpePFumgJzI
EfFE5H+nzsbbry2XgJbWzRNvuFTOLWn4zM+aFyy9WvbO
-----END RSA PRIVATE KEY-----`
	body = ""
)

var key = []byte("q4t7w!z%C*F-JaNdRgUjXn2r5u8x/A?D")

func TestContentSecurity(t *testing.T) {
	tests := []struct {
		name        string
		mode        string
		extraKey    string
		extraSecret string
		extraTime   string
		err         error
		code        int
	}{
		{
			name:      "encrypted",
			mode:      "1",
			extraTime: "3600",
		},
	}

	for _, test := range tests {
		test := test
		t.Run(test.name, func(t *testing.T) {
			t.Parallel()
			limit := int64(1024)
			src := []byte("")
			rb := bytes.NewBuffer(src)
			wb := new(bytes.Buffer)
			r, err := http.NewRequest(http.MethodGet, "http://localhost:8888/v1/user/info",
				io.TeeReader(iox.LimitTeeReader(http.NoBody, wb, limit), rb))
			r.Header.Set("Content-Type", "application/json")
			assert.Nil(t, err)

			timestamp := time.Now().Unix()
			bodySign := computeBodySignature(r)
			fmt.Println(bodySign)
			contentOfSign := strings.Join([]string{
				strconv.FormatInt(timestamp+3600, 10),
				http.MethodGet,
				r.URL.Path,
				r.URL.RawQuery,
				bodySign,
			}, "\n")
			sign := hs256(key, contentOfSign)
			content := strings.Join([]string{
				"version=v1",
				"type=" + test.mode,
				fmt.Sprintf("key=%s", base64.StdEncoding.EncodeToString(key)) + test.extraKey,
				"time=" + strconv.FormatInt(timestamp+3600, 10),
			}, "; ")

			encrypter, err := codec.NewRsaEncrypter([]byte(pubKey))
			if err != nil {
				log.Fatal(err)
			}

			output, err := encrypter.Encrypt([]byte(content))
			if err != nil {
				log.Fatal(err)
			}

			encryptedContent := base64.StdEncoding.EncodeToString(output)
			join := strings.Join([]string{
				fmt.Sprintf("key=%s", fingerprint(pubKey)),
				"secret=" + encryptedContent + test.extraSecret,
				"signature=" + sign,
			}, "; ")
			fmt.Println(join)
			r.Header.Set("X-Content-Security", join)

			file, err := fs.TempFilenameWithText(priKey)
			assert.Nil(t, err)
			defer os.Remove(file)

		})
	}
}

func computeBodySignature(r *http.Request) string {
	var dup io.ReadCloser
	r.Body, dup = iox.DupReadCloser(r.Body)
	sha := sha256.New()
	io.Copy(sha, r.Body)
	r.Body = dup
	return fmt.Sprintf("%x", sha.Sum(nil))
}

func fingerprint(key string) string {
	h := md5.New()
	io.WriteString(h, key)
	return base64.StdEncoding.EncodeToString(h.Sum(nil))
}

func hs256(key []byte, body string) string {
	h := hmac.New(sha256.New, key)
	io.WriteString(h, body)
	return base64.StdEncoding.EncodeToString(h.Sum(nil))
}
```

## 4. 解密中间件

```go
// LimitCryptionHandler returns a middleware to handle cryption.
func LimitCryptionHandler(limitBytes int64, key []byte) func(http.Handler) http.Handler {
	return func(next http.Handler) http.Handler {
		return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			cw := newCryptionResponseWriter(w)
			defer cw.flush(key)

			if r.ContentLength <= 0 {
				next.ServeHTTP(cw, r)
				return
			}

			if err := decryptBody(limitBytes, key, r); err != nil {
				w.WriteHeader(http.StatusBadRequest)
				return
			}

			next.ServeHTTP(cw, r)
		})
	}
}
```

> 使用AES加密方式，ECB模式。
>
> 在`内容安全中间件`中，如果解密出来的header信息中携带有`对内容加密的标识`，需要继续对内容进行解密才可以，这时就使用到了`解密中间件`。

## 5. 压缩管理中间件

```go
// GunzipHandler returns a middleware to gunzip http request body.
func GunzipHandler(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if strings.Contains(r.Header.Get(httpx.ContentEncoding), gzipEncoding) {
			reader, err := gzip.NewReader(r.Body)
			if err != nil {
				w.WriteHeader(http.StatusBadRequest)
				return
			}

			r.Body = reader
		}

		next.ServeHTTP(w, r)
	})
}
```

> 如果请求Header中`Content-Encoding=gzip`，则使用gzip的方式进行读取

## 6. 日志中间件

```go
func LogHandler(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		timer := utils.NewElapsedTimer()
		logs := new(internal.LogCollector)
		lrw := response.NewWithCodeResponseWriter(w)

		var dup io.ReadCloser
		r.Body, dup = iox.LimitDupReadCloser(r.Body, limitBodyBytes)
		next.ServeHTTP(lrw, r.WithContext(internal.WithLogCollector(r.Context(), logs)))
		r.Body = dup
		logBrief(r, lrw.Code, timer, logs)
	})
}
```

```go
func logBrief(r *http.Request, code int, timer *utils.ElapsedTimer, logs *internal.LogCollector) {
	var buf bytes.Buffer
	duration := timer.Duration()
	logger := logx.WithContext(r.Context()).WithDuration(duration)
	buf.WriteString(fmt.Sprintf("[HTTP] %s - %s %s - %s - %s",
		wrapStatusCode(code), wrapMethod(r.Method), r.RequestURI, httpx.GetRemoteAddr(r), r.UserAgent()))
	if duration > slowThreshold.Load() {
		logger.Slowf("[HTTP] %s - %s %s - %s - %s - slowcall(%s)",
			wrapStatusCode(code), wrapMethod(r.Method), r.RequestURI, httpx.GetRemoteAddr(r), r.UserAgent(),
			timex.ReprOfDuration(duration))
	}

	ok := isOkResponse(code)
	if !ok {
		buf.WriteString(fmt.Sprintf("\n%s", dumpRequest(r)))
	}

	body := logs.Flush()
	if len(body) > 0 {
		buf.WriteString(fmt.Sprintf("\n%s", body))
	}

	if ok {
		logger.Info(buf.String())
	} else {
		logger.Error(buf.String())
	}
}
```

> 打印请求日志，可以通过配置开关

```yaml
Middlewares:
# 是否开启日志记录
  Log: false
# 配置为true 代码记录详细的日志 对应中间件为DetailedLogHandler 必须先开启日志才能生效
Verbose: true
```

## 7. ContentLength 管理中间件

```go
// MaxBytesHandler returns a middleware that limit reading of http request body.
func MaxBytesHandler(n int64) func(http.Handler) http.Handler {
    //配置小于等于0 代表不限制
	if n <= 0 {
		return func(next http.Handler) http.Handler {
			return next
		}
	}

	return func(next http.Handler) http.Handler {
		return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			if r.ContentLength > n {
				internal.Errorf(r, "request entity too large, limit is %d, but got %d, rejected with code %d",
					n, r.ContentLength, http.StatusRequestEntityTooLarge)
				w.WriteHeader(http.StatusRequestEntityTooLarge)
			} else {
				next.ServeHTTP(w, r)
			}
		})
	}
}
```

> `Content-Length`表示请求消息中body的长度，此中间件可以通过配置对消息的长度做限制，不符合条件返回`413`（请求的数据超过服务器的限制）

```yaml
Middlewares:
  #控制此中间件是否开启
  MaxBytes: false
```

在创建路由时：

```go
//配置限制的数据长度
rest.WithMaxBytes(1048576)
```

```go
@server (
	//代表当前service的代码会放在account目录下
	//这里注意 冒汗要紧贴着key
	group: account
	//路由前缀
	prefix:   v1
	jwt:      Auth
    //配置限制的数据长度
	maxBytes: 1048576
)
```

## 8. 限流中间件

```go
// MaxConnsHandler returns a middleware that limit the concurrent connections.
func MaxConnsHandler(n int) func(http.Handler) http.Handler {
    //配置小于0 代表不限流
	if n <= 0 {
		return func(next http.Handler) http.Handler {
			return next
		}
	}

	return func(next http.Handler) http.Handler {
		latch := syncx.NewLimit(n)

		return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			if latch.TryBorrow() {
				defer func() {
					if err := latch.Return(); err != nil {
						logx.WithContext(r.Context()).Error(err)
					}
				}()

				next.ServeHTTP(w, r)
			} else {
				internal.Errorf(r, "concurrent connections over %d, rejected with code %d",
					n, http.StatusServiceUnavailable)
				w.WriteHeader(http.StatusServiceUnavailable)
			}
		})
	}
}
```

> 用于限制 http 最大并发请求数，当并发请求数超过设置的值（默认为 10000），当超过设置值会返回 http.StatusServiceUnavailable 状态码

```yaml
Middlewares:
 #配置是否开启中间件
  MaxConns: true
# 配置触发限流的并发请求数
MaxConns: 10000
```

可以通过并发测试软件对其进行测试验证。

## 9. 指标统计中间件

```go
// MetricHandler returns a middleware that stat the metrics.
func MetricHandler(metrics *stat.Metrics) func(http.Handler) http.Handler {
	return func(next http.Handler) http.Handler {
		return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			startTime := timex.Now()
			defer func() {
				metrics.Add(stat.Task{
					Duration: timex.Since(startTime),
				})
			}()

			next.ServeHTTP(w, r)
		})
	}
}
func log(report *StatReport) {
	writeReport(report)
	if logEnabled.True() {
		logx.Statf("(%s) - qps: %.1f/s, drops: %d, avg time: %.1fms, med: %.1fms, "+
			"90th: %.1fms, 99th: %.1fms, 99.9th: %.1fms",
			report.Name, report.ReqsPerSecond, report.Drops, report.Average, report.Median,
			report.Top90th, report.Top99th, report.Top99p9th)
	}
}
```

> 开启指标统计后，统计请求相关的一些指标，qps，drops，avg，med，t90，t99等

```yaml
Middlewares:
  # 开启指标统计
  Metrics: false
```

```go
stat   (user-api) - qps: 0.1/s, drops: 0, avg time: 1.2ms, med: 1.5ms, 90th: 1.6ms, 99th: 1.6ms, 99.9th: 1.6ms     caller=stat/metrics.go:210
```

stat (user-api) - qps: 0.1/s, drops: 0, avg time: 1.2ms, med: 1.5ms, 90th: 1.6ms, 99th: 1.6ms, 99.9th: 1.6ms caller=stat/metrics.go:210

`TP指标: `指在一个时间段内，统计该方法每次调用所消耗的时间，并将这些时间按从小到大的顺序进行排序, 并取出结果为 ： `总次数 * 指标数 = 对应TP指标的序号 `， 再根据序号取出对应排序好的时间，即为TP指标。

- 假设上一分钟内接口被调用100次，100次的调用耗时分别为：1、2、3...99、100秒。
- 我们对耗时进行从小到大排序，形成容量为100的数组A=[1s,2s,3s....99s,100s]
- TP50的计算方式：`100*50%=50，所以TP50指标=A[50]=50s`
- TP99的计算方式：`100*99%=99，所以TP99指标=A[99]=99s`
- TP999的计算方式：`100*999%=99.9，99.9进位取整为100，所以TP999指标=A[999]=100s`

## 10. panic 恢复中间件

```go
// RecoverHandler returns a middleware that recovers if panic happens.
func RecoverHandler(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		defer func() {
			if result := recover(); result != nil {
				internal.Error(r, fmt.Sprintf("%v\n%s", result, debug.Stack()))
				w.WriteHeader(http.StatusInternalServerError)
			}
		}()

		next.ServeHTTP(w, r)
	})
}
```

> 用于捕获panic错误

## 11. 超时中间件

```go
/ TimeoutHandler returns the handler with given timeout.
// If client closed request, code 499 will be logged.
// Notice: even if canceled in server side, 499 will be logged as well.
func TimeoutHandler(duration time.Duration) func(http.Handler) http.Handler {
	return func(next http.Handler) http.Handler {
		if duration <= 0 {
			return next
		}

		return &timeoutHandler{
			handler: next,
			dt:      duration,
		}
	}
}
```

```yaml
Timeout: 3000 # 默认超时时间为3000毫秒
```

```go
@server (
    timeout:    3s // 对当前 Foo 语法块下的所有路由进行超时配置，不需要则请删除此行
)
```

## 12. 负载监控中间件

```go
// SheddingHandler returns a middleware that does load shedding.
func SheddingHandler(shedder load.Shedder, metrics *stat.Metrics) func(http.Handler) http.Handler {
	if shedder == nil {
		return func(next http.Handler) http.Handler {
			return next
		}
	}

	ensureSheddingStat()

	return func(next http.Handler) http.Handler {
		return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			sheddingStat.IncrementTotal()
			promise, err := shedder.Allow()
			if err != nil {
				metrics.AddDrop()
				sheddingStat.IncrementDrop()
				logx.Errorf("[http] dropped, %s - %s - %s",
					r.RequestURI, httpx.GetRemoteAddr(r), r.UserAgent())
				w.WriteHeader(http.StatusServiceUnavailable)
				return
			}

			cw := response.NewWithCodeResponseWriter(w)
			defer func() {
				if cw.Code == http.StatusServiceUnavailable {
					promise.Fail()
				} else {
					sheddingStat.IncrementPass()
					promise.Pass()
				}
			}()
			next.ServeHTTP(cw, r)
		})
	}
}
```

```go
func (as *adaptiveShedder) shouldDrop() bool {
    //检查是否高负载(CPU使用率) 过热
	if as.systemOverloaded() || as.stillHot() {
        //高吞吐
		if as.highThru() {
			flying := atomic.LoadInt64(&as.flying)
			as.avgFlyingLock.Lock()
			avgFlying := as.avgFlying
			as.avgFlyingLock.Unlock()
			msg := fmt.Sprintf(
				"dropreq, cpu: %d, maxPass: %d, minRt: %.2f, hot: %t, flying: %d, avgFlying: %.2f",
				stat.CpuUsage(), as.maxPass(), as.minRt(), as.stillHot(), flying, avgFlying)
			logx.Error(msg)
			stat.Report(msg)
			return true
		}
	}

	return false
}
```

> 通过对系统状态的判定，监测系统是否处于高负载状况，如果超过阙值，则返回错误

```yaml
Middlewares:
  # 是否开启
  Shedding: false
CpuThreshold: 900 # cpu百分比阈值，0-1000取值 900是90%
```

> 可以通过`rest.WithPriority()`设置某个接口为优先级接口，cpu阈值的计算方式为`CpuThreshold+1000 >> 1`

#  队列

> go-zero中使用的队列组件为`go-queue`，是gozero官方实现的基于`Kafka`和`Beanstalkd `的消息队列框架

## 1. kafka

![Overview of Kafka architecture](go-zeroimg/66a661a088cc6a4f89f0e9bf_66a3e47a6002f97c37942516_guide-kafka-architecture-img1.30716601.png)

![A Kafka topic with three partitions and a replication factor of 3](go-zeroimg/66a661a088cc6a4f89f0e9b7_66a3e47ab693d0e8a4226d6b_guide-kafka-architecture-img5.fe19f0b9.png)

![Consumer group reading from a partitioned topic](go-zeroimg/66a661a088cc6a4f89f0e9d3_66a3e47a05f1ff248f94f6ca_guide-kafka-architecture-img6.68d5ead9.png)

涉及到几个概念：

- Producer： 消息生产者，将消息发送到broker中
- Consumer：消息消费者，从broker获取消息
- Broker：kafka服务器，一个集群由多个broker组成
- Topic：消息队列的名称
- Partition：分区，存放消息的单位，每一个分区中的消息队列是有序的，一个topic消息会分布在不同的broker上以及不同的Partition中
- Offset：偏移量，消息在队列中的位置，是Partition中每条消息的标识
- Consumer Group：消费者组，组内的消费者共同消费一个topic中所有分区的数据，可以提供消费能力

## 2. 配置说明

```go
type KqConf struct {
   service.ServiceConf
   Brokers    []string
   Group      string
   Topic      string
   Offset     string `json:",options=first|last,default=last"`
   Conns      int    `json:",default=1"`
   Consumers  int    `json:",default=8"`
   Processors int    `json:",default=8"`
   MinBytes   int    `json:",default=10240"`    // 10K
   MaxBytes   int    `json:",default=10485760"` // 10M
   Username   string `json:",optional"`
   Password   string `json:",optional"`
}
```

- Brokers: kafka 的多个 Broker 节点
- Group：消费者组
- Topic：订阅的 Topic 主题
- Offset：如果新的 topic kafka 没有对应的 offset 信息,或者当前的 offset 无效了(历史数据被删除),那么需要指定从头(`first`)消费还是从尾(`last`)部消费
- Conns: 一个 kafka queue 对应可对应多个 consumer，Conns 对应 kafka queue 数量，可以同时初始化多个 kafka queue，默认只启动一个
- Consumers : go-queue 内部是起多个 goroutine 从 kafka 中获取信息写入进程内的 channel，这个参数是控制此处的 goroutine 数量（⚠️ 并不是真正消费时的并发 goroutine 数量）
- Processors: 当 Consumers 中的多个 goroutine 将 kafka 消息拉取到进程内部的 channel 后，我们要真正消费消息写入我们自己逻辑，go-queue 内部通过此参数控制当前消费的并发 goroutine 数量
- MinBytes: fetch 一次返回的最小字节数,如果不够这个字节数就等待.
- MaxBytes: fetch 一次返回的最大字节数,如果第一条消息的大小超过了这个限制仍然会继续拉取保证 consumer 的正常运行.因此并不是一个绝对的配置,消息的大小还需要受到 broker 的`message.max.bytes`限制,以及 topic 的`max.message.bytes`的限制
- Username: kafka 的账号
- Password：kafka 的密码

## 3. 入门案例

```yaml
  kafka:
    image: 'bitnami/kafka:3.6.2'
    container_name: kafka
    restart: always
    ulimits:
      nofile:
        soft: 65536
        hard: 65536
    environment:
      - TZ=Asia/Shanghai
      - KAFKA_CFG_NODE_ID=0
      - KAFKA_CFG_PROCESS_ROLES=controller,broker
      - KAFKA_CFG_CONTROLLER_QUORUM_VOTERS=0@kafka:9093
      - KAFKA_CFG_LISTENERS=PLAINTEXT://:9092,CONTROLLER://:9093,EXTERNAL://:9094
      - KAFKA_CFG_ADVERTISED_LISTENERS=PLAINTEXT://kafka:9092,EXTERNAL://localhost:9094
      - KAFKA_CFG_LISTENER_SECURITY_PROTOCOL_MAP=CONTROLLER:PLAINTEXT,PLAINTEXT:PLAINTEXT,EXTERNAL:PLAINTEXT
      - KAFKA_CFG_CONTROLLER_LISTENER_NAMES=CONTROLLER
    ports:
      - '9092:9092'
      - '9094:9094'
    volumes:
      - ./volumes/kafka:/bitnami/kafka
```

### 3.1 配置

```yaml
KqPusherConf:
  Name: log-producer
  Brokers:
    - 127.0.0.1:9094
  Topic: login-log
  Group: login-log-group
KqConsumerConf:
  Name: log-consumer
  Brokers:
    - 127.0.0.1:9094
  Group: login-login-group
  Topic: login-log
```

```go
type Config struct {
	rest.RestConf
	MysqlConfig    MysqlConfig
	Auth           Auth
	RedisConfig    redis.RedisConf
	KqPusherConf   kq.KqConf
	KqConsumerConf kq.KqConf
}
```

### 3.2 注入svc

```go
type ServiceContext struct {
	Config         config.Config
	Conn           sqlx.SqlConn
	RedisClient    *redis.Redis
	KqPusherClient *kq.Pusher
}

func NewServiceContext(c config.Config) *ServiceContext {
	sqlConn := db.NewMysql(c.MysqlConfig)
	redisClient := db.NewRedis(c.RedisConfig)
	KqPusherClient := kq.NewPusher(
		c.KqPusherConf.Brokers,
		c.KqPusherConf.Topic,
	)
	return &ServiceContext{
		Config:         c,
		Conn:           sqlConn,
		RedisClient:    redisClient,
		KqPusherClient: KqPusherClient,
	}
}
```

### 3.3 日志生产者

```go
go func() {
		//记录登录日志
		logData := map[string]any{
			"user_id": u.Id,
			"ip":      "127.0.0.1",
			"device":  "pc",
			"status":  "success",
			"msg":     "登录成功",
			"time":    time.Now().Format("2006-01-02 15:04:05"),
		}
		marshal, _ := json.Marshal(logData)
		//key能保证 消息进入当前用户的消息 进入一个分区 保证顺序性
		//如果不填key 默认按照轮训方式 安排分区
		err = l.svcCtx.KqPusherClient.PushWithKey(context.Background(), fmt.Sprintf("login_log_%d", u.Id), string(marshal))
		if err != nil {
			l.Logger.Error(err)
		}
	}()
```

### 3.4 日志消费者

```go
package queue

import (
	"context"
	"github.com/zeromicro/go-zero/core/logx"
	"user-api/internal/svc"
)

type LoginLogConsumer struct {
	ctx    context.Context
	svcCtx *svc.ServiceContext
}

func NewLoginLogConsumer(ctx context.Context, svcCtx *svc.ServiceContext) *LoginLogConsumer {
	return &LoginLogConsumer{
		ctx:    ctx,
		svcCtx: svcCtx,
	}
}

func (*LoginLogConsumer) Consume(ctx context.Context, key, val string) error {
	logx.Infof("login log key: %s, val: %s \n", key, val)
	return nil
}
```

```go
package queue

import (
	"context"
	"github.com/zeromicro/go-queue/kq"
	"github.com/zeromicro/go-zero/core/service"
	"user-api/internal/config"
	"user-api/internal/svc"
)

func Consumers(c config.Config, ctx context.Context, svcCtx *svc.ServiceContext) []service.Service {
	return []service.Service{
		kq.MustNewQueue(c.KqConsumerConf, NewLoginLogConsumer(ctx, svcCtx)),
	}
}
```

```go
//启动消费者
	group := service.NewServiceGroup()
	defer group.Stop()
	for _, mq := range queue.Consumers(c, context.Background(), ctx) {
		group.Add(mq)
	}
	group.Add(server)
	group.Start()
```

## 4. 高级使用

### 4.1 参数配置

kq.NewPusher 第三个参数是 options，就是支持传递的可选参数

- chunkSize : 由于效率问题，kq client 是批量提交，批量消息体达到此大小才会提交给 kafka。
- flushInterval：间隔多久提交一次。即使未达到 chunkSize 但是达到了这个间隔时间也会向 kafka 提交
- allowAutoTopicCreation：是否自动创建topic

```go
	KqPusherClient := kq.NewPusher(
		c.KqPusherConf.Brokers,
		c.KqPusherConf.Topic,
		kq.WithChunkSize(1024),
		kq.WithFlushInterval(time.Second),
		kq.WithAllowAutoTopicCreation(),
	)
```

当然，consumer 中在 mqs.go 中 kq.MustNewQueue 初始化时候这个参数也是可选参数

- commitInterval : 提交给 kafka broker 间隔时间，默认是 1s
- queueCapacity：kafka 内部队列长度
- maxWait：从 kafka 批量获取数据时，等待新数据到来的最大时间。
- metrics：上报消费每个消息消费时间，默认会内部初始化，一般也不需要指定

```go
func Consumers(c config.Config, ctx context.Context, svcCtx *svc.ServiceContext) []service.Service {
	return []service.Service{
		kq.MustNewQueue(
			c.KqConsumerConf,
			NewLoginLogConsumer(ctx, svcCtx),
			kq.WithCommitInterval(time.Second),
		),
	}
}
```

### 4.2 负载策略

```go
KqPusherClient := kq.NewPusher(
		c.KqPusherConf.Brokers,
		c.KqPusherConf.Topic,
		kq.WithChunkSize(1024),
		kq.WithFlushInterval(time.Second),
		kq.WithAllowAutoTopicCreation(),
    	//配置负载策略，有hash、roundRobin、leastBytes，也可以自定义实现
		kq.WithBalancer(&kafka.Hash{}),
	)
```

### 4.3 延迟队列

如果使用kafka来实现：

- 设置消息发送时，延迟时间
- 收到消息后，判断当前时间和延迟时间
- 如果不到延迟时间，将消息重新发回队列进行处理

# 配置中心

> 配置中心是集中管理配置信息的组件，优雅的解决了配置的动态变更、权限管理、持久化、运维成本等问题。

![1](go-zeroimg/technical-selection-and-landing-practice-for-building-a-cloud-native-configuration-center1.5f77f0ae.jpg)

## 1. 创建配置

1. 下载etcd GUI客户端：`https://tzfun.github.io/etcd-workbench/`
2. 创建租约
3. 创建基于租约的key-value存储，将配置写入，并记录key

## 2. 实现配置中心

```go
func PullConfig() Config {
	ss := subscriber.MustNewEtcdSubscriber(subscriber.EtcdConf{
		Hosts: []string{"localhost:2379"}, // etcd 地址
		Key:   "user-api-test",            // 配置key
	})
	// 创建 configurator
	cc := configurator.MustNewConfigCenter[Config](configurator.Config{
		Type: "yaml", // 配置值类型：json,yaml,toml
	}, ss)

	// 获取配置
	// 注意: 配置如果发生变更，调用的结果永远获取到最新的配置
	v, err := cc.GetConfig()
	if err != nil {
		panic(err)
	}
	cc.AddListener(func() {
		v, err := cc.GetConfig()
		if err != nil {
			panic(err)
		}
		//这个地方要写 触发配置变化后 需要处理的操作
		println("config changed:", v.Name)
	})
	// 如果想监听配置变化，可以添加 listener
	return v
}
```

## 3. 自定义配置中间件

> go-zero官方支持etcd，如果不想使用etcd，比如想要使用consul，我们可以如下做：

```bash
# go get github.com/hashicorp/consul/api
# go get github.com/spf13/viper
```

```go
func PullConsulConfig() Config {
	ss := NewConsulSubscriber("http://localhost:8500", "config/test/user-api")
	// 创建 configurator
	cc := configurator.MustNewConfigCenter[Config](configurator.Config{
		Type: "yaml", // 配置值类型：json,yaml,toml
	}, ss)

	// 获取配置
	// 注意: 配置如果发生变更，调用的结果永远获取到最新的配置
	v, err := cc.GetConfig()
	if err != nil {
		panic(err)
	}
	cc.AddListener(func() {
		v, err := cc.GetConfig()
		if err != nil {
			panic(err)
		}
		//这个地方要写 触发配置变化后 需要处理的操作
		println("config changed:", v.Name)
	})
	// 如果想监听配置变化，可以添加 listener
	return v
}
```

```go
package config

import (
	"bytes"
	"encoding/json"
	consulApi "github.com/hashicorp/consul/api"
	"github.com/spf13/viper"
	"github.com/zeromicro/go-zero/core/configcenter/subscriber"
	"sync"
)

type ConsulSubscriber struct {
	listeners []func()
	lock      sync.Mutex
	consulCli *consulApi.Client
	Path      string
}

func NewConsulSubscriber(address, path string) subscriber.Subscriber {
	config := &consulApi.Config{
		Address: address,
	}
	client, err := consulApi.NewClient(config)
	if err != nil {
		panic(err)
	}
	return &ConsulSubscriber{
		consulCli: client,
		Path:      path,
	}
}
func (s *ConsulSubscriber) AddListener(listener func()) error {
	s.lock.Lock()
	defer s.lock.Unlock()
	s.listeners = append(s.listeners, listener)
	return nil
}

func (s *ConsulSubscriber) Value() (string, error) {
	defaultConfig := viper.New()
	defaultConfig.SetConfigType("yaml")
	kvPair, _, err := s.consulCli.KV().Get(s.Path, nil)
	if err != nil {
		panic(err)
	}
	err = defaultConfig.ReadConfig(bytes.NewBuffer(kvPair.Value))
	if err != nil {
		panic(err)
	}
	settings := defaultConfig.AllSettings()
	marshal, _ := json.Marshal(settings)
	return string(marshal), nil
}
```

```docker
  consul:
    image: hashicorp/consul:1.18
    ports:
      - "8500:8500"
    volumes:
      - ./volume/consul/data:/consul/data
      - ./volume/consul/consul.d/:/consul/config:rw
    command: >
      consul agent -server
      -bootstrap-expect=1
      -ui
      -client=0.0.0.0
      -data-dir=/consul/data
      --config-dir=/consul/config
```
