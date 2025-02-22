# day01

### 知识点自测

> 今天课程中涉及到的已学习知识点

1. 函数的`call`方法-[文档链接](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Function/call)

```javascript
// 以指定的this调用函数，并通过 从第二个参数开始依次传递参数
function func(food,drink){
  console.log(this)
  console.log(food)
  console.log(drink)
}
const obj = {
  name:'小黑'
}
func.call(obj,'西蓝花','咖啡')
```

2. 函数的`apply`方法-[文档链接](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Function/apply)

```javascript
// 以指定的this调用函数，并通过 数组的形式 传递参数
function func(food,drink){
  console.log(this)
  console.log(food)
  console.log(drink)
}
const obj = {
  name:'小黑'
}
func.apply(obj,['西蓝花','咖啡'])
```

3. 函数的`bind`方法-[文档链接](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Function/bind)

```javascript
function func(food, drink) {
  console.log(this)
  console.log(food)
  console.log(drink)
}
const obj = {
  name: '小黑'
}
const bindFunc = func.bind(obj, '花菜')
bindFunc('可乐')
```

4. 剩余参数-[文档链接](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Guide/Functions#%E5%89%A9%E4%BD%99%E5%8F%82%E6%95%B0)

```javascript
function func(...args){
  console.log(args)// 以数组的形式获取传入的所有参数
}
func('西蓝花','西葫芦','西洋参','西芹')
```

5. Promise核心用法-[文档链接](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Guide/Using_promises)

```javascript
const p = new Promise((resolve, reject) => {
  setTimeout(() => {
    const num = parseInt(Math.random() * 10)
    if (num > 5) {
      resolve(`成功啦--${num}`)
    } else {
      reject(`失败啦--${num}`)
    }
  }, 1000)
})
p.then(res => {
  console.log(res)
}, err => {
  console.log(err)
})
```

6. URLSearchParams核心用法-[文档链接](https://developer.mozilla.org/zh-CN/docs/Web/API/URLSearchParams)

```javascript
// 实例化时支持传入JS对象
const params = new URLSearchParams({ name: 'jack', age: 18 })
// toString方法 返回搜索参数组成的字符串，可直接使用在 URL 上。
console.log(params.toString())
```

7. Object.create核心用法-[文档链接](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Object/create)

```javascript
  const person = {
    name: 'itheima',
    foods: ['西蓝花', '西红柿', '西葫芦']
  }
  // 将传入的对象作为原型，创建一个新对象（浅拷贝）
  const clone = Object.create(person)
  clone.name = 'itheima'
  clone.foods.push('西北风')
  console.log(clone.foods === person.foods)// true
```

7. Object.assign核心用法-[文档链接](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Object/assign)

```javascript
  const person = {
    name: 'itheima',
    foods: ['西蓝花', '西红柿', '西葫芦']
  }
  const son = {
    name: 'rose',
  }
  // 参数1 目标对象
  // 参数2 源对象
  // 将源对象的自身属性复制到目标对象，并返回目标对象
  const returnTarget = Object.assign(son, person)

  console.log(returnTarget === son)// true
  console.log(son.name)// itheima
  console.log(son.foods === person.foods)// true
```





## JS中的this

> 这一节咱们来学习JS中this相关的知识点
>
> [传送门：MDN-this](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Operators/this)
>
> [传送门：MDN-call](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Function/call)
>
> [传送门：MDN-apply](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Function/apply)
>
> [传送门：MDN-bind](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Function/bind)
>
> [传送门：MDN-箭头函数](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Functions/Arrow_functions)
>
> [传送门：MDN-剩余参数](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Functions/rest_parameters)
>
> [传送门：MDN-Symbol](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Symbol)

这一节咱们会学习的有：

1. 如何确认`this`指向
2. 如何改变`this`指向
3. 手写`call`，`apply`，`bind`



### 如何确认this的值：

在非严格模式下，总是指向一个对象，在严格模式下可以是任意值，开启严格模式可以使用如下两种方式:

1. 在整个脚本顶部开启
2. 在函数顶部开启

```javascript
// 为整个脚本开启严格模式
'use strict'
function func() {
  // 为函数开启严格模式
  'use strict'
}
```

然后就可以根据不同的模式来确认this指向啦，

1. 全局执行环境中,指向全局对象(非严格模式、严格模式)

2. 函数内部,取决于函数被调用的方式

   1. 直接调用的this值:
      1. 非严格模式:全局对象(window)
      2. 严格模式:undefined

   2. 对象方法调用的this值:
      1. 调用者

```javascript
// 1.全局执行环境
// 非严格模式: 不做任何设置,直接写就是非严格模式
// console.log(this) // window
// 严格模式: 代码顶部加上 'use strict' 即可
// 'use strict' // 为整个脚本开启严格模式
// console.log(this) // window

// 2.函数内部
//  2.1 直接调用-非严格模式
// function func() {
//   console.log(this) // 全局对象window
// }
// func()

//  2.1 直接调用-严格模式
// function func() {
//   'use strict'
//   console.log(this) // undefined
// }
// func()

//  2.2 对象方法调用
// const food = {
//   name: '猪脚饭',
//   eat() {
//     console.log('吧唧吧唧')
//     console.log(this)
//   }
// }
// food.eat()
```

#### 面试回答：

如何确认this指向:

1. 全局执行环境中,指向全局对象(非严格模式、严格模式)

2. 如何开启严格模式:

   ```javascript
   // 为整个脚本开启严格模式
   'use strict'
   function func() {
     // 为函数开启严格模式
     'use strict'
   }
   ```

2. 函数内部,取决于函数被调用的方式

   1. 直接调用的this值:
      1. 非严格模式:全局对象(window)
      2. 严格模式:undefined

   2. 对象方法调用时的this值为调用者







### 如何改变this指向

主要有2类改变函数内部`this`指向的方法：

1. 调用函数并传入具体的`this`:
   1. `call`:
      1. 参数1:`this`
      2. 参数2-n:传递给函数的参数

   2. `apply`-数组作为参数
      1. 参数1:`this`
      2. 参数2:以数组的形式,传递给函数的参数

2. 创建绑定`this`的函数:
   1. bind:返回一个绑定了`this`的新函数
   2. 箭头函数:最近的this是谁,就是谁

注：用 bind 绑定时传的实参会依顺序传递给原函数，此时往获得的新函数传参时，实参只会传递给没被 bind 绑定时传递的形参


**调用函数并传入具体的this：**

```javascript
function funcA(p1, p2) {
  console.log('funcA-调用')
  console.log(this)
  console.log('p1:', p1)
  console.log('p2:', p2)
}
const obj = {
  name: 'jack'
}
// call参数
// 参数1 this值
// 参数2-参数n 挨个传入函数的参数
funcA.call(obj, 1, 2)
// apply参数
// 参数1 this值
// 参数2 以数组的形式传入函数的参数
funcA.apply(obj, [3, 4])
```



**创建绑定this的函数：**

```javascript
function funcB(p1, p2) {
  console.log('funcB-调用')
  console.log(this)
  console.log('p1:', p1)
  console.log('p2:', p2)
}
const person = {
  name: 'itheima'
}
// bind参数
// 参数1 this值
// 参数2-参数n 绑定的参数
const bindFuncB = funcB.bind(person, 123)
bindFuncB(666)

const student = {
  name: 'lilei',
  sayHi: function () {
    console.log(this)
    // 箭头会从自己作用域链的上一层继承this
    const inner = () => {
      console.log('inner-调用了')
      console.log(this)
    }
    inner()
  }
}
student.sayHi()
```



#### 面试回答:

如何改变`this`指向,有2类改变`this`指向的方法,分别是:

1. 调用函数时并传入具体的`this`

   1. `call`:从第二个参数开始挨个传递参数

   2. `apply`:在第二个参数以数组的形式传递参数

2. 创建函数时绑定`this`?

   1. `bind`:返回一个绑定了`this`以及参数(可选)的新函数

   2. 箭头函数:创建时会绑定上一级作用域中的`this`














### 手写call方法

这一节咱们来实现`myCall`方法，实际用法和`call`方法一致，核心步骤有4步

```javascript
const person = {
  name: 'itheima'
}
function func(numA, numB) {
  console.log(this)
  console.log(numA, numB)
  return numA + numB
}
// 参数1:指定的this值
// 参数2-参数n:原函数参数
const res = func.myCall(person, 2, 8)
console.log('返回值为:', res)

```

1. 如何定义`myCall`?
2. 如何让函数内部的`this`为某个对象？
3. 如何让`myCall`接收参数2-参数n?
4. 使用[Symbol](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Symbol)调优`myCall`？

```javascript
// 1. 如何定义`myCall`
Function.prototype.myCall = function () {
  // 逻辑略
}

// 2 设置this并调用原函数
Function.prototype.myCall = function (thisArg) {
  // this 是调用myCall的 函数
  // thisArg 指定的this
  // 为他添加一个自定义属性，让函数成为他的该属性
  thisArg['fn'] = this
  // 调用并获取结果
  const res = thisArg['fn']()
  // 移除添加的自定义属性
  delete thisArg['fn']

}


// 3 接收剩余参数并返回结果
Function.prototype.myCall = function (thisArg, ...args) {
  thisArg['fn'] = this
  // 调用并获取结果
  const res = thisArg['fn'](...args)
  // 移除添加的自定义属性
  delete thisArg['fn']
  // 返回调用结果
  return res
}

// 4 使用`Symbol`调优`myCall`
Function.prototype.myCall = function (thisArg, ...args) {
  // 使用Symbol生成唯一标记，避免和原属性冲突
  const fn = Symbol()
  thisArg[fn] = this
  const res = thisArg[fn](...args)
  // 移除添加的自定义属性
  delete thisArg[fn]
  // 返回调用结果
  return res
}


// --------测试代码--------
const person = {
  name: 'itheima'
}
function func(numA, numB) {
  console.log(this)
  console.log(numA, numB)
  return numA + numB
}
// 参数1:指定的this值
// 参数2-参数n:原函数参数
const res = func.myCall(person, 2, 8)
console.log('返回值为:', res)
```





#### 面试回答：

手写call方法的步骤为

1. 在`function`的原型上添加`myCall`方法,保证所有函数都可以调用
2. 方法内部,通过动态为对象添加方法的形式来指定`this`指向
3. 调用完毕之后通过`delete`关键字删除上一步动态增加的方法
4. 方法的名字通过[Symbol](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Symbol)进行设置,避免和默认名重复
5. 使用剩余参数的形式传递参数2-参数n(函数参数)

```javascript
Function.prototype.myCall = function (thisArg, ...args) {
  const fn = Symbol()
  thisArg[fn] = this
  const res = thisArg[fn](...args)
  delete thisArg[fn]
  return res
}
```





### 手写apply方法

这一节咱们来实现`myApply`方法，实际用法和`apply`方法一致，核心步骤依旧`4`步

```javascript
const person = {
  name: 'itheima’
}

function func(numA, numB) {
  console.log(this)
  console.log(numA, numB)
  return numA + numB
}

const res = func.myApply(person, [2, 8])
console.log('返回值为:', res)

```

1. 如何定义`myApply`?
   1. 定义在原型上

2. 如何让函数内部的`this`为某个对象？
   1. 动态给对象添加方法,通过`对象.方法()`调用即可
   2. 使用`Symbol`来生成方法名

3. 如何让`myApply`接收参数?
   1. 定义参数2即可
   2. 传递给原函数时需要使用`...`展开


```javascript
// 1. 如何定义`myApply`
Function.prototype.myApply = function () {
  // 逻辑略
}

// 2 如何让函数内部的`this`为某个对象
Function.prototype.myApply = function (thisArg) {
  // 为他添加一个自定义属性，让函数成为他的该属性
  // 使用Symbol生成唯一标记，避免和原属性冲突
  const fn = Symbol()
  thisArg[fn] = this
  const res = thisArg[fn](...args)
  // 移除添加的自定义属性
  delete thisArg[fn]
  // 返回调用结果
  return res
}


// 3 如何让`myApply`接收参数
Function.prototype.myApply = function (thisArg, args) {
  const fn = Symbol()
  thisArg[fn] = this
  // 调用并获取结果
  // 用... 将args展开传入
  const res = thisArg[fn](...args)
  delete thisArg['fn']
  // 返回调用结果
  return res
}




// 测试代码
const person = {
  name: 'itheima’
}

function func(numA, numB) {
  console.log(this)
  console.log(numA, numB)
  return numA + numB
}

const res = func.myApply(person, [2, 8])
console.log('返回值为:', res)

```

#### 面试回答:

手写apply方法

1. 在`function`的原型上添加`myApply`方法,保证所有函数都可以调用
2. 方法内部,通过动态为对象添加方法的形式来指定`this`指向
3. 调用完毕之后通过`delete`关键字删除上一步动态增加的方法
4. 方法的名字通过[Symbol](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Symbol)进行设置,避免和默认名重复
5. 直接使用数组传递函数的参数,内部调用时结合`...`运算符展开数组

```javascript
Function.prototype.myApply = function (thisArg, args) {
  const fn = Symbol()
  thisArg[fn] = this
  const res = thisArg[fn](...args)
  delete thisArg[fn]
  return res
}
```







### 手写bind方法

这一节咱们来实现`myBind`方法，实际用法和`bind`方法一致，核心步骤为2步

```javascript
const person = {
  name: 'itheima'
}

function func(numA, numB, numC, numD) {
  console.log(this)
  console.log(numA, numB, numC, numD)
  return numA + numB + numC + numD
}

const bindFunc = func.myBind(person, 1, 2)

const res = bindFunc(3, 4)
console.log('返回值:', res)

```

1. 如何返回一个绑定了`this`的函数？
2. 如何实现绑定的参数，及传入的参数合并?

```javascript
// 1 如何返回一个绑定了`this`的函数
Function.prototype.myBind = function (thisArg) {
  // myBind函数调用时，this就是函数本身 
  return () => {
    // 通过call方法将传入的 thisArg 作为this进行调用
    this.call(thisArg)
  }
}

// 2 如何实现绑定的参数，及传入的参数合并
// ...args 接收绑定参数
Function.prototype.myBind = function (thisArg, ...args) {
  // ...args2 接收调用时的参数
  return (...args2) => {
    // thisArg 需要指定的this
    // args 调用myBind时传入的参数
    // args2 调用新函数时传入的参数
   return this.call(thisArg, ...args, ...args2)
  }
}

// 测试代码
const person = {
  name: 'itheima'
}

function func(numA, numB, numC, numD) {
  console.log(this)
  console.log(numA, numB, numC, numD)
  return numA + numB + numC + numD
}

const bindFunc = func.myBind(person, 1, 2)

const res = bindFunc(3, 4)
console.log('返回值:', res)

```

#### 面试回答

手写bind方法

1. `function`原型上添加`myBind`函数,参数1为绑定的this,参数2-参数2为绑定的参数
2. 内部返回一个新箭头函数,目的是绑定作用域中的this
3. 返回的函数内部,通过`call`进行this和参数绑定
4. 通过`call`的参数2和参数3指定绑定的参数,和调用时传递的参数

```javascript
Function.prototype.myBind = function (thisArg, ...args) {
  return (...args2) => {
   return this.call(thisArg, ...args, ...args2)
  }
}
```

## JS继承-ES5

> 这一节咱们来学习如何在JS中实现**继承**，首先看看在ES6之前可以如何实现继承
>
> [传送门:继承与原型链](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Inheritance_and_the_prototype_chain)
>
> [传送门:继承（计算机科学）](https://zh.wikipedia.org/wiki/%E7%BB%A7%E6%89%BF_(%E8%AE%A1%E7%AE%97%E6%9C%BA%E7%A7%91%E5%AD%A6))
>
> [传送门:JavaScript高级程序设计](https://www.ituring.com.cn/book/2472)
>
> [传送门:MDN-Object.create](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Object/create)
>
> [传送门:MDN-Object.assign](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Object/assign)

**继承：**继承可以使子类具有父类的各种属性和方法，而不需要再次编写相同的代码

这一节咱们会学习ES5中常见的继承写法(命名来源于 **《JavaScript高级程序设计》**)

1. 原型链实现继承
2. 构造函数继承
3. 组合继承
4. 原型式继承
5. 寄生式继承
6. 寄生组合式继承

```javascript
// 父类
function Parent(){
  this.name = name
  this.foods = ['西蓝花', '西红柿']
  this.sayFoods = function () {
    console.log(this.foods)
  }
}
```





### ES5-原型链实现继承

**核心步骤：**希望继承谁，就将谁作为原型

**缺点：**父类中的引用数据类型，会被所有子类共享

```javascript
// 父类
function Parent(name) {
  this.name = name
  this.foods = ['西蓝花', '西红柿']
  this.sayFoods = function () {
    console.log(this.foods)
  }
}
// 子类
function Son() {
}
// 将父类的实例 作为子类的原型
Son.prototype = new Parent('jack')
const s1 = new Son()
s1.sayFoods()// ['西蓝花', '西红柿']

const s2 = new Son()
s2.sayFoods() // ['西蓝花', '西红柿']

s2.foods.push('西葫芦')

s2.sayFoods()// ['西蓝花', '西红柿', '西葫芦']
s1.sayFoods()// ['西蓝花', '西红柿', '西葫芦']
```

#### 面试回答：

ES5-原型链实现继承

1. 将父类的实例作为子类的原型实现继承
2. 这种继承方法的缺点是父类中的引用类型数据会被所有子类共享



### ES5-构造函数继承

别名：伪造对象或经典继承

基本思想：**在子类构造函数的内部调用超类构造函数**

**核心步骤：**在子类的构造函数中通过`call`或`apply`父类的构造函数

**缺点：**子类没法使用父类原型上的属性/方法

```javascript
// 父类
function Parent(name) {
  this.name = name
}
Parent.prototype.sayHi = function () {
  console.log('你好,我叫:', this.name)
}

// 子类
function Son(name) {
  Parent.call(this, name)
}

const s1 = new Son('lucy')
const s2 = new Son('rose')
s1.sayHi() // 报错
```

#### 面试回答：

ES5-构造函数继承

1. 在子类的构造函数中通过`call`或者`apply`调用父类的构造函数
2. 这种继承方法的缺点是:子类没法使用父类原型上的属性/方法





### ES5-组合继承

别名：伪经典继承

通过组合继承,结合上面2种方法的优点

**核心步骤：**

1. 通过原型链继承公共的属性和方法
2. 通过构造函数继承实例独有的属性和方法

**特点：**调用了2次构造函数

**缺点**：调用了2次构造函数，也就意味着属性在子类的实例对象上和子类的原型对象上都有一份，原型对象上的那份是不必要的。

**解决**：`xxx.prototype = new Person()`换成`xxx.xxx = Person.prototype`；但这样可能会存在prototype上简单类型属性的共用，加上一层更为合适：`= Object.create(Person.prototype)`相当于`= {__proto__: Person.prototype}`（在寄生组合方式可以解决该缺点）

```javascript
// 父类
function Person(name) {
  this.name = name
}
// 方法加父类原型上
Person.prototype.sayHi = function () {
  console.log(`你好，我叫${this.name}`)
}
// 子类构造函数
function Student(name, age) {
  // 调用父类构造函数传入this
  Person.call(this, name)
  // 子类独有的属性和方法单独设置
  this.age = age
}
// 设置子类的原型为 父类实例
Student.prototype = new Person()

// 最好再设置下子类原型对象的constructor指向，更符合规范
//Student.prototype.constructor = Student

// 调用子类的构造函数
const s = new Student('李雷', 18)
// 可以使用原型链上的 属性和方法 也可以使用 通过构造函数获取的父类的属性和方法
```

#### 面试回答：

ES5-组合继承

1. 组合继承的核心步骤有2步:
   1. 通过原型链继承公共的属性和方法
   2. 通过构造函数继承实例独有的属性和方法

2. 组合继承的特点:调用2次父类的构造函数,浪费性能

### Object.create

`Object.create(proto, [propertiesObject])`方法，ECMAScript5通过新增**Object.create()**方法规范了原型式继承

- 这个方法接收一个原型对象和一个可选的属性描述符参数，并返回新创建的对象；返回的新对象会从proto继承属性

~~~javascript
// 即返回的新对象相当下面这种结构，实际propertiesObject并不是可以直接展开的，具体形式参照第二点的示例代码
{
  ...propertiesObject,
  __proto__: proto
}
~~~

- 第二个参数用于加上/覆盖指定属性/方法在返回的新对象中，例如设置上constructor属性

~~~javascript
xxx.prototype = Object.create(Person, {
  // 加上新属性或覆盖旧属性
  constructor: {
    value: xxx
  },
  // 如果加上新方法或覆盖旧方法
  eat: {
    value() {}
  }
})
~~~



### ES5-原型式继承

直接基于对象实现继承，思想是：**原型可以基于已有的对象创建新对象**，同时还不必因此创建自定义类型。

**核心步骤:**对某个对象进行浅拷贝(工厂函数或[Object.create](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Object/create)),实现继承

**缺点:**父类中的引用数据类型，会被所有子类共享

```javascript
// 可以用 Object.create替代
function objectFactory(obj) {
  function Fun() { }
  Fun.prototype = obj
  return new Fun()
}
const parent = {
  name: 'parent',
  age: 25,
  friend: ['rose', 'ice', 'robot'],
  sayHi() {
    console.log(this.name, this.age)
  }
}
const son1 = objectFactory(parent)
const son2 = objectFactory(parent)
son1.friend.push('lucy')
console.log(son2.friend)
```

#### 面试回答:

ES5-原型式继承

1. 原型式继承的核心步骤是:对某个对象进行浅拷贝,可以通过内置api `Object.create` 实现,不需要调用构造函数即可实现继承,主要针对于继承对象的情况
2. 原型式继承的缺点是：父类中的引用数据类型，会被所有子类共享



### ES5-寄生式继承

**定义：**寄生式继承的思路是创建一个封装基础过程的函数，该函数内部以某种方式来增强对象，最后在想真地是它做了所有工作一样返回对象。

**核心步骤:**

定义工厂函数,并在内部:

1. 对传入的对象进行浅拷贝(公共属性/方法)
2. 为浅拷贝对象增加属性/方法(独有属性/方法)

```javascript
function createAnother(origin) {
  // Object.create基于原型创建新对象，对属性进行浅拷贝
  const clone = Object.create(origin)
  // 为对象增加属性/方法
  clone.sayHi = function () {
    console.log('你好')
  }
  return clone
}
const parent = {
  name: 'parent',
  foods: ['西蓝花', '炒蛋', '花菜']
}
const son1 = createAnother(parent)
const son2 = createAnother(parent)
```

#### 面试回答:

寄生式继承

1. 寄生式继承的核心步骤是：基于对象创建新对象(可以使用`Object.create`),并且为新创建的对象增加新的属性和方法
   
2. 寄生式继承和上一节学习的原型式继承的区别是：创建出来的新对象,会额外的增加新的**属性/方法**



### ES5-寄生组合式继承

定义：即通过借用构造函数来继承属性，通过原型链的混成形式来继承方法。

实质：不必为了指定子类型的原型而调用超类型的构造函数，我们所需要的无非就是超类型原型的一个副本而已。即：使用**寄生式继承**来继承**超类原型**，然后将结果（实例）指定给**子类原型**。

**核心步骤:**

1. 通过构造函数来继承属性
2. 通过原型链来继承方法

```javascript
// 继承原型函数
function inheritPrototype(son, parent){
    const prototype = object.create(parent.prototype)
    prototype.constructor = son
    son.prototype = prototype
  	// 上面3行代码可以换成：
  	son.prototype = object.create(parent.prototype, {
      constructor: {
        value: son
      }
    })
}

// 父类
function Parent(name) {
  this.name = name
  this.foods = ['西蓝花', '西葫芦', '西红柿']
}

Parent.prototype.sayHi = function () {
  console.log(this.name, `我喜欢吃,${this.foods}`)
}

// 子类借用父类的构造函数
function Son(name, age) {
  Parent.call(this, name)
  this.age = age
}
// 完成原型继承
inheritPrototype(Son,Parent)
// 可以继续在原型上添加属性/方法
Son.prototype.sayAge = function () {
  console.log('我的年龄是', this.age)
}

const son1 = new Son('jack', 18)
const son2 = new Son('rose', 16)
```

#### 面试回答:

ES5-寄生组合式继承

1. 寄生组合式继承的核心步骤是:通过构造函数来继承属性,通过原型链来继承方法
2. 寄生组合式继承和组合式继承的区别是:原型链的继承并没有调用父类的构造函数,而是直接基于父类的原型创建一个新副本实现继承



## JS继承-ES6

> 这一节咱们来学习在ES6中class关键字的使用,并且使用它来实现继承
>
> [传送门:mdn类](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Statements/class)
>
> [传送门:阮一峰ES6-class](https://wangdoc.com/es6/class)
>
> [传送门:mdn-super](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Operators/super)

ES6中推出了`class`类,是用来创建对象的模板.`class`可以看作是一个语法糖,它的绝大部分功能，ES5 都可以做到，新的`class`写法只是让对象原型的写法更加清晰、更像面向对象编程的语法而已。

这一节咱们会学习:

1. class核心语法
2. class实现继承
3. class语法补充

### class核心语法

**核心语法:**

1. 如何定义及使用[类](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Classes#%E7%B1%BB%E5%A3%B0%E6%98%8E):
2. 如何定义实例属性/方法:

```javascript
// 定义类
class Person {
  // 实例属性，方便一眼确认有哪些
  name
  food
  // 构造方法，类似于构造函数，new的时候会调用，内部的this就是实例化的对象
  constructor(name, food) {
    this.name = name
    this.food = food
  }

  // 实例方法
  sayHi() {
    console.log(`你好，我叫${this.name},我喜欢吃${this.food}`)
  }
}
const p = new Person('小黑', '西蓝花')
p.sayHi()
```

#### 面试回答:

class核心语法:

1. 通过`class 类名{}`的形式来定义类
1. 内部直接写实例属性,可以设置默认值,
1. 实例方法的添加方式为`方法名(){}`
1. 构造函数通过`constructor`进行添加
1. 通过`new 类名()`创建实例,会调用构造函数`constructor`

```javascript
class Person{
    name
    food='西兰花炒蛋'
    constructor(name){
        this.name=name
    }
	sayHi(){
        console.log('你好,我叫:',this.name)
    }
}

```



### class实现继承

**关键语法:**

1. **子类**通过[extends](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Classes/extends)继承**父类**
2. 子类构造函数中通过[super](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Operators/super)调用父类构造函数

```javascript
// 在上一份代码的基础上继续编写下面代码
class Student extends Person {
  song
  constructor(name, food, song) {
    // 子类构造函数使用this以前必须调用super
    super(name, food)
    this.song = song
  }
  // 添加方法
  sing() {
    console.log(`我叫${this.name},我喜欢唱${this.song}`)
  }
}
const s = new Student('李雷', '花菜', '孤勇者')
s.sayHi()
s.sing()
```

#### 面试回答:

class实现继承

1. 子类通过`extends`继承继承父类
2. 子类如果需要重新定义构造函数,必须在内部通过`super`关键字调用父类的构造函数



### class私有,静态属性和方法

**补充语法:**

1. [私有](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Classes/Private_class_fields)属性/方法的定义及使用(内部调用)
2. [静态](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Classes/static)属性/方法的定义及使用(类直接访问)

注：静态属性/方法实际是定义到了该类的`__proto__`（即[[Prototype]]上

```javascript
class Person {
  constructor(name) {
    this.name = name
  }
  // 通过#作为前缀添加的属性会变为私有
  // 私有属性
  #secret = '我有一个小秘密，就不告诉你'
  // 私有方法
  #say() {
    // 私有属性可以在
    console.log('私有的say方法')
  }
  info() {
    // 在类的内部可以访问私有属性调用私有方法
    console.log(this.#secret)
    this.#say()
  }

  // 通过 static定义静态属性/方法
  static staticMethod() {
    console.log('这是一个静态方法')
    console.log(this)
  }
  static info = '直立行走，双手双脚'
}

const p = new Person('jack')
console.log(p)
// 外部无法访问 点语法访问直接报错，通过[]无法动态获取
console.log(p['#secret'])
p.info()
// 通过类访问静态属性/方法
Person.staticMethod()
console.log(Person.info)
```

#### 面试回答:

class语法补充

1. class中私有属性/方法
   1. **定义和使用时**需要使用关键字`#`
   2. 私有属性只能在类的内部使用,外部无法使用(代码中)
   3. **Chrome**的控制台中为了方便调试,可以直接访问

2. class中静态属性/方法
   1. **定义和使用时**需要使用关键字`static`
   2. 通过类访问
   3. 静态方法中的`this`是类


## fetch

> 这一节咱们来学习内置函数`fetch`
>
> [传送门-fetch](https://developer.mozilla.org/zh-CN/docs/Web/API/fetch)
>
> [传送门-Response](https://developer.mozilla.org/zh-CN/docs/Web/API/Response)
>
> [传送门-Headers](https://developer.mozilla.org/zh-CN/docs/Web/API/Headers)

**ajax&axios&fetch的关系:**

`ajax`：`ajax` 是一种基于原生 JavaScript 的异步请求技术。它使用 `XMLHttpRequest` 对象来发送请求和接收响应。

`axios`：`axios` 是一个基于 Promise 的 HTTP 客户端，可以在浏览器和 Node.js 中使用。它提供了更高级别的封装，使发送请求和处理响应更加简单和灵活。

`fetch`：`fetch` 是浏览器内置的 API，用于发送网络请求。它提供了一种现代化、基于 Promise 的方式来进行网络通信。用法和`axios`类似，但相比于 `axios`，它的功能和封装级别更为简单。





全局的`fetch`函数用来发起获取资源请求.他返回一个`promise`,这个`promise`会在请求响应后被`resolve`,并传回Response对象

这一节咱们会学习的有:

1. `fetch`核心语法

2. `fetch`结合`URLSearchParams`发送get请求:

   1. ```javascript
      const obj = {
          name:'jack',
          age:18
      }
      name=jack&age=17
      ```

3. `fetch`发送post请求,提交`FormData`数据

4. `fetch`发送post请求,提交`JSON`数据

### fetch核心语法

**核心语法:**

1. 如何[发请求](https://developer.mozilla.org/zh-CN/docs/Web/API/fetch):
2. 如何处理[响应](https://developer.mozilla.org/zh-CN/docs/Web/API/Response):
3. 注:[测试用接口](https://apifox.com/apidoc/project-1937884/api-49760223)

```javascript
fetch(资源地址,{...配置项对象})
.then(response=>{
    // 接收请求
})
```



#### 面试回答:

fetch核心语法

1. `fetch`函数的参数:
   1. 参数1:请求的url地址
   2. 参数2:以对象的形式设置请求相关的内容比如,方法,请求头,提交的数据等.
2. `fetch`获取到响应结果,需要如何解析:

```javascript
fetch(参数1,参数2)
.then(response=>{
    // 接收请求
})
```



### fetch结合URLSearchParams发送get请求:

**需求:**

1. 使用`fetch`结合`URLSearchParams`调用地区查询[接口](https://apifox.com/apidoc/project-1937884/api-49760217)

```javascript
;(async function () {
  const params = new URLSearchParams({
    pname: '广东省',
    cname: '广州市'
  })
  const url = `http://hmajax.itheima.net/api/area?${params.toString()}`
  // fetch函数返回的是 Promise对象，通过await等待获取response对象
  const res = await fetch(url)
  // .json方法返回的是Promise对象 继续通过await等待
  const data = await res.json()
})()
```

#### 面试回答:

fetch结合URLSearchParams发送get请求:

1. `fetch`发送get请求时,不需要设置请求方法,因为默认的就是`get`
2. `URLSearchParams`可以用来创建或者解析查询字符串,这里通过它将对象转为查询字符串



### post请求-提交JSON

**需求:**

1. `fetch`发送post请求,提交`JSON`数据
2. [测试接口-用户注册](https://apifox.com/apidoc/project-1937884/api-49760218)

**核心步骤:**

1. 根据文档设置请求头
2. 通过配置项设置,请求方法,请求头,请求体

```javascript
    ; (async function () {
      // 通过headers设置请求头
      const headers = new Headers()
      // 通过 content-type指定请求体数据格式
      headers.append('content-type', 'application/json')
      // 参数1 url
      // 参数2 请求配置
      const res = await fetch('http://hmajax.itheima.net/api/register', {
        method: 'post',// 请求方法
        headers, // 请求头
        // 请求体
        body: JSON.stringify({ username: 'itheima9876', password: '123456' })
      })
      const json = await res.json()
      console.log(json)
    })()
```

#### 面试回答:

post请求-提交JSON

1. `fetch`函数的第二个参数可以设置请求头,请求方法,请求体,根据接口文档设置对应的内容即可
1. 可以通过`JSON.stringify`将对象转为`JSON`

### post请求-提交FormData

**需求:**

1. `fetch`发送post请求,提交`FormData`数据(上传+回显)
2. [测试接口-上传图片](https://apifox.com/apidoc/project-1937884/api-49760221)

**核心步骤:**

1. 通过`FormData`添加文件
2. 通过配置项设置,请求方法,请求体(`FormData`不需要设置请求头)

```javascript
  <input type="file" class="file" accept="image/*">
  <script>
    document.querySelector('.file').addEventListener('change', async function (e) {
      // 生成FormData对象并添加数据
      const data = new FormData()
      data.append('img', this.files[0])
      const res = await fetch('http://hmajax.itheima.net/api/uploadimg', {
        method: 'post',
        body: data
      })
      const json = await res.json()
      console.log(json)
    })
  </script>
```

#### 面试回答:

1. post请求-提交FormData

   1. `fetch`提交`FormData`时不需要额外的设置请求头

   2. 实例化`FormData`之后可以通过`append(key,value)`方法来动态添加数据

2. **ajax&axios&fetch的关系**

   1. `ajax`是一种基于原生JavaScript的异步请求技术,他使用`XMLHttpRequest`对象来发送请求和接收响应---**学习原理时适用**

   2. `axios`是一个基于Promise的http客户端,可以在浏览器和Node.js中使用.他提供了更高级别的封装,使发送请求和处理响应更加简单和灵活---**项目开发时适用**

   3. `fetch`是浏览器内置的API,用于发送网络请求.它基于Promise的方式来进行网络通信.和`axios`类似.但是功能和封装级别比`axios`更为简单---**项目简单,不想导入axios时适用**

      

## Generator

> 这一节咱们来学习`generator`
>
> [传送门-Generator](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Generator)

`Generator`对象由[生成器函数](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Statements/function*)返回并且它符合[可迭代协议](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Iteration_protocols#可迭代协议)和[迭代器协议](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Iteration_protocols#迭代器协议).他可以用来控制流程,语法行为和之前学习的函数不一样

### Generator-核心语法

Generator对象由**生成器函数**返回并且它符合**可迭代协议**和**迭代器协议**，**生成器函数**在执行时能暂停，后面又能从暂停处继续执行。

**核心语法:**

1. 如何定义生成器函数:
2. 如何获取`generator`对象
3. `yield`表达式的使用
4. 通过`for of`获取每一个`yield`的值

```javascript
// 1. 通过function* 创建生成器函数 
function* foo() {
  // 遇到yield表达式时会暂停后续的操作
  yield 'a'
  yield 'b'
  yield 'c'
  return 'd'
}
// 2. 调用函数获取生成器
const f = foo()
// 3. 通过next方法获取yield 之后的表达式结果，会被包装到一个对象中
// 执行一次next 即可获取一次 yield之后的表达式结果
const res1 = f.next()
console.log(res1)// {value: 'a', done: false}
const res2 = f.next()
console.log(res2)// {value: 'b', done: false}
const res3 = f.next()
console.log(res3)// {value: 'c', done: false}
// 最后一次可以拿到return的结果
const res4 = f.next()
console.log(res4)// {value: 'd', done: true} 
// done 为true之后，获取到的value为undefined
const res5 = f.next()
console.log(res5)// {value: undefined, done: true} 


// 4. 通过for of 获取每一个yield之后的值，
const f2 = foo()
for (const iterator of f2) {
  console.log(iterator)
}
```

#### 面试回答:

Generator-核心语法

1. 可以通过生成器函数(`function* xxx(){}`)来生成`Generator`对象:
2. 通过`Generator`对象的`next`方法可以获取`yield`表达式之后的结果

### Generator-id生成器

**需求:**使用`Generator`实现一个id生成器id

```javascript
function* idGenerator() {
    // 逻辑略
}
const idMaker = idGenerator()

// 调用next方法,获取id(每次累加1)
const { value: id1 } = idMaker.next()
console.log(id1)
const { value: id2 } = idMaker.next()
console.log(id2)
```

**核心步骤:**

1. 定义生成器函数
2. 内部使用循环,通过`yield`返回`id`并累加

```javascript
// 1. 通过function* 创建生成器函数 
function* generator() {
  let id = 0
  // 无限循环
  while (true) {
    // id累加并返回
    yield id++
  }
}
// 2. 调用函数获取生成器
const idMaker = generator()
// 3. 需要id的时候 通过next获取即可
const { value: id1 } = idMaker.next()
console.log(id1)
const { value: id2 } = idMaker.next()
console.log(id2)
```

#### 面试回答:

Generator-id生成器

1. 生成器函数内部的代码会在调用`next`方法时执行,利用这一特点,可以实现任意的生成器,需要时调用`next`即可获取结果

   

### Generator-流程控制

遇到`yield`表达式时会**暂停**后续的操作

**需求:**使用`Generator`实现流程控制

```javascript
function* weatherGenerator() {
	// 逻辑略
    yield axios()
}
// 获取Generator实例
const weather = weatherGenerator()
// 依次获取 北上广深的天气 (axios)
weather.next()
```

**核心步骤:**

1. `yield`后面跟上天气查询逻辑
2. [接口文档-天气预报](https://apifox.com/apidoc/project-1937884/api-49760220)
3. 参考`code`:北京 110100  上海 310100  广州 440100 深圳 440300

```html
  <button class="getWeather">天气查询</button>
  <script src="https://cdn.bootcdn.net/ajax/libs/axios/1.3.6/axios.js"></script>
  <script>
    /**
     * 需求：流程控制，依次查询，北上广深的天气预报
     * 参考code: 北京 110100  上海 310100  广州 440100 深圳 440300
     * 接口文档: https://apifox.com/apidoc/project-1937884/api-49760220
     * */
    function* weatherGenerator() {
      // 北京
      yield axios('http://hmajax.itheima.net/api/weather?city=110100')
      // 上海
      yield axios('http://hmajax.itheima.net/api/weather?city=310100')
      // 广州
      yield axios('http://hmajax.itheima.net/api/weather?city=440100')
      // 深圳
      yield axios('http://hmajax.itheima.net/api/weather?city=440300')
    }

    const cityWeather = weatherGenerator()
    document.querySelector('.getWeather').addEventListener('click', async () => {
      const res = await genCity.next()
      console.log(res)
    })
    
    //另一种写法
    cityWeather.next().value.then(res => {
      ...
      return cityWeather.next().value
    }).then(res => {
      ...
    }).
  </script>
```

#### 面试回答:

Generator-流程控制

1. 使用`Generator`控制流程的本质是利用`yield`关键字来分隔逻辑比如示例中依次调用了多个接口,通过`yield`分隔,通过`next`来触发调用







## 参考资料

1. [阮一峰-《ECMAScript 6 教程》](https://wangdoc.com/es6/)
2. [图灵社区-JavaScript高级程序设计](https://www.ituring.com.cn/book/2472)

# day02



## 手写Promise

> 这一节咱们一起来手写Promise

这一章咱们会学习的有:

1. 实现Promise的核心功能:
2. Promise:
	1. 实例方法:`catch`,`finally`
	2. 静态方法:`resolve`,`reject`,`race`,`all`,`allSettled`,`any`

3. Promise\A+标准,并跑通872个单元测试

首先明确Promise的核心用法

```javascript
// 实例化 并管理异步任务
const p = new HMPromise((resolve, reject) => {
  setTimeout(() => {
    resolve('success')
    // reject('error')
  }, 1000);
})

// then方法获取成功/失败结果
// 参数1:成功时执行的回调函数
// 参数2:失败时执行的回调函数
p.then(res => {
  console.log('res:', res)
  return 'success2'
}, err => {
  console.log('err:', err)
}).then(res2 => {
  console.log('res2:', res2)
})

```



### 手写Promise-构造函数

**需求:**

1. 实现`HMPromise`类，可以用如下的方式实例化
2. 实例化时传入回调函数
	1. 回调函数立刻执行
	2. 回调函数接收函数`resolve`和`reject`

```javascript
const p = new HMPromise((resolve, reject) => {
  resolve('success')
  // reject('error')
})

```

**核心步骤:**

1. 定义类`HMPromise`
2. 添加构造函数`constructor`
3. 定义resolve/reject
4. 执行回调函数

```javascript
// 1. 定义类
class HMPromise {
  // 2. 添加构造函数
  constructor(func) {
    // 3. 定义resolve/reject
    const resolve = (result) => {
      console.log('resolve-执行啦:', result)
    }
    const reject = (result) => {
      console.log('reject-执行啦:', result)
    }

    // 4. 执行回调函数
    func(resolve, reject)
  }
}
```

#### 面试回答:

手写Promise-构造函数

1. 定义类`HMPromise`,内部添加构造函数`constructor`,构造函数需要接收回调函数`func`
2. 在构造函数中定义`resolve`和`reject`
3. 构造函数内部调用`func`并将`resolve`和`reject`传入:`func(resolve,reject)`









### 手写Promise-状态、成功or失败原因

**需求:**

1. `HMPromise`增加`state`属性，只能是如下3个值
	1. `pending`:待定，默认状态
	2. `fulfilled`:已兑现，操作成功
	3. `rejected`:已拒绝，操作失败
2. `HMPromise`增加`result`属性，记录成功/失败原因
3. 调用`resolve`或`reject`,修改状态,并记录成功/失败原因

```javascript
const p = new HMPromise((resolve, reject) => {
  resolve('success') // pending -> fulfilled
  // reject('error') // pending -> rejected
})
p.state // 状态
p.result // 原因
```

**核心步骤:**

1. 定义常量保存状态，避免**硬编码**
2. `HMPromise`中定义
	1. 属性:`state`保存状态，`result`成功/失败原因
	2. 修改`state`的私有方法，修改状态并记录`result`
	3. 注意:`state`只有在`pending`时，才可以修改，且不可逆

```javascript
const PENDING = 'pending'
const FULFILLED = 'fulfilled'
const REJECTED = 'rejected'
class HMPromise {
  // 1. 添加状态
  state = PENDING
  // 2. 添加原因
  result = undefined

  constructor(func) {
    // 3. 调整resolve/reject
    // 4. 状态不可逆
    // 改状态: pending->fulfilled
    // 记录原因
    const resolve = (result) => {
      if (this.state === PENDING) {
        this.state = FULFILLED
        this.result = result
      }
    }
    // 改状态: pending->rejected
    // 记录原因
    const reject = (result) => {
      if (this.state === PENDING) {
        this.state = REJECTED
        this.result = result
      }
    }

    func(resolve, reject)
  }
}
```

#### 面试回答:

手写Promise-状态、成功or失败原因

1. 定义3个常量用来保存状态,`pending`,`fulfilled`,`rejected`
2. `HMPromise`内部定义属性`state`和`result`分别用来保存状态和原因
3. 调用`resolve`时传入具体原因,如果状态为`pending`则更改状态并记录兑现原因
4. 调用`reject`时传入具体原因,如果状态为`pending`则更改状态并记录拒绝原因

### 手写Promise-then方法-成功和失败回调

**需求:**

1. then方法的回调函数1: 状态变为`fulfilled`时触发，并获取成功结果
2. then方法的回调函数2: 状态变为`rejected`时触发，并获取失败原因
3. then方法的回调函数1或2没有传递的特殊情况处理，[参考:then方法的参数](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Promise/then#%E5%8F%82%E6%95%B0)

```javascript
const p = new HMPromise((resolve, reject) => {
    resolve('success')
    // reject('error')
})
p.then(res => {
  console.log('成功回调:', res)
}, err => {
  console.log('失败回调:', err)
})
```

**核心步骤:**

1. 增加`then`方法，根据不同的状态执行对应的回调函数，并传入`result`
	1. 参数1:成功的回调函数
	2. 参数2:失败的回调函数
2. 判断参数
	1. 没有传递`onFulfilled`,`onRejected`时
	2. 设置默认值(参考文档)


```javascript
const PENDING = 'pending'
const FULFILLED = 'fulfilled'
const REJECTED = 'rejected'
class HMPromise {
  // 状态
  state = PENDING
  // 原因
  result = undefined

  // 构造函数
  constructor(func) {
    // pending->fulfilled
    const resolve = (result) => {
      if (this.state === PENDING) {
        this.state = FULFILLED
        this.result = result
      }
    }
    // pending->rejected
    const reject = (result) => {
      if (this.state === PENDING) {
        this.state = REJECTED
        this.result = result
      }
    }
    func(resolve, reject)
  }

  // 1. 添加实例方法
  then(onFulfilled, onRejected) {
    // 2. 参数判断(参考文档)
    onFulfilled = typeof onFulfilled === 'function' ? onFulfilled : x => x
    onRejected = typeof onRejected === 'function' ? onRejected : x => { throw x }

    // 2.1 执行成功回调
    // 2.2 执行失败回调
    if (this.state === FULFILLED) {
      onFulfilled(this.result)
    } else if (this.state === REJECTED) {
      onRejected(this.result)
    }
  }
}

```

#### 面试回答

手写Promise-then方法-成功和失败回调

1. 添加`then`方法,接收2个回调函数:
	1. 成功回调`onFulfilled`
	2. 失败回调`onRejected`
2. 判断传入的`onFulfilled`和`onRejected`是否为函数,如果不是设置默认值
3. 根据状态调用`onFulfilled`或`onRejected`并传入兑现或拒绝原因



### 手写Promise-then方法-异步和多次调用

**需求:**

1. 实例化传入的回调函数,内部支持异步操作
2. `then`方法支持多次调用(非链式编程)

```javascript
const p = new HMPromise((resolve, reject) => {
  setTimeout(() => {
    resolve('success')
    // reject('error')
  }, 2000);
})
p.then(res => {
  console.log('then1:', res)
}, err => {
  console.log('then1:', err)
})
p.then(res => {
  console.log('then2:', res)
}, err => {
  console.log('then2:', err)
})

```

**核心步骤:**

1. 定义属性:保存传入的回调函数:`[]`
2. 保存回调函数:状态为`pending`时
3. 调用成功回调:`resolve`内部
4. 调用失败回调:`reject`内部

```javascript
const PENDING = 'pending'
const FULFILLED = 'fulfilled'
const REJECTED = 'rejected'
class HMPromise {
  // 状态
  state = PENDING
  // 原因
  result = undefined
  // 1. 定义实例属性
  #handlers = [] // [{onFulfilled,onRejected}...]

  // 构造函数
  constructor(func) {
    // pending->fulfilled
    const resolve = (result) => {
      if (this.state === PENDING) {
        this.state = FULFILLED
        this.result = result
        // 3. 调用成功回调
        this.#handlers.forEach(({ onFulfilled }) => {
          onFulfilled(this.result)
        })
      }
    }
    // pending->rejected
    const reject = (result) => {
      if (this.state === PENDING) {
        this.state = REJECTED
        this.result = result
        // 4. 调用失败回调
        this.#handlers.forEach(({ onRejected }) => {
          onRejected(this.result)
        })
      }
    }
    func(resolve, reject)
  }

  // then方法
  then(onFulfilled, onRejected) {
    onFulfilled = typeof onFulfilled === 'function' ? onFulfilled : x => x
    onRejected = typeof onRejected === 'function' ? onRejected : x => { throw x }

    if (this.state === FULFILLED) {
      onFulfilled(this.result)
    } else if (this.state === REJECTED) {
      onRejected(this.result)
    } else if (this.state === PENDING) {
      // 2. 保存回调函数
      this.#handlers.push({
        onFulfilled, onRejected
      })
    }
  }
}

```

#### 面试回答

手写Promise-then方法-异步和多次调用

1. `HMPromise`添加私有属性`#handlers`
	1. 保存then方法调用时状态为`pending`的回调函数
	2. 格式为对象数组:`[{onFulfilled,onRejected}...]`

2. 构造函数内部调整`resolve`和`reject`的逻辑:
	1. 调用`resolve`时取出数组`#handlers`中的所有`onFulfilled`回调函数进行调用
	2. 调用`reject`时取出数组`#handlers`中的所有`onRejected`回调函数进行调用



### 手写Promise-异步任务-api补充

1. [传送门:MDN-queueMicrotask](https://developer.mozilla.org/zh-CN/docs/Web/API/queueMicrotask)
2. [传送门:MDN-queueMicrotask使用指南](https://developer.mozilla.org/zh-CN/docs/Web/API/HTML_DOM_API/Microtask_guide)
3. [传送门:MDN-setImmediate](https://developer.mozilla.org/zh-CN/docs/Web/API/Window/setImmediate)
4. [传送门:MDN-MutationObserver](https://developer.mozilla.org/zh-CN/docs/Web/API/MutationObserver)

**需求:**

1. 如下代码打印结果为`1,2,4,3`
1. 核心: 让then方法的回调函数以**异步任务**的方式执行

```javascript
console.log('top')
const p = new HMPromise((resolve, reject) => {
  resolve('success')
})
p.then(res => {
  console.log(res)
})
console.log('bottom')
```

**这里我们参考vue2的做法:**

1. **vue2:**Promise.then、MutationObserver 、 setImmediate 、 setTimeout
2. **我们选用**:queueMicrotask 、MutationObserver 、 setTimeout



**选用原因:**

1. `Promise.then`: 我们是手写Promise,故不选用这个
2. `queueMicrotask` :新式浏览器均支持,node11开始支持,ie不支持
3. `MutationObserver` :新式浏览器均支持,ie11开始支持
4. `setImmediate`: 新式浏览器只有edge支持,ie10开始支持
5. `setTimeout`:浏览器支持,node支持



**测试代码:**

```javascript
// ------------- 异步任务1 queueMicrotask  -------------
// node v11 ie 不支持
// console.log('top')
queueMicrotask(() => {
  // ....
})
// console.log('bottom')

// ------------- 异步任务2 MutationObserver -------------
// node 不支持 ie11
console.log('top')
// 创建并返回一个新的观察器，它会在触发指定 DOM 事件时，调用指定的回调函数
const obs = new MutationObserver(() => {
  console.log('MutationObserver-run')
})
// 创建div
const divNode = document.createElement('div')
// 监听创建的div ,监听子节点改变
obs.observe(divNode, { childList: true })
// 修改内容触发回调函数
divNode.innerText = 'itheima 666'
console.log('bottom')

// ------------- 异步任务3 setTimeout -------------
// 这个都熟悉,就不测试了啦
```

#### 面试回答

请问可以使用哪些方式开启异步任务:

1. `Promise.then`: 我们是手写Promise,故不选用这个
2. `queueMicrotask` :新式浏览器均支持,node11开始支持,ie不支持
3. `MutationObserver` :新式浏览器均支持,ie11开始支持
4. `setImmediate`: 新式浏览器只有edge支持,ie10开始支持
5. `setTimeout`:浏览器支持,node支持







### 手写Promise-异步任务-函数封装

**需求:**

1. 封装函数`runMicrotask`内部执行异步任务
2. 使用`runMicrotask`让`then`方法的回调函数为异步任务



**核心步骤:**

1. 封装函数`runMicrotask`并传入回调函数
2. 内部依次判断:`queueMicrotask` 、`MutationObserver` 、 `setTimeout`并使用即可
3. 使用`runMicrotask`开启执行异步任务即可

```javascript
// 1. 定义函数
function runAsynctask(callback) {
  // 2. 调用核心api(queueMicrotask,MutationObserver,setTimeout)
  if (typeof queueMicrotask === 'function') {
    queueMicrotask(callback)
  } else if (typeof MutationObserver === 'function') {
    const obs = new MutationObserver(callback)
    const divNode = document.createElement('div')
    obs.observe(divNode, { childList: true })
    divNode.innerText = 'itheima666'
  } else {
    setTimeout(callback, 0)
  }
}

const PENDING = 'pending'
const FULFILLED = 'fulfilled'
const REJECTED = 'rejected'
class HMPromise {
  // 状态
  state = PENDING
  // 原因
  result = undefined
  // 回调函数数组
  #handlers = [] // [{onFulfilled,onRejected}...]

  // 构造函数
  constructor(func) {
    // pending->fulfilled
    const resolve = (result) => {
      if (this.state === PENDING) {
        this.state = FULFILLED
        this.result = result
        this.#handlers.forEach(({ onFulfilled }) => {
          onFulfilled(this.result)
        })
      }
    }
    // pending->rejected
    const reject = (result) => {
      if (this.state === PENDING) {
        this.state = REJECTED
        this.result = result
        this.#handlers.forEach(({ onRejected }) => {
          onRejected(this.result)
        })
      }
    }
    func(resolve, reject)
  }

  // then方法
  then(onFulfilled, onRejected) {
    onFulfilled = typeof onFulfilled === 'function' ? onFulfilled : x => x
    onRejected = typeof onRejected === 'function' ? onRejected : x => { throw x }

    // 3. 使用封装函数
    if (this.state === FULFILLED) {
      runAsynctask(() => {
        onFulfilled(this.result)
      })
    } else if (this.state === REJECTED) {
      runAsynctask(() => {
        onRejected(this.result)
      })
    } else if (this.state === PENDING) {
      this.#handlers.push({
        onFulfilled: () => {
          runAsynctask(() => {
            onFulfilled(this.result)
          })
        }, onRejected: () => {
          runAsynctask(() => {
            onRejected(this.result)
          })
        }
      })
    }
  }
}

```

#### 面试回答

手写Promise-异步任务-函数封装

1. 封装执行异步任务的函数

	1. 定义函数传入异步任务(回调函数)

	1. 内部根据实际情况判断并使用开启异步任务的api即可,比如`queueMicrotask`,`MutationObserver`

	1. 调用的`api`可以根据实际情况进行调整

	1. 如果都无法执行,使用`setTimeout`兜底

2. 调整`then`中的逻辑,`fulFilled`,`rejected`,`pending`3种状态时的回调函数,使用封装的函数包装一次



### 手写Promise-链式编程-fulfilled状态-返回值+异常

**需求:**

1. `then`的链式编程
2. 目前只考虑`then`的第一个回调函数
	1. 返回普通值
	2. 内部出现异常


```javascript
const p = new HMPromise((resolve, reject) => {
  resolve(1)
})
p.then(res => {
  console.log(res)
  // throw 'throw-error'
  return 2
}).then(res => {
  console.log(res)
}, err => {
  console.log(err)
})

```

**核心步骤:**

1. 调整`then`方法，返回一个新的`HMPromise`对象
2. 使用`try-catch`捕获异常,并通过`reject`传递
3. 内部获取`onFulfilled`的执行结果,并通过`resolve`传递

```javascript
// 执行异步任务
function runAsynctask(callback) {
  if (typeof queueMicrotask === 'function') {
    queueMicrotask(callback)
  } else if (typeof MutationObserver === 'function') {
    const obs = new MutationObserver(callback)
    const divNode = document.createElement('div')
    obs.observe(divNode, { childList: true })
    divNode.innerText = 'itheima666'
  } else {
    setTimeout(callback, 0)
  }
}

/**
 * 链式编程-处理异常和普通内容(fulfilled状态)
 *  1. 返回新Promise实例
 *  2. 获取返回值
 *    2.1 处理返回值
 *    2.2 处理异常
*/
const PENDING = 'pending'
const FULFILLED = 'fulfilled'
const REJECTED = 'rejected'
class HMPromise {
  // 状态
  state = PENDING
  // 原因
  result = undefined
  // 回调函数数组
  #handlers = [] // [{onFulfilled,onRejected}...]

  // 构造函数
  constructor(func) {
    // pending->fulfilled
    const resolve = (result) => {
      if (this.state === PENDING) {
        this.state = FULFILLED
        this.result = result
        this.#handlers.forEach(({ onFulfilled }) => {
          onFulfilled(this.result)
        })
      }
    }
    // pending->rejected
    const reject = (result) => {
      if (this.state === PENDING) {
        this.state = REJECTED
        this.result = result
        this.#handlers.forEach(({ onRejected }) => {
          onRejected(this.result)
        })
      }
    }
    func(resolve, reject)
  }

  // then方法
  // 1. 返回新Promise实例
  // 2. 获取返回值
  //    2.1 处理返回值
  //    2.2 处理异常
  then(onFulfilled, onRejected) {
    onFulfilled = typeof onFulfilled === 'function' ? onFulfilled : x => x
    onRejected = typeof onRejected === 'function' ? onRejected : x => { throw x }

    // 1. 返回新Promise实例
    const p2 = new HMPromise((resolve, reject) => {
      if (this.state === FULFILLED) {
        runAsynctask(() => {
          // 2. 获取返回值
          try {
            const x = onFulfilled(this.result)
            // console.log('x:', x)
            // 2.1 处理返回值
            resolve(x)
          } catch (error) {
            // 2.2 处理异常
            // console.log('捕获异常:', error)
            reject(error)
          }
        })
      }
      else if (this.state === REJECTED) {
        runAsynctask(() => {
          onRejected(this.result)
        })
      }
      else if (this.state === PENDING) {
        this.#handlers.push({
          onFulfilled: () => {
            runAsynctask(() => {
              onFulfilled(this.result)
            })
          }, onRejected: () => {
            runAsynctask(() => {
              onRejected(this.result)
            })
          }
        })
      }

    })

    return p2
  }
}

```

#### 面试回答:

手写Promise-链式编程-fulfilled状态-返回值+异常,本节只考虑

1. 链式编程的本质then方法会返回一个新的`HMPromise`对象
2. 将原本的代码迁移到返回的`HMPromise`对象的回调函数中
3. 内部通过`try-catch`捕获异常,出现异常通过`reject`传递异常
4. 获取`onFulfilled`的执行结果,并通过`resolve`传递



### 手写Promise-链式编程-fulfilled状态-返回Promise

**需求:**

1. `then`的链式编程
2. 目前只考虑`then`的第一个回调函数
	1. 返回`Promise`

```javascript
const p = new HMPromise((resolve, reject) => {
  resolve(1)
})
p.then(res => {
  return new HMPromise((resolve, reject) => {
    resolve(2)
    // reject('error')
  })
}).then(res => {
  console.log('p2:', res) // 2
}, err => {
  console.log('p2:', err) // error
})
```

**核心步骤:**

1. 判断是否为`HMPromise`实例
1. 调用`then`方法依次传入回调函数

```javascript
// 执行异步任务
function runAsynctask(callback) {
  if (typeof queueMicrotask === 'function') {
    queueMicrotask(callback)
  } else if (typeof MutationObserver === 'function') {
    const obs = new MutationObserver(callback)
    const divNode = document.createElement('div')
    obs.observe(divNode, { childList: true })
    divNode.innerText = 'itheima666'
  } else {
    setTimeout(callback, 0)
  }
}

/**
 * 链式编程-处理Promise(fulfilled状态)
*/
const PENDING = 'pending'
const FULFILLED = 'fulfilled'
const REJECTED = 'rejected'
class HMPromise {
  // 状态
  state = PENDING
  // 原因
  result = undefined
  // 回调函数数组
  #handlers = [] // [{onFulfilled,onRejected}...]

  // 构造函数
  constructor(func) {
    // pending->fulfilled
    const resolve = (result) => {
      if (this.state === PENDING) {
        this.state = FULFILLED
        this.result = result
        this.#handlers.forEach(({ onFulfilled }) => {
          onFulfilled(this.result)
        })
      }
    }
    // pending->rejected
    const reject = (result) => {
      if (this.state === PENDING) {
        this.state = REJECTED
        this.result = result
        this.#handlers.forEach(({ onRejected }) => {
          onRejected(this.result)
        })
      }
    }
    func(resolve, reject)
  }

  // then方法
  then(onFulfilled, onRejected) {
    onFulfilled = typeof onFulfilled === 'function' ? onFulfilled : x => x
    onRejected = typeof onRejected === 'function' ? onRejected : x => { throw x }

    const p2 = new HMPromise((resolve, reject) => {
      if (this.state === FULFILLED) {
        runAsynctask(() => {
          try {
            const x = onFulfilled(this.result)
            // 1.处理返回Promise
            if (x instanceof HMPromise) {
              // console.log('HMPromise实例')
              // 2. 调用then方法
              // x.then(res => console.log(res), err => console.log(err))
              x.then(res => resolve(res), err => reject(err))
            } else {
              resolve(x)
            }
          } catch (error) {
            reject(error)
          }
        })
      }
      else if (this.state === REJECTED) {
        runAsynctask(() => {
          onRejected(this.result)
        })
      }
      else if (this.state === PENDING) {
        this.#handlers.push({
          onFulfilled: () => {
            runAsynctask(() => {
              onFulfilled(this.result)
            })
          }, onRejected: () => {
            runAsynctask(() => {
              onRejected(this.result)
            })
          }
        })
      }
    })
    return p2
  }
}
```

#### 面试回答

手写Promise-链式编程-fulfilled状态-返回Promise

1. 判断`onFulfilled`的执行结果是否为`HMPromise`实例
2. 如果是的话调用返回值的`then`方法,获取兑现和拒绝的原因并通过`resolve`和`reject`传递即可



### 手写Promise-链式编程-fulfilled状态-重复引用

**需求:**

1. `then`中返回的`then`方法返回的`Promise`实例报错
2. 注:下列代码中的`p2`

![image-20230804205538209](C:/Users/797799421/Desktop/笔记/前端/js/js原理-面试/assets/image-20230804205538209.png)

```javascript
const p = new HMPromise((resolve, reject) => {
  resolve(1)
})
const p2 = p.then(res => {
  return p2
})
p2.then(
  res => { },
  err => console.log('err:', err))
```

**核心步骤:**

1. 判断是否相同,抛出异常

```javascript
// 执行异步任务
function runAsynctask(callback) {
  if (typeof queueMicrotask === 'function') {
    queueMicrotask(callback)
  } else if (typeof MutationObserver === 'function') {
    const obs = new MutationObserver(callback)
    const divNode = document.createElement('div')
    obs.observe(divNode, { childList: true })
    divNode.innerText = 'itheima666'
  } else {
    setTimeout(callback, 0)
  }
}

/**
 * 链式编程-处理Promise(fulfilled状态)
*/
const PENDING = 'pending'
const FULFILLED = 'fulfilled'
const REJECTED = 'rejected'
class HMPromise {
  // 状态
  state = PENDING
  // 原因
  result = undefined
  // 回调函数数组
  #handlers = [] // [{onFulfilled,onRejected}...]

  // 构造函数
  constructor(func) {
    // pending->fulfilled
    const resolve = (result) => {
      if (this.state === PENDING) {
        this.state = FULFILLED
        this.result = result
        this.#handlers.forEach(({ onFulfilled }) => {
          onFulfilled(this.result)
        })
      }
    }
    // pending->rejected
    const reject = (result) => {
      if (this.state === PENDING) {
        this.state = REJECTED
        this.result = result
        this.#handlers.forEach(({ onRejected }) => {
          onRejected(this.result)
        })
      }
    }
    func(resolve, reject)
  }

  // then方法
  then(onFulfilled, onRejected) {
    onFulfilled = typeof onFulfilled === 'function' ? onFulfilled : x => x
    onRejected = typeof onRejected === 'function' ? onRejected : x => { throw x }

    const p2 = new HMPromise((resolve, reject) => {
      if (this.state === FULFILLED) {
        runAsynctask(() => {
          try {
            const x = onFulfilled(this.result)
            // 1. 处理重复引用
            if (x === p2) {
              // console.log('返回了p2')
              // 2. 抛出错误 Chaining cycle detected for promise #<Promise>
              throw new TypeError('Chaining cycle detected for promise #<Promise>')
            }
            if (x instanceof HMPromise) {
              x.then(res => resolve(res), err => reject(err))
            } else {
              resolve(x)
            }
          } catch (error) {
            reject(error)
          }
        })
      }
      else if (this.state === REJECTED) {
        runAsynctask(() => {
          onRejected(this.result)
        })
      }
      else if (this.state === PENDING) {
        this.#handlers.push({
          onFulfilled: () => {
            runAsynctask(() => {
              onFulfilled(this.result)
            })
          }, onRejected: () => {
            runAsynctask(() => {
              onRejected(this.result)
            })
          }
        })
      }
    })
    return p2
  }
}
```

#### 面试回答

手写Promise-链式编程-fulfilled状态-重复引用

1. 判断`onFulfilled`函数的返回值是否和`then`方法内部返回的`HMPromise`相同
2. 如果相同抛出错误`new TypeError('Chaining cycle detected for promise #<Promise>')`



### 手写Promise-链式编程-rejected状态

**需求:**

1. `then`的第二个回调函数，执行`reject`时的链式编程

```javascript
const p = new HMPromise((resolve, reject) => {
  reject(1)
})
const p2 = p.then(undefined, err => {
  throw 'error'
  // return p2
  // return 2
  // return new HMPromise((resolve, reject) => {
  //   resolve('HMPromise-2')
  // })
})
p2.then(res => {
  console.log('p2-res:', res)
}, err => {
  console.log('p2-err:', err)
})

```

**核心步骤:**

1. 处理异常:`onRejected`的异常
2. 获取返回值:`onRejected`的返回值
3. 将`fulfilled`状态中的处理逻辑抽取为函数`resolvePromise`并复用
4. `fulfilled`和`rejected`状态中调用函数`resolvePromise`

```javascript
// 执行异步任务
function runAsynctask(callback) {
  if (typeof queueMicrotask === 'function') {
    queueMicrotask(callback)
  } else if (typeof MutationObserver === 'function') {
    const obs = new MutationObserver(callback)
    const divNode = document.createElement('div')
    obs.observe(divNode, { childList: true })
    divNode.innerText = 'itheima666'
  } else {
    setTimeout(callback, 0)
  }
}

/**
 * 链式编程-处理Promise(fulfilled状态)
*/
const PENDING = 'pending'
const FULFILLED = 'fulfilled'
const REJECTED = 'rejected'
class HMPromise {
  // 状态
  state = PENDING
  // 原因
  result = undefined
  // 回调函数数组
  #handlers = [] // [{onFulfilled,onRejected}...]

  // 构造函数
  constructor(func) {
    // pending->fulfilled
    const resolve = (result) => {
      if (this.state === PENDING) {
        this.state = FULFILLED
        this.result = result
        this.#handlers.forEach(({ onFulfilled }) => {
          onFulfilled(this.result)
        })
      }
    }
    // pending->rejected
    const reject = (result) => {
      if (this.state === PENDING) {
        this.state = REJECTED
        this.result = result
        this.#handlers.forEach(({ onRejected }) => {
          onRejected(this.result)
        })
      }
    }
    func(resolve, reject)
  }

  // then方法
  // 1. 处理异常
  // 2. 获取返回值
  // 3. 抽取函数
  // 4. 调用函数
  then(onFulfilled, onRejected) {
    onFulfilled = typeof onFulfilled === 'function' ? onFulfilled : x => x
    onRejected = typeof onRejected === 'function' ? onRejected : x => { throw x }

    const p2 = new HMPromise((resolve, reject) => {
      if (this.state === FULFILLED) {
        runAsynctask(() => {
          try {
            const x = onFulfilled(this.result)
            // 4. 调用函数
            resolvePromise(p2, x, resolve, reject)
            // if (x === p2) {
            //   throw new TypeError('Chaining cycle detected for promise #<Promise>')
            // }
            // if (x instanceof HMPromise) {
            //   x.then(res => resolve(res), err => reject(err))
            // } else {
            //   resolve(x)
            // }
          } catch (error) {
            reject(error)
          }
        })
      }

      else if (this.state === REJECTED) {
        runAsynctask(() => {
          // 1. 处理异常
          try {
            // 2. 获取返回值
            const x = onRejected(this.result)
            // console.log('x:', x)
            // 4. 调用函数
            resolvePromise(p2, x, resolve, reject)
          } catch (error) {
            reject(error)
          }
        })
      }

      else if (this.state === PENDING) {
        this.#handlers.push({
          onFulfilled: () => {
            runAsynctask(() => {
              onFulfilled(this.result)
            })
          }, onRejected: () => {
            runAsynctask(() => {
              onRejected(this.result)
            })
          }
        })
      }
    })

    return p2
  }
}

// 3. 抽取函数
function resolvePromise(p2, x, resolve, reject) {
  if (x === p2) {
    throw new TypeError('Chaining cycle detected for promise #<Promise>')
  }
  if (x instanceof HMPromise) {
    x.then(res => resolve(res), err => reject(err))
  } else {
    resolve(x)
  }
}

```

#### 面试回答

手写Promise-链式编程-rejected状态

1. 判断`onRejected`可能出现的异常,如果出现通过`reject`传递
2. 获取`onRejected`函数的执行结果
3. 将`fulfilled`状态时的处理逻辑抽取为函数,`rejected`状态时调用函数复用逻辑



### 手写Promise-链式编程-pending状态

**需求:**

1. 执行异步操作时，支持链式编程

```javascript
const p = new HMPromise((resolve, reject) => {
  setTimeout(() => {
    resolve(1)
  }, 2000)
})
const p2 = p.then(res => {
  throw 'error'
  // return p2
  // return 2
  // return new HMPromise((resolve, reject) => {
  //   resolve('resolve-2')
  //   // reject('reject-2')
  // })
})
p2.then(res => {
  console.log('p2-res:', res)
}, err => {
  console.log('p2-err:', err)
})

```

**核心步骤:**

1. 处理异常:
	1. `fulfilled`状态时推入回调函数数组时增加`try-catch`

2. 获取返回值:
	1. 推入数组时,增加获取返回值的操作

3. 调用上一节封装的函数`resolvePromise`

```javascript
// 执行异步任务
function runAsynctask(callback) {
  if (typeof queueMicrotask === 'function') {
    queueMicrotask(callback)
  } else if (typeof MutationObserver === 'function') {
    const obs = new MutationObserver(callback)
    const divNode = document.createElement('div')
    obs.observe(divNode, { childList: true })
    divNode.innerText = 'itheima666'
  } else {
    setTimeout(callback, 0)
  }
}

function resolvePromise(p2, x, resolve, reject) {
  if (x === p2) {
    throw new TypeError('Chaining cycle detected for promise #<Promise>')
  }
  if (x instanceof HMPromise) {
    x.then(res => resolve(res), err => reject(err))
  } else {
    resolve(x)
  }
}

/**
 * 链式编程-处理Promise(fulfilled状态)
*/
const PENDING = 'pending'
const FULFILLED = 'fulfilled'
const REJECTED = 'rejected'
class HMPromise {
  // 状态
  state = PENDING
  // 原因
  result = undefined
  // 回调函数数组
  #handlers = [] // [{onFulfilled,onRejected}...]

  // 构造函数
  constructor(func) {
    // pending->fulfilled
    const resolve = (result) => {
      if (this.state === PENDING) {
        this.state = FULFILLED
        this.result = result
        this.#handlers.forEach(({ onFulfilled }) => {
          onFulfilled(this.result)
        })
      }
    }
    // pending->rejected
    const reject = (result) => {
      if (this.state === PENDING) {
        this.state = REJECTED
        this.result = result
        this.#handlers.forEach(({ onRejected }) => {
          onRejected(this.result)
        })
      }
    }
    func(resolve, reject)
  }

  // then方法
  then(onFulfilled, onRejected) {
    onFulfilled = typeof onFulfilled === 'function' ? onFulfilled : x => x
    onRejected = typeof onRejected === 'function' ? onRejected : x => { throw x }

    const p2 = new HMPromise((resolve, reject) => {
      if (this.state === FULFILLED) {
        runAsynctask(() => {
          try {
            const x = onFulfilled(this.result)
            resolvePromise(p2, x, resolve, reject)
          } catch (error) {
            reject(error)
          }
        })
      }

      else if (this.state === REJECTED) {
        runAsynctask(() => {
          try {
            const x = onRejected(this.result)
            resolvePromise(p2, x, resolve, reject)
          } catch (error) {
            reject(error)
          }
        })
      }

      else if (this.state === PENDING) {
        this.#handlers.push({
          onFulfilled: () => {
            runAsynctask(() => {
              // 1. 处理异常
              try {
                // 2.获取返回值
                const x = onFulfilled(this.result)
                // 3.调用函数
                resolvePromise(p2, x, resolve, reject)
              } catch (error) {
                reject(error)
              }
            })
          }, onRejected: () => {
            runAsynctask(() => {
              // 1. 处理异常
              try {
                // 2.获取返回值
                const x = onRejected(this.result)
                // 3.调用函数
                resolvePromise(p2, x, resolve, reject)
              } catch (error) {
                reject(error)
              }
            })
          }
        })
      }
    })

    return p2
  }
}
```

#### 面试回答:

手写Promise-链式编程-pending状态

1. `then`方法中`pending`状态时推入数组的函数增加`try-catch`捕获异常
2. 获取推入数组的回调函数的返回值
3. 调用上一节封装的函数并传入获取的值

小结:

到目前已经将核心功能全部实现啦,接下来开始实现后续功能

- [x] 实现Promise的核心功能:
- [ ] Promise:
	1. 实例方法:
		- [ ] `catch`
		- [ ] `finally`
	2. 静态方法:
		- [ ] `resolve`
		- [ ] `reject`
		- [ ] `race`
		- [ ] `all`
		- [ ] `allSettled`
		- [ ] `any`
- [ ] Promise\A+标准,并跑通872个单元测试



### 手写Promise-实例方法catch

**需求:**

1. 实现实例方法`catch`,可以实现如下调用

```javascript
const p = new HMPromise((resolve, reject) => {
  reject('reject-error')
  // throw 'throw-error'
})
p.then(res => {
  console.log('res:', res)
}).catch(err => {
  console.log('err:', err)
})

```

**核心步骤:**

1. 参考[文档](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Promise/catch),catch等同于:`then(undefined,onRjected)`
2. 直接添加`catch`方法，内部调用`then`
3. 使用`try-catch`包裹`constructor`中的`func`捕获异常

```javascript
function runAsynctask(callback) {
  if (typeof queueMicrotask === 'function') {
    queueMicrotask(callback)
  } else if (typeof MutationObserver === 'function') {
    const obs = new MutationObserver(callback)
    const divNode = document.createElement('div')
    obs.observe(divNode, { childList: true })
    divNode.innerText = 'itheima666'
  } else {
    setTimeout(callback, 0)
  }
}

function resolvePromise(p2, x, resolve, reject) {
  if (x === p2) {
    throw new TypeError('Chaining cycle detected for promise #<Promise>')
  }
  if (x instanceof HMPromise) {
    x.then(res => resolve(res), err => reject(err))
  } else {
    resolve(x)
  }
}

const PENDING = 'pending'
const FULFILLED = 'fulfilled'
const REJECTED = 'rejected'
class HMPromise {
  // 状态
  state = PENDING
  // 原因
  result = undefined
  // 回调函数数组
  #handlers = [] // [{onFulfilled,onRejected}...]

  // 构造函数
  constructor(func) {
    // pending->fulfilled
    const resolve = (result) => {
      if (this.state === PENDING) {
        this.state = FULFILLED
        this.result = result
        this.#handlers.forEach(({ onFulfilled }) => {
          onFulfilled(this.result)
        })
      }
    }

    // pending->rejected
    const reject = (result) => {
      if (this.state === PENDING) {
        this.state = REJECTED
        this.result = result
        this.#handlers.forEach(({ onRejected }) => {
          onRejected(this.result)
        })
      }
    }

    // 2. 处理异常
    try {
      func(resolve, reject)
    } catch (error) {
      // console.log('error:', error)
      reject(error)
    }
  }

  // then方法
  then(onFulfilled, onRejected) {
    onFulfilled = typeof onFulfilled === 'function' ? onFulfilled : x => x
    onRejected = typeof onRejected === 'function' ? onRejected : x => { throw x }

    const p2 = new HMPromise((resolve, reject) => {
      if (this.state === FULFILLED) {
        runAsynctask(() => {
          try {
            const x = onFulfilled(this.result)
            resolvePromise(p2, x, resolve, reject)
          } catch (error) {
            reject(error)
          }
        })
      }

      else if (this.state === REJECTED) {
        runAsynctask(() => {
          try {
            const x = onRejected(this.result)
            resolvePromise(p2, x, resolve, reject)
          } catch (error) {
            reject(error)
          }
        })
      }

      else if (this.state === PENDING) {
        this.#handlers.push({
          onFulfilled: () => {
            runAsynctask(() => {
              try {
                const x = onFulfilled(this.result)
                resolvePromise(p2, x, resolve, reject)
              } catch (error) {
                reject(error)
              }
            })
          }, onRejected: () => {
            runAsynctask(() => {
              try {
                const x = onRejected(this.result)
                resolvePromise(p2, x, resolve, reject)
              } catch (error) {
                reject(error)
              }
            })
          }
        })
      }
    })

    return p2
  }

  /**
   * catch方法
   * 1. 内部调用then方法
   * 2. 处理异常
   * */
  catch(onRejected) {
    // 1. 内部调用then方法
    return this.then(undefined, onRejected)
  }
}
```

#### 面试回答

手写Promise-实例方法catch

1. 定义`catch`方法,接收拒绝的回调函数`onRejected`

2. `catch`方法的本质是内部调用`then`方法

3. 调用形式为第一个回调函数传入`undefined`,第二个回调函数传入`onRejected`即可

	





### 手写Promise-实例方法finally

**需求:**

1. 无论成功失败都会执行`finally`的回调函数
2. 回调函数不接受任何参数

```javascript
const p = new HMPromise((resolve, reject) => {
  // resolve('resolve-res')
  // reject('reject-error')
  // throw 'throw-error'
})
p.then(res => {
  console.log('res:', res)
}).catch(err => {
  console.log('err:', err)
}).finally(() => {
  console.log('finally')
})
```

**核心步骤:**

1. 参考[文档](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Promise/finally):finally方法类似于调用`then(onFinally,onFinally)`,且不接受任何回调函数
2. **注意:**
	1. 版面问题,这里只保留函数部分的逻辑,其他代码未改动
	2. 后续未特殊说明,只保留函数部分代码


```javascript
finally(onFinally) {
    return this.then(onFinally,onFinally)
}
```

#### 面试回答:

手写Promise-实例方法finally

1. 添加`finally`方法,接收最终执行的回调函数`onFinally`
2. `finally`方法的本质为内部调用`then`方法
3. 调用形式为第一个和第二个回调函数均传入`onFinally`即可

```javascript
finally(onFinally) {
    return this.then(onFinally,onFinally)
}
```



到目前已经将实例方法都实现啦

- [x] 实现Promise的核心功能:
- [x] Promise:
	1. 实例方法:
		- [x] `catch`
		- [x] `finally`
	2. 静态方法:
		- [ ] `resolve`
		- [ ] `reject`
		- [ ] `race`
		- [ ] `all`
		- [ ] `allSettled`
		- [ ] `any`
- [ ] Promise\A+标准,并跑通872个单元测试



### 手写Promise-静态方法resolve

**需求:**

1. 返回一个带有成功原因的`Promise`对象

```javascript
HMPromise.resolve(new HMPromise((resolve, reject) => {
  // resolve('resolve')
  // reject('reject')
  // throw 'error'
})).then(res => {
  console.log('res:', res)
}, err => {
  console.log('err:', err)
})
HMPromise.resolve('itheima').then(res => {
  console.log(res)
})


```

**核心步骤:**

1. 增加静态方法`resolve`，根据传入的值返回不同的结果即可

```javascript
  static resolve(value) {
    // 1. 判断传入值
    if (value instanceof HMPromise) {
      // 2.1 Promise直接返回
      return value
    }
    // 2.2 转为Promise并返回(fulfilled状态)
    // return new HMPromise((resolve, reject) => {
    return new HMPromise((resolve) => {
      resolve(value)
    })
  }
```

#### 面试回答:

手写Promise-静态方法resolve

1. 通过`static`关键字添加静态方法`resolve`,接收参数`value`

2. 内部判断传入的值

	1. 如果是`Promise`实例,直接返回
	2. 其他的值,创建`Promise`实例并返回,内部通过`resolve(value)`传递`value`

	

### 手写Promise-静态方法reject

**需求:**

1. 返回一个带有拒绝原因的`Promise`对象

```javascript
HMPromise.reject('error').catch(res => {
  console.log(res)
})
```

**核心步骤:**

1. 添加静态方法
1. 返回`rejected`状态的`Promise`

```javascript
  static reject(value) {
    // 1. 返回rejected状态的Promise
    // new HMPromise((resolve,reject)=>{
    return new HMPromise((undefined, reject) => {
      reject(value)
    })
  }
```

#### 面试回答

手写Promise-静态方法reject

1. 添加静态方法`reject`并接收参数`value`
2. 内部返回一个拒绝状态的`Promise`实例即可



### 手写Promise-静态方法race

**需求:**

1. 接收Promise数组,数组中第一个Promise敲定时,获取`成功/失败`结果
2. 传入的参数不是数组,直接报错

![image-20230804211157895](C:/Users/797799421/Desktop/笔记/前端/js/js原理-面试/assets/image-20230804211157895.png)

```javascript
const p1 = new HMPromise((resolve, reject) => {
  setTimeout(() => {
    resolve(1)
  }, 2000)
})
const p2 = new HMPromise((resolve, reject) => {
  setTimeout(() => {
    reject(2)
  }, 1000)
})
HMPromise.race([p1, p2, 'itheima']).then((res) => {
  console.log('res:', res)
}, err => {
  console.log('err:', err)
})

```

**核心步骤:**

1. 返回`Promise`
2. 判断是否未数组,不是直接报错
3. 等待第一个敲定

```javascript
  static race(promises) {
    // 1. 返回Promise
    return new HMPromise((resolve, reject) => {
      // 2. 判断是否为数组
      if (!Array.isArray(promises)) {
        return reject(new TypeError('Argument is not iterable'))
      }
      // 3. 等待第一个敲定
      promises.forEach(p => {
        // p.then
        HMPromise.resolve(p).then(res => { resolve(res) }, err => { reject(err) })
      })
    })
  }
```

#### 面试回答:

手写Promise-静态方法race

1. 添加静态方法`race`接收参数`promises`
2. 内部返回一个新的`Promise`实例,在返回的`Promise`实例中:
	1. 判断参数是否为数组,不是通过`reject`传递错误
	2. 遍历Promise数组,通过`resolve`静态方法等待每一个兑现
	3. 任何一个兑现,调用`resolve`传递兑现结果
	4. 任何一个拒绝,调用`reject`传递拒绝原因



### 手写Promise-静态方法all

**需求:**

1. 接收Promise数组
	1. 所有Promise都成功时，返回一个成功的Promise对象及成功数组
	2. 任何一个Promise失败，返回一个失败的Promise对象及第一个失败原因

```javascript
const p1 = HMPromise.resolve(1)
const p2 = new HMPromise((resolve, reject) => {
  setTimeout(() => {
    resolve(2)
    // reject('error')
  }, 1000)
})
const p3 = 3
HMPromise.all([p1, p2, p3]).then(res => {
  console.log('res:', res)
}, err => {
  console.log('err:', err)
})

```

**核心步骤:**

1. 返回Promise

2. 判断参数是否未数组:

	1. 不是:直接报错

3. 是:

	1. 空数组直接兑现
	2. 处理全部兑现:记录结果->判断全部兑现
		3. 处理第一个拒绝

	


```javascript
static all(promises) {
    // 1. 返回Promise实例
    return new HMPromise((resolve, reject) => {
      // 2. 判断是否为数组
      if (!Array.isArray(promises)) {
        return reject(new TypeError('Argument is not iterable'))
      }
      // 3. 空数组直接兑现
      promises.length === 0 && resolve(promises)
      // 4.1 记录结果
      const results = []
      let count = 0
      promises.forEach((p, index) => {
        HMPromise.resolve(p).then(res => {
          // results.push 无法保证 结果的顺序和Promise数组的顺序一致
          // index 和 Promise实例的索引一致,保证顺序
          results[index] = res
          // 4.2 判断全部兑现
          count++
          count === promises.length && resolve(results)
        }, err => {
          // 5. 处理第一个拒绝
          reject(err)
        })
      })
    })
  }

```

#### 面试回答:

手写Promise-静态方法all

1. 添加静态方法`all`
2. 内部返回`Promise`实例,在返回的`Promise`实例中:
	1. 判断参数是否为数组,不是通过`reject`传递错误
	2. 空数组直接以空数组为结果进行兑现
	3. 遍历`Promise`数组,通过`resolve`静态方法等待结果
		1. 处理全部兑现:
			1. 通过数组记录结果,用索引的方式来添加,目的是保证结果的顺序和`Promise`数组的顺序一致
			2. 通过兑现次数进行判断,因为是通过索引的方式记录结果,如果第一次兑现的是最后一个,那么数组的长度就已经和Promise数组的长度一致了,所以需要通过兑现次数来进行判断
		2. 任意一个拒绝,调用`reject`传递拒绝原因

### 手写Promise-静态方法allSettled

**需求:**[-传送门](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Promise/allSettled)

1. 传入`Promise`数组，当所有对象都已敲定时
2. 返回一个新的`Promise`对象及以数组形式保存的结果

```javascript
const p1 = HMPromise.resolve(1)
const p2 = 2
const p3 = new HMPromise((resolve, reject) => {
  setTimeout(() => {
    reject(3)
  }, 1000)
})
HMPromise.allSettled([p1, p2, p3]).then(res => {
  console.log('res:', res)
}, err => {
  console.log('err:', err)
})
```



**核心步骤:**

1. 返回`Promise`
2. 判断是否为数组:
	1. 不是:报错
	2. 是:
		1. 空数组:直接兑现
		2. 等待全部敲定:并记录结果
			1. 处理兑现:`{state:FULFILLED,value:'xxx'}`
			2. 处理拒绝:`{state:REJECTED,reason:'xxx'}`


```javascript
  static allSettled(promises) {
    // 1. 返回Promise
    return new HMPromise((resolve, reject) => {
      // 2. 数组判断
      if (!Array.isArray(promises)) {
        return reject(new TypeError('Argument is not iterable'))
      }
      // 3. 为空直接敲定
      promises.length === 0 && resolve(promises)

      // 4. 等待全部敲定
      // 4.1 记录结果
      const results = []
      let count = 0
      promises.forEach((p, index) => {
        HMPromise.resolve(p).then(res => {
          // 4.2 处理兑现{status:'fulfilled',value:''}
          results[index] = { status: FULFILLED, value: res }
          count++
          count === promises.length && resolve(results)
        }, err => {
          // 4.3 处理拒绝{status:'rejected',reason:''}
          results[index] = { status: REJECTED, reason: err }
          count++
          count === promises.length && resolve(results)
        })
      })
    })
  }


```

#### 面试回答:

手写Promise-静态方法allSettled

做法和`all`方法类似,区别是要获取全部敲定的结果(成功/拒绝),以及获取的结果是对象形式

1. 添加静态方法`allSettled`
2. 内部返回`Promise`实例,在返回的`Promise`实例中:
	1. 判断参数是否为数组,不是通过`reject`传递错误
	2. 空数组直接以空数组为结果进行兑现
3. 遍历`Promise`数组,通过`resolve`静态方法等待敲定结果

4. 等待全部敲定:并记录结果,根据兑现和拒绝将如下格式的内容通过索引的方式的记录到数组中

	1. 处理兑现:`{state:FULFILLED,value:'xxx'}`

	2. 处理拒绝:`{state:REJECTED,reason:'xxx'}`

5. 根据敲定的次数判断是否全部敲定,全部敲定之后,通过`resolve`传递结果数组



### 手写Promise-静态方法any

**需求:**-[传送门](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Promise/any)

1. 传入`Promise`数组，
	1. 任何一个`Promise`对象敲定时，返回一个新的`Promise`对象，及对应的结果
	2. 所有Promise都被拒绝时，返回一个包含所有拒绝原因的`AggregateError`错误数组

```javascript
const p1 = new HMPromise((resolve, reject) => {
  setTimeout(() => {
    reject(1)
  }, 2000)
})
const p2 = 2
const p3 = new HMPromise((resolve, reject) => {
  setTimeout(() => {
    resolve(3)
    // reject(3)
  }, 1000)
})
HMPromise.any([p1, p2, p3]).then(res => {
  console.log('res:', res)
}, err => {
  console.dir(err)
})

```



**核心步骤:**

1. 返回Promise
2. 判断是否为数组
	1. 不是:报错
	2. 是:
		1. 空数组:直接拒绝
		2. 等待结果:
			1. 第一个兑现
			2. 全部拒绝


```javascript
  static any(promises) {
    // 1. 返回Promise,数组判断
    return new HMPromise((resolve, reject) => {
      if (!Array.isArray(promises)) {
        return reject(new TypeError('Argument is not iterable'))
      }
      // 2. 空数组直接拒绝
      promises.length === 0 && reject(new AggregateError(promises, 'All promises were rejected'))

      // 3. 等待结果
      const errors = []
      let count = 0
      promises.forEach((p, index) => {
        HMPromise.resolve(p).then(res => {
          // 3.1 第一个兑现
          resolve(res)
        }, err => {
          // 3.2 全部拒绝
          errors[index] = err
          count++
          count === promises.length && reject(new AggregateError(errors, 'All promises were rejected'))
        })
      })
    })
  }


```

#### 面试回答:

手写Promise-静态方法any

做法和`all`方法也有点类似,区别是获取第一个兑现,或者是全部拒绝

1. 添加静态方法`any`
2. 内部返回`Promise`实例,在返回的`Promise`实例中:
	1. 判断参数是否为数组,不是通过`reject`传递错误
	2. 空数组直接以空数组为结果进行兑现
3. 遍历`Promise`数组,通过`resolve`静态方法等待结果
	1. 第一个兑现,通过`resolve`传递兑现结果
	2. 全部拒绝:
		1. 定义数组,保存拒绝原因,通过索引记录,目的是保证顺序和`Promise`数组一致
		2. 通过次数判断是否全部拒绝,当全部拒绝时,通过`reject`传递`AggregateError`类型的错误,并将拒绝原因数组传递进去即可





到目前已经将静态方法都实现啦

- [x] 实现Promise的核心功能:
- [x] Promise:
	1. 实例方法:
		- [x] `catch`
		- [x] `finally`
	2. 静态方法:
		- [x] `resolve`
		- [x] `reject`
		- [x] `race`
		- [x] `all`
		- [x] `allSettled`
		- [x] `any`

- [x] Promise\A+标准,并跑通872个单元测试


### 手写Promise-Promise\A+测试

接下来咱们来测试一下手写Promise的代码能否通过[Promise\A+](https://promisesaplus.com/)测试

**Promise\A+规范:**

Promise\A+是社区推出的规范,其实最早Promise也是社区推出并实现的,旨在规范Promise的实现,里面约定了:

1. 状态必须是:pending,fulfilled,rejected
2. then方法的详细实现细节
3. ....

早期使用Promise可能需要导入一些库,比如:

- [Q](https://github.com/kriskowal/q)
- [when](https://github.com/cujojs/when)
- [WinJS](https://msdn.microsoft.com/en-us/library/windows/apps/br211867.aspx)
- [RSVP.js](https://github.com/tildeio/rsvp.js)

​    现在已经不需要了,因为在ES6中已经加入语言标准,我们可以直接使用了:从 Chrome 32、Opera 19、Firefox 29、Safari 8 和 Microsoft Edge 开始，promises 是默认开启的。若要使缺乏完整 promise 实现的浏览器符合规范，或将 promise 添加到其他浏览器和 Node.js 中，请查看[polyfill](https://github.com/jakearchibald/ES6-Promises#readme) (2k gzipped)。

​		上面提到的库,以及ES6中实现的Promise,还有我们手写的Promise其实都是按照标准进行编写的,那么如何测试是否符合标准呢

**测试:**

社区提供了[promises-](https://github.com/promises-aplus/promises-tests)[aplus](https://github.com/promises-aplus/promises-tests)[-tests](https://github.com/promises-aplus/promises-tests)用来测试实现的Promise是否符合规范,使用方式为:

1. 使用CommonJS的方式暴露对象,要求如下

	```javascript
	1.  提供deferred方法,返回对象{promise,resolve,reject}
	   1.1  promise: pending状态的promise实例(自己手写的Promise)
	   1.2  resolve:  以传入的原因兑现promise
	   1.3  reject:    以传入的原因拒绝promise
	```

	```javascript
	// 将我们自己手写的Promise拷贝到一个单独的文件,并在底部加上
	module.exports = {
	  deferred() {
	    const res = {}
	    // 自己手写的Promise
	    res.promise = new HMPromise((resolve, reject) => {
	      // 内部将resolve和reject赋值上去   
	      res.resolve = resolve
	      res.reject = reject
	    })
	    return res
	  }
	}
	
	```

	

2. 下包:

	1. 初始化项目: `npm init -y`

	2. 下包:`npm i promises-aplus-tests -D`

3. 配置并执行命令:

	1. `package.json`的`scripts`中加入

	2. 注: `HMPromise`是文件名,根据实际情况调整自己的文件名即可

		```javascript
		"test": "promises-aplus-tests HMPromise"
		```

	3. 执行命令:`npm run test`


**测试:**

我们目前的写法中,没有考虑所有的边界情况,测试时会在2.3.3开始出错

![image-20230806180825358](C:/Users/797799421/Desktop/笔记/前端/js/js原理-面试/assets/image-20230806180825358.png)

只需要将`resolvePromise`函数替换为如下写法即可:

1. 函数名,参数顺序和原函数一致
2. 函数内部使用,序号+说明的方式对Promise\A+的标准进行标注

大伙可以参考注释对比确认还需要考虑哪些便捷情况,

```javascript
// 符合Promise\A规范(考虑了各种边界情况)
function resolvePromise(p2, x, resolve, reject) {
  // 2.3.3.1 如果p2和x引用同一个对象,通过TypeError作为原因来拒绝pormise
  if (x === p2) {
    throw new TypeError('Chaining cycle detected for promise');
  }

  /**
   * 2.3.3.2 如果x是一个promise,采用他的状态
   *  2.3.3.3.1 如果x是pengding状态,promise必须保持等待状态,直到x被fulfilled或rejected
   *  2.3.3.3.2 如果x是fulfilled状态,用相同的原因解决promise
   *  2.3.3.3.3 如果x是rejected状态,用相同的原因拒绝promise
   * */
  if (x instanceof HMPromise) {
    x.then(y => {
      resolvePromise(p2, y, resolve, reject)
    }, reject);
  }
  // 2.3.3 如果x是一个对象或者函数
  else if (x !== null && ((typeof x === 'object' || (typeof x === 'function')))) {
    // 2.3.3.1 让then成为x.then
    try {
      var then = x.then;
    } catch (e) {
      // 2.3.3.2 如果检索属性x.then抛出了异常e，用e作为原因拒绝promise
      return reject(e);
    }

    /**
     * 2.3.3.3  如果then是一个函数，通过call调用他,并且将x作为他的this(参数1)
     * 调用then时传入2个回调函数:
     *    第一个参数叫做resolvePromise(对应到的参数2)
     *    第二个参数叫做rejectPromise(对应到参数3)
     * */

    if (typeof then === 'function') {
      // 2.3.3.3.3 如果 resolvePromise 和 rejectPromise 均被调用，或者同一参数被调用了多次，只采用第一次调用,后续的调用会被忽略(观察called后续的赋值+判断)
      let called = false;
      try {
        then.call(
          x,
          // 2.3.3.3.1 如果 resolvePromise 以 成功原因 y 为参数被调用，继续执行 resolvePromise
          y => {
            if (called) return;
            called = true;
            resolvePromise(p2, y, resolve, reject);
          },
          // 2.3.3.3.2 如果 rejectPromise 以拒绝原因 r 为参数被调用，用 r 拒绝 promise
          r => {
            if (called) return;
            called = true;
            reject(r);
          }
        )
      }
      // 2.3.3.3.4 如果调用then抛出异常
      catch (e) {
        // 2.3.3.3.4.1 如果resolvePromise或rejectPromise已经被调用，忽略它
        if (called) return;
        called = true;

        // 2.3.3.3.4.2 否则以 e 作为拒绝原因 拒绝promise
        reject(e);
      }
    } else {
      // 2.3.3.4 如果then不是函数，用 x 作为原因 兑现promise
      resolve(x);
    }
  } else {
    // 2.3.4 如果then不是对象或函数，用 x 作为原因 兑现promise
    return resolve(x);
  }
}
```

替换完毕之后,再次执行`npm run test`,全部测试通过.

![image-20230806180745983](C:/Users/797799421/Desktop/笔记/前端/js/js原理-面试/assets/image-20230806180745983.png)



#### 面试回答:

手写Promise-Promise\A+测试

`Promise`和`Promise\A+`规范的关系

1. `Promise\A+`是社区推出的规范,最早Promise也是社区推出并实现的,旨在规范`Promise`的实现,里面约定了:
	1. 状态必须是`pending`,`fulfilled`,`rejected`
	2. `then`方法的详细实现细节
	3. 各种边界情况....

2. 早期使用`Promise`需要导入第三方库,现在在新式浏览器中已经不需要导入第三方库,因为`Promise`是默认开启的
3. 无论是早期实现了Promise的第三方库,以及现在的新式浏览器内置的Promise,都是符合`Promise\A+`规范要求的







## 参考资料

1. [MDN-Promise](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Promise)

	

# day03

## 函数柯里化

> 这一节咱们来学习函数柯里化,在计算机科学中，柯里化（英语：Currying），又译为卡瑞化或加里化，是把接受多个参数的函数变换成接受一个单一参数（最初函数的第一个参数）的函数，并且返回接受余下的参数而且返回结果的新函数的技术。

这一节咱们会学习的有:

1. 什么是函数柯里化
2. 经典面试题
3. 柯里化实际应用

 柯里化 作为一种高阶技术, 可以提升函数的复用性和灵活性。

### 什么是函数柯里化

函数柯里化 (Currying) 是一种**将多个参数的函数转换为单个参数函数**的技术

转换完毕之后的函数:**只传递函数的一部分参数来调用，让他返回一个新的函数去处理剩下的参数。**

**例子:**

```javascript
// 调整函数 sum
function sum(num1, num2) {
  return num1 + num2
}

// 改写为 可以实现如下效果
console.log(sum(1)(2))// 
```

**核心步骤:**

1. `sum`改为接收一个参数，返回一个新函数
2. 新函数内部将**参数1**，**参数2**累加并返回

```javascript
function sum(num1) {
  return function (num2) {
    return num1 + num2
  }
}
```

#### 面试回答:

什么是函数柯里化

1. 函数柯里化是一种将多个参数的函数转换为单个参数函数的技术
2. 转换完毕之后的函数只需要传递一部分参数进行调用,并且会返回一个新的函数去处理剩下的参数





### 柯里化面试题-全局变量

柯里化在面试的时候一般以笔试题出现,比如

**需求:**

```javascript
function sum(a, b, c, d, e) {
  return a + b + c + d + e
}
// 改写函数sum实现:参数传递到5个即可实现累加
// sum(1)(2)(3)(4)(5)
// sum(1)(2,3)(4)(5)
// sum(1)(2,3,4)(5)
// sum(1)(2,3)(4,5)
```

**核心步骤:**

1. 接收不定长参数
2. 存储已传递的参数
3. 判断长度
	1. 满足5:累加
	2. 不满足:继续返回**函数本身**

```javascript
let nums = []
function currySum(...args) {
  nums.push(...args)
  if (nums.length >= 5) {
    return nums.reduce((prev, curv) => prev + curv, 0)
  } else {
    return currySum
  }
}
```

#### 面试回答:

柯里化面试题-全局变量

1. 定义数组保存参数
2. 函数接收不定长参数
3. 调用时将传入的参数,添加到数组中,并判断数组长度:
	1. 满足长度要求:累加并返回结果
	2. 未达到长度要求:继续返回函数本身





### 柯里化面试题-使用闭包

**需求:**

1. 使用**闭包**将上一节代码中的全局变量,保护起来
2. 支持自定义累加的参数个数

```javascript
function sumMaker(length){
    // 逻辑略
}
// 支持5个累加
const sum5 = sumMaker(5)
// 支持7个累加
const sum7 = sumMaker(7)
sum7(1,2,3)(4,5,6,7)
```



**核心步骤:**

1. 定义外层函数:
	1. 定义参数`length`
	2. 将全局变量迁移到函数内
2. 定义内层函数:
	1. 参数长度判断,使用传入的参数`length`
	2. 直接复用上一节的逻辑,并返回

```javascript
function sumMaker(length) {
  let nums = []
  function inner(...args) {
    nums.push(...args)
    if (nums.length >= length) {
      return nums.reduce((prev, curv) => prev + curv, 0)
    } else {
      return inner
    }
  }
  return inner
}
```

#### 面试回答:

柯里化面试题-使用闭包

1. 定义函数,接收参数,用来确定参数个数
2. 内部将上一节的逻辑拷贝进去
3. 返回原函数
4. 通过这样的调整,可以让我们自定义参数的个数,并且没有上一节的全局变量数组







### 柯里化实际应用-类型判断

通过**参数复用**,实现一个**类型判断生成器函数**

**需求:**

1. 将下列4个类型判断函数,改写为通过函数`typeOfTest`动态生成

```javascript
// 有如下4个函数
function isUndefined(thing) {
  return typeof thing === 'undefined'
}
function isNumber(thing) {
  return typeof thing === 'number'
}
function isString(thing) {
  return typeof thing === 'string'
}
function isFunction(thing) {
  return typeof thing === 'function'
}

// 改为通过 typeOfTest 生成:
const typeOfTest =function(){
   // 参数 和 逻辑略

}
const isUndefined = typeOfTest('undefined')
const isNumber = typeOfTest('number')
const isString = typeOfTest('string')
const isFunction = typeOfTest('function')

// 可以通过 isUndefined,isNumber,isString,isFunction 来判断类型:

isUndefined(undefined) // true
isNumber('123') // false
isString('memeda') // true
isFunction(() => { }) // true
```

**核心步骤:**

1. `typeOfTest`接收参数`type`用来接收判断的类型
2. 内部返回新函数,接收需要判断的值,并基于`type`进行判断
3. 使用箭头函数改写为最简形式~~[传送门-github](https://github.com/axios/axios/blob/v1.x/lib/utils.js)

```javascript
const typeOfTest = (type) => {
  return (thing) => {
    return typeof thing === type
  }
}
```

#### 面试回答:

柯里化实际应用-类型判断

1. 定义函数,接收需要判断的类型名

2. 内部返回一个新的函数,

	1. 新函数接收需要判断的具体的值
	2. 新函数内部根据外层函数传入的类型,以及传入的值进行判断并返回结果

	





### 柯里化实际应用-固定参数

依旧是一个**参数复用**的实际应用

**需求:**

1. 将如下3个请求的函数(都是**post**请求),变为通过`axiosPost`函数动态生成
2. 实现函数`axiosPost`

```javascript
 // 项目开发中不少请求的 请求方法 是相同的,比如
axios({
  url: 'url',
  method: 'get'
})
axios({
  url: 'url',
  method: 'get',
  params: {
    // 
  }
})
axios({
  url: 'url',
  method: 'post',
  data: ''
})
axios({
  url: 'url',
  method: 'post',
  data: '',
  headers: {

  }
})

// 固定请求参数,请求方法固定,其他参数从外部传递进来
// 需求: 实现方法requestWithMethod 支持如下调用
requestWithMethod('get')({
  url: '',
  params: {},
  headers: {}
})
requestWithMethod('post')({
  url: '',
  headers: {},
  data: {}
})

```

**核心步骤:**

1. 函数内部固定请求方法,post
2. 函数内部调用`axios`发请求即可
3. `axios`内部就是这样实现的
	1. [传送门-github:](https://github.com/axios/axios/blob/v1.x/dist/axios.js#L2667)


```javascript
function requestWithMethod(method) {
  return (config) => {
    return axios({
      method,
      ...config
    })
  }
}
```

#### 面试回答:

柯里化实际应用-固定参数

1. 函数柯里化是一种函数式编程思想:**将多个参数的函数转换为单个参数函数,调用时返回新的函数接收剩余参数**

2. 常见面试题,将函数改写为如下调用新式:核心思想就是返回新的函数,根据已经记录的参数长度判断:

	1. 长度符合要求:累加

	2. 长度不符合要求:继续返回


   ```javascript
function sum(a, b, c, d, e) {
  return a + b + c + d + e
}
// 改写函数sum实现:参数传递到5个即可实现累加
// sum(1)(2)(3)(4)(5)
// sum(1)(2,3)(4)(5)
// sum(1)(2,3,4)(5)
// sum(1)(2,3)(4,5)
   ```

3. 常见应用:固定参数,比如`axios`中的:

	1. [类型判断函数](https://github.com/axios/axios/blob/v1.x/lib/utils.js#L20)
	2. [get,post,put等别名方法](https://github.com/axios/axios/blob/v1.x/dist/axios.js#L2667)
	3. 就用到了柯里化的思想

## JS设计模式

> 这一节咱们来学习JS中的设计模式
>
> [传送门:wiki-设计模式](https://zh.wikipedia.org/wiki/%E8%AE%BE%E8%AE%A1%E6%A8%A1%E5%BC%8F%EF%BC%9A%E5%8F%AF%E5%A4%8D%E7%94%A8%E9%9D%A2%E5%90%91%E5%AF%B9%E8%B1%A1%E8%BD%AF%E4%BB%B6%E7%9A%84%E5%9F%BA%E7%A1%80)
>
> [传送门:JavaScript设计模式与开发实践](https://www.ituring.com.cn/book/1632)

设计模式的指的是：在**面向对象软件**设计过程中针对特定问题的简洁而优雅的解决方案。通俗一点说，设计模式就是给面向对象软件开发中的一些好的设计取个名字。

目前说到设计模式，一般指的是《设计模式：可复用面向对象软件的基础》一书中提到的**23种**常见的软件开发设计模式。

JavaScript中不需要生搬硬套这些模式，咱们结合实际前端开发中的具体应用场景，来看看有哪些常用的设计模式

这一节咱们会学习:

1. JS中的常用设计模式
2. 设计模式在开发/框架中的应用场景

### 工厂模式

在JavaScript中，工厂模式的表现形式就是一个直接调用即可返回新对象的函数

```javascript
// 定义构造函数并实例化
function Dog(name){
    this.name=name
}
const dog = new Dog('柯基')

// 工厂模式
function ToyFactory(name,price){
    return {
        name,
        price
    }
}
const toy1 = ToyFactory('布娃娃',10)
const toy2 = ToyFactory('玩具车',15)
```

**应用场景**

1. Vue2->Vue3: 

	1. 启用了`new Vue`,改成了工厂函数`createApp`-[传送门](https://v3-migration.vuejs.org/zh/breaking-changes/global-api.html)
	2. *任何全局改变 Vue 行为的 API(vue2) 现在都会移动到应用实例上(vue3)*
	3. 就不会出现,Vue2中多个Vue实例共享,相同的全局设置,可以**实现隔离**

	```html
	<!DOCTYPE html>
	<html lang="zh-CN">
	
	<head>
	  <meta charset="UTF-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1.0">
	  <title>Document</title>
	  <style>
	    #app1,
	    #app2 {
	      border: 1px solid #000;
	    }
	  </style>
	</head>
	
	<body>
	  <h2>vue2-全局注册组件</h2>
	  <div id="app1">
	    实例1
	    <my-title></my-title>
	  </div>
	  <div id="app2">
	    实例2
	    <my-title></my-title>
	  </div>
	  <script src="https://cdn.bootcdn.net/ajax/libs/vue/2.7.9/vue.js"></script>
	  <script>
	    Vue.component('my-title', {
	      template: '<h2 style="color:orange">标题组件</h2>'
	    })
	    const app1 = new Vue({
	      el: "#app1"
	    })
	
	    const app2 = new Vue({
	      el: "#app2"
	    })
	
	  </script>
	</body>
	
	</html>
	```

2. axios.create:

	1. 基于传入的配置创建一个新的`axios`实例,[传送门](https://www.axios-http.cn/docs/instance)
	2. 项目中有2个请求基地址如何设置?

```javascript
// 1. 基于不同基地址创建多个 请求对象
const request1 = axios.create({
  baseURL: "基地址1"
})
const request2 = axios.create({
  baseURL: "基地址2"
})
const request3 = axios.create({
  baseURL: "基地址3"
})

// 2. 通过对应的请求对象,调用接口即可
request1({
  url: '基地址1的接口'
})
request2({
  url: '基地址2的接口'
})
request3({
  url: '基地址3的接口'
})
```

#### 面试回答:

1. 工厂模式:JS中的表现形式,返回新对象的函数(方法)

	1. ```javascript
		function sayHi(){} // 函数
		const obj ={
		    name:'jack',
		    sayHello(){} // 方法
		}
		```

2. 日常开发中,有2个很经典的场景

	1. `vue3`中创建实例的api改为`createApp`,`vue2`中是`new Vue`
		1. Vue3中,没有影响所有Vue实例的api了,全都变成了影响某个app对象的api,比如`Vue.component-->app.component`
	2. `axios.create`基于传入的配置,创建一个新的请求对象,可以用来设置多个基地址



### 单例模式

单例模式指的是，在使用这个模式时，单例对象整个系统需要保证**只有一个**存在。

**需求:**

1. 通过静态方法`getInstance`获取**唯一实例**

```javascript
const s1 = SingleTon.getInstance()
const s2 = SingleTon.getInstance()
console.log(s1===s2)//true
```

**核心步骤:**

1. 定义类
2. 私有静态属性:`#instance`
3. 提供静态方法`getInstance`:
	1. 调用时判断`#instance`是否存在:
	2. 存在:直接返回
	3. 不存在:实例化,保存,并返回

```javascript
class SingleTon {
   constructor() { }
   // 私有属性，保存唯一实例
   static #instance

  // 获取单例的方法
  static getInstance() {
    if (SingleTon.#instance === undefined) {
      // 内部可以调用构造函数
      SingleTon.#instance = new SingleTon()
    }
    return SingleTon.#instance
  }
}
```

**实际应用:**

1. vant组件库中的弹框组件,保证弹框是单例
	1. toast组件:[传送门](https://gitee.com/vant-contrib/vant/blob/main/packages/vant/src/toast/index.ts)
	2. notify组件:[传送门](https://gitee.com/vant-contrib/vant/blob/main/packages/vant/src/notify/index.ts)
	3. 如果弹框对象
		1. 不存在,-->创建一个新的
		2. 存在,直接用
2. vue中注册插件,用到了单例的思想(只能注册一次)
	1. vue2:[传送门](https://gitee.com/vuejs/vue/blob/main/src/core/global-api/use.ts)
	2. vue3:[传送门](https://gitee.com/vuejs/core/blob/main/packages/runtime-core/src/apiCreateApp.ts#L256)

#### 面试回答:

1. 单例模式:
	1. 保证,应用程序中,某个对象,只能有一个
2. 自己实现核心为一个返回唯一实例的方法,比如`getInstance`
	1. 实例存在`->`返回
	2. 实力不存在`->`创建,保存`->`返回
3. 应用场景:
	1. `vant`的`toast`和`notify`组件都用到了单例:多次弹框,不会创建多个弹框,复用唯一的弹框对象
	2. `vue`中注册插件,`vue2`和`vue3`都会判断插件是否已经注册,已注册,直接提示用户



### 观察者模式

在对象之间定义一个**一对多**的依赖，当一个对象状态改变的时候，所有依赖的对象都会自动收到通知。

**举个例子:**

1. `dom`事件绑定，比如

```javascript
window.addEventListener('load', () => {
  console.log('load触发1')
})
window.addEventListener('load', () => {
  console.log('load触发2')
})
window.addEventListener('load', () => {
  console.log('load触发3')
})
```

2. Vue中的watch:



#### 面试回答:

1. 观察者模式重点说清楚2点即可:
	1. 在对象之间定义一个**一对多**的依赖，当一个对象状态改变的时候，所有依赖的对象都会自动收到通知。
	2. 常见场景:vue中的watch,dom事件绑定

观察者模式和发布订阅模式的区别也是常见考点,回答方式见下一节



### 发布订阅模式01-应用场景

发布订阅模式可以实现的效果类似观察者模式,但是两者略有差异,一句话描述:一个有中间商(**发布订阅模式**)一个没中间商(**观察者模式**)

![image-20230811104051236](assets/image-20230811104051236.png)

**应用场景:**

1. `vue2`中的`EventBus`:[传送门](https://v2.cn.vuejs.org/v2/api/#%E5%AE%9E%E4%BE%8B%E6%96%B9%E6%B3%95-%E4%BA%8B%E4%BB%B6)
2. `vue3`中因为移除了实例上对应方法，可以使用替代方案:[传送门](https://v3-migration.vuejs.org/zh/breaking-changes/events-api.html)
	1. 官方推荐,用插件
	2. 我们自己写


### 发布订阅模式02-自己写一个事件总线

**需求:**

```javascript
const bus = new HMEmitter()
// 注册事件
bus.$on('事件名1',回调函数)
bus.$on('事件名1',回调函数)

// 触发事件
bus.$emit('事件名',参数1,...,参数n)

// 移除事件
bus.$off('事件名')

// 一次性事件
bus.$once('事件名',回调函数)
```

**核心步骤:**

1. 定义类
2. 私有属性:`#handlers={事件1:[f1,f2],事件2:[f3,f4]}`
3. 实例方法:
	1. $on(事件名,回调函数):注册事件
	2. $emit(事件名,参数列表):触发事件
	3. $off(事件名):移除事件
	4. $once(事件名,回调函数):注册一次性事件

**基础模板:**

```html
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>

<body>
  <h2>自己实现事件总线</h2>
  <button class="on">注册事件</button>
  <button class="emit">触发事件</button>
  <button class="off">移除事件</button>
  <button class="once-on">一次性事件注册</button>
  <button class="once-emit">一次性事件触发</button>
  <script>
    class HMEmmiter {
    	// 逻辑略
    }

    // 简化 querySelector调用
    function qs(selector) {
      return document.querySelector(selector)
    }
    // 注册事件
    qs('.on').addEventListener('click', () => {
    
    })
    // 触发事件
    qs('.emit').addEventListener('click', () => {
   
    })
    // 移除事件
    qs('.off').addEventListener('click', () => {
      
    })
    // 一次性事件注册
    qs('.once-on').addEventListener('click', () => {
     
    })
    // 一次性事件触发
    qs('.once-emit').addEventListener('click', () => {
     
    })
  </script>
</body>

</html>
```



```javascript
class HMEmmiter {
  #handlers = {}
  // 注册事件
  $on(event, callback) {
    if (!this.#handlers[event]) {
      this.#handlers[event] = []
    }
    this.#handlers[event].push(callback)
  }
  // 触发事件
  $emit(event, ...args) {
    const funcs = this.#handlers[event] || []
    funcs.forEach(func => {
      func(...args)
    })
  }
  // 移除事件
  $off(event) {
    this.#handlers[event] = undefined
  }
  // 一次性事件
  $once(event, callback) {
    this.$on(event, (...args) => {
      callback(...args)
      this.$off(event)
    })
  }
}
```

#### 面试回答:

1. 发布订阅模式:可以实现的效果类似观察者模式,但是两者略有差异,一句话描述:一个有中间商(**发布订阅模式**)一个没中间商(**观察者模式**)
2. 经典的场景是`vue2`中的`EventBus`,`vue3`移除了实例的`$on`,`$off`,`$emit`方法,如果还需要使用:
	1. 使用第三方插件
	2. 自己实现事件总线:
3. 自己实现事件总线的核心逻辑:
	1. 添加类,内部定义私有属性`#handlers={}`,以对象的形式来保存回调函数
	2. 添加实例方法:
		1. `$on`:
			1. 接收事件名和回调函数
			2. 内部判断并将回调函数保存到`#handlers`中,以`{事件名:[回调函数1,回调函数2]}`格式保存
		2. `$emit`
			1. 接收事件名和回调函数参数
			2. 内部通过`#handlers`获取保存的回调函数,如果获取不到设置为空数组`[]`
			3. 然后挨个调用回调函数即可
		3. `$off`
			1. 接收事件名
			2. 将`#handlers`中事件名对应的值设置为`undefined`即可
		4. `$once`
			1. 接收事件名和回调函数
			2. 内部通过`$on`注册回调函数,
			3. 内部调用`callback`并通过`$off`移除注册的事件



### 原型模式

在原型模式下，当我们想要创建一个对象时，会先找到一个对象作为原型，然后通过**克隆原型**的方式来创建出一个与原型一样（共享一套数据/方法）的对象。在`JavaScript`中,`Object.create`就是实现原型模式的内置`api`

**应用场景:**

`vue2`中重写数组方法:

1. 调用方法时(`push`,`pop`,`shift`,`unshift`,`splice`,`sort`,`reverse`)可以触发视图更新:[传送门](https://v2.cn.vuejs.org/v2/guide/list.html#%E5%8F%98%E6%9B%B4%E6%96%B9%E6%B3%95)
2. 源代码:[传送门](https://gitee.com/vuejs/vue/blob/main/src/core/observer/array.ts)
3. 测试一下:

```html
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>

<body>
  <h2>原型模式</h2>
  <div id="app"></div>
  <script src="https://cdn.bootcdn.net/ajax/libs/vue/2.7.9/vue.js"></script>
  <script>
    const app = new Vue({
      el: "#app", data: {
        foods: ['西瓜', '西葫芦', '西红柿']
      }
    })
    console.log(app.foods.push === Array.prototype.push)
  </script>

</body>

</html>
```



#### 面试回答:

1. 原型模式:
	1. 基于某个对象,创建一个新的对象
	2. JS中,通过`Object.create`就是实现了这个模式的内置`api`
	3. 比如`vue2`中重写数组方法就是这么做的

2. vue2中数组重写了7个方法,内部基于数组的原型`Array.prototype`创建了一个新对象
3. 创建的方式是通过`Object.create`进行浅拷贝
4. 重写的时候:
	1. 调用数组的原方法,获取结果并返回---方法的功能和之前一致
	2. 通知了所有的观察者去更新视图

```javascript
const app = new Vue({
    el:"#app",
    data:{
        arr:[1,2,3]
    }
})
app.arr.push === Array.prototype.push //false
```



### 代理模式

代理模式指的是**拦截和控制**与目标对象的交互

这里我们来看一个非常经典的代理模式的应用: 缓存代理

![image-20230811104311315](assets/image-20230811104311315.png)

**核心语法:**

1. 创建对象缓存数据
2. 获取数据时,先通过缓存判断:
	1. 有直接获取
	2. 没有:调用接口


```javascript
//  1. 创建对象缓存数据
const cache = {}
async function searchCity(pname) {
  // 2. 判断是否缓存数据
  if (!cache[pname]) {
    // 2.1 没有:查询,缓存,并返回
    const res = await axios({
      url: 'http://hmajax.itheima.net/api/city',
      params: {
        pname
      }
    })
    cache[pname] = res.data.list
  }
  // 2.2 有:直接返回
  return cache[pname]
}

document.querySelector('.query').addEventListener('keyup', async function (e) {
  if (e.keyCode === 13) {
    const city = await searchCity(this.value)
    console.log(city)
  }
})
```

#### 面试回答:

1. 代理模式的核心是,通过一个代理对象拦截对原对象的直接操纵
2. 比如可以通过缓存代理:
	1. 缓存获取到的数据
	2. 拦截获取数据的请求:
		1. 已有缓存:直接返回缓存数据
		2. 没有缓存:去服务器获取数据并缓存
3. 提升数据获取效率,降低服务器性能消耗



### 迭代器模式

迭代器模式提供一种方法顺序访问一个聚合对象中的各个元素，而又不暴露该对象的内部表示.简而言之就是:**遍历**

遍历作为日常开发中的**高频**操作,JavaScript中有大量的默认实现:**比如**

1. `Array.prototype.forEach`:遍历数组
2. `NodeList.prototype.forEach`:遍历`dom`,`document.querySelectorAll`
3. `for in`
4. `for of`



**面试题**:

1. `for in` 和`for of` 的区别?
	1. **`for...in`** **语句**以任意顺序迭代一个对象的除[Symbol](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Symbol)以外的[可枚举](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Enumerability_and_ownership_of_properties)属性，包括继承的可枚举属性。
		1. 对象默认的属性以及动态增加的属性都是**可枚举**属性
		2. 遍历出来的是**属性名**
		3. 继承而来的属性也会遍历
	2. **`for...of`语句**在[可迭代对象](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Iteration_protocols)（包括 [`Array`](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array)，[`Map`](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Map)，[`Set`](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Set)，[`String`](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/String)，[`TypedArray`](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/TypedArray)，[arguments](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Functions/arguments) 对象等等）上创建一个迭代循环
		1. for of不会遍历**继承**而来的属性
		2. 遍历出来的是**属性值**

```javascript
Object.prototype.objFunc = function () { }
Array.prototype.arrFunc = 'arrFunc'

const foods = ['西瓜', '西葫芦', '西兰花']
for (const key in foods) {
  console.log('for-in:key', key)
}
for (const iterator of foods) {
  console.log('for-of:iterator', iterator)
}
```



**可迭代协议和迭代器协议:**

1. 可迭代协议:[传送门](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Iteration_protocols#%E5%8F%AF%E8%BF%AD%E4%BB%A3%E5%8D%8F%E8%AE%AE)
	1. 给对象增加属方法` [Symbol.iterator](){}`
	2. 返回一个符合迭代器协议的对象

2. 迭代器协议:[传送门](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Iteration_protocols#%E8%BF%AD%E4%BB%A3%E5%99%A8%E5%8D%8F%E8%AE%AE)
	1. next方法,返回对象:
		1. `{done:true}`,迭代结束
		2. `{done:false,value:'xx'}`,获取解析并接续迭代
		3. 实现方式:
			1. 手写
			2. `Generator`

```javascript
// ------------- 迭代协议 -------------
/**
 * 迭代协议可以定制对象的迭代行为  分为2个协议:
 *  1. 可迭代协议: 增加方法[Symbol.iterator](){} 返回符合 迭代器协议 的对象
 *  2. 迭代器协议: 
 *      有next方法的对象,next方法返回:
 *        已结束: {done:true}
 *        继续迭代: {done:false,value:'x'}
 *    使用Generator
 *    自己实现 对象,next
 * */
const obj = {
  // Symbol.iterator 内置的常量
  // [属性名表达式]
  [Symbol.iterator]() {

    // ------------- 自己实现 -------------
    const arr = ['北京', '上海', '广州', '深圳']
    let index = 0

    return {
      next() {
        if (index < arr.length) {
          // 可以继续迭代
          return { done: false, value: arr[index++] }
        }
        // 迭代完毕
        return { done: true }
      }
    }


    // ------------- 使用Generator -------------
    // function* foodGenerator() {
    //   yield '西兰花'
    //   yield '花菜'
    //   yield '西兰花炒蛋'
    // }
    // const food = foodGenerator()
    // return food
  }
}

for (const iterator of obj) {
  console.log('iterator:', iterator)
}
```

#### 面试回答:

1. 迭代器模式在js中有大量的默认实现,因为遍历或者说迭代时日常开发中的高频操作,比如`forEach`,`for in`,`for of`等
2. `for in` 和`for of`的区别:
	1. **`for...in`** **语句**以任意顺序迭代一个对象的除[Symbol](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Symbol)以外的[可枚举](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Enumerability_and_ownership_of_properties)属性，包括继承的可枚举属性。
		1. 对象默认的属性以及动态增加的属性都是**可枚举**属性
		2. 遍历出来的是**属性名**
		3. 继承而来的属性也会遍历
	2. **`for...of`语句**在[可迭代对象](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Iteration_protocols)（包括 [`Array`](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array)，[`Map`](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Map)，[`Set`](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Set)，[`String`](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/String)，[`TypedArray`](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/TypedArray)，[arguments](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Functions/arguments) 对象等等）上创建一个迭代循环
		1. for of不会遍历**继承**而来的属性
		2. 遍历出来的是**属性值**

3. 如何自定义可迭代对象?
	1. 需要符合2个协议:可迭代协议和迭代器协议,其实就是按照语法要求实现功能而已
	2. 可迭代协议:[传送门](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Iteration_protocols#%E5%8F%AF%E8%BF%AD%E4%BB%A3%E5%8D%8F%E8%AE%AE)
		1. 给对象增加属方法` [Symbol.iterator](){}`
		2. 返回一个符合**迭代器协议**的对象
	3. 迭代器协议:[传送门](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Iteration_protocols#%E8%BF%AD%E4%BB%A3%E5%99%A8%E5%8D%8F%E8%AE%AE)
		1. 有next方法的一个对象,内部根据不同情况返回对应结果:
			1. `{done:true}`,迭代结束
			2. `{done:false,value:'xx'}`,获取解析并接续迭代
		2. 实现方式:
			1. 自己手写实现逻辑
			2. 直接返回一个`Generator`











## 参考资料

1. [阮一峰-《ECMAScript 6 教程》](https://wangdoc.com/es6/)
2. [图灵社区-JavaScript高级程序设计](https://www.ituring.com.cn/book/2472)

# 防抖和节流

## 防抖



### 防抖的适用场景

常见的前端性能优化方案 , 它可以防止JS高频渲染页面时出现的视觉抖动(卡顿):比如

1. **示例1:**页面改变尺寸时,同步调整图表的大小
2. **示例2:**输入内容时,结合ajax进行搜索并渲染结果

如果内容的渲染速度过快,都可能会造成抖动效果,并且连带会**浪费性能**

1. 频繁执行逻辑代码,耗费浏览器性能
2. 频繁发送请求去服务器,耗费服务器性能

![image-20231103105837551](C:/Users/797799421/Desktop/笔记/前端/js/js原理-面试/assets/image-20231103105837551.png)



**适用场景**:

1. 在触发频率高的事件中
	* 频率高的事件: resize、input 、scroll 、keyup….
2. 执行耗费性能操作
	* 耗费性能的操作: 操纵页面、网络请求….
3. 需要实现的效果: 连续操作之后只有最后一次生效

这个时候就可以适用防抖来进行优化









### 手写防抖

防抖优化之后的效果可以通过一些具体的网站来进行确认,比如[12306](https://www.12306.cn/index/),他就是通过防抖进行的优化:

![image-20231103110502057](C:/Users/797799421/Desktop/笔记/前端/js/js原理-面试/assets/image-20231103110502057.png)

1. 在输入内容的时候没有发送请求
2. 输入完毕之后,稍等一会才发送请求去服务器

这个就是防抖的效果: **连续事件停止触发后,一段时间内没有再次触发,就执行业务代码**



#### 核心实现步骤

1. 开启定时器,保存定时器id

2. 清除已开启的定时器





![image-20231103110559686](C:/Users/797799421/Desktop/笔记/前端/js/js原理-面试/assets/image-20231103110559686.png)



那个**输入框+搜索**的例子优化之后代码如下:

```javascript
let timeId
document.querySelector('.search-city').addEventListener('input', function () {
  //  2. 清除已开启的定时器
  clearTimeout(timeId)
    
  //  1. 开启定时器,保存定时器id
  timeId = setTimeout(() => {
    renderCity(this.value)
  }, 500)
})
```



### lodash的debounce方法



实际开发中一般不需要手写防抖,因为已经有库里面提供了对应的方法,可以直接调用,也可以自己手写实现`debounce`,一会咱们就从这两个方面进行讲解:

1. `lodash`工具库中的`debounce`方法(**常用**)
2. `debounce`的实现原理(**高频面试题**)



[传送门](https://www.lodashjs.com/docs/lodash.debounce)



```javascript
_.debounce(func, [wait=0], [options=])
```

#### 参数

1. `func` *(Function)*: 要防抖动的函数。
2. `[wait=0]` *(number)*: 需要延迟的毫秒数。
3. `[options=]` *(Object)*: 选项对象。
4. `[options.leading=false]` *(boolean)*: 指定在延迟开始前调用。
5. `[options.maxWait]` *(number)*: 设置 `func` 允许被延迟的最大值。
6. `[options.trailing=true]` *(boolean)*: 指定在延迟结束后调用。

#### 返回

*(Function)*: 返回新的 debounced（防抖动）函数。



**注意:** 

1. 实际开发时一般给前2个参数即可,然后适用返回的函数替换原函数即可
2. 项目中如果有`lodash`那么直接使用它提供的`debounce`即可,不仅可以实现防抖,原函数中的`this`和`参数`均可以正常使用











### 手写debounce函数



手写实现`debounce`函数,实现`lodash`中`debounce`方法的核心功能

**需求:**

1. 参数:
	1. `func` *(Function)*: 要防抖动的函数。
	2. `[wait=0]` *(number)*: 需要延迟的毫秒数。
2. 返回值:
	1. *(Function)*: 返回新的 debounced（防抖动）函数。



#### 核心步骤:

1. 返回防抖动的新函数

2. 原函数中的`this`可以正常使用

3. 原函数中的**参数**可以正常使用

```javascript
function debounce(func, wait = 0) {
  let timeId
  // 防抖动的新函数
  return function (...args) {
    let _this = this
    clearTimeout(timeId)
    timeId = setTimeout(function () {
      // 通过apply调用原函数,并指定this和参数
      func.apply(_this, args)
    }, wait)
  }
}

```



## 节流

### 节流的适用场景

常见的前端性能优化方案 , 它可以防止高频触发事件造成的性能浪费:比如

1. 播放视频时同步缓存播放时间
2. 如果要多设备同步,还需要通过`ajax`提交到服务器

高频触发耗费性能的操作,会造成**性能浪费**

![image-20231103112157435](C:/Users/797799421/Desktop/笔记/前端/js/js原理-面试/assets/image-20231103112157435.png)

**适用场景****:**在触发频率高的事件中, 执行耗费性能操作 , 连续触发 , 单位时间内只有一次生效



**优化之前:** 每当触发事件就会执行业务逻辑

![image-20231103112319492](C:/Users/797799421/Desktop/笔记/前端/js/js原理-面试/assets/image-20231103112319492.png)

**优化之后:**触发事件之后延迟执行逻辑,在逻辑执行完毕之后无法再次触发

![image-20231103112334032](C:/Users/797799421/Desktop/笔记/前端/js/js原理-面试/assets/image-20231103112334032.png)





### 手写节流

使用节流将播放器记录时间的例子优化:

![image-20231103112334032](C:/Users/797799421/Desktop/笔记/前端/js/js原理-面试/assets/image-20231103112334032.png)![image-20231103112334032](C:/Users/797799421/Desktop/笔记/前端/js/js原理-面试/assets/image-20231103112334032.png)

**核心步骤**:

1.开启定时器,并保存 id

2.判断是否已开启定时器

3.定时器执行时 , id设置为空



```javascript
// 播放器案例优化之后代码
let timeId
video.addEventListener('timeupdate', function () {
  if (timeId !== undefined) {
    return
  }

  timeId = setTimeout(() => {
    console.log('timeupdate触发')
    localStorage.setItem('currentTime', this.currentTime)
    timeId = undefined
  }, 3000)

})
```

### lodash的throttle方法

实际开发中一般不需要手写节流,因为已经有库里面提供了对应的方法,可以直接调用,也可以自己手写实现`throttle`,一会咱们就从这两个方面进行讲解:

1. `lodash`工具库中的`throttle`方法(**常用**)
2. `throttle`的实现原理(**高频面试题**)



[传送门](https://www.lodashjs.com/docs/lodash.throttle)

```javascript
_.throttle(func, [wait=0], [options=])
```

#### 参数

1. `func` *(Function)*: 要节流的函数。
2. `[wait=0]` *(number)*: 需要节流的毫秒。
3. `[options=]` *(Object)*: 选项对象。
4. `[options.leading=true]` *(boolean)*: 指定调用在节流开始前。
5. `[options.trailing=true]` *(boolean)*: 指定调用在节流结束后。

#### 返回

*(Function)*: 返回节流的函数。



**注意:** 

1. 实际开发时一般会给3个参数即可,然后适用返回的函数替换原函数即可
	1. 参数3:`options.leading=true`默认为`true`,开始时触发节流函数,一般设置为`false`
2. 项目中如果有`lodash`那么直接使用它提供的`throttle`即可,不仅可以实现节流,原函数中的`this`和`参数`均可以正常使用

```javascript
// 播放器案例使用`lodash` 优化之后的结果如下
const func = function (e) {
  console.log('timeupdate触发')
  console.log('e:', e)
  localStorage.setItem('currentTime', this.currentTime)
}

const throttleFn = _.throttle(func, 1000, { leading: false })

video.addEventListener('timeupdate', throttleFn)
```



### 手写throttle方法



手写实现`throttle`函数,实现`lodash`中`throttle`方法的核心功能

**需求:**

1. 参数:
	1. `func` *(Function)*: 要节流的函数。
	2. `[wait=0]` *(number)*: 需要节流的毫秒。
2. 返回值:
	1. *(Function)*: 返回节流的函数



#### 核心步骤:

1. 返回节流的新函数

2. 原函数中的`this`可以正常使用

3. 原函数中的**参数**可以正常使用

```javascript
// 节流工具函数
function throttle(func, wait = 0) {
  let timeId
  return function (...args) {
    if (timeId !== undefined) {
      return
    }
    const _this = this
    timeId = setTimeout(() => {
      func.apply(_this, args)
      timeId = undefined
    }, wait)
  }
}
```































































