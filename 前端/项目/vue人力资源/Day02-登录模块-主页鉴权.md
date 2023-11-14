# 1. 分析登录流程
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677660537041-ce27cc25-b47f-44f0-8658-7c86a29d426a.png#clientId=u60b73d67-62d7-4&from=paste&height=459&id=u6da3ee15&name=image.png&originHeight=918&originWidth=1994&originalType=binary&ratio=2&rotation=0&showTitle=false&size=110407&status=done&style=none&taskId=uc92adc89-73eb-4124-aaac-39d1fc4ac34&title=&width=997)
> 传统思路都是登录校验通过之后，直接调用接口，获取token之后，跳转到主页。

- vue-element-admin的登录思路：

1. 登录表单校验通过
2. 调用Vuex提供的登录的action
3. 登录的Action中会调用接口
4. 登录接口如果成功执行，会返回token
5. 利用Vuex的特性，将token共享的到Vuex中，这样Vuex就统一管理了token,别的地方想要使用，直接通过Vuex就可以
6. 登录接口会调用单独封装的请求模块(api)
7. 请求模块中又会使用用到axios封装的请求工具
8. 而请求工具又要考虑区分 开发环境和生产环境的问题
9. 请求时还要考虑前后分离项目产生的跨域问题，要使用代理解决跨域

# 2. Vuex中用户模块的实现
> 登录流程中最核心的是用户模块，所以这部分我们单独拿出来进行重写。

代码位置(**src/store/modules/user.js**)

- 删除原有模板中用户模块中的内容
- 导出Vuex子模块-声明一个状态token
```javascript
const state = {
  token: null
}
const mutations = {}
const actions = {}
export default {
   namespaced: true,
   state,
   mutations,
   actions
}
```

- 实现token的Vue数据持久化
```javascript
import { getToken, setToken, removeToken } from '@/utils/auth'
const state = {
  token: getToken(), // 从缓存中读取初始值
}
const mutations = {
  setToken(state, token) {
    state.token = token
    // 同步到缓存
    setToken(token)
  },
  removeToken(state) {
    // 删除Vuex的token
    state.token = null
    removeToken()
  }
}
export default {
  namespaced: true, // 开启命名空间
  state,
  mutations,
  actions
}

```

- 实现登录的action方法
```javascript
const actions = {
  // context上下文，传入参数
  async login(context, data) {
    console.log(data)
    // todo: 调用登录接口
    const token = await login(data)
    // 返回一个token 123456
    context.commit('setToken', token)
  },
}
```

- 在登录组件中调用该action方法-代码位置(**src/views/login/index.vue**)
```javascript

export default {
  methods: {
    login() {
      this.$refs.form.validate((isOK) => {
        if (isOK) {
          this.$store.dispatch("user/login", this.loginForm)
        }
      })
    }
  }
}
```
注意： 因为user模块导出的时候**namespaced为true**，所以我们调用action的时候要加上模块名称如**user/login**

# 3.Vue-cli代理解决跨域
> 上个小节，完成了Vuex用户模块的创建和持久化管理，现在已经调通了 **登录页面- action，**继续往下需要处理
> **请求模块-axios封装-跨域-区分环境**

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677661659053-a46470bb-38f9-4483-b685-d2f0236e57b0.png#averageHue=%23fdfdfd&clientId=u60b73d67-62d7-4&from=paste&height=489&id=u35c19420&name=image.png&originHeight=978&originWidth=2126&originalType=binary&ratio=2&rotation=0&showTitle=false&size=105804&status=done&style=none&taskId=u7a1f8bf3-efc3-423c-9e69-a4aa46593ee&title=&width=1063)
> 我们要先把跨域问题解决才能考虑其他内容的开发

- 首先为什么会有跨域？

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677662325286-e15c499c-44a2-47cc-a1ea-47ce323facaa.png#averageHue=%23fcfafa&clientId=u60b73d67-62d7-4&from=paste&height=192&id=u4817e2b5&name=image.png&originHeight=384&originWidth=2048&originalType=binary&ratio=2&rotation=0&showTitle=false&size=63802&status=done&style=none&taskId=u6b4945fa-b4cd-4b9f-8493-723a76b20e5&title=&width=1024)
> 在后端没有开启cors的情况下，浏览器的同源策略会直接限制后端返回的数据给到前端。这是因为我们目前所有的项目都是前后分离，前端一个服务， 后端一个服务，后端不开cors只能前端自己想办法。

- 代理是怎么解决跨域的？

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677662514280-7a5ed512-57e7-4de3-825d-d8c352d679ec.png#averageHue=%23fefdfd&clientId=u60b73d67-62d7-4&from=paste&height=237&id=u0b790914&name=image.png&originHeight=474&originWidth=2184&originalType=binary&ratio=2&rotation=0&showTitle=false&size=63966&status=done&style=none&taskId=u007d9723-528d-4b10-9bd6-3112c660518&title=&width=1092)
> 既然前端不能直接请求后端服务，那就搞个中间服务，中间服务刚好和我们的前端服务同源，前端和中间服务可以通信，而中间服务是node, node后台向后端发请求是不受同源策略影响的，因为**同源策略只针对浏览器！！！**， 这样就是代理，中间层的服务将前端的请求代理给了后端接口。


- 具体怎么做呢？
> 跨域有开发环境跨域和生产环境跨域，我们最后上线的时候要考虑生产环境跨域，目前只需要考虑开发环境。

- 配置文件可以直接配置代理 vue.config.js
```javascript
  devServer: {
    port: port,
    open: true,
    overlay: {
      warnings: false,
      errors: true
    },
    proxy: {
      '/api': {
        target: 'https://heimahr.itheima.net'
      }
    }
    // before: require('./mock/mock-server.js')
  },
```
注意： 要去掉before这个选项，这个是mock数据，会影响到我们的请求，并且修改完成之后要重启服务。

# 4.axios封装
> 完成了代理跨域，就可以考虑axios的封装了。

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677662862226-ebc76111-3217-4661-b28a-c8a9e0dd74f0.png#averageHue=%23fefefe&clientId=u60b73d67-62d7-4&from=paste&height=455&id=u171f33b0&name=image.png&originHeight=910&originWidth=2100&originalType=binary&ratio=2&rotation=0&showTitle=false&size=104541&status=done&style=none&taskId=u2e9c8f87-99d2-4f82-a8e0-8dbcc53c4d6&title=&width=1050)

> axios封装主要封装做哪些呢？

- 基础地址，超时时间
- 请求拦截器-统一注入token
- 响应拦截器-解构数据-处理异常

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677663057762-d0653812-73be-4885-a00c-50eaf3dee4cf.png#averageHue=%23fefefe&clientId=u60b73d67-62d7-4&from=paste&height=342&id=u88b463ee&name=image.png&originHeight=684&originWidth=2220&originalType=binary&ratio=2&rotation=0&showTitle=false&size=65900&status=done&style=none&taskId=ub38fd5da-3be4-4093-8c49-aa729540ae8&title=&width=1110)

- axios的基础功能

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677663248416-25147092-dcd4-46e1-bae4-1084ac8e73f7.png#averageHue=%23fdfdfd&clientId=u60b73d67-62d7-4&from=paste&height=472&id=u0ddd8983&name=image.png&originHeight=944&originWidth=2326&originalType=binary&ratio=2&rotation=0&showTitle=false&size=112419&status=done&style=none&taskId=uc141a243-4f29-46de-b123-8e55a3c6b0b&title=&width=1163)

代码位置(src/utils/request.js)
```javascript
import axios from 'axios'
import store from '@/store'
const service = axios.create({
  baseURL: '/api',
  timeout: 10000,
})

service.interceptors.request.use((config) => {
  // 注入token
//  this.$store.getters
  // store.getters.token => 请求头里面
  if (store.getters.token) {
    config.headers.Authorization = `Bearer ${store.getters.token}`
  }
  return config
}, (error) => {
  // 失败执行promise
  return Promise.reject(error)
})
// 响应拦截器
service.interceptors.response.use((response) => {
  const { data, message, success } = response.data // 默认json格式
  if (success) {
    return data
  } else {
    Message({ type: 'error', message })
    return Promise.reject(new Error(message))
  }
}, async(error) => {
  // error.message
  Message({ type: 'error', message: error.message })
  return Promise.reject(error)
})

export default service
```
# 5.环境区分

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677667090171-7e569091-0544-49f4-9a22-7195ba55c0a9.png#averageHue=%23fcfbfa&clientId=u60b73d67-62d7-4&from=paste&height=472&id=ude3f8172&name=image.png&originHeight=944&originWidth=1924&originalType=binary&ratio=2&rotation=0&showTitle=false&size=101249&status=done&style=none&taskId=u8140d293-c9b4-4e82-b712-9b3215251a8&title=&width=962)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677667212785-bfc5de9c-ee4e-4ab8-9ea5-549a137f3c91.png#averageHue=%23faf8f7&clientId=u60b73d67-62d7-4&from=paste&height=462&id=u34f9b1c2&name=image.png&originHeight=924&originWidth=2288&originalType=binary&ratio=2&rotation=0&showTitle=false&size=246988&status=done&style=none&taskId=ucca3d918-64eb-486f-a922-0b4d238b77e&title=&width=1144)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677667227525-9d0d6876-080a-4938-a664-ed8e9f50f632.png#averageHue=%23fbf7f6&clientId=u60b73d67-62d7-4&from=paste&height=237&id=ub1cbea1a&name=image.png&originHeight=474&originWidth=2296&originalType=binary&ratio=2&rotation=0&showTitle=false&size=76755&status=done&style=none&taskId=u77d14dc1-31a4-4998-8a9c-8f4a45ba3e5&title=&width=1148)

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677667385734-95592eb6-e236-4b05-8e32-8c65df2367cd.png#averageHue=%23b6b6b6&clientId=u60b73d67-62d7-4&from=paste&height=261&id=u6858a56b&name=image.png&originHeight=522&originWidth=2386&originalType=binary&ratio=2&rotation=0&showTitle=false&size=163061&status=done&style=none&taskId=u6f71d26e-e56b-4507-b0c1-d89f7eab5f5&title=&width=1193)

- 将.env.development中的值改为 /api 作为请求工具的基础地址
- **process.env.VUE_APP_BASE_API **的表示读取该变量，npm run dev时该变量为 /api,  npm run build:prod时 该变量为 /prod-api

# 6. 登录联调
> 目前登录功能只剩下红色的部分还需要

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677724539500-9e9b1f76-4220-4a35-aa55-539cab4e6993.png#averageHue=%23fdfdfd&clientId=u60b73d67-62d7-4&from=paste&height=525&id=u7f1c3b73&name=image.png&originHeight=1050&originWidth=2454&originalType=binary&ratio=2&rotation=0&showTitle=false&size=122291&status=done&style=none&taskId=u444becba-25d5-4f15-8ce8-df53b507e35&title=&width=1227)

- 首先封装登录的API请求-代码位置(**src/api/user.js**)
```javascript
import request from '@/utils/request'

export function login(data) {
  return request({
    url: '/sys/login',
    method: 'post',
    data
  })
}
```

- Vuex中的用户模块调用登录接口-代码位置(**src/store/modules/user.js**)
```javascript
const actions = {
  // context上下文，传入参数
  async login(context, data) {
    console.log(data)
    // todo: 调用登录接口
    const token = await login(data)
    // 返回一个token 123456
    context.commit('setToken', token)
  }
}
```

- 登录成功后，跳转到主页-代码位置(**src/views/login/index.vue**)
```javascript
  methods: {
    login() {
      this.$refs.form.validate(async(isOK) => {
        if (isOK) {
          await this.$store.dispatch('user/login', this.loginForm)
          // Vuex 中的action 返回的promise
          // 跳转主页
          this.$router.push('/')
        }
      })
    }
  }
```

- 区分不同环境的数据-代码位置(**src/views/login/index.vue**)
> 因为开发环境为了便利，我们将用户的账户信息和密码都默认写在了页面上，但是真正的项目我们不可能将数据进行暴露出去，所以在生产环境时应该将 用户的手机号和密码抹去

```javascript
export default {
  name: 'Login',
  data() {
    return {
      loginForm: {
        mobile: process.env.NODE_ENV === 'development' ? '13800000002' : '',
        password: process.env.NODE_ENV === 'development' ? '123456' : '',
        isAgree: process.env.NODE_ENV === 'development'
      }
    }
  }
}
```
# 7.主页权限验证-鉴权
> 当前项目用户是否有权限访问主页，要考虑当前有没有token,  如果有token, 用户还想去登录页，我们可以直接去主页-这个就是免登录功能。有token的情况下，直接到主页。

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677725185117-bd3bdb5d-9ab0-498d-a8cf-9fabf878054e.png#averageHue=%23fcf8f3&clientId=u60b73d67-62d7-4&from=paste&height=510&id=ub052895c&name=image.png&originHeight=1020&originWidth=2602&originalType=binary&ratio=2&rotation=0&showTitle=false&size=128698&status=done&style=none&taskId=u94ebd235-1fc4-41ac-8abe-0de345cfade&title=&width=1301)

- 访问主页-有token放过，没有token跳到登录页
- 访问登录-有token跳到主页，没有token放过

代码实现-代码位置(**src/pemission.js**)
```javascript
import router from '@/router'
import nprogress from 'nprogress'
import 'nprogress/nprogress.css'
import store from '@/store'

/**
 *前置守卫
 *
*/

const whiteList = ['/login', '/404']
router.beforeEach(async(to, from, next) => {
  nprogress.start()
  if (store.getters.token) {
    // 存在token
    if (to.path === '/login') {
      // 跳转到主页
      next('/') // 中转到主页
      // next（地址）并没有执行后置守卫
      nprogress.done()
    } else {
       next() // 放行
    }
  } else {
    // 没有token
    if (whiteList.includes(to.path)) {
      next()
    } else {
      next('/login') // 中转到登录页
      nprogress.done()
    }
  }
})

/** *
 * 后置守卫
 * **/
router.afterEach(() => {
  nprogress.done()
})

```
