# 快速入门

gorm地址：https://github.com/go-gorm/gorm

对开发者友好的gorm库，目前使用最广的go orm库之一

## 1. 入门

数据库以目前使用最多的mysql为例。

```go
//安装MySQL驱动
go get -u gorm.io/driver/mysql
//安装gorm包
go get -u gorm.io/gorm
//安装gin
go get -u github.com/gin-gonic/gin
```

涉及到的数据库sql：

```sql
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `username` varchar(30) NOT NULL COMMENT '账号',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `createtime` bigint(20) NOT NULL DEFAULT 0 COMMENT '创建时间',
   PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4
```

```go
//定义User模型，绑定users表，ORM库操作数据库，需要定义一个struct类型和MYSQL表进行绑定或者叫映射，struct字段和MYSQL表字段一一对应
type User struct {
    ID int64 // 主键
	//通过在字段后面的标签说明，定义golang字段和表字段的关系
	//例如 `gorm:"column:username"` 标签说明含义是: Mysql表的列名（字段名)为username
	Username string `gorm:"column:username"`
	Password string `gorm:"column:password"`
	//创建时间，时间戳
	CreateTime int64 `gorm:"column:createtime"`
}
```

```go
package dao

import (
	"fmt"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

var DB *gorm.DB

func init() {
	//配置MySQL连接参数
	username := "root"   //账号
	password := "root" //密码
	host := "127.0.0.1"  //数据库地址，可以是Ip或者域名
	port := 3306         //数据库端口
	Dbname := "gorm"     //数据库名
	dsn := fmt.Sprintf("%s:%s@tcp(%s:%d)/%s?charset=utf8&parseTime=True&loc=Local", username, password, host, port, Dbname)
	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{
		Logger: logger.Default.LogMode(logger.Info),
	})
	if err != nil {
		panic("连接数据库失败, error=" + err.Error())
	}
	DB = db
}
```

插入数据：

```go
package dao

import "log"

type User struct {
	ID         int64
	Username   string `gorm:"column:username"`
	Password   string `gorm:"column:password"`
	CreateTime int64  `gorm:"column:createtime"`
}

func (u User) TableName() string {
	//绑定MYSQL表名为users
	return "users"
}

func Save(user *User) {
	err := DB.Create(user)
	if err != nil {
		log.Println("insert fail : ", err)
	}
}
```

```go
package api

import (
	"github.com/gin-gonic/gin"
	"test.com/gormtest/dao"
	"time"
)

func SaveUser(c *gin.Context) {
	user := &dao.User{
		Username:   "zhangsan",
		Password:   "123456",
		CreateTime: time.Now().UnixMilli(),
	}
	dao.Save(user)
	c.JSON(200, user)
}
```

```go
package api

import "github.com/gin-gonic/gin"

func RegisterRouter(r *gin.Engine) {
	r.GET("/save", SaveUser)
}
```

测试，数据成功保存，并获取到id

查询：

```go
func GetById(id int64) User {
	var user User
	err := DB.Where("id=?", id).First(&user).Error
	if err != nil {
		log.Println("get user by id fail : ", err)
	}
	return user
}
```

```go
func GetUser(c *gin.Context) {
	user := dao.GetById(1)
	c.JSON(200, user)
}
```

```go
func GetAll() []User {
	var users []User
	err := DB.Find(&users)
	if err != nil {
		log.Println("get users  fail : ", err)
	}
	return users
}
```

```go
func GetUser(c *gin.Context) {
	user := dao.GetAll()
	c.JSON(200, user)
}
```

更新：

```go
func UpdateById(id int64) {
	err := DB.Model(&User{}).Where("id=?", id).Update("username", "lisi")
	if err != nil {
		log.Println("update users  fail : ", err)
	}
}
```

```go
func UpdateUser(c *gin.Context) {
	dao.UpdateById(1)
	user := dao.GetById(1)
	c.JSON(200, user)
}
```

删除：

```go
func DeleteById(id int64) {
	err := DB.Where("id=?", id).Delete(&User{})
	if err != nil {
		log.Println("delete users  fail : ", err)
	}
}
```

```go
func DeleteUser(c *gin.Context) {
	dao.DeleteById(1)
	user := dao.GetById(1)
	c.JSON(200, user)
}
```

# 模型定义

前面入门案例中，我们定义了User结构体用来和数据表users做映射，User结构体，我们称之为数据模型，在gorm框架中，操作数据库需要预先定义模型。

底层都是使用的golang的database标准库，利用反射原理，执行读写操作时，将结构体翻译为sql语句，并将结果转化为对应的模型。

## 1. 模型定义

假设有一个商品表

```sql
CREATE TABLE `goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID，商品Id',
  `name` varchar(30) NOT NULL COMMENT '商品名',
  `price` decimal(10,2) unsigned  NOT NULL COMMENT '商品价格',
  `type_id` int(10) unsigned NOT NULL COMMENT '商品类型Id',
  `createtime` int(10) NOT NULL DEFAULT 0 COMMENT '创建时间',
   PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4
```

将上述表翻译为模型后，如下：

```go
type Good struct {
	Id         int  //表字段名为：id
	Name       string //表字段名为：name
	Price      float64 //表字段名为：price
	TypeId     int  //表字段名为：type_id
	CreateTime int64 `gorm:"column:createtime"`  //表字段名为：createtime
}
```

默认gorm对struct字段名使用**Snake Case**命名风格转换成mysql表字段名(需要转换成小写字母)。

> Snake Case命名风格，就是各个单词之间用下划线（_）分隔，例如： CreateTime的Snake Case风格命名为create_time

同时默认情况下，使用`ID`做为其主键，使用结构体名称的`Snake Case`风格的复数形式做为表名，使用 `CreatedAt`、`UpdatedAt` 字段追踪创建、更新时间。

## 2. 模型标签

标签定义：

```go
`gorm:"标签内容"`
```

**标签定义部分，多个标签定义可以使用分号（;）分隔**

gorm常用标签如下：

| 标签       | 说明     | 例子                                                         |
| :--------- | :------- | :----------------------------------------------------------- |
| column     | 指定列名 | `gorm:"column:createtime"`                                   |
| primaryKey | 指定主键 | `gorm:"column:id; PRIMARY_KEY"`                              |
| -          | 忽略字段 | `gorm:"-"` 可以忽略struct字段，被忽略的字段不参与gorm的读写操作 |

其他的可以查看官方文档：`https://gorm.io/zh_CN/docs/models.html#embedded_struct`

## 3. 表名映射

- 复数表名，比如结构体User，默认的表名为users

- 实现Tabler接口 （`TableName` 不支持动态变化，它会被缓存下来以便后续使用。）

  ```go
  type Tabler interface {
      TableName() string
  }
  
  // TableName 会将 User 的表名重写为 `profiles`
  func (User) TableName() string {
    return "profiles"
  }
  ```

- 动态表名，使用Scopes

```go
func UserTable(user User) func (tx *gorm.DB) *gorm.DB {
  return func (tx *gorm.DB) *gorm.DB {
    if user.Admin {
      return tx.Table("admin_users")
    }

    return tx.Table("users")
  }
}

db.Scopes(UserTable(user)).Create(&user)
```

- 临时表名

  ```go
  db.Table("deleted_users")
  ```

  1

## 4. Model

GORM 定义一个 `gorm.Model` 结构体，其包括字段 `ID`、`CreatedAt`、`UpdatedAt`、`DeletedAt`

```go
// gorm.Model 的定义
type Model struct {
  ID        uint           `gorm:"primaryKey"`
  CreatedAt time.Time
  UpdatedAt time.Time
  DeletedAt gorm.DeletedAt `gorm:"index"`
}
```

GORM 约定使用 `CreatedAt`、`UpdatedAt` 追踪创建/更新时间。如果定义了这种字段，GORM 在创建、更新时会自动填充当前时间。

要使用不同名称的字段，您可以配置 autoCreateTime、autoUpdateTime 标签

如果想要保存 UNIX（毫/纳）秒时间戳，而不是 time，只需简单地将 time.Time 修改为 int 即可。

例子：

```go
type User struct {
  CreatedAt time.Time // 默认创建时间字段， 在创建时，如果该字段值为零值，则使用当前时间填充
  UpdatedAt int       // 默认更新时间字段， 在创建时该字段值为零值或者在更新时，使用当前时间戳秒数填充
  Updated   int64 `gorm:"autoUpdateTime:nano"` // 自定义字段， 使用时间戳填纳秒数充更新时间
  Updated   int64 `gorm:"autoUpdateTime:milli"` //自定义字段， 使用时间戳毫秒数填充更新时间
  Created   int64 `gorm:"autoCreateTime"`      //自定义字段， 使用时间戳秒数填充创建时间
}
```

可以将它嵌入到您的结构体中，以包含这几个字段，比如

```go
type User struct {
  gorm.Model
  Name string
}
// 等效于
type User struct {
  ID        uint           `gorm:"primaryKey"`
  CreatedAt time.Time
  UpdatedAt time.Time
  DeletedAt gorm.DeletedAt `gorm:"index"`
  Name string
}
```

对于正常的结构体字段，你也可以通过标签 `embedded` 将其嵌入，例如：

```go
type Author struct {
    Name  string
    Email string 
}

type Blog struct {
  ID      int
  Author  Author `gorm:"embedded"`
  Upvotes int32
}
// 等效于
type Blog struct {
  ID    int64
  Name  string
  Email string
  Upvotes  int32
}
```

可以使用标签 `embeddedPrefix` 来为 db 中的字段名添加前缀，例如：

```go
type Blog struct {
  ID      int
  Author  Author `gorm:"embedded;embeddedPrefix:author_"`
  Upvotes int32
}
// 等效于
type Blog struct {
  ID          int64
  AuthorName  string
  AuthorEmail string
  Upvotes     int32
}
```

## 5. 数据库连接

GORM 官方支持的数据库类型有： MySQL, PostgreSQL, SQlite, SQL Server

连接数据库主要是两个步骤：

- 配置DSN (Data Source Name)
- 使用gorm.Open连接数据库

### 5.1 DSN

gorm库使用dsn作为连接数据库的参数，dsn翻译过来就叫数据源名称，用来描述数据库连接信息。一般都包含数据库连接地址，账号，密码之类的信息。

格式：

```go
[username[:password]@][protocol[(address)]]/dbname[?param1=value1&...&paramN=valueN]
```

mysql的dsn的一些例子：

```go
//mysql dsn格式
//涉及参数:
//username   数据库账号
//password   数据库密码
//host       数据库连接地址，可以是Ip或者域名
//port       数据库端口
//Dbname     数据库名
username:password@tcp(host:port)/Dbname?charset=utf8&parseTime=True&loc=Local

//填上参数后的例子
//username = root
//password = 123456
//host     = localhost
//port     = 3306
//Dbname   = gorm
//后面K/V键值对参数含义为：
//  charset=utf8 客户端字符集为utf8
//  parseTime=true 支持把数据库datetime和date类型转换为golang的time.Time类型
//  loc=Local 使用系统本地时区
root:123456@tcp(localhost:3306)/gorm?charset=utf8&parseTime=True&loc=Local

//gorm 设置mysql连接超时参数
//开发的时候经常需要设置数据库连接超时参数，gorm是通过dsn的timeout参数配置
//例如，设置10秒后连接超时，timeout=10s
//下面是完成的例子
root:123456@tcp(localhost:3306)/gorm?charset=utf8&parseTime=True&loc=Local&timeout=10s

//设置读写超时时间
// readTimeout - 读超时时间，0代表不限制
// writeTimeout - 写超时时间，0代表不限制
root:123456@tcp(localhost:3306)/gorm?charset=utf8&parseTime=True&loc=Local&timeout=10s&readTimeout=30s&writeTimeout=60s
```

要支持完整的 UTF-8 编码，您需要将 `charset=utf8` 更改为 `charset=utf8mb4`

### 5.2 连接数据库

```go
import (
  "gorm.io/driver/mysql"
  "gorm.io/gorm"
)

func main() {
  // 参考 https://github.com/go-sql-driver/mysql#dsn-data-source-name 获取详情
  dsn := "user:pass@tcp(127.0.0.1:3306)/dbname?charset=utf8mb4&parseTime=True&loc=Local"
  db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{})
}
```

MySQL 驱动程序提供了 [一些高级配置open in new window](https://github.com/go-gorm/mysql) 可以在初始化过程中使用，例如：

```go
db, err := gorm.Open(mysql.New(mysql.Config{
  DSN: "gorm:gorm@tcp(127.0.0.1:3306)/gorm?charset=utf8&parseTime=True&loc=Local", // DSN data source name
  DefaultStringSize: 256, // string 类型字段的默认长度
  DisableDatetimePrecision: true, // 禁用 datetime 精度，MySQL 5.6 之前的数据库不支持
  DontSupportRenameIndex: true, // 重命名索引时采用删除并新建的方式，MySQL 5.7 之前的数据库和 MariaDB 不支持重命名索引
  DontSupportRenameColumn: true, // 用 `change` 重命名列，MySQL 8 之前的数据库和 MariaDB 不支持重命名列
  SkipInitializeWithVersion: false, // 根据当前 MySQL 版本自动配置
}), &gorm.Config{})
```

GORM 允许通过 `DriverName` 选项自定义 MySQL 驱动，例如：

```go
import (
  _ "example.com/my_mysql_driver"
  "gorm.io/driver/mysql"
  "gorm.io/gorm"
)

db, err := gorm.Open(mysql.New(mysql.Config{
  DriverName: "my_mysql_driver",
  DSN: "gorm:gorm@tcp(localhost:9910)/gorm?charset=utf8&parseTime=True&loc=Local", // data source name, 详情参考：https://github.com/go-sql-driver/mysql#dsn-data-source-name
}), &gorm.Config{})
```

### 5.3 调试模式

```go
db.Debug()
```

### 5.4 连接池配置

```go
	sqlDB, _ := db.DB()

    //设置数据库连接池参数
    sqlDB.SetMaxOpenConns(100)   //设置数据库连接池最大连接数
    sqlDB.SetMaxIdleConns(20)   //连接池最大允许的空闲连接数，如果没有sql任务需要执行的连接数大于20，超过的连接会被连接池关闭
```

# 增删改查

## 1. 插入数据

```go
user := User{
	Username:"zhangsan",
	Password:"123456",
	CreateTime:time.Now().Unix(),
}
db.Create(&user)

user.ID             // 返回插入数据的主键
result.Error        // 返回 error
result.RowsAffected // 返回插入记录的条数
```

### 1.1 用指定的字段创建：

```go
db.Select("username","password").Create(&user)
```

### 1.2 忽略字段

```go
db.Omit("username").Create(&user)
```

### 1.3 批量插入：

```go
var users = []User{{Username: "jinzhu1"}, {Username: "jinzhu2"}, {Username: "jinzhu3"}}
db.Create(&users)

for _, user := range users {
  user.ID // 1,2,3
}
```

使用 `CreateInBatches` 分批创建时，你可以指定每批的数量，例如：

```go
var users = []User{{Username: "jinzhu_1"}, ...., {Username: "jinzhu_10000"}}

// 数量为 100
db.CreateInBatches(users, 100)
```

### 1.4 使用map创建：

```go
db.Model(&User{}).Create(map[string]interface{}{
  "Name": "jinzhu", "Age": 18,
})

// batch insert from `[]map[string]interface{}{}`
db.Model(&User{}).Create([]map[string]interface{}{
  {"Name": "jinzhu_1", "Age": 18},
  {"Name": "jinzhu_2", "Age": 20},
})
```

map创建注意，主键不会被填充。

### 1.5 sql表达式：

```go
DB.Model(&User{}).Create(map[string]interface{}{
		"username": "jinzhu",
		"password": clause.Expr{SQL: "md5(?)", Vars: []interface{}{"123456"}},
	})
```

### 1.6 使用原生sql语句：

```go
	db.Exec("insert into users (username,password,createtime) values (?,?,?)", user.Username, user.Password, user.CreateTime)
```

## 2. 更新数据

在创建一个表

```sql
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `title` varchar(100) NOT NULL COMMENT '商品名',
  `price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '商品价格',
  `stock` int(11) DEFAULT '0' COMMENT '商品库存',
  `type` int(11) DEFAULT '0' COMMENT '商品类型',
  `create_time` datetime NOT NULL COMMENT '商品创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

```go
package dao

import "time"

type Goods struct {
	Id         int
	Title      string
	Price      float64
	Stock      int
	Type       int
	CreateTime time.Time
}

func (v Goods) TableName() string {
	return "goods"
}

func SaveGoods(goods Goods) {
	DB.Create(&goods)
}
```

```go
package dao

import (
	"testing"
	"time"
)

func TestSaveGoods(t *testing.T) {
	goods := Goods{
		Title:      "毛巾",
		Price:      25,
		Stock:      100,
		Type:       0,
		CreateTime: time.Now(),
	}
	SaveGoods(goods)
}
```

### 2.1 保存数据

```go
	goods := Goods{}
	DB.Where("id = ?", 1).Take(&goods)

	goods.Price = 100
	//UPDATE `goods` SET `title`='毛巾',`price`=100.000000,`stock`=100,`type`=0,`create_time  `='2022-11-25 13:03:48' WHERE `id` = 1
	DB.Save(&goods)
```

### 2.2 更新单个列

```go
	goods := Goods{}
	DB.Where("id = ?", 2).Take(&goods)
	DB.Model(&goods).Update("title", "hello")
```

### 2.3 更新多列

```go
    goods := Goods{}
	DB.Where("id = ?", 2).Take(&goods)
    //更新非零值的字段  也可以使用map
	DB.Model(&goods).Updates(Goods{
		Title: "hello",
		Stock: 200,
	})
```

### 2.4 更新选定的字段

```go
goods := Goods{}
	DB.Where("id = ?", 2).Take(&goods)
	DB.Model(&goods).Select("title").Updates(Goods{
		Title: "hello",
		Stock: 200,
	})
```

排除：

```go
goods := Goods{}
	DB.Where("id = ?", 2).Take(&goods)
	DB.Model(&goods).Omit("title").Updates(Goods{
		Title: "hello",
		Stock: 200,
	})
```

也可以组合使用

```go
Select("*").Omit("title")
```

gorm更新必须带条件进行更新，否则会返回错误`gorm.ErrMissingWhereClause`，或者启用 `AllowGlobalUpdate` 模式

```go
db.Session(&gorm.Session{AllowGlobalUpdate: true}).Model(&User{}).Update("name", "jinzhu")
```

### 2.5 表达式

```go
db.Model(&goods).Update("stock", gorm.Expr("stock + 1"))
db.Model(&goods).Update(map[string]interface{}{"stock": gorm.Expr("stock + 1")})
```

### 2.6 子查询更新

```go
  goods := Goods{}
	DB.Where("id = ?", 2).Take(&goods)
	DB.Model(&goods).Update("title", DB.Model(&User{}).Select("username").Where("id=?", 2))
```

## 3. 删除数据

```go
	goods := Goods{}
	DB.Where("id = ?", 2).Take(&goods)
	DB.Delete(&goods)
```

```go
//根据主键删除
DB.Delete(&Goods{}, 1)
```

同样的道理，不带条件不能进行删除，必须加一些条件，或者使用原生 SQL，或者启用 `AllowGlobalUpdate` 模式

```go
db.Session(&gorm.Session{AllowGlobalUpdate: true}).Delete(&User{})
// DELETE FROM users
```

## 4. 查询数据

### 4.1 查询函数

- Take：查询一条记录

  ```go
  db.Take(&goods)
  ```

  1

- First: 根据主键正序排序后，查询第一条数据

  ```go
  db.First(&goods)
  ```

  1

- Last：根据主键倒序排序后，查询最后一条记录

  ```go
  db.Last(&goods)
  ```

  1

- Find：查询多条记录

  ```go
  db.Find(&goods)
  ```

  1

- Pluck：查询一列值

  ```go
  var titles []string
  db.Model(&Goods{}).Pluck("title", &titles)
  ```

  1
  2

当 First、Last、Take 方法找不到记录时，GORM 会返回 ErrRecordNotFound 错误，可以通过对比`gorm.ErrRecordNotFound`进行判断，或者使用Find和Limit的组合进行查询。

```go
db.Limit(1).Find(&user)
```

### 4.2 where

通过db.Where函数设置条件

函数说明： `db.Where(query interface{}, args ...interface{})`

参数说明:

| 参数名 | 说明                                                         |
| :----- | :----------------------------------------------------------- |
| query  | sql语句的where子句, where子句中使用问号(?)代替参数值，则表示通过args参数绑定参数 |
| args   | where子句绑定的参数，可以绑定多个参数                        |

比如：

```go
db.Where("id in (?)", []int{1,2,5,6}).Take(&goods)
```

### 4.3 select

设置select子句, 指定返回的字段

```go
var goods Goods
DB.Select("id", "title").Find(&goods)
```

也可以写聚合函数

```go
var total int
DB.Model(&Goods{}).Select("count(*) as total").Pluck("total", &total)
fmt.Println(total)
```

### 4.4 order

排序

```go
var goods []Goods
	DB.Order("id desc").Find(&goods)
```

### 4.5 分页

通过limit和Offset实现

```go
var goods []Goods
DB.Order("create_time desc").Limit(10).Offset(10).Find(&goods)
```

### 4.6 count

返回查询匹配的行数

```go
var total int64 = 0
DB.Model(Goods{}).Count(&total)
fmt.Println(total)
```

### 4.7 分组

```go
//统计每个商品分类下面有多少个商品
//定一个Result结构体类型，用来保存查询结果
type Result struct {
    Type  int
    Total int
}
var results []Result
//等价于: SELECT type, count(*) as  total FROM `goods` GROUP BY type HAVING (total > 0)
db.Model(Goods{}).Select("type, count(*) as  total").Group("type").Having("total > 0").Scan(&results)

//scan类似Find都是用于执行查询语句，然后把查询结果赋值给结构体变量，区别在于scan不会从传递进来的结构体变量提取表名.
//这里因为我们重新定义了一个结构体用于保存结果，但是这个结构体并没有绑定goods表，所以这里只能使用scan查询函数。
```

**Group函数必须搭配Select函数一起使用**

### 4.8 直接执行sql语句

```go
sql := "SELECT type, count(*) as  total FROM `goods` where create_time > ? GROUP BY type HAVING (total > 0)"
//因为sql语句使用了一个问号(?)作为绑定参数, 所以需要传递一个绑定参数(Raw第二个参数).
//Raw函数支持绑定多个参数
db.Raw(sql, "2022-11-06 00:00:00").Scan(&results)
fmt.Println(results)
```

# 事务和Hook

## 1. 会话Session

为了避免共用db导致的一些问题，gorm提供了会话模式，通过新建session的形式，将db的操作分离，互不影响。

创建session的时候，有一些配置：

```go
// Session 配置
type Session struct {
  DryRun                   bool   //生成 SQL 但不执行
  PrepareStmt              bool   //预编译模式
  NewDB                    bool  //新db 不带之前的条件
  Initialized              bool  //初始化新的db
  SkipHooks                bool  //跳过钩子
  SkipDefaultTransaction   bool  //禁用默认事务
  DisableNestedTransaction bool  //禁用嵌套事务
  AllowGlobalUpdate        bool  //允许不带条件的更新
  FullSaveAssociations     bool  //允许更新关联数据
  QueryFields              bool  //select（字段）
  Context                  context.Context
  Logger                   logger.Interface
  NowFunc                  func() time.Time //允许改变 GORM 获取当前时间的实现
  CreateBatchSize          int  
}
```

比如说可以禁用默认的事务，从而提供性能，官方说大致能提升30%左右：

```go
// 持续会话模式
tx := db.Session(&Session{SkipDefaultTransaction: true})
tx.First(&user, 1)
tx.Find(&users)
tx.Model(&user).Update("Age", 18)
```

比如使用`PreparedStmt` 在执行任何 SQL 时都会创建一个 prepared statement 并将其缓存，以提高后续的效率

```go
// 会话模式
tx := db.Session(&Session{PrepareStmt: true})
tx.First(&user, 1)
tx.Find(&users)
tx.Model(&user).Update("Age", 18)

// returns prepared statements manager
stmtManger, ok := tx.ConnPool.(*PreparedStmtDB)

// 关闭 *当前会话* 的预编译模式
stmtManger.Close()

// 为 *当前会话* 预编译 SQL
stmtManger.PreparedSQL // => []string{}

// 为当前数据库连接池的（所有会话）开启预编译模式
stmtManger.Stmts // map[string]*sql.Stmt

for sql, stmt := range stmtManger.Stmts {
  sql  // 预编译 SQL
  stmt // 预编译模式
  stmt.Close() // 关闭预编译模式
}
```

还有，gorm的db默认是协程安全的，如果使用初始化参数，则db不在协程安全：

```go
tx := db.Session(&gorm.Session{Initialized: true})
```

比如context：

```go
timeoutCtx, _ := context.WithTimeout(context.Background(), time.Second)
tx := db.Session(&Session{Context: timeoutCtx})

tx.First(&user) // 带有 context timeoutCtx 的查询操作
tx.Model(&user).Update("role", "admin") // 带有 context timeoutCtx 的更新操作
```

## 2. 事务

### 2.1 自动事务

```go
db.Transaction(func(tx *gorm.DB) error {
  // 在事务中执行一些 db 操作（从这里开始，您应该使用 'tx' 而不是 'db'）
  if err := tx.Create(&Animal{Name: "Giraffe"}).Error; err != nil {
    // 返回任何错误都会回滚事务
    return err
  }
  if err := tx.Create(&Animal{Name: "Lion"}).Error; err != nil {
    return err
  }
  // 返回 nil 提交事务
  return nil
})
```

### 2.2 嵌套事务

GORM 支持嵌套事务，您可以回滚较大事务内执行的一部分操作，例如：

```go
db.Transaction(func(tx *gorm.DB) error {
  tx.Create(&user1)

  tx.Transaction(func(tx2 *gorm.DB) error {
    tx2.Create(&user2)
    return errors.New("rollback user2") // Rollback user2
  })

  tx.Transaction(func(tx2 *gorm.DB) error {
    tx2.Create(&user3)
    return nil
  })

  return nil
})

// Commit user1, user3
```

### 2.3 手动事务

```go
// 开始事务
tx := db.Begin()

// 在事务中执行一些 db 操作（从这里开始，您应该使用 'tx' 而不是 'db'）
tx.Create(...)

// ...

// 遇到错误时回滚事务
tx.Rollback()

// 否则，提交事务
tx.Commit()
```

比如

```go
// 开启事务
tx := db.Begin()

//在事务中执行数据库操作，使用的是tx变量，不是db。
//库存减一
//等价于: UPDATE `goods` SET `stock` = stock - 1  WHERE `goods`.`id` = '2' and stock > 0
//RowsAffected用于返回sql执行后影响的行数
rowsAffected := tx.Model(&goods).Where("stock > 0").Update("stock", gorm.Expr("stock - 1")).RowsAffected
if rowsAffected == 0 {
    //如果更新库存操作，返回影响行数为0，说明没有库存了，结束下单流程
    //这里回滚作用不大，因为前面没成功执行什么数据库更新操作，也没什么数据需要回滚。
    //这里就是举个例子，事务中可以执行多个sql语句，错误了可以回滚事务
    tx.Rollback()
    return
}
err := tx.Create(保存订单).Error

//保存订单失败，则回滚事务
if err != nil {
    tx.Rollback()
} else {
    tx.Commit()
}
```

### 2.4 保存点

GORM 提供了 `SavePoint`、`Rollbackto` 方法，来提供保存点以及回滚至保存点功能，例如：

```go
tx := db.Begin()
tx.Create(&user1)

tx.SavePoint("sp1")
tx.Create(&user2)
tx.RollbackTo("sp1") // Rollback user2

tx.Commit() // Commit user1
```

## 3. Hook

Hook 是在创建、查询、更新、删除等操作之前、之后调用的函数。

如果您已经为模型定义了指定的方法，它会在创建、更新、查询、删除时自动被调用。如果任何回调返回错误，GORM 将停止后续的操作并回滚事务。

钩子方法的函数签名应该是 `func(*gorm.DB) error`

### 3.1 创建

创建时可用的 hook

```go
// 开始事务
BeforeSave
BeforeCreate
// 关联前的 save
// 插入记录至 db
// 关联后的 save
AfterCreate
AfterSave
// 提交或回滚事务
```

```go
func (u *User) BeforeCreate(tx *gorm.DB) (err error) {
  u.UUID = uuid.New()

  if !u.IsValid() {
    err = errors.New("can't save invalid data")
  }
  return
}

func (u *User) AfterCreate(tx *gorm.DB) (err error) {
  if u.ID == 1 {
    tx.Model(u).Update("role", "admin")
  }
  return
}
```

> 在 GORM 中保存、删除操作会默认运行在事务上， 因此在事务完成之前该事务中所作的更改是不可见的，如果您的钩子返回了任何错误，则修改将被回滚。

```go
func (u *User) AfterCreate(tx *gorm.DB) (err error) {
  if !u.IsValid() {
    return errors.New("rollback invalid user")
  }
  return nil
}
```

### 3.2 更新

更新时可用的 hook

```go
// 开始事务
BeforeSave
BeforeUpdate
// 关联前的 save
// 更新 db
// 关联后的 save
AfterUpdate
AfterSave
// 提交或回滚事务
```

代码示例：

```go
func (u *User) BeforeUpdate(tx *gorm.DB) (err error) {
  if u.readonly() {
    err = errors.New("read only user")
  }
  return
}

// 在同一个事务中更新数据
func (u *User) AfterUpdate(tx *gorm.DB) (err error) {
  if u.Confirmed {
    tx.Model(&Address{}).Where("user_id = ?", u.ID).Update("verfied", true)
  }
  return
}
```

### 3.3 删除

删除时可用的 hook

```go
// 开始事务
BeforeDelete
// 删除 db 中的数据
AfterDelete
// 提交或回滚事务
```

代码示例：

```go
// 在同一个事务中更新数据
func (u *User) AfterDelete(tx *gorm.DB) (err error) {
  if u.Confirmed {
    tx.Model(&Address{}).Where("user_id = ?", u.ID).Update("invalid", false)
  }
  return
}
```

### 3.4 查询

查询时可用的 hook

```go
// 从 db 中加载数据
// Preloading (eager loading)
AfterFind
```

代码示例：

```go
func (u *User) AfterFind(tx *gorm.DB) (err error) {
  if u.MemberShip == "" {
    u.MemberShip = "user"
  }
  return
}
```

# 高级查询

## 1. scope

作用域允许你复用通用的逻辑，这种共享逻辑需要定义为类型`func(*gorm.DB) *gorm.DB`。

例子：

```go
func Paginate(r *http.Request) func(db *gorm.DB) *gorm.DB {
  return func (db *gorm.DB) *gorm.DB {
    q := r.URL.Query()
    page, _ := strconv.Atoi(q.Get("page"))
    if page == 0 {
      page = 1
    }

    pageSize, _ := strconv.Atoi(q.Get("page_size"))
    switch {
    case pageSize > 100:
      pageSize = 100
    case pageSize <= 0:
      pageSize = 10
    }

    offset := (page - 1) * pageSize
    return db.Offset(offset).Limit(pageSize)
  }
}

db.Scopes(Paginate(r)).Find(&users)
db.Scopes(Paginate(r)).Find(&articles)
```

## 2. 智能选择字段

```go
type User struct {
  ID     uint
  Name   string
  Age    int
  Gender string
  // 假设后面还有几百个字段...
}

type APIUser struct {
  ID   uint
  Name string
}

// 查询时会自动选择 `id`, `name` 字段
db.Model(&User{}).Limit(10).Find(&APIUser{})
// SELECT `id`, `name` FROM `users` LIMIT 10
```

## 3. 子查询

```go
db.Where("amount > (?)", db.Table("orders").Select("AVG(amount)")).Find(&orders)
// SELECT * FROM "orders" WHERE amount > (SELECT AVG(amount) FROM "orders");
```

from子查询

```go
db.Table("(?) as u", db.Model(&User{}).Select("name", "age")).Where("age = ?", 18).Find(&User{})
// SELECT * FROM (SELECT `name`,`age` FROM `users`) as u WHERE `age` = 18

subQuery1 := db.Model(&User{}).Select("name")
subQuery2 := db.Model(&Pet{}).Select("name")
db.Table("(?) as u, (?) as p", subQuery1, subQuery2).Find(&User{})
```

## 4. 关联操作

```sql
CREATE TABLE `gorm`.`user_profiles`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `sex` tinyint(4) NULL DEFAULT NULL,
  `age` int(10) NULL DEFAULT NULL,
  `user_id` int(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4;
```

比如有一个用户属性表，查询用户的时候需要将其的性别和年龄查询出来：

```go
type UserProfile struct {
	ID     int64
	UserId int64
	Sex    int
	Age    int

}

func (u UserProfile) TableName() string {
	return "user_profiles"
}
```

```go
type User struct {
	ID          int64
	Username    string `gorm:"column:username"`
	Password    string `gorm:"column:password"`
	CreateTime  int64  `gorm:"column:createtime"`
	UserProfile UserProfile
}
```

保存User

```go
var user = User{
		Username:   "ms",
		Password:   "ms",
		CreateTime: time.Now().UnixMilli(),
		UserProfile: UserProfile{
			Sex: 0,
			Age: 20,
		},
	}
	DB.Save(&user)
```

会产生两条sql，users表和user_profiles表都有数据

> 这是因为默认的外键是结构体名字+下划线+id，即UserId或者表字段是user_id

如果将user_profiles表中的user_id改为other_id就会失败。

```go
type User struct {
	ID          int64
	Username    string      `gorm:"column:username"`
	Password    string      `gorm:"column:password"`
	CreateTime  int64       `gorm:"column:createtime"`
	UserProfile UserProfile `gorm:"foreignKey:OtherId"`
}
```

只要给UserProfile添加上相应的tag即可。

**关联标签**

| 标签             | 描述                                     |
| :--------------- | :--------------------------------------- |
| foreignKey       | 指定当前模型的列作为连接表的外键         |
| references       | 指定引用表的列名，其将被映射为连接表外键 |
| polymorphic      | 指定多态类型，比如模型名                 |
| polymorphicValue | 指定多态值、默认表名                     |
| many2many        | 指定连接表表名                           |
| joinForeignKey   | 指定连接表的外键列名，其将被映射到当前表 |
| joinReferences   | 指定连接表的外键列名，其将被映射到引用表 |
| constraint       | 关系约束，例如：`OnUpdate`、`OnDelete`   |

### 4.1 查询

```go
	var users []User
	err := DB.Preload("UserProfile").Find(&users).Error
	fmt.Println(err)
	fmt.Println(users)
```

Preload预加载，直接加载关联关系

也可以使用joins进行加载关联数据：

```go
    var users []User
	err := DB.Joins("UserProfile").Find(&users).Error
	fmt.Println(err)
	fmt.Println(users)
```

从sql中能看的出来，使用了left join。

如果不想要User的数据，只想要关联表的数据，可以这么做：

```go
   var user User
	DB.Where("id=?", 25).Take(&user)
	var userProfile UserProfile
	err := DB.Model(&user).Association("UserProfile").Find(&userProfile)
	fmt.Println(err)
	fmt.Println(userProfile)
```
