# JS原理课-DAY01

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
