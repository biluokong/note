### 一、前言：为什么会出现Promise?

Promise的重要性我认为没有必要多讲，概括起来说就是五个字：**必！须！得！掌！握！**。

而且还要掌握透彻，在实际的使用中，有非常多的应用场景我们不能立即知道应该如何继续往下执行。

最常见的一个场景就是ajax请求，通俗来说，由于网速的不同，可能你得到返回值的时间也是不同的，

这个时候我们就需要等待，结果出来了之后才知道怎么样继续下去。

~~~js
let xhr = new XMLHttpRequest();
xhr.open('get', 'https://v0.yiketianqi.com/api?unescape=1&version=v61&appid=82294778&appsecret=4PKVFula&city=%E5%8C%97%E4%BA%AC');
xhr.send();
xhr.onreadystatechange = function () {
    if (xhr.readyState === 4) {
        if (xhr.status >= 200 && xhr.status < 300) {
            console.log(xhr.responseText)
        }
    }
}
~~~

在ajax的原生实现中，利用了onreadystatechange事件，当该事件触发并且符合一定条件时，才能拿到想要的数

据，之后才能开始处理数据，这样做看上去并没有什么麻烦，但如果这个时候，我们还需要另外一个ajax请求，这

个新ajax请求的其中一个参数，得从上一个ajax请求中获取，这个时候我们就不得不等待上一个接口请求完成之

后，再请求后一个接口。

~~~js
let xhr = new XMLHttpRequest();
xhr.open('get', 'https://v0.yiketianqi.com/api?unescape=1&version=v61&appid=82294778&appsecret=4PKVFula&city=%E5%8C%97%E4%BA%AC');
xhr.send();
xhr.onreadystatechange = function () {
    if (xhr.readyState === 4) {
        if (xhr.status >= 200 && xhr.status < 300) {
            console.log(xhr.responseText)
            
            //伪代码....
            let xhr = new XMLHttpRequest();
            xhr.open('get','http://www.xx.com?a'+xhr.responseText);
            xhr.send();
            xhr.onreadystatechange = function(){
                if(xhr.readyState === 4){
                    if(xhr.status>=200 && xhr.status<300){
                        console.log(xhr.responseText)
                        
                    }
                }
            }
        }
    }
}
~~~

当出现第三个ajax(甚至更多)仍然依赖上一个请求时，我们的代码就变成了一场灾难。

这场灾难，往往也被称为**回调地狱**。

因此我们需要一个叫做Promise的东西，来解决这个问题，当然，除了回调地狱之外，还有个非常重要的需求就是

**为了代码更加具有可读性和可维护性，我们需要将数据请求与数据处理明确的区分开来**。

上面的写法，是完全没有区分开，当数据变得复杂时，也许我们自己都无法轻松维护自己的代码了。

这也是模块化过程中，必须要掌握的一个重要技能，请一定重视。

### 二、Promise是什么?

> Promise是异步编程的一种解决方案，比传统的解决方案回调函数更合理、更强大。
>
> ES6将其写进了语言标准，统一了用法，原生提供了Promise对象。
>
> 指定回调函数的方式也变得更加灵活易懂，也解决了异步`回调地狱`的问题
>
> 旧方案是单纯使用回调函数，常见的异步操作有：定时器、fs模块、ajax、数据库操作  
>
> 从语法上说，Promise是一个构造函数；
>
> 从功能上说，Promise对象用来封装一个异步操作并可以获取其成功/失败的结果值。

#### 2.1  Promise的初体验

创建promise对象（pending状态）

const p = new Promise(executor);

其中：

executor函数:  执行器  (resolve, reject) => {}

resolve函数: 内部定义成功时我们调用的函数 value => {}

reject函数: 内部定义失败时我们调用的函数 reason => {}

executor会在Promise内部立即同步调用,异步操作在执行器中执行

实例对象调用Promise原型中的then方法来完成对结果的处理

~~~js
<script>
    const p = new Promise((resolve, reject) => {
        //如果咱们公司今年挣钱了，年底就发奖金，否则不发
        resolve('ok');
    })
    console.log(p)
    p.then(() => {
        console.log('发奖金')
    }, () => {
        console.log('不发奖金')
    })
</script>
~~~

### 三、使用Promise的好处?

#### 3.1  指定回调函数的方式更加灵活

1. 旧的：必须在启动异步任务前指定

2. promise：启动异步任务->返回promise对象->给promise对象绑定回调函数

   (甚至可以在异步任务结束后指定/多个)

#### 3.2 可以解决回调地狱问题，支持链式调用

 1. 什么是回调地狱？

    回调函数嵌套调用，外部回调函数异步执行的结果是嵌套的回调执行的条件

   2. 回调地狱的缺点?

      不便于阅读

      不便于异常处理

   3. 解决方案？

      promise链式调用

4. 终极解决方案？

   async/await

### 四、Promise实例对象的两个属性

- PromiseState

  此属性为promise对象的状态属性。

  - fulfilled：成功的状态
  - rejected：失败的状态
  - pending：初始化的状态

  【注】状态只能由pending->fulfilled 或者是 pending->rejected

- PromiseResult

  此属性为promise对象的结果值（resolve以及reject函数的形参值）

### 五、resolve函数以及reject函数

- resolve：修改promise对象的状态，由pending修改到fulfilled；将实参设置到这个属性PromiseResult中。
- reject：修改promise对象的状态，由pending修改到rejected；将实参设置到这个属性PromiseResult中。

案例1：利用promise来进行读取文件操作

~~~js
//1.普通文件读取方式
const fs = require('fs');

//2.直接利用readfile来进行读取
/* fs.readFile(__dirname + '/data.txt',(err,data)=>{
    if(err) throw err;
    console.log(data.toString());
}) */

//3.利用promise来实现文件的读取
const p = new Promise((resolve, reject) => {
    fs.readFile(__dirname + '/data.txt', (err, data) => {
        if (err) {
            reject(err);
        }else{
            resolve(data);
        }
    })
}); 

p.then(value=>{
    console.log(value.toString());
},reason=>{
    console.log(reason);
})
~~~

案例2：利用promise进行ajax请求

~~~js
<body>
    <button>发送ajax请求</button>
    <script>
        //1.获取DOM元素对象
        let btn = document.querySelector('button');
        //2.绑定事件
        btn.onclick = function(){
            //3.创建promise实例对象
            const p = new Promise((resolve,reject)=>{
                //4.创建ajax实例对象
                const xhr = new XMLHttpRequest();
                //5.打开请求
                xhr.open('get','https://www.yiketianqi.com/free/day?appid=82294778&appsecret=4PKVFula&unescape=1');
                //6.发送请求
                xhr.send();
                //7.利用onreadystatechange事件
                xhr.onreadystatechange = function(){
                    //8.判断
                    if(xhr.readyState == 4){
                        if(xhr.status == 200){
                            resolve(xhr.responseText);
                        }else{
                            reject(xhr.response);
                        }
                    }
                }
            });
            p.then(value=>{
                console.log(JSON.parse(value));
            },reason=>{
                console.log('获取信息失败');
            })
        }
    </script>
</body>
~~~

案例3：利用promise进行数据库操作

~~~js
const mongoose = require('mongoose');

new Promise((resolve, reject) => {
    mongoose.connect('mongodb://127.0.0.1/project');
    mongoose.connection.on('open', ()=>{
        //连接成功的情况
        resolve();
    });

    mongoose.connection.on('error', () => {
        //连接失败的情况
        reject();
    })
}).then(value => {
    //创建结构
    const NoteSchema = new mongoose.Schema({
        title: String,
        content: String
    })
    //创建模型
    const NoteModel = mongoose.model('notes', NoteSchema);

    //读取操作
    NoteModel.find().then(value => {
        console.log(value);
    }, reason => {
        console.log(reason);
    })
}, reason => {
    console.log('连接失败');
})
~~~

案例4：封装一个函数，作用是读取文件

~~~js
const fs = require('fs');

function ReadFileFun(path){
    return new Promise((resolve,reject)=>{
         fs.readFile(path,(err,data)=>{
              //判断
              if(err){
                    reject(err)
              }else{
                    resolve(data);
              }
         })
    });
}

ReadFileFun('./data.txt').then(value=>{
    console.log(value.toString());
},reason=>{
    console.log(reason);
})
~~~

node中的promisify

- promisify  (只能在 NodeJS 环境中使用)
- promisify 是 util 模块中的一个方法  util 是 nodeJS 的内置模块
- 作用: 返回一个新的函数, 函数的是 promise 风格的.

~~~js
const util = require('util');
const fs = require('fs');
//通过 fs.readFile 创建一个新的函数
const mineReadFile = util.promisify(fs.readFile);

mineReadFile('./resource/2.html')
.then(value => {
    console.log(value.toString());
}, reason => {
    console.log(reason);
})
~~~

### 六、Promise对象的状态

Promise对象通过自身的状态来控制异步操作，Promise实例具有三种状态.

- 异步操作未完成：pending
- 异步操作成功：fulfilled
- 异步操作失败：rejected

这三种的状态的变化途径只有两种

- 从pending(未完成)到fulfilled(成功)
- 从pending(未成功)到rejected(失败)

一旦状态发生变化，就凝固了，不会再有新的状态变化，这也是Promise这个名字的由来，它的英语意思"承诺"，

一旦承诺生效，就不得再改变了，这也意味着Promise实例的状态变化只可能发生一次。

在Promise对象的构造函数中，将一个函数作为第一个参数。而这个函数，就是用来处理Promise的状态变化。

上面的resolve和reject都为一个函数，他们的作用分别是将状态修改为resolved和rejected。

因此，Promise的最终结果只有两种。

~~~js
异步操作成功，Promise实例传回一个值(value)，状态变为fulfilled.
异步操作失败，Promise实例抛出一个错误(error),状态变为rejected
~~~

### 七、Promise的then方法

then：指定用于得到成功value的成功回调和用于得到失败reason的失败回调，`返回一个新的promise对象`

- 成功的状态：执行第一个回调函数
- 失败的状态：执行第二个回调函数

promise.then()返回的新promise的结果状态由什么决定?

(1) 简单表达: 由then()指定的回调函数执行的结果决定

(2) 详细表达:

① 如果抛出异常, 新promise变为rejected, reason为抛出的异常

~~~js
const p = new Promise((resolve,reject)=>{
     resolve('ok');
});

let result = p.then(value=>{
	throw '错误';
},reason=>{
	console.log(reason);
});

console.log(result);
~~~

② 如果返回的是非promise的任意值, 新promise变为fulfilled, PromiseResult为返回的值

~~~js
const p = new Promise((resolve,reject)=>{
                resolve('ok');
});

let result = p.then(value=>{
	return 100;
},reason=>{
	console.log(reason);
});

console.log(result);
~~~

③ 如果返回的是另一个新promise, 此promise的结果就会成为新promise的结果 

~~~js
const p = new Promise((resolve,reject)=>{
                resolve('ok');
});

let result = p.then(value=>{
	return new Promise((resolve,reject)=>{
		//resolve('111');
        reject('error');
	})
},reason=>{
	console.log(reason);
});

console.log(result);
~~~

### 八、Promise的链式调用

~~~js
const p = new Promise((resolve,reject)=>{
	//resolve('ok');
    reject('error');
});

p.then(value=>{
	console.log(value);
},reason=>{
	console.log(reason);
}).then(value=>{
	console.log(value);
},reason=>{
	console.log(reason);
})
~~~

案例：通过promise的链式调用来读取文件

回调地狱的方式：

~~~js
const fs = require('fs');
fs.readFile('./resource/1.html',(err,data1)=>{
    if(err) throw err;
    fs.readFile('./resource/1.html',(err,data2)=>{
    	if(err) throw err;
        fs.readFile('./resource/1.html',(err,data3)=>{
    		if(err) throw err;
            console.log(data1 + data2 + data3);
		})
	})
})
~~~

Promise的形式：

需求：读取resource下三个文件内容，并在控制台合并输出

~~~js
new Promise((resolve,reject)=>{
	fs.readFile('./resource/1.html',(err,data)=>{
		 //如果失败 则修改promise对象状态为失败
        if(err) reject(err);
        //如果成功 则修改promise对象状态为成功
        resolve(data);
	})
}).then(value=>{
    return new Promise((resolve,reject)=>{
        fs.readFile('./resource/2.html',(err,data)=>{
             //失败
            if(err) reject(err);
            //成功
            resolve([value,data]);
        })
	})
}).then(value=>{
    return new Promise((resolve,reject)=>{
        fs.readFile('./resource/3.html',(err,data)=>{
             //失败
            if(err) reject(err);
            value.push(data);
            //成功
            resolve(value);
        })
	})
}).then(value=>{
    console.log(value.join(""));
})
~~~

### 九、Promise下的几种方法

#### 9.1 Promise.resolve()

将一个普通值转化为promise类型的数据

- 若参数为非promise对象，则返回的结果为成功状态的promise对象

~~~js
let p1 = Promise.resolve(123);
console.log(p1);
let p2 = Promise.resolve(undefined);
console.log(p2);
~~~

- 若参数为promise对象，参数的状态决定返回结果的状态

~~~js
let p3 = Promise.resolve(new Promise((resolve,reject)=>{
	resolve('success');
}));
console.log(p3);

let p4 = Promise.resolve(Promise.resolve(Promise.resolve("OK")));
console.log(p4);
~~~

#### 9.2 Promise.reject()

返回的结果`始终为失败的Promise对象`

~~~js
console.log(Promise.reject(123));
console.log(Promise.reject(Promise.resolve('ok')));
~~~

#### 9.3 Promise.catch()

功能是用来指定失败的回调函数

~~~js
let p = new Promise((resolve,reject)=>{
	//resolve('success');
    reject('error');
});

p.catch(reason=>{
    console.log(reason);
});

//then方法中不是必须传入两个参数，可以只传递成功时的回调函数
//也可以单独使用catch来指定失败的回调函数

//异常（错误）穿透
//当如果有多个需要执行的成功时的回调函数，可以不需要每一次都写失败回调，可以统一最后利用catch
//当如果promise对象的状态为reject的话，会一直向下穿透直到catch方法
p.then(value=>{
    console.log(value);
}).then(value=>{
    console.log(value);
}).catch(reason=>{
    console.log(reason);
})
~~~

#### 9.4 Promise.all()

作用：针对于多个Promise的异步任务进行处理

接收的参数：promise数组

返回值：promise对象，状态由`promise数组中的对象状态`决定

- 若每个对象状态`都为`成功，则返回的promise对象状态为成功，

​		 成功的结果值为`每个promise对象成功结构值组成的数组`

-  若`其中一个对象`状态为失败，则返回的promise对象状态为失败，

​	    失败的结果值为`失败的promise对象的结果值`

~~~js
let p1 = new Promise((resolve, reject) => {
            resolve('ok');
})
let p2 = Promise.resolve('hello');
let p3 = Promise.resolve('oh yeah');
let result = Promise.all([p1, p2, p3])
console.log(result);
~~~

当有一个ajax请求，它的参数需要另外2个甚至更多请求都有返回结果之后才能确定，

那么这个时候，就需要用到Promise.all来帮助我们应对这个场景。

Promise.all接收一个Promise对象组成的数组作为参数，

当这个数组所有的Promise对象状态都变成resolved或者rejected的时候，它才会去调用then方法。

~~~js
//ES6中对Promise.all()的理解以及应用场景
//用于将多个Promise实例，包装成一个新的Promise实例
let p1 = new Promise((resolve,reject)=>{
   resolve('成功01');
})
let p2 = new Promise((resolve,reject)=>{
	resolve('成功02');
}).catch(reason=>console.log(reason));
let p3 = new Promise((resolve,reject)=>{
	resolve('成功03');
})
//参数可以不是数组，但必须是iterator接口
let pAll = Promise.all([p1,p2,p3]);
console.log(pAll)
//pAll的状态是由p1,p2,p3来决定，只有当这三个都为成功，pAll才会为成功,反之，但凡其中一个失败结果就是失败
//这个时候第一个失败的实力的返回值会传递给pAll的回调函数，如果作为参数的实例，自己定义了catch方法，那么它一旦为rejected，是不会触碰到pAll中的catch方法
pAll.then(value=>{
	console.log(value);
},reason=>{
	console.log(reason);
})
~~~

案例1：模拟请求三个接口中的数据，全部请求成功后获取。

~~~js
function getUsersList() {
    return new Promise((resolve, reject) => {
        //模拟请求用户列表数据
        setTimeout(() => {
            resolve('用户列表的数据');
        }, 1000);
    })
}
function getBannersList() {
    return new Promise((resolve, reject) => {
        //模拟请求用户列表数据
        setTimeout(() => {
            resolve('轮播图的数据');
        }, 2000);
    })
}
function getVideoList() {
    return new Promise((resolve, reject) => {
        //模拟请求用户列表数据
        setTimeout(() => {
            resolve('视频列表的数据');
        }, 3000);
    })
}
//初始加载的时候
function initLoad() {
    let all = Promise.all([getUsersList(), getBannersList(), getVideoList()]);
    //获取成功请求的结果值
    all.then(value => {
        console.log(value);
    })
}
initLoad();
~~~

案例2：修改多文件读取代码

~~~js
const fs = require('fs');
const util = require('util');
const mywriteFile = util.promisify(fs.readFile);
let one = mywriteFile('./resource/1.html');
let two = mywriteFile('./resource/2.html');
let three = mywriteFile('./resource/3.html');
let result = Promise.all([one,two,three]);
result.then(value=>{
    console.log(value.join(''));
},reason=>{
    console.log(reason);
})
~~~

#### 9.5 Promise.race()

Promise.race  race 赛跑的意思

参数: promise 数组

返回结果: promise 对象

状态由『最先改变状态的 promise对象』决定 

结果值由 『最先改变状态的 promise对象』决定

~~~js
let p1 = new Promise((resolve, reject) => {
            setTimeout(() => {
                resolve('ok');
            }, 2000)
});
let p2 = Promise.resolve('success');
let p3 = Promise.resolve('oh hou');
let result = Promise.race([p1, p2, p3]);
console.log(result);
~~~

与Promise.all相似的是，Promise.race都是以一个Promise对象组成的数组作为参数。

不同的是，只要当数组中的其中一个Promsie状态变成resolved或者rejected时，就可以调用.then方法了。

而传递给then方法的值也会有所不同。

~~~js
<script>
    //ES6中Promise.race的用法以及使用场景
    //将多个Promise实例包装成一个新的Promise实例
    let p1 = new Promise((resolve, rejct) => {
        setTimeout(() => {
            resolve('p1成功')
        }, 2000);
    })
    let p2 = new Promise((resolve, rejct) => {
        setTimeout(() => {
            resolve('p2成功');
        }, 1000);
    }, 1000);
    //调用
    const prace = Promise.race([p1, p2]);
    //Promise.race区别于Promise.all：
    //只要是实例中有一个先改变状态，就会把这个实例的返回值传递给prace的回调函数
</script>
~~~

~~~js
//使用场景：请求超时提示
function request() {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            resolve('请求成功');
        }, 4000);
    })
}
function timeout() {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            reject('网络不畅,请求超时');
        }, 3000);
    });
}
Promise.race([request(), timeout()]).then(value => {
    console.log(value)
}).catch(reason => {
    console.log(reason)
})
~~~

#### 9.6 Promise.allSettled()

Promise.allSettled()方法，用来确定要一组异步操作是否都结束了(不管成功或失败)。

所以，它的名字叫"Settled"，包含了"fufilled"和"rejected"两种情况.

~~~js
<script>
    function ajax(url) {
    return new Promise((resolve, reject) => {
        let xhr = new XMLHttpRequest();
        xhr.open('get', url, true);
        xhr.send();
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4) {
                if (xhr.status >= 200 && xhr.status < 300) {
                    resolve(xhr.responseText);
                } else {
                    reject(xhr.responseText);
                }
            }
        }
    })

}
//类比Promise下的all方法和allSettled
// Promise.all([ajax('http://www.xiongmaoyouxuan.com/api/tabs'),
// ajax('https://m.maizuo.com/gateway?cityId=110100&k=4770248')
// ]).then(value => {
//     console.log(value)
// }).catch(error => {
//     console.log(error);
// })

Promise.allSettled([ajax('http://www.xiongmaoyouxuan.com/api/tabs'),
                    ajax('https://m.maizuo.com/gateway?cityId=110100&k=4770248')
                   ]).then(value => {
    // console.log(value)
    let successList = value.filter(item => item.status === 'fulfilled');
    console.log(successList)

    let errorList = value.filter(item => item.status === 'rejected');
    console.log(errorList)
}).catch(error => {
    console.log(error);
})
</script>
~~~

#### 9.7 Promise.any()

只要参数实例有一个变成fulfilled状态，包装实例就会变成fulfiilled状态；

如果所有参数实例都变成rejected，包装实例就会变成rejected状态。

> Promise.any()跟Promise.race()方法很像，但是有一点不同，
>
> 就是Promise.any()不会因为某个Promise变成rejected状态而结束，
>
> 必须等到所有参数Promise变成rejected状态才会结束。

~~~js
<script>
    let p1 = new Promise((resolve, reject) => {
        setTimeout(() => {
            resolve('ok');
        }, 1000)
    })
    let p2 = new Promise((resolve, reject) => {
        setTimeout(() => {
            resolve('okk');
        }, 2000)
    })
    let p3 = new Promise((resolve, reject) => {
        setTimeout(() => {
            reject('error');
        }, 3000)
    })
    Promise.any([p1, p2, p3]).then(res => {
        console.log(res)
    }).catch(err => {
        console.log('error')
    })
</script>
~~~

#### 9.8 Promise.finally()

finally是在ES9(ES2018)中新增的一个特性：表示无论Promise对象变成fufilled还是rejected状态，最终都会被执行。

finally方法中的`回调函数`是不接受参数的，因为无论前面是fulfilled状态还是rejected状态， 它都是执行。

~~~js
const p = new Promise((resolve, reject) => {
    // resolve('ok');
    reject('error');
});
p.then(res => {
    console.log(res);
}).catch(err => {
    console.log(err);
}).finally(() => {
    console.log('finally')
})
~~~

### 十、终止Promise链条

~~~js
new Promise((resolve, reject) => {
    resolve(111);
}).then(value=>{
    console.log(value);
    console.log(222);
    //
    // return false;
    // throw '出错啦';
    //有且只有一种方式 返回一个pending状态的promise对象
    return new Promise((resolve, reject) => {});
}).then(value => {
    console.log(333);
}).then(value => {
    console.log(444);
}).catch(reason => {
    console.log(reason);
});
~~~

### 十一、几个关键问题

#### 11.1 如何修改 promise 对象状态

~~~js
<script>
    //如何修改 promise 对象状态
    let p = new Promise((resolve, reject) => {
        //1. resolve
        // resolve('success');
        //2. reject
        // reject('error');
        //3. 抛出错误 异常
        // throw '出问题啦! 你说出这样的话  你没有良心!!';
        // 状态的改变只有一次 
        resolve('ok');
        reject('error');
    });
	console.log(p);
</script>
~~~

#### 11.2 指定多个回调执行情况

问题：一个promise指定多个成功/失败回调函数，都会调用吗？

答：会，但是前提是当promise对象的状态改变(fulfilled/rejected)时才会调用

~~~js
<script>
        let p = new Promise((resolve, reject) => {
            //promise对象是可以多次调用then方法完成多个成功/失败回调函数
            //但是使用的前提是这个promise对象的状态必须要么是fulfilled或者是rejected
            //不能是pending
            resolve('OK');
        });	
		
        //第一次指定回调
        p.then(value => {
            console.log(value);
        }, reason => {
            console.error(reason);
        });

        p.then(value => {
            alert(value);
        }, reason => {
            alert(reason);
        })
</script>
~~~

#### 11.3 指定回调与改变状态先后顺序问题

改变promise状态和指定回调函数执行谁先谁后？

- 都有可能，正常情况下是先指定回调再改变状态，但也可以先改变状态在指定回调

  ~~~js
  //若执行器函数中是异步任务, 则先指定回调, 然后再改变状态  更为常见
  //若执行器函数中是同步任务, 则先改变状态, 然后再指定回调
  let p = new Promise((resolve, reject) => {
      //同步任务
      //resolve('ok');
      //异步任务
      setTimeout(() => {
          resolve('ok');
      }, 1000);
  });
  ~~~

- 如何先改状态再指定回调？

  - 在执行器中直接调用resolve()/reject()

  ~~~js
  let p = new Promise((resolve, reject) => {
  	//resolve('ok');
  	reject('error');
  });
  ~~~

  - 延迟更长时间才调用then()

  ~~~js
  const p = new Promise((resolve, reject) => {
      setTimeout(() => {
          resolve('ok');
      }, 1000)
  
  })
  //then方法使用定时器延迟更久的时间
  setTimeout(() => {
      p.then(value => {
          console.log(value);
      }, reason => {
          console.log(reason);
      })
  
  }, 3000)
  ~~~

- 什么时候才能得到数据？

  - 如果是先指定的回调，那当状态发生改变时，回调函数就会调用，得到数据
  - 如果先改变的状态，那当指定回调时，回调函数就会调用，得到数据

#### 11.4 promise.then()返回的新promise的结果状态由什么决定？

- 简单表达：由then指定的回调函数执行的结果决定
- 详细表达：
  - 如果抛出异常：新promise对象状态变成rejected，reason为抛出的异常
  - 如果返回的是是非promise的任意值，新promise对象状态变成fulfilled，value为返回的值
  - 如果返回的是另一个新的promise对象，此promise的结果就会称为新promise的结果

~~~js
const p = new Promise((resolve, reject) => {
    resolve('ok');
})
let result = p.then(value => {
    //return value;
    return new Promise((resolve, reject) => {
        resolve('okk');
    })
}, reason => {
    console.log(reason);
})
console.log(result);
~~~

#### 11.5 promise如何串联多个操作任务?

- promise的then()返回一个新的promise对象，可以写成then()方法的链式调用
- 通过then()的链式调用串联多个同步/异步任务

~~~js
<script>
    new Promise((resolve, reject) => {
            console.log(111);
            reject();
    }).then(value => {
            console.log(222);
    }).then(value=> {
            console.log(value);
    }).then(value => {
            console.log(value)
    }, reason => {
            console.error(reason);
    });
</script>
~~~

#### 11.6 promise的异常穿透

- 当使用promise的then链式调用时, 可以在最后指定失败的回调,
- 前面任何操作出了异常, 都会传到最后失败的回调中处理

~~~js
new Promise((resolve, reject) => {
    console.log(111);
    reject('error');
}).then(value => {
    console.log(222);
}).then(value => {
    console.log(value);
}).then(value => {
    console.log(value)
}).catch(reason => {
    console.log(reason);
})
~~~

#### 11.7 中断promise链

- 当使用promise的then链式调用时, 在中间中断, 不再调用后面的回调函数
- 办法: 在回调函数中返回一个pending状态的promise对象

~~~js
new Promise((resolve, reject) => {
    console.log(111);
    resolve('ok');
}).then(value => {
    console.log(222);
}).then(value => {
    console.log(value);
    return new Promise(() => { })
}).then(value => {
    console.log(value)
}, reason => {
    console.error(reason);
});
~~~

### 十二、async和await

async/await 是ES7提出的基于Promise的解决异步的最终方案。

#### 12.1  async函数

async是一个加在函数前的修饰符，被async定义的函数会默认返回一个Promise对象resolve的值。

因此对async函数可以直接then，返回值就是then方法传入的函数。

~~~js
// async基础语法
async function fun0(){
    console.log(1);
    return 1;
}
fun0().then(val=>{
    console.log(val) // 1,1
})

async function fun1(){
    console.log('Promise');
    return new Promise(function(resolve,reject){
        resolve('Promise')
    })
}
fun1().then(val => {
    console.log(val); // Promise Promise
}
~~~

~~~js
//声明一个async函数
async function main() {
    console.log('async function');
    //情况1：返回非promise对象数据
    return 'hahaha';
    //情况2：返回是promise对象数据
    /* return new Promise((resolve, reject) => {
		// resolve('ok');
		reject('error');
	}) */
    //情况3：抛出异常
    // throw new Error('出错啦!!!');
}
let result = main().then(value => {
    console.log(value);
});
console.log(result);
~~~

#### 12.2  await表达式

await 也是一个修饰符，只能放在async定义的函数内。可以理解为**等待**。

await 修饰的如果是Promise对象，可以获取Promise中返回的内容（resolve或reject的参数），且取到值后语

句才会往下执行；如果不是Promise对象：把这个非promise的东西当做await表达式的结果。

注意事项
- await必须写在async函数中，但是async函数中可以没有await
- 如果await的promise失败了，就会抛出异常，需要通过try...catch捕获处理

~~~js
async function fun(){
    let a = await 1;
    let b = await new Promise((resolve,reject)=>{
        setTimeout(function(){
            resolve('setTimeout')
        },3000)
    })
    let c = await function(){
        return 'function'
    }()
    console.log(a,b,c)
}
fun(); // 3秒后输出： 1 "setTimeout" "function"
~~~

~~~js
function log(time){
    setTimeout(function(){
        console.log(time);
        return 1;
    },time)
}
async function fun(){
    let a = await log(1000);
    let b = await log(3000);
    let c = log(2000);
    console.log(a);
    console.log(1)
}
fun(); 
// 立即输出 undefined 1
// 1秒后输出 1000
// 2秒后输出 2000
// 3秒后输出 3000
~~~

~~~js
async function main() {
    //1、如果await右侧为非promise类型数据
    var rs = await 10;
    var rs = await 1 + 1;
    var rs = await "非常6+7";

    //2、如果await右侧为promise成功类型数据
    var rs = await new Promise((resolve, reject) => {
        resolve('success');
    })

    //3、如果await右侧为promise失败类型数据,需要借助于try...catch捕获
    try {
        var rs = await new Promise((resolve, reject) => {
            reject('error');
        })
        } catch (e) {
            console.log(e);
        }
}
main();
~~~

~~~js
// 使用async/await获取成功的结果

// 定义一个异步函数，3秒后才能获取到值(类似操作数据库)
function getSomeThing(){
    return new Promise((resolve,reject)=>{
        setTimeout(()=>{
            resolve('获取成功')
        },3000)
    })
}

async function test(){
    let a = await getSomeThing();
    console.log(a)
}
test(); // 3秒后输出：获取成功
~~~

案例：async结合await读取文件内容

~~~js
//1、导包
const fs = require('fs');
const {promisify} = require('util');
//2、将fs.readFile转化成promise风格的函数
const myreadfile = promisify(fs.readFile);
//3、声明async函数
async function main(){
    try{
        //4、读取文件
        let one = await myreadfile('./resource/4.html');
        let two = await myreadfile('./resource/2.html');
        let three = await myreadfile('./resource/3.html');
    //5、拼接读取文件内容
    console.log(one + two + three);
    }catch(e){
        console.log(e);
    }
}
//6、调用main函数
main();
~~~

### 十三、JS中的宏队列与微队列

- 说明
  - JS中用来存储待执行回调函数的队列包含2个不同特定的列队
  - 宏列队: 用来保存待执行的宏任务(回调), 比如: 定时器回调/DOM事件回调/ajax回调
  - 微列队: 用来保存待执行的微任务(回调), 比如: promise的回调/MutationObserver的回调
  - JS执行时会区别这2个队列
    - JS引擎首先必须先执行所有的初始化同步任务代码
    - 每次准备取出第一个宏任务执行前, 都要将所有的微任务一个一个取出来执行

~~~js
setTimeout(() => {
    console.log(111);
});

new Promise((resolve, reject) => {
    resolve();
    //return ;throw
    reject();
    console.log(222);
}).then(v => {
    console.log(333);
})
console.log(444);
~~~

### 十四、Promise常见面试题

~~~js
setTimeout(() => {
    console.log(1)
}, 0)
Promise.resolve().then(() => {
    console.log(2)
})
Promise.resolve().then(() => {
    console.log(4)
})
console.log(3)
~~~

~~~js
setTimeout(() => {
    console.log(1)
}, 0)
new Promise((resolve) => {
    console.log(2)
    resolve()
}).then(() => {
    console.log(3)
}).then(() => {
    console.log(4)
})
console.log(5)
~~~

~~~js
const first = () => (new Promise((resolve, reject) => {
    console.log(3)
    let p = new Promise((resolve, reject) => {
        console.log(7)
        setTimeout(() => {
            console.log(5)
            resolve(6)
        }, 0)
        resolve(1)
    })
    resolve(2)
    p.then((arg) => {
        console.log(arg)
    })

}))
first().then((arg) => {
    console.log(arg)
})
console.log(4)
~~~

~~~js
setTimeout(() => {
    console.log("0")
}, 0)
new Promise((resolve, reject) => {
    console.log("1")
    resolve()
}).then(() => {
    console.log("2")
    new Promise((resolve, reject) => {
        console.log("3")
        resolve()
    }).then(() => {
        console.log("4")
    }).then(() => {
        console.log("5")
    })
}).then(() => {
    console.log("6");
})

new Promise((resolve, reject) => {
    console.log("7")
    resolve()
}).then(() => {
    console.log("8")
});
~~~

### 十五、手写promise自定义基础结构的搭建

#### 15.1   Promise 的基本结构

~~~js
/**
 * 1- Promise 是一个构造函数
 * 2- Promise 接收一个参数，该参数的类型是函数（执行器函数executor）
 * 3- executor接收两个参数（resolve,reject）,参数的类型是函数
 * 4- 执行器函数会同步执行。
 * 5- then方法在其显式原型属性上
 */

// 立即调用函数的好处：可以避免对外部的变量造成污染。
(function(window){
    // executor是执行器函数
    function Promise(executor){
        executor(function(){

        },function(){

        });
    }
    window.Promise = Promise;
})(window);
~~~

~~~js
new Promise((resolve, reject)=>{
    console.log("这是我的执行器函数",resolve,reject)
})
console.log("over",Promise);
~~~

#### 15.2  Promise实例拥有两个实例属性

~~~js
/*
 * 1- Promise实例拥有两个实例属性：
 * 状态（[[PromiseState]]），初始状态为pending
 * 值（[[PromiseResult]]）,初始值为undefined
*/ 
~~~

~~~js
// 立即调用函数的好处：可以避免对外部的变量造成污染。
(function(window){
	// executor是执行器函数
	function Promise(executor){
		// 定义实例属性state,初始值为pending
		this.state = "pending";
		// 定义实例属性result,初始值为undefined
		this.result = undefined;
		executor(function(){
		
		},function(){
		
		});
	}
	window.Promise = Promise;
})(window);
~~~

~~~js
const p1 = new Promise((resolve, reject)=>{
	console.log("这是我的执行器函数",resolve,reject)
})
console.log(p1);
~~~

#### 15.3 更改状态三种方式-方法未抽离

~~~js
/*
 * 更改状态三种方式
 * 1- 通过调用resolve将状态更改为成功（fulfilled），接收的值为成功值
 * 2- 通过调用reject将状态更改为失败(rejected)，接收的值为失败值
 * 3- 抛出异常将状态更改为失败(rejected)，失败的值为异常信息。
*/
~~~

~~~js
// 立即调用函数的好处：可以避免对外部的变量造成污染。
(function(window){
	// executor是执行器函数
	function Promise(executor){
		// 定义实例属性state,初始值为pending
		this.state = "pending";
		// 定义实例属性result,初始值为undefined
		this.result = undefined;
		try{
			executor(function(value){
				// 将状态更改为成功(fulfilled)
				this.state = "fulfilled";
				// 成功值为value
				this.result = value;
			}.bind(this),function(value){
				// 将状态更改为失败
				this.state = "rejected";
				// 将result设置为value
				this.result = value;
			}.bind(this));
		}catch (err){
			// 将状态更改为失败
			this.state = "rejected";
			// 将异常信息作为失败值
			this.result = err;
		}
		
	}
	window.Promise = Promise;
})(window);
~~~

~~~js
const p1 = new Promise((resolve, reject)=>{
    // resolve(1);
    // reject(2);
    throw "异常"
})
console.log(p1);
~~~

#### 15.4  更改状态三种方式-抽离为普通函数

~~~js
// 立即调用函数的好处：可以避免对外部的变量造成污染。
(function(window){
	// executor是执行器函数
	function Promise(executor){
		// 定义实例属性state,初始值为pending
		this.state = "pending";
		// 定义实例属性result,初始值为undefined
		this.result = undefined;
		// 定义resolve函数
		const _resolve = function(value){
			// 将状态更改为成功(fulfilled)
			this.state = "fulfilled";
			// 成功值为value
			this.result = value;
		}.bind(this)
		// 定义reject函数
		const _reject = function(value){
			// 将状态更改为失败
			this.state = "rejected";
			// 将result设置为value
			this.result = value;
		}.bind(this)
		try{
			executor(_resolve,_reject);
		}catch (err){
			// 将状态更改为失败
			this.state = "rejected";
			// 将异常信息作为失败值
			this.result = err;
		}
	}
	window.Promise = Promise;
})(window);
~~~

~~~js
const p1 = new Promise((resolve, reject)=>{
    // resolve(1);
    reject(2);
    // throw "异常"
})
console.log(p1);
~~~

#### 15.5   更改状态三种方式-抽离为箭头函数

~~~js
// 立即调用函数的好处：可以避免对外部的变量造成污染。
(function(window){
	// executor是执行器函数
	function Promise(executor){
		// 定义实例属性state,初始值为pending
		this.state = "pending";
		// 定义实例属性result,初始值为undefined
		this.result = undefined;
		// 定义resolve函数
		const _resolve = value=>{
			// 将状态更改为成功(fulfilled)
			this.state = "fulfilled";
			// 成功值为value
			this.result = value;
		}
		// 定义reject函数
		const _reject = value=>{
			// 将状态更改为失败
			this.state = "rejected";
			// 将result设置为value
			this.result = value;
		}
		try{
			executor(_resolve,_reject);
		}catch (err){
			// 将状态更改为失败
			this.state = "rejected";
			// 将异常信息作为失败值
			this.result = err;
		}
		
	}
	window.Promise = Promise;
})(window);
~~~

~~~js
const p1 = new Promise((resolve, reject)=>{
    // resolve(1);
    // reject(2);
    throw "异常"
})
console.log(p1);
~~~

#### 15.6   状态只允许更改一次

~~~js
/*
 * pending-> fulfilled
 * pending-> rejected
 * 改变状态只有这两种，且一个promise对象只能改变一次，，无论变成成功还是失败，都会有一个结果值
 * 成功的结果数据一般称为value，失败的结果值一般称为reason
*/
~~~

~~~js
// 立即调用函数的好处：可以避免对外部的变量造成污染。
(function(window){
	// executor是执行器函数
	function Promise(executor){
		// 定义实例属性state,初始值为pending
		this.state = "pending";
		// 定义实例属性result,初始值为undefined
		this.result = undefined;
		// 定义resolve函数
		const _resolve = value=>{
			// 当状态已经被更改过，不允许再次更改
			if(this.state !== "pending") return;
			// 将状态更改为成功(fulfilled)
			this.state = "fulfilled";
			// 成功值为value
			this.result = value;
		}
		// 定义reject函数
		const _reject = value=>{
			// 当状态已经被更改过，不允许再次更改
			if(this.state !== "pending") return;
			// 将状态更改为失败
			this.state = "rejected";
			// 将result设置为value
			this.result = value;
		}
		try{
			executor(_resolve,_reject);
		}catch (err){
			_reject(err);// 状态更改为失败，值为异常信息
		}
		
	}
	window.Promise = Promise;
})(window);
~~~

~~~js
const p1 = new Promise((resolve, reject)=>{
    resolve(1);
    reject(2);
    throw "异常"
})
console.log(p1);
~~~

#### 15.7  then函数调用成功或失败回调函数

~~~js
/*
 * 1- then是Promise中的原型方法
 * 2- then函数接收两个参数（成功回调，失败回调）
 * 3- 如果p1状态为成功执行成功回调，失败执行失败回调。
*/
~~~

~~~js
// 立即调用函数的好处：可以避免对外部的变量造成污染。
(function(window){
	// executor是执行器函数
	function Promise(executor){
		// 定义实例属性state,初始值为pending
		this.state = "pending";
		// 定义实例属性result,初始值为undefined
		this.result = undefined;
		// 定义resolve函数
		const _resolve = value=>{
			// 当状态已经被更改过，不允许再次更改
			if(this.state !== "pending") return;
			// 将状态更改为成功(fulfilled)
			this.state = "fulfilled";
			// 成功值为value
			this.result = value;
		}
		// 定义reject函数
		const _reject = value=>{
			// 当状态已经被更改过，不允许再次更改
			if(this.state !== "pending") return;
			// 将状态更改为失败
			this.state = "rejected";
			// 将result设置为value
			this.result = value;
		}
		try{
			executor(_resolve,_reject);
		}catch (err){
			_reject(err);// 状态更改为失败，值为异常信息
		}
		
	}

	Object.assign(Promise.prototype,{
		// onResolved:成功回调
		// onRejected:失败回调
		then(onResolved,onRejected){
			// 状态成功调用onResolved
			if(this.state === "fulfilled"){
				onResolved(this.result);
			}else if(this.state === "rejected"){
				onRejected(this.result);
			}
		},
		catch(){
		
		}
	})
	window.Promise = Promise;
})(window);
~~~

#### 15.8  then函数中的回调函数是异步调用的

~~~js
// 立即调用函数的好处：可以避免对外部的变量造成污染。
(function(window){
	// executor是执行器函数
	function Promise(executor){
		// 定义实例属性state,初始值为pending
		this.state = "pending";
		// 定义实例属性result,初始值为undefined
		this.result = undefined;
		// 定义resolve函数
		const _resolve = value=>{
			// 当状态已经被更改过，不允许再次更改
			if(this.state !== "pending") return;
			// 将状态更改为成功(fulfilled)
			this.state = "fulfilled";
			// 成功值为value
			this.result = value;
		}
		// 定义reject函数
		const _reject = value=>{
			// 当状态已经被更改过，不允许再次更改
			if(this.state !== "pending") return;
			// 将状态更改为失败
			this.state = "rejected";
			// 将result设置为value
			this.result = value;
		}
		try{
			executor(_resolve,_reject);
		}catch (err){
			_reject(err);// 状态更改为失败，值为异常信息
		}
		
	}

	Object.assign(Promise.prototype,{
		// onResolved:成功回调
		// onRejected:失败回调
		then(onResolved,onRejected){
			// 状态成功调用onResolved
			if(this.state === "fulfilled"){
				// 异步调用
				setTimeout(()=>{
					onResolved(this.result);
				})
				
			}else if(this.state === "rejected"){
				// 异步调用
				setTimeout(()=>{
					onRejected(this.result);
				})
			}
		},
		catch(){
		
		}
	})
	window.Promise = Promise;
})(window);
~~~

~~~js
const p1 = new Promise((resolve, reject)=>{
    // resolve(1);
    // reject(2);
    throw "异常"
})
p1.then(value=>{
    console.log("成功回调",value);
},reason=>{
    console.log("失败回调",reason);
})
console.log("over");
~~~

#### 15.9  then函数返回的是一个Promise实例

~~~js
// 立即调用函数的好处：可以避免对外部的变量造成污染。
(function(window){
	// executor是执行器函数
	function Promise(executor){
		// 定义实例属性state,初始值为pending
		this.state = "pending";
		// 定义实例属性result,初始值为undefined
		this.result = undefined;
		// 定义resolve函数
		const _resolve = value=>{
			// 当状态已经被更改过，不允许再次更改
			if(this.state !== "pending") return;
			// 将状态更改为成功(fulfilled)
			this.state = "fulfilled";
			// 成功值为value
			this.result = value;
		}
		// 定义reject函数
		const _reject = value=>{
			// 当状态已经被更改过，不允许再次更改
			if(this.state !== "pending") return;
			// 将状态更改为失败
			this.state = "rejected";
			// 将result设置为value
			this.result = value;
		}
		try{
			executor(_resolve,_reject);
		}catch (err){
			_reject(err);// 状态更改为失败，值为异常信息
		}
		
	}

	Object.assign(Promise.prototype,{
		// onResolved:成功回调
		// onRejected:失败回调
		then(onResolved,onRejected){
			return new Promise((resolve,reject)=>{
				// 状态成功调用onResolved
				if(this.state === "fulfilled"){
					// 异步调用
					setTimeout(()=>{
						onResolved(this.result);
					})
					
				}else if(this.state === "rejected"){
					// 异步调用
					setTimeout(()=>{
						onRejected(this.result);
					})
				}
			})
			
		},
		catch(){
		
		}
	})
	window.Promise = Promise;
})(window);
~~~

~~~~js
const p1 = new Promise((resolve, reject)=>{
    // resolve(1);
    // reject(2);
    throw "异常"
})
const p2 = p1.then(value=>{
    console.log("成功回调",value);
},reason=>{
    console.log("失败回调",reason);
})
console.log(p2);
~~~~

#### 15.10  then函数返回的Promise实例状态以及值-未优化

~~~js
/*
 * then返回的Promise实例受成功或失败回调函数返回值的影响
 * 1- 如果返回的是非Promise,那么p2状态为成功，值为返回值
 * 2- 如果返回的是Promise,那么p2状态以及值与返回的状态，值相同。
 * 3- 如果出现异常，那么p2状态为失败，值为异常信息。
*/
~~~

~~~js
// 立即调用函数的好处：可以避免对外部的变量造成污染。
(function(window){
	// executor是执行器函数
	function Promise(executor){
		// 定义实例属性state,初始值为pending
		this.state = "pending";
		// 定义实例属性result,初始值为undefined
		this.result = undefined;
		// 定义resolve函数
		const _resolve = value=>{
			// 当状态已经被更改过，不允许再次更改
			if(this.state !== "pending") return;
			// 将状态更改为成功(fulfilled)
			this.state = "fulfilled";
			// 成功值为value
			this.result = value;
		}
		// 定义reject函数
		const _reject = value=>{
			// 当状态已经被更改过，不允许再次更改
			if(this.state !== "pending") return;
			// 将状态更改为失败
			this.state = "rejected";
			// 将result设置为value
			this.result = value;
		}
		try{
			executor(_resolve,_reject);
		}catch (err){
			_reject(err);// 状态更改为失败，值为异常信息
		}
		
	}

	Object.assign(Promise.prototype,{
		// onResolved:成功回调
		// onRejected:失败回调
		then(onResolved,onRejected){
			return new Promise((resolve,reject)=>{
				// 状态成功调用onResolved
				if(this.state === "fulfilled"){
					// 异步调用
					setTimeout(()=>{
						try{
							// value是成功回调的返回值
							const value = onResolved(this.result);
							// 判断value是不是通过Promise实例化出来的（判断value是否为Promise实例）
							if(value instanceof Promise){
								// value.then(v=>{
								// 	// 将返回的Promise实例设置为成功，值为v
								// 	resolve(v);
								// },s=>{
								// 	// 将返回的Promise实例设置为失败，值为s
								// 	reject(s);
								// })
								
								// 简化：
								value.then(resolve,reject)
							}else{
								// 不是Promise实例，将返回的Promise状态设置为成功，值为value
								resolve(value);
							}
						}catch (err){
							// 有异常，将返回Promise的状态更改为失败，值为err
							reject(err);
						}
						
					})
					
				}else if(this.state === "rejected"){
					// 异步调用
					setTimeout(()=>{
						try{
							// value是失败回调的返回值
							const value = onRejected(this.result);
							// value是否为Promise实例
							if(value instanceof Promise){
								// 将返回Promise设置为与value相同的结果
								value.then(resolve,reject);
							}else{
								// 返回成功promise,值为value
								resolve(value);
							}
						}catch (err){
							// 返回失败promise,值为err
							reject(err);
						}
						
					})
				}
			})
			
		},
		catch(){
		
		}
	})
	window.Promise = Promise;
})(window);
~~~

~~~js
const p1 = new Promise((resolve, reject)=>{
    // resolve(1);
    reject(2);
    // throw "异常"
})
const p2 = p1.then(value=>{
    return new Promise((resolve,reject)=>{
        // resolve(100)
        // reject(200)
        throw "异常2"
    })
    // return 1;
    // console.log("成功回调",value);
},reason=>{
    return new Promise((resolve,reject)=>{
        // resolve(100);
        // reject(2)
        throw "异常3"
    })
    // return 1;
    // console.log("失败回调",reason);
})
console.log(p2);
~~~

#### 15.11   then函数返回的Promise实例状态以及值-优化封装函数_common

~~~js
// 立即调用函数的好处：可以避免对外部的变量造成污染。
(function(window){
	// executor是执行器函数
	function Promise(executor){
		// 定义实例属性state,初始值为pending
		this.state = "pending";
		// 定义实例属性result,初始值为undefined
		this.result = undefined;
		// 定义resolve函数
		const _resolve = value=>{
			// 当状态已经被更改过，不允许再次更改
			if(this.state !== "pending") return;
			// 将状态更改为成功(fulfilled)
			this.state = "fulfilled";
			// 成功值为value
			this.result = value;
		}
		// 定义reject函数
		const _reject = value=>{
			// 当状态已经被更改过，不允许再次更改
			if(this.state !== "pending") return;
			// 将状态更改为失败
			this.state = "rejected";
			// 将result设置为value
			this.result = value;
		}
		try{
			executor(_resolve,_reject);
		}catch (err){
			_reject(err);// 状态更改为失败，值为异常信息
		}
		
	}

	Object.assign(Promise.prototype,{
		// onResolved:成功回调
		// onRejected:失败回调
		then(onResolved,onRejected){
			
			return new Promise((resolve,reject)=>{
				const _common = function(callback){
					setTimeout(()=>{
						try{
							// value是成功回调的返回值
							const value = callback(this.result);
							// 判断value是不是通过Promise实例化出来的（判断value是否为Promise实例）
							if(value instanceof Promise){
								value.then(resolve,reject);
							}else{
								// 不是Promise实例，将返回的Promise状态设置为成功，值为value
								resolve(value);
							}
						}catch (err){
							// 有异常，将返回Promise的状态更改为失败，值为err
							reject(err);
						}
						
					})
				}
				// 状态成功调用onResolved
				// p1的状态为成功
				if(this.state === "fulfilled"){
					_common.call(this,onResolved);
				}else if(this.state === "rejected"){
					_common.call(this,onRejected);
				}
			})
			
		},
		catch(){
		
		}
	})
	window.Promise = Promise;
})(window);
~~~

~~~js
const p1 = new Promise((resolve, reject)=>{
    // resolve(1);
    reject(2);
    // throw "异常"
})
const p2 = p1.then(value=>{
    // return new Promise((resolve,reject)=>{
    // 	// resolve(100)
    // 	// reject(200)
    throw "异常2"
    // })
    // return 1;
    // console.log("成功回调",value);
},reason=>{
    // return new Promise((resolve,reject)=>{
    // 	// resolve(100);
    // 	// reject(2)
    // 	throw "异常3"
    // })
    // return 1;
    // console.log("失败回调",reason);
})
console.log(p2);
~~~

#### 15.12  增加成功与失败回调函数的默认值

~~~js
/*
 * 1- then如果省略成功回调，默认成功回调为 value=>value;
 * 2- then如果省略失败回调，默认失败回调为 reason=>{throw reason};
*/
~~~

~~~js
// 立即调用函数的好处：可以避免对外部的变量造成污染。
(function(window){
	// executor是执行器函数
	function Promise(executor){
		// 定义实例属性state,初始值为pending
		this.state = "pending";
		// 定义实例属性result,初始值为undefined
		this.result = undefined;
		// 定义resolve函数
		const _resolve = value=>{
			// 当状态已经被更改过，不允许再次更改
			if(this.state !== "pending") return;
			// 将状态更改为成功(fulfilled)
			this.state = "fulfilled";
			// 成功值为value
			this.result = value;
		}
		// 定义reject函数
		const _reject = value=>{
			// 当状态已经被更改过，不允许再次更改
			if(this.state !== "pending") return;
			// 将状态更改为失败
			this.state = "rejected";
			// 将result设置为value
			this.result = value;
		}
		try{
			executor(_resolve,_reject);
		}catch (err){
			_reject(err);// 状态更改为失败，值为异常信息
		}
		
	}

	Object.assign(Promise.prototype,{
		// onResolved:成功回调
		// onRejected:失败回调
		then(onResolved,onRejected){
			// 如果成功回调不是函数，那么增加成功回调默认值
			if(!(onResolved instanceof Function)){
				onResolved = value=>value;
			}
			// 如果失败回调不是函数，那么增加失败回调默认值
			if(!(onRejected instanceof Function)){
				onRejected = reason=>{
					throw reason;
				};
			}
			return new Promise((resolve,reject)=>{
				const _common = function(callback){
					setTimeout(()=>{
						try{
							// value是成功回调的返回值
							const value = callback(this.result);
							// 判断value是不是通过Promise实例化出来的（判断value是否为Promise实例）
							if(value instanceof Promise){
								value.then(resolve,reject);
							}else{
								// 不是Promise实例，将返回的Promise状态设置为成功，值为value
								resolve(value);
							}
						}catch (err){
							// 有异常，将返回Promise的状态更改为失败，值为err
							reject(err);
						}
						
					})
				}
				// 状态成功调用onResolved
				// p1的状态为成功
				if(this.state === "fulfilled"){
					_common.call(this,onResolved);
				}else if(this.state === "rejected"){
					_common.call(this,onRejected);
				}
			})
			
		},
		catch(){
		
		}
	})
	window.Promise = Promise;
})(window);
~~~

~~~js
const p1 = new Promise((resolve,reject)=>{
    resolve(1);
    // reject(2);
})
const p2 = p1.then();
console.log(p2);
~~~

#### 15.14   执行器函数常用于处理异步行为

~~~js
(function(window){
	// executor是执行器函数
	function Promise(executor){
		// 记录成功与失败回调函数
		this.callbackFn = {};
		// 定义实例属性state,初始值为pending
		this.state = "pending";
		// 定义实例属性result,初始值为undefined
		this.result = undefined;
		// 定义resolve函数
		const _resolve = value=>{
			// 当状态已经被更改过，不允许再次更改
			if(this.state !== "pending") return;
			// 将状态更改为成功(fulfilled)
			this.state = "fulfilled";
			// 成功值为value
			this.result = value;
			if(this.callbackFn.onResolved){
				this.callbackFn.onResolved();
			}
		}
		// 定义reject函数
		const _reject = value=>{
			// 当状态已经被更改过，不允许再次更改
			if(this.state !== "pending") return;
			// 将状态更改为失败
			this.state = "fulfilled";
			// 将result设置为value
			this.result = value;
			if(this.callbackFn.onRejected){
				this.callbackFn.onRejected();
			}
		}
		try{
			executor(_resolve,_reject);
		}catch (err){
			_reject(err);// 状态更改为失败，值为异常信息
		}
	}

	Object.assign(Promise.prototype,{
		// onResolved:成功回调
		// onRejected:失败回调
		then(onResolved,onRejected){
			// 如果成功回调不是函数，那么增加成功回调默认值
			if(!(onResolved instanceof Function)){
				onResolved = value=>value;
			}
			// 如果失败回调不是函数，那么增加失败回调默认值
			if(!(onRejected instanceof Function)){
				onRejected = reason=>{
					throw reason;
				};
			}
			return new Promise((resolve,reject)=>{
				const _common = function(callback){
					setTimeout(()=>{
						try{
							// value是成功回调的返回值
							const value = callback(this.result);
							// 判断value是不是通过Promise实例化出来的（判断value是否为Promise实例）
							if(value instanceof Promise) value.then(resolve,reject);
							else{
								// 不是Promise实例，将返回的Promise状态设置为成功，值为value
								resolve(value);
							}
						}catch (err){
							// 有异常，将返回Promise的状态更改为失败，值为err
							reject(err);
						}
						
					})
				}
				// 状态成功调用onResolved
				// p1的状态为成功
				if(this.state === "fulfilled"){
					_common.call(this,onResolved);
				}else if(this.state === "rejected"){
					_common.call(this,onRejected);
				}else{
					// pending
					// 如果状态为pending,那么保存成功与失败回调
					this.callbackFn = {
						onResolved:_common.bind(this,onResolved),
						onRejected:_common.bind(this,onRejected)
					}
				}
			})
			
		},
		catch(){
		
		}
	})
	window.Promise = Promise;
})(window);
~~~

~~~js
const p1 = new Promise((resolve,reject)=>{
    setTimeout(()=>{
        reject(100);
    })
})
p1.then(value=>{
    console.log(value);
},reason=>{
    console.log("失败",reason);
})
~~~

#### 15.15  可以指定多个成功或失败的回调

~~~js
(function(window){
	// executor是执行器函数
	function Promise(executor){
		// 记录成功与失败回调函数
		this.callbackFn = [];
		// 定义实例属性state,初始值为pending
		this.state = "pending";
		// 定义实例属性result,初始值为undefined
		this.result = undefined;
		// 定义resolve函数
		const _resolve = value=>{
			// 当状态已经被更改过，不允许再次更改
			if(this.state !== "pending") return;
			// 将状态更改为成功(fulfilled)
			this.state = "fulfilled";
			// 成功值为value
			this.result = value;
			this.callbackFn.forEach(item=>{
				item.onResolved()
			})
		}
		// 定义reject函数
		const _reject = value=>{
			// 当状态已经被更改过，不允许再次更改
			if(this.state !== "pending") return;
			// 将状态更改为失败
			this.state = "fulfilled";
			// 将result设置为value
			this.result = value;
			this.callbackFn.forEach(item=>{
				item.onRejected()
			})
		}
		try{
			executor(_resolve,_reject);
		}catch (err){
			_reject(err);// 状态更改为失败，值为异常信息
		}
	}

	Object.assign(Promise.prototype,{
		// onResolved:成功回调
		// onRejected:失败回调
		then(onResolved,onRejected){
			// 如果成功回调不是函数，那么增加成功回调默认值
			if(!(onResolved instanceof Function)){
				onResolved = value=>value;
			}
			// 如果失败回调不是函数，那么增加失败回调默认值
			if(!(onRejected instanceof Function)){
				onRejected = reason=>{
					throw reason;
				};
			}
			return new Promise((resolve,reject)=>{
				const _common = function(callback){
					setTimeout(()=>{
						try{
							// value是成功回调的返回值
							const value = callback(this.result);
							// 判断value是不是通过Promise实例化出来的（判断value是否为Promise实例）
							if(value instanceof Promise) value.then(resolve,reject);
							else{
								// 不是Promise实例，将返回的Promise状态设置为成功，值为value
								resolve(value);
							}
						}catch (err){
							// 有异常，将返回Promise的状态更改为失败，值为err
							reject(err);
						}
						
					})
				}
				// 状态成功调用onResolved
				// p1的状态为成功
				if(this.state === "fulfilled"){
					_common.call(this,onResolved);
				}else if(this.state === "rejected"){
					_common.call(this,onRejected);
				}else{
					// pending
					// 如果状态为pending,那么保存成功与失败回调
					this.callbackFn.push({
						onResolved:_common.bind(this,onResolved),
						onRejected:_common.bind(this,onRejected)
					})
				}
			})
			
		},
		catch(){
		
		}
	})
	window.Promise = Promise;
})(window);
~~~

~~~js
// 可以指定多个成功或失败的回调
const p1 = new Promise((resolve,reject)=>{
    setTimeout(()=>{
        reject(100);
    })
})
p1.then(value=>{
    console.log("成功1",value);
},reason=>{
    console.log("失败1",reason);
})
p1.then(value=>{
    console.log("成功2",value);
},reason=>{
    console.log("失败2",reason);
})
p1.then(value=>{
    console.log("成功3",value);
},reason=>{
    console.log("失败3",reason);
})
p1.then(value=>{
    console.log("成功4",value);
},reason=>{
    console.log("失败4",reason);
})
~~~

#### 15.16  catch

~~~js
(function(window){
	// executor是执行器函数
	function Promise(executor){
		// 记录成功与失败回调函数
		this.callbackFn = [];
		// 定义实例属性state,初始值为pending
		this.state = "pending";
		// 定义实例属性result,初始值为undefined
		this.result = undefined;
		// 定义resolve函数
		const _resolve = value=>{
			// 当状态已经被更改过，不允许再次更改
			if(this.state !== "pending") return;
			// 将状态更改为成功(fulfilled)
			this.state = "fulfilled";
			// 成功值为value
			this.result = value;
			this.callbackFn.forEach(item=>{
				item.onResolved()
			})
		}
		// 定义reject函数
		const _reject = value=>{
			// 当状态已经被更改过，不允许再次更改
			if(this.state !== "pending") return;
			// 将状态更改为失败
			this.state = "fulfilled";
			// 将result设置为value
			this.result = value;
			this.callbackFn.forEach(item=>{
				item.onRejected()
			})
		}
		try{
			executor(_resolve,_reject);
		}catch (err){
			_reject(err);// 状态更改为失败，值为异常信息
		}
	}

	Object.assign(Promise.prototype,{
		// onResolved:成功回调
		// onRejected:失败回调
		then(onResolved,onRejected){
			// 如果成功回调不是函数，那么增加成功回调默认值
			if(!(onResolved instanceof Function)){
				onResolved = value=>value;
			}
			// 如果失败回调不是函数，那么增加失败回调默认值
			if(!(onRejected instanceof Function)){
				onRejected = reason=>{
					throw reason;
				};
			}
			return new Promise((resolve,reject)=>{
				const _common = function(callback){
					setTimeout(()=>{
						try{
							// value是成功回调的返回值
							const value = callback(this.result);
							// 判断value是不是通过Promise实例化出来的（判断value是否为Promise实例）
							if(value instanceof Promise) value.then(resolve,reject);
							else{
								// 不是Promise实例，将返回的Promise状态设置为成功，值为value
								resolve(value);
							}
						}catch (err){
							// 有异常，将返回Promise的状态更改为失败，值为err
							reject(err);
						}
						
					})
				}
				// 状态成功调用onResolved
				// p1的状态为成功
				if(this.state === "fulfilled"){
					_common.call(this,onResolved);
				}else if(this.state === "rejected"){
					_common.call(this,onRejected);
				}else{
					// pending
					// 如果状态为pending,那么保存成功与失败回调
					this.callbackFn.push({
						onResolved:_common.bind(this,onResolved),
						onRejected:_common.bind(this,onRejected)
					})
				}
			})
			
		},
		catch(onRejected){
			return this.then(undefined,onRejected)
		}
	})
	window.Promise = Promise;
})(window);
~~~

~~~js
// 可以指定多个成功或失败的回调
const p1 = new Promise((resolve,reject)=>{
    setTimeout(()=>{
        reject(100);
    })
})
// p1.then(undefined,reason=>{
// 	console.log(reason);
// })
// catch的返回值是Promise实例,实例的属性与值取决于回调函数的返回值
// 返回值为非Promise实例，那么得到的状态为成功，值为返回值
// 返回值为Promise实例，那么得到的结果与返回的结果相同。
// 有异常，那么得到的状态为失败，值为异常信息。
const p2 = p1.catch(reason=>{
    // console.log(reason);
    return new Promise((resolve,reject)=>{
        resolve(2);
    })
    // throw "异常"
})
console.log(p2);
~~~

#### 15.17  链式调用支持

~~~js
(function(window){
	// executor是执行器函数
	function Promise(executor){
		// 记录成功与失败回调函数
		this.callbackFn = [];
		// 定义实例属性state,初始值为pending
		this.state = "pending";
		// 定义实例属性result,初始值为undefined
		this.result = undefined;
		// 定义resolve函数
		const _resolve = value=>{
			// 当状态已经被更改过，不允许再次更改
			if(this.state !== "pending") return;
			// 将状态更改为成功(fulfilled)
			this.state = "fulfilled";
			// 成功值为value
			this.result = value;
			this.callbackFn.forEach(item=>{
				item.onResolved()
			})
		}
		// 定义reject函数
		const _reject = value=>{
			// 当状态已经被更改过，不允许再次更改
			if(this.state !== "pending") return;
			// 将状态更改为失败
			this.state = "rejected";
			// 将result设置为value
			this.result = value;
			this.callbackFn.forEach(item=>{
				item.onRejected()
			})
		}
		try{
			executor(_resolve,_reject);
		}catch (err){
			_reject(err);// 状态更改为失败，值为异常信息
		}
	}

	Object.assign(Promise.prototype,{
		// onResolved:成功回调
		// onRejected:失败回调
		then(onResolved,onRejected){
			// 如果成功回调不是函数，那么增加成功回调默认值
			if(!(onResolved instanceof Function)){
				onResolved = value=>value;
			}
			// 如果失败回调不是函数，那么增加失败回调默认值
			if(!(onRejected instanceof Function)){
				onRejected = reason=>{
					throw reason;
				};
			}
			return new Promise((resolve,reject)=>{
				const _common = function(callback){
					setTimeout(()=>{
						try{
							// value是成功回调的返回值
							const value = callback(this.result);
							// 判断value是不是通过Promise实例化出来的（判断value是否为Promise实例）
							if(value instanceof Promise) value.then(resolve,reject);
							else{
								// 不是Promise实例，将返回的Promise状态设置为成功，值为value
								resolve(value);
							}
						}catch (err){
							// 有异常，将返回Promise的状态更改为失败，值为err
							reject(err);
						}
						
					})
				}
				// 状态成功调用onResolved
				// p1的状态为成功
				if(this.state === "fulfilled"){
					_common.call(this,onResolved);
				}else if(this.state === "rejected"){
					_common.call(this,onRejected);
				}else{
					// pending
					// 如果状态为pending,那么保存成功与失败回调
					this.callbackFn.push({
						onResolved:_common.bind(this,onResolved),
						onRejected:_common.bind(this,onRejected)
					})
				}
			})
			
		},
		catch(onRejected){
			return this.then(undefined,onRejected)
		}
	})
	window.Promise = Promise;
})(window);
~~~

~~~js
new Promise((resolve,reject)=>{
    resolve(1);
}).then(value=>{
    console.log(value);// 1
    return 2;
}).then(value=>{
    console.log(value);// 2
    return 3;
}).then(value=>{
    console.log(value);// 3
    return 4;
}).then(value=>{
    console.log(value);// 4
    return 5;
})
~~~

#### 15.18   异常穿透支持

~~~js
(function(window){
	// executor是执行器函数
	function Promise(executor){
		// 记录成功与失败回调函数
		this.callbackFn = [];
		// 定义实例属性state,初始值为pending
		this.state = "pending";
		// 定义实例属性result,初始值为undefined
		this.result = undefined;
		// 定义resolve函数
		const _resolve = value=>{
			// 当状态已经被更改过，不允许再次更改
			if(this.state !== "pending") return;
			// 将状态更改为成功(fulfilled)
			this.state = "fulfilled";
			// 成功值为value
			this.result = value;
			this.callbackFn.forEach(item=>{
				item.onResolved()
			})
		}
		// 定义reject函数
		const _reject = value=>{
			// 当状态已经被更改过，不允许再次更改
			if(this.state !== "pending") return;
			// 将状态更改为失败
			this.state = "rejected";
			// 将result设置为value
			this.result = value;
			this.callbackFn.forEach(item=>{
				item.onRejected()
			})
		}
		try{
			executor(_resolve,_reject);
		}catch (err){
			_reject(err);// 状态更改为失败，值为异常信息
		}
	}

	Object.assign(Promise.prototype,{
		// onResolved:成功回调
		// onRejected:失败回调
		then(onResolved,onRejected){
			// 如果成功回调不是函数，那么增加成功回调默认值
			if(!(onResolved instanceof Function)){
				onResolved = value=>value;
			}
			// 如果失败回调不是函数，那么增加失败回调默认值
			if(!(onRejected instanceof Function)){
				onRejected = reason=>{
					throw reason;
				};
			}
			return new Promise((resolve,reject)=>{
				const _common = function(callback){
					setTimeout(()=>{
						try{
							// value是成功回调的返回值
							const value = callback(this.result);
							// 判断value是不是通过Promise实例化出来的（判断value是否为Promise实例）
							if(value instanceof Promise) value.then(resolve,reject);
							else{
								// 不是Promise实例，将返回的Promise状态设置为成功，值为value
								resolve(value);
							}
						}catch (err){
							// 有异常，将返回Promise的状态更改为失败，值为err
							reject(err);
						}
						
					})
				}
				// 状态成功调用onResolved
				// p1的状态为成功
				if(this.state === "fulfilled"){
					_common.call(this,onResolved);
				}else if(this.state === "rejected"){
					_common.call(this,onRejected);
				}else{
					// pending
					// 如果状态为pending,那么保存成功与失败回调
					this.callbackFn.push({
						onResolved:_common.bind(this,onResolved),
						onRejected:_common.bind(this,onRejected)
					})
				}
			})
			
		},
		catch(onRejected){
			return this.then(undefined,onRejected)
		}
	})
	window.Promise = Promise;
})(window);
~~~

~~~js
new Promise((resolve, reject) => {
    resolve(1);
}).then(value => {
    throw "异常"
}).then(value => {
    console.log(value);
    return 3;
}).then(value => {
    console.log(value);// 3
    return 4;
}).then(value => {
    console.log(value);// 4
    return 5;
}).catch(reason => {
    console.log(4,reason);
})
~~~

#### 15.19   中断Promise链

~~~js
(function(window){
	// executor是执行器函数
	function Promise(executor){
		// 记录成功与失败回调函数
		this.callbackFn = [];
		// 定义实例属性state,初始值为pending
		this.state = "pending";
		// 定义实例属性result,初始值为undefined
		this.result = undefined;
		// 定义resolve函数
		const _resolve = value=>{
			// 当状态已经被更改过，不允许再次更改
			if(this.state !== "pending") return;
			// 将状态更改为成功(fulfilled)
			this.state = "fulfilled";
			// 成功值为value
			this.result = value;
			this.callbackFn.forEach(item=>{
				item.onResolved()
			})
		}
		// 定义reject函数
		const _reject = value=>{
			// 当状态已经被更改过，不允许再次更改
			if(this.state !== "pending") return;
			// 将状态更改为失败
			this.state = "rejected";
			// 将result设置为value
			this.result = value;
			this.callbackFn.forEach(item=>{
				item.onRejected()
			})
		}
		try{
			executor(_resolve,_reject);
		}catch (err){
			_reject(err);// 状态更改为失败，值为异常信息
		}
	}

	Object.assign(Promise.prototype,{
		// onResolved:成功回调
		// onRejected:失败回调
		then(onResolved,onRejected){
			// 如果成功回调不是函数，那么增加成功回调默认值
			if(!(onResolved instanceof Function)){
				onResolved = value=>value;
			}
			// 如果失败回调不是函数，那么增加失败回调默认值
			if(!(onRejected instanceof Function)){
				onRejected = reason=>{
					throw reason;
				};
			}
			return new Promise((resolve,reject)=>{
				const _common = function(callback){
					setTimeout(()=>{
						try{
							// value是成功回调的返回值
							const value = callback(this.result);
							// 判断value是不是通过Promise实例化出来的（判断value是否为Promise实例）
							if(value instanceof Promise) value.then(resolve,reject);
							else{
								// 不是Promise实例，将返回的Promise状态设置为成功，值为value
								resolve(value);
							}
						}catch (err){
							// 有异常，将返回Promise的状态更改为失败，值为err
							reject(err);
						}
						
					})
				}
				// 状态成功调用onResolved
				// p1的状态为成功
				if(this.state === "fulfilled"){
					_common.call(this,onResolved);
				}else if(this.state === "rejected"){
					_common.call(this,onRejected);
				}else{
					// pending
					// 如果状态为pending,那么保存成功与失败回调
					this.callbackFn.push({
						onResolved:_common.bind(this,onResolved),
						onRejected:_common.bind(this,onRejected)
					})
				}
			})
			
		},
		catch(onRejected){
			return this.then(undefined,onRejected)
		}
	})
	window.Promise = Promise;
})(window);
~~~

~~~js
new Promise((resolve,reject)=>{
    resolve(1);
}).then(value=>{
    console.log(value);// 1
    return 2;
}).then(value=>{
    console.log(value);// 2
    // 在回调函数中返回一个`pendding`状态的promise对象
    return new Promise(()=>{})
}).then(value=>{
    console.log(value);// undefined
    return 4;
}).then(value=>{
    console.log(value);// 4
    return 5;
})
~~~

#### 15.20  resolve

~~~js
(function(window){
	// executor是执行器函数
	function Promise(executor){
		// 记录成功与失败回调函数
		this.callbackFn = [];
		// 定义实例属性state,初始值为pending
		this.state = "pending";
		// 定义实例属性result,初始值为undefined
		this.result = undefined;
		// 定义resolve函数
		const _resolve = value=>{
			// 当状态已经被更改过，不允许再次更改
			if(this.state !== "pending") return;
			// 将状态更改为成功(fulfilled)
			this.state = "fulfilled";
			// 成功值为value
			this.result = value;
			this.callbackFn.forEach(item=>{
				item.onResolved()
			})
		}
		// 定义reject函数
		const _reject = value=>{
			// 当状态已经被更改过，不允许再次更改
			if(this.state !== "pending") return;
			// 将状态更改为失败
			this.state = "rejected";
			// 将result设置为value
			this.result = value;
			this.callbackFn.forEach(item=>{
				item.onRejected()
			})
		}
		try{
			executor(_resolve,_reject);
		}catch (err){
			_reject(err);// 状态更改为失败，值为异常信息
		}
	}

	Object.assign(Promise.prototype,{
		// onResolved:成功回调
		// onRejected:失败回调
		then(onResolved,onRejected){
			// 如果成功回调不是函数，那么增加成功回调默认值
			if(!(onResolved instanceof Function)){
				onResolved = value=>value;
			}
			// 如果失败回调不是函数，那么增加失败回调默认值
			if(!(onRejected instanceof Function)){
				onRejected = reason=>{
					throw reason;
				};
			}
			return new Promise((resolve,reject)=>{
				const _common = function(callback){
					setTimeout(()=>{
						try{
							// value是成功回调的返回值
							const value = callback(this.result);
							// 判断value是不是通过Promise实例化出来的（判断value是否为Promise实例）
							if(value instanceof Promise) value.then(resolve,reject);
							else{
								// 不是Promise实例，将返回的Promise状态设置为成功，值为value
								resolve(value);
							}
						}catch (err){
							// 有异常，将返回Promise的状态更改为失败，值为err
							reject(err);
						}
						
					})
				}
				// 状态成功调用onResolved
				// p1的状态为成功
				if(this.state === "fulfilled"){
					_common.call(this,onResolved);
				}else if(this.state === "rejected"){
					_common.call(this,onRejected);
				}else{
					// pending
					// 如果状态为pending,那么保存成功与失败回调
					this.callbackFn.push({
						onResolved:_common.bind(this,onResolved),
						onRejected:_common.bind(this,onRejected)
					})
				}
			})
			
		},
		catch(onRejected){
			return this.then(undefined,onRejected)
		}
	})
	Promise.resolve = function(value){
		if(value instanceof Promise){
			return value;// 如果是Promise实例直接返回
		}else{
			// 如果不是Promise实例，那么返回的状态为成功，值为value
			return new Promise(resolve=>{
				resolve(value);
			})
		}
	}
	window.Promise = Promise;
})(window);
~~~

~~~js
// const p1 = Promise.resolve(1);
// console.log(p1);

// const p1 = Promise.resolve(new Promise((resolve,reject)=>{
// 	resolve(2);
// }));
// console.log(p1);
//
// const p1 = Promise.resolve(new Promise((resolve,reject)=>{
// 	reject(2);
// }));
// console.log(p1);


const p =new Promise((resolve,reject)=>{
    reject(2);
})
const p1 = Promise.resolve(p);
console.log(p1===p);
~~~

#### 15.21  reject

~~~js
(function(window){
	// executor是执行器函数
	function Promise(executor){
		// 记录成功与失败回调函数
		this.callbackFn = [];
		// 定义实例属性state,初始值为pending
		this.state = "pending";
		// 定义实例属性result,初始值为undefined
		this.result = undefined;
		// 定义resolve函数
		const _resolve = value=>{
			// 当状态已经被更改过，不允许再次更改
			if(this.state !== "pending") return;
			// 将状态更改为成功(fulfilled)
			this.state = "fulfilled";
			// 成功值为value
			this.result = value;
			this.callbackFn.forEach(item=>{
				item.onResolved()
			})
		}
		// 定义reject函数
		const _reject = value=>{
			// 当状态已经被更改过，不允许再次更改
			if(this.state !== "pending") return;
			// 将状态更改为失败
			this.state = "rejected";
			// 将result设置为value
			this.result = value;
			this.callbackFn.forEach(item=>{
				item.onRejected()
			})
		}
		try{
			executor(_resolve,_reject);
		}catch (err){
			_reject(err);// 状态更改为失败，值为异常信息
		}
	}

	Object.assign(Promise.prototype,{
		// onResolved:成功回调
		// onRejected:失败回调
		then(onResolved,onRejected){
			// 如果成功回调不是函数，那么增加成功回调默认值
			if(!(onResolved instanceof Function)){
				onResolved = value=>value;
			}
			// 如果失败回调不是函数，那么增加失败回调默认值
			if(!(onRejected instanceof Function)){
				onRejected = reason=>{
					throw reason;
				};
			}
			return new Promise((resolve,reject)=>{
				const _common = function(callback){
					setTimeout(()=>{
						try{
							// value是成功回调的返回值
							const value = callback(this.result);
							// 判断value是不是通过Promise实例化出来的（判断value是否为Promise实例）
							if(value instanceof Promise) value.then(resolve,reject);
							else{
								// 不是Promise实例，将返回的Promise状态设置为成功，值为value
								resolve(value);
							}
						}catch (err){
							// 有异常，将返回Promise的状态更改为失败，值为err
							reject(err);
						}
						
					})
				}
				// 状态成功调用onResolved
				// p1的状态为成功
				if(this.state === "fulfilled"){
					_common.call(this,onResolved);
				}else if(this.state === "rejected"){
					_common.call(this,onRejected);
				}else{
					// pending
					// 如果状态为pending,那么保存成功与失败回调
					this.callbackFn.push({
						onResolved:_common.bind(this,onResolved),
						onRejected:_common.bind(this,onRejected)
					})
				}
			})
			
		},
		catch(onRejected){
			return this.then(undefined,onRejected)
		}
	})
	Promise.resolve = function(value){
		if(value instanceof Promise){
			return value;// 如果是Promise实例直接返回
		}else{
			// 如果不是Promise实例，那么返回的状态为成功，值为value
			return new Promise(resolve=>{
				resolve(value);
			})
		}
	}
	Promise.reject = function(value){
		return new Promise((resolve,reject)=>{
			reject(value);
		})
	}
	window.Promise = Promise;
})(window);
~~~

~~~js
const p1 = Promise.reject(1);
console.log(p1);

const p2 = Promise.reject(new Promise((resolve,reject)=>{
    resolve(2);
}));
console.log(p2);

const p3 = Promise.reject(new Promise((resolve,reject)=>{
    reject(2);
}));
console.log(p3);
~~~

#### 15.22 完成all

~~~js
(function (window) {
	// 接收执行器函数(executor)，执行器函数会同步执行（立即执行）。
	function Promise(executor) {
		this.state = "pending";// 初始状态
		this.result = undefined;// 初始值
		this.callbackFn = [];
		// _resolve函数将状态更新为成功，成功值为接收的value
		const _resolve = value => {
			// 如果状态已经更改，直接跳出函数体
			if (this.state !== "pending") return;
			this.state = "fulfilled";// 状态更新为成功
			this.result = value;// 更新成功值
			this.callbackFn.forEach(item=>{
				item.onResolved();
			})
		}
		// _reject函数将状态更新为失败，失败值为接收的value
		const _reject = value => {
			// 如果状态已经更改，直接跳出函数体
			if (this.state !== "pending") return;
			this.state = "rejected";// 状态更新为失败
			this.result = value;// 更新失败值
			this.callbackFn.forEach(item=>{
				item.onRejected();
			})
		}
		try {
			executor(_resolve, _reject);
		} catch (err) {
			// 如果有异常，将状态更新为失败，失败的值为异常信息
			_reject(err);
		}
	}
	
	// 将第二个参数（对象）合并至Promise.prototype对象中。
	Object.assign(Promise.prototype, {
		// 1- 接收成功与失败回调函数
		// 2- 返回的是一个Promise实例
		// 3- onResolved成功回调，默认值为value=>value;
		// 4- onRejected失败回调，默认值为reason=>{throw reason};
		then(onResolved, onRejected) {
			// onResolved成功回调，默认值为value=>value;
			if (!(onResolved instanceof Function)) onResolved = value => value;
			//onRejected失败回调，默认值为reason=>{throw reason};
			if (!(onRejected instanceof Function)) onRejected = reason => {
				throw reason
			};
			return new Promise((resolve, reject) => {
				// callback是成功或失败回调
				const _common = function (callback) {
					setTimeout(()=>{
						try {
							// value是成功回调返回结果
							const value = callback(this.result);
							// 判断是否为Promise实例
							if (value instanceof Promise) {
								value.then(resolve, reject);
							} else {
								// 非Promise实例
								resolve(value);
							}
						} catch (err) {
							reject(err);
						}
					})
					
				}
				// 判断状态为成功，调用成功回调
				if (this.state === "fulfilled") _common.call(this, onResolved);
				else if (this.state === "rejected") _common.call(this, onRejected);
				else {
					this.callbackFn.push({
						onResolved: _common.bind(this, onResolved),
						onRejected: _common.bind(this, onRejected)
					})
				}
			})
		},
		catch(onRejected){
			return this.then(undefined,onRejected);
		}
	})
	Promise.resolve = function(value){
		// 判断接收的参数是否为Promise实例，如果是直接返回
		if(value instanceof Promise){
			return value;
		}else{
			// 如果不是，创建一个新的Promise,状态为成功，值为value;
			return new Promise(resolve=>{
				resolve(value);
			})
		}
	}
	Promise.reject = function(value){
		// 返回失败的Promise,失败值为接收的value
		return new Promise((resolve,reject)=>{
			reject(value);
		})
	}
	// 1- 接收的是数组，返回的是Promise
	Promise.all = function(promiseArr){
		let index = 0;
		let successArr = new Array(promiseArr.length);
		return new Promise((resolve,reject)=>{
			promiseArr.forEach((value,i)=>{
				value.then(v=>{
					index++;
					successArr[i] = v;
					if(index === promiseArr.length){
						resolve(successArr);
					}
				},s=>{
					// 返回Promise的状态设置失败
					reject(s);
				})
			})
		})
	}
	window.Promise = Promise;
})(window);
~~~

~~~js
const p1 = new Promise((resolve,reject)=>{
    setTimeout(()=>{
        resolve(100)
    },100)
})
const p2 = new Promise((resolve,reject)=>{
    setTimeout(()=>{
        resolve(200)
    },50)
})
const p3 = new Promise((resolve,reject)=>{
    setTimeout(()=>{
        resolve(300)
    },200)
})
const p4 = new Promise((resolve,reject)=>{
    setTimeout(()=>{
        resolve(400)
    },100)
})
// all接收的数组中的元素是Promise实例。
// 元素中的Promise实例都成功，p的状态为成功，值为数组，数组的元素为成功值
// 元素中有一个失败，那么p的状态为失败，值为失败值
const p = Promise.all([p1,p2,p3,p4]);
console.log(p);
~~~

#### 15.23 完成race

~~~js
(function (window) {
    // 接收执行器函数(executor)，执行器函数会同步执行（立即执行）。
    function Promise(executor) {
        this.state = "pending";// 初始状态
        this.result = undefined;// 初始值
        this.callbackFn = [];
        // _resolve函数将状态更新为成功，成功值为接收的value
        const _resolve = value => {
            // 如果状态已经更改，直接跳出函数体
            if (this.state !== "pending") return;
            this.state = "fulfilled";// 状态更新为成功
            this.result = value;// 更新成功值
            this.callbackFn.forEach(item=>{
                item.onResolved();
            })
        }
        // _reject函数将状态更新为失败，失败值为接收的value
        const _reject = value => {
            // 如果状态已经更改，直接跳出函数体
            if (this.state !== "pending") return;
            this.state = "rejected";// 状态更新为失败
            this.result = value;// 更新失败值
            this.callbackFn.forEach(item=>{
                item.onRejected();
            })
        }
        try {
            executor(_resolve, _reject);
        } catch (err) {
            // 如果有异常，将状态更新为失败，失败的值为异常信息
            _reject(err);
        }
    }

    // 将第二个参数（对象）合并至Promise.prototype对象中。
    Object.assign(Promise.prototype, {
        // 1- 接收成功与失败回调函数
        // 2- 返回的是一个Promise实例
        // 3- onResolved成功回调，默认值为value=>value;
        // 4- onRejected失败回调，默认值为reason=>{throw reason};
        then(onResolved, onRejected) {
            // onResolved成功回调，默认值为value=>value;
            if (!(onResolved instanceof Function)) onResolved = value => value;
            //onRejected失败回调，默认值为reason=>{throw reason};
            if (!(onRejected instanceof Function)) onRejected = reason => {
                throw reason
            };
            return new Promise((resolve, reject) => {
                // callback是成功或失败回调
                const _common = function (callback) {
                    setTimeout(()=>{
                        try {
                            // value是成功回调返回结果
                            const value = callback(this.result);
                            // 判断是否为Promise实例
                            if (value instanceof Promise) {
                                value.then(resolve, reject);
                            } else {
                                // 非Promise实例
                                resolve(value);
                            }
                        } catch (err) {
                            reject(err);
                        }
                    })

                }
                // 判断状态为成功，调用成功回调
                if (this.state === "fulfilled") _common.call(this, onResolved);
                else if (this.state === "rejected") _common.call(this, onRejected);
                else {
                    this.callbackFn.push({
                        onResolved: _common.bind(this, onResolved),
                        onRejected: _common.bind(this, onRejected)
                    })
                }
            })
        },
        catch(onRejected){
            return this.then(undefined,onRejected);
        }
    })
    Promise.resolve = function(value){
        // 判断接收的参数是否为Promise实例，如果是直接返回
        if(value instanceof Promise){
            return value;
        }else{
            // 如果不是，创建一个新的Promise,状态为成功，值为value;
            return new Promise(resolve=>{
                resolve(value);
            })
        }
    }
    Promise.reject = function(value){
        // 返回失败的Promise,失败值为接收的value
        return new Promise((resolve,reject)=>{
            reject(value);
        })
    }
    // 1- 接收的是数组，返回的是Promise
    Promise.all = function(promiseArr){
        let index = 0;
        let successArr = new Array(promiseArr.length);
        return new Promise((resolve,reject)=>{
            promiseArr.forEach((value,i)=>{
                value.then(v=>{
                    index++;
                    successArr[i] = v;
                    if(index === promiseArr.length){
                        resolve(successArr);
                    }
                },s=>{
                    // 返回Promise的状态设置失败
                    reject(s);
                })
            })
        })
    }
    Promise.race = function(promiseArr){
        return new Promise((resolve,reject)=>{
            promiseArr.forEach(value=>{
                // value.then(v=>{
                // 	resolve(v);
                // },s=>{
                // 	reject(s);
                // })
                value.then(resolve,reject);
            })
        })
    }
    window.Promise = Promise;
})(window);
~~~

~~~js
const p1 = new Promise((resolve,reject)=>{
    setTimeout(()=>{
        resolve(100)
    },100)
})
const p2 = new Promise((resolve,reject)=>{
    setTimeout(()=>{
        reject(200)
    },50)
})
const p3 = new Promise((resolve,reject)=>{
    setTimeout(()=>{
        resolve(300)
    },200)
})
const p4 = new Promise((resolve,reject)=>{
    setTimeout(()=>{
        resolve(400)
    },100)
})
// race:返回的是Promise实例，谁先执行完就与谁的状态以及值相同。
const p = Promise.race([p1,p2,p3,p4]);
console.log(p);
~~~

#### 15.24 class版本实现Promise

~~~js
(function (window) {
	// 1-将之前构造函数体内的语句放置到constructor函数中
	// 2-将之前prototype的属性直接放置到Promise中
	class Promise{
		static resolve(value){
			// 判断接收的参数是否为Promise实例，如果是直接返回
			if(value instanceof Promise){
				return value;
			}else{
				// 如果不是，创建一个新的Promise,状态为成功，值为value;
				return new Promise(resolve=>{
					resolve(value);
				})
			}
		}
		static reject(value){
			// 返回失败的Promise,失败值为接收的value
			return new Promise((resolve,reject)=>{
				reject(value);
			})
		}
		static all(promiseArr){
			let index = 0;
			let successArr = new Array(promiseArr.length);
			return new Promise((resolve,reject)=>{
				promiseArr.forEach((value,i)=>{
					value.then(v=>{
						index++;
						successArr[i] = v;
						if(index === promiseArr.length){
							resolve(successArr);
						}
					},s=>{
						// 返回Promise的状态设置失败
						reject(s);
					})
				})
			})
		}
		static race(promiseArr){
			return new Promise((resolve,reject)=>{
				promiseArr.forEach(value=>{
					// value.then(v=>{
					// 	resolve(v);
					// },s=>{
					// 	reject(s);
					// })
					value.then(resolve,reject);
				})
			})
		}
		constructor(executor) {
			this.state = "pending";// 初始状态
			this.result = undefined;// 初始值
			this.callbackFn = [];
			// _resolve函数将状态更新为成功，成功值为接收的value
			const _resolve = value => {
				// 如果状态已经更改，直接跳出函数体
				if (this.state !== "pending") return;
				this.state = "fulfilled";// 状态更新为成功
				this.result = value;// 更新成功值
				this.callbackFn.forEach(item=>{
					item.onResolved();
				})
			}
			// _reject函数将状态更新为失败，失败值为接收的value
			const _reject = value => {
				// 如果状态已经更改，直接跳出函数体
				if (this.state !== "pending") return;
				this.state = "rejected";// 状态更新为失败
				this.result = value;// 更新失败值
				this.callbackFn.forEach(item=>{
					item.onRejected();
				})
			}
			try {
				executor(_resolve, _reject);
			} catch (err) {
				// 如果有异常，将状态更新为失败，失败的值为异常信息
				_reject(err);
			}
		}
		then(onResolved, onRejected) {
			// onResolved成功回调，默认值为value=>value;
			if (!(onResolved instanceof Function)) onResolved = value => value;
			//onRejected失败回调，默认值为reason=>{throw reason};
			if (!(onRejected instanceof Function)) onRejected = reason => {
				throw reason
			};
			return new Promise((resolve, reject) => {
				// callback是成功或失败回调
				const _common = function (callback) {
					setTimeout(()=>{
						try {
							// value是成功回调返回结果
							const value = callback(this.result);
							// 判断是否为Promise实例
							if (value instanceof Promise) {
								value.then(resolve, reject);
							} else {
								// 非Promise实例
								resolve(value);
							}
						} catch (err) {
							reject(err);
						}
					})
					
				}
				// 判断状态为成功，调用成功回调
				if (this.state === "fulfilled") _common.call(this, onResolved);
				else if (this.state === "rejected") _common.call(this, onRejected);
				else {
					this.callbackFn.push({
						onResolved: _common.bind(this, onResolved),
						onRejected: _common.bind(this, onRejected)
					})
				}
			})
		}
		catch(onRejected){
			return this.then(undefined,onRejected);
		}
	}
	window.Promise = Promise;
})(window);
~~~

~~~js
const p1 = new Promise((resolve,reject)=>{
    setTimeout(()=>{
        resolve(100)
    },100)
})
const p2 = new Promise((resolve,reject)=>{
    setTimeout(()=>{
        reject(200)
    },50)
})
const p3 = new Promise((resolve,reject)=>{
    setTimeout(()=>{
        resolve(300)
    },200)
})
const p4 = new Promise((resolve,reject)=>{
    setTimeout(()=>{
        resolve(400)
    },100)
})
// race:返回的是Promise实例，谁先执行完就与谁的状态以及值相同。
const p = Promise.race([p1,p2,p3,p4]);
console.log(p);
~~~

