# 1.权限应用-拆分静态路由-动态路由![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677837267385-362b4b13-53e2-4c5a-b340-8fa439bb0102.png#averageHue=%2387b52f&clientId=u7263e634-8cc4-4&from=paste&height=142&id=ue8c221fc&name=image.png&originHeight=284&originWidth=2104&originalType=binary&ratio=2&rotation=0&showTitle=false&size=65290&status=done&style=none&taskId=ubc162632-8ffc-4931-a6dd-b169dd1caa7&title=&width=1052)
- 将静态路由和动态路由进行拆分-代码位置(**src/router/index.js**)
```javascript
import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

/* Layout */
import Layout from '@/layout'
import departmentRouter from './modules/department'
import approvalRouter from './modules/approval'
import attendanceRouter from './modules/attendance'
import employeeRouter from './modules/employee'
import permissionRouter from './modules/permission'
import roleRouter from './modules/role'
import salaryRouter from './modules/salary'
import socialRouter from './modules/social'

/**
 * Note: sub-menu only appear when route children.length >= 1
 * Detail see: https://panjiachen.github.io/vue-element-admin-site/guide/essentials/router-and-nav.html
 *
 * hidden: true                   if set true, item will not show in the sidebar(default is false)
 * alwaysShow: true               if set true, will always show the root menu
 *                                if not set alwaysShow, when item has more than one children route,
 *                                it will becomes nested mode, otherwise not show the root menu
 * redirect: noRedirect           if set noRedirect will no redirect in the breadcrumb
 * name:'router-name'             the name is used by <keep-alive> (must set!!!)
 * meta : {
    roles: ['admin','editor']    control the page roles (you can set multiple roles)
    title: 'title'               the name show in sidebar and breadcrumb (recommend set)
    icon: 'svg-name'/'el-icon-x' the icon show in the sidebar
    breadcrumb: false            if set false, the item will hidden in breadcrumb(default is true)
    activeMenu: '/example/list'  if set path, the sidebar will highlight the path you set
  }
 */

/**
 * constantRoutes
 * a base page that does not have permission requirements
 * all roles can be accessed
 */
export const constantRoutes = [
  {
    path: '/login',
    component: () => import('@/views/login/index'),
    hidden: true
  },

  {
    path: '/404',
    component: () => import('@/views/404'),
    hidden: true
  },

  {
    path: '/',
    component: Layout,
    redirect: '/dashboard',
    children: [{
      path: 'dashboard',
      name: 'Dashboard',
      component: () => import('@/views/dashboard/index'),
      meta: { title: '首页', icon: 'dashboard' }
    }]
  },

  // 404 page must be placed at the end !!!
  { path: '*', redirect: '/404', hidden: true }
]
// 动态路由
export const asyncRoutes = [
  departmentRouter,
  roleRouter,
  employeeRouter,
  permissionRouter,
  attendanceRouter,
  approvalRouter,
  salaryRouter,
  socialRouter]
const createRouter = () => new Router({
  // mode: 'history', // require service support
  scrollBehavior: () => ({ y: 0 }),
  routes: constantRoutes // 默认引入静态路由
})

const router = createRouter()

// Detail see: https://github.com/vuejs/vue-router/issues/1234#issuecomment-357941465
export function resetRouter() {
  const newRouter = createRouter()
  router.matcher = newRouter.matcher // reset router
}

export default router
```
# 2.权限应用-根据用户权限添加动态路由
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677837731510-005dbaaa-416c-4c49-9f8b-113fb9a94dc0.png#averageHue=%23b6c3d8&clientId=u7263e634-8cc4-4&from=paste&height=77&id=ucc320e85&name=image.png&originHeight=154&originWidth=1902&originalType=binary&ratio=2&rotation=0&showTitle=false&size=41749&status=done&style=none&taskId=u6ef51489-2a69-4172-ad97-64fe4e08bb9&title=&width=951)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677837769508-38e7a1df-4f64-4a2b-8b6a-f235b906d385.png#averageHue=%23f3f2e3&clientId=u7263e634-8cc4-4&from=paste&height=221&id=u1e9e9009&name=image.png&originHeight=442&originWidth=1586&originalType=binary&ratio=2&rotation=0&showTitle=false&size=117596&status=done&style=none&taskId=u8b008797-782d-4f74-bd59-ade11a34dd3&title=&width=793)
怎么匹配?

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677837804419-cfcccd44-207b-48c6-9d82-4567c0d91e1d.png#averageHue=%23b7b1b0&clientId=u7263e634-8cc4-4&from=paste&height=193&id=ue8c001dc&name=image.png&originHeight=544&originWidth=1556&originalType=binary&ratio=2&rotation=0&showTitle=false&size=173238&status=done&style=none&taskId=u81c10b5d-52ce-48fc-8807-eb2cbfcfa2c&title=&width=552)
 

- Vuex用户模块action中返回result信息
```javascript
async getUserInfo(context) {
    const result = await getUserInfo()
    context.commit('setUserInfo', result)
    return result // 返回数据
}
```

- 权限拦截处筛选-添加路由-代码位置(**src/permission.js**)
```javascript
import router from '@/router'
import nprogress from 'nprogress'
import 'nprogress/nprogress.css'
import store from '@/store'
import { asyncRoutes } from '@/router'

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
      // 判断是否获取过资料
      if (!store.getters.userId) {
        const { roles } = await store.dispatch('user/getUserInfo')
        // console.log(roles.menus) // 数组 不确定 可能是8个 1个 0个
        // console.log(asyncRoutes) // 数组 8个
        const filterRoutes = asyncRoutes.filter(item => {
          // return true/false
          return roles.menus.includes(item.name)
        }) // 筛选后的路由
        router.addRoutes([...filterRoutes, { path: '*', redirect: '/404', hidden: true }]) // 添加动态路由信息到路由表
        // router添加动态路由之后 需要转发一下
        next(to.path) // 目的是让路由拥有信息 router的已知缺陷
      } else {
        next() // 放过
      }
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
  console.log('123')
  nprogress.done()
})
```

- 删除静态路由中的404-代码位置(**src/router/index.js**)
```javascript
/**
 * constantRoutes
 * a base page that does not have permission requirements
 * all roles can be accessed
 */
export const constantRoutes = [
  {
    path: '/login',
    component: () => import('@/views/login/index'),
    hidden: true
  },

  {
    path: '/404',
    component: () => import('@/views/404'),
    hidden: true
  },

  {
    path: '/',
    component: Layout,
    redirect: '/dashboard',
    children: [{
      path: 'dashboard',
      name: 'Dashboard',
      component: () => import('@/views/dashboard/index'),
      meta: { title: '首页', icon: 'dashboard' }
    }]
  }
]
```

- 针对每个路由模块的配置文件添加name属性，和权限的数据进行对应。

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677841628970-275b0590-2bb5-4dfe-acf2-be0e27a8639a.png#averageHue=%2320201f&clientId=u7263e634-8cc4-4&from=paste&height=360&id=udf3c79a2&name=image.png&originHeight=720&originWidth=912&originalType=binary&ratio=2&rotation=0&showTitle=false&size=2631609&status=done&style=none&taskId=u9fc3ac0d-3e77-40e8-8b5e-33dec9da53b&title=&width=456)

# 3.权限应用-根据权限显示左侧菜单
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677841660021-7d71de2c-3efd-4fe4-8b9d-4c3604b27b7a.png#averageHue=%23b2c3da&clientId=u7263e634-8cc4-4&from=paste&height=74&id=ua420e34c&name=image.png&originHeight=148&originWidth=1956&originalType=binary&ratio=2&rotation=0&showTitle=false&size=42716&status=done&style=none&taskId=u06f15b91-6abe-4316-b814-2257fbbe792&title=&width=978)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677841668181-45ecf5df-9a74-4264-af59-1c97a855eb12.png#averageHue=%23c2d898&clientId=u7263e634-8cc4-4&from=paste&height=62&id=u369753b3&name=image.png&originHeight=124&originWidth=1946&originalType=binary&ratio=2&rotation=0&showTitle=false&size=40489&status=done&style=none&taskId=ub6f008d8-e7d0-41e6-965e-75aa1b70165&title=&width=973)

- Vuex中的user模块添加state管理-代码位置(**src/store/modules/user.js**)
```javascript
import { getToken, setToken, removeToken } from '@/utils/auth'
import { login, getUserInfo } from '@/api/user'
import { constantRoutes } from '@/router'
const state = {
  token: getToken(), // 从缓存中读取初始值
  userInfo: {}, // 存储用户基本资料状态
  routes: constantRoutes // 静态路由的数组
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
  },
  setUserInfo(state, userInfo) {
    state.userInfo = userInfo
  },
  setRoutes(state, newRoutes) {
    state.routes = [...constantRoutes, ...newRoutes] // 静态路由 + 动态路由
  }
}

const actions = {
  // context上下文，传入参数
  async login(context, data) {
    console.log(data)
    // todo: 调用登录接口
    const token = await login(data)
    // 返回一个token 123456
    context.commit('setToken', token)
  },
  // 获取用户的基本资料
  async getUserInfo(context) {
    const result = await getUserInfo()
    context.commit('setUserInfo', result)
    return result // 返回数据
  },
  // 退出登录的action
  logout(context) {
    context.commit('removeToken') // 删除token
    context.commit('setUserInfo', {}) // 设置用户信息为空对象
  }
}

export default {
  namespaced: true, // 开启命名空间
  state,
  mutations,
  actions
}

```

- 筛选路由后，更新state信息-代码位置(**src/permission.js**)
```javascript
import router from '@/router'
import nprogress from 'nprogress'
import 'nprogress/nprogress.css'
import store from '@/store'
import { asyncRoutes } from '@/router'

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
      // 判断是否获取过资料
      if (!store.getters.userId) {
        const { roles } = await store.dispatch('user/getUserInfo')
        // console.log(roles.menus) // 数组 不确定 可能是8个 1个 0个
        // console.log(asyncRoutes) // 数组 8个
        const filterRoutes = asyncRoutes.filter(item => {
          // return true/false
          return roles.menus.includes(item.name)
        }) // 筛选后的路由
        store.commit('user/setRoutes', filterRoutes)
        router.addRoutes([...filterRoutes, { path: '*', redirect: '/404', hidden: true }]) // 添加动态路由信息到路由表
        // router添加动态路由之后 需要转发一下
        next(to.path) // 目的是让路由拥有信息 router的已知缺陷
      } else {
        next() // 放过
      }
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
  console.log('123')
  nprogress.done()
})

```

- 使用getters开放路由的访问信息-代码位置(**src/store/getters.js**)
```javascript
const getters = {
  sidebar: state => state.app.sidebar,
  device: state => state.app.device,
  token: state => state.user.token,
  userId: state => state.user.userInfo.userId,
  avatar: state => state.user.userInfo.staffPhoto, // 头像
  name: state => state.user.userInfo.username, // 用户名称
  routes: state => state.user.routes
}
export default getters

```

- 左侧菜单组件读取Vuex中的路由信息-代码位置(**src/layout/components/Sidebar/index.vue**)
```javascript
export default {
  components: { SidebarItem, Logo },
  computed: {
    ...mapGetters([
      'sidebar', 'routes'
    ]),
    // 路由信息的计算属性
    // routes() {
    //   // 返回所有的路由信息
    //   return this.$router.options.routes
    // },
  }
}
```
# 4.权限应用-退出登录重置路由
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677842226740-22a33f8b-07ef-4b0b-9355-c0ec534e054a.png#averageHue=%23c3daec&clientId=u7263e634-8cc4-4&from=paste&height=161&id=ud762b032&name=image.png&originHeight=322&originWidth=2080&originalType=binary&ratio=2&rotation=0&showTitle=false&size=63016&status=done&style=none&taskId=u9b5a91e3-3151-4f1d-a1ab-075e69da7a1&title=&width=1040)

- 退出登录时-重置路由-代码位置(**src/store/modules/user.js**)
```javascript
import { resetRouter } from '@/router'

// 退出登录的action
  logout(context) {
    context.commit('removeToken') // 删除token
    context.commit('setUserInfo', {}) // 设置用户信息为空对象
    // 重置路由
    resetRouter()
  }
```
# 5.权限应用-功能权限-按钮权限标识
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677842344977-b73028d0-80af-44c0-9e09-e8a9b67f3425.png#averageHue=%23ccdded&clientId=u7263e634-8cc4-4&from=paste&height=97&id=uadb0999b&name=image.png&originHeight=194&originWidth=2032&originalType=binary&ratio=2&rotation=0&showTitle=false&size=42103&status=done&style=none&taskId=u8d202f40-29f8-48c7-afee-311f8cdc3e8&title=&width=1016)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677842355723-0eff0601-376c-45cf-b42e-0ea5e93cbd57.png#averageHue=%23fdfcfc&clientId=u7263e634-8cc4-4&from=paste&height=78&id=ua2ff0d96&name=image.png&originHeight=156&originWidth=1764&originalType=binary&ratio=2&rotation=0&showTitle=false&size=31994&status=done&style=none&taskId=u415690ec-966e-428f-b4a6-f4a9c4b64be&title=&width=882)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677842380628-1434b24b-89e9-4c3e-bccf-68d32a813860.png#averageHue=%23fbfafa&clientId=u7263e634-8cc4-4&from=paste&height=213&id=u4d91064d&name=image.png&originHeight=426&originWidth=2108&originalType=binary&ratio=2&rotation=0&showTitle=false&size=122946&status=done&style=none&taskId=ubc8ca504-c1d6-4fc4-ab16-f29be8087b1&title=&width=1054)

# 6.权限应用-自定义指令应用功能权限

- 自定义指令- 作用在按钮上-所有的按钮都可以直接使用 

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677842430909-125e2e00-04ad-42f5-80c4-613e011df381.png#averageHue=%23b7cadf&clientId=u7263e634-8cc4-4&from=paste&height=105&id=u4b9311f4&name=image.png&originHeight=210&originWidth=2000&originalType=binary&ratio=2&rotation=0&showTitle=false&size=52947&status=done&style=none&taskId=u661c63ae-4204-423a-bfce-79d3b5f05e7&title=&width=1000)

- 封装自定义指令-代码位置(**src/main.js**)
```javascript
// 封装自定义指令 用来控制操作权
Vue.directive('permission', {
  // 会在指令作用的元素插入到页面完成以后触发
  inserted(el, binding) {
    // el 指令作用的元素的dom对象
    console.log(el)
    const points = store.state.user.userInfo?.roles?.points || [] // 当前用户信息的操作权
    if (!points.includes(binding.value)) {
      // 不存在就要删除或者禁用
      el.remove() // 删除元素
      // el.disabled = true
      // 线上的权限数据和线下的代码进行对应
    }
  }

})
```

- 应用自定义指令-代码位置(**src/views/employee/index.vue**)
```html
<el-button v-permission="'add-employee'" size="mini" type="primary" @click="$router.push('/employee/detail')">添加员工</el-button>

```
# 7.其他模块-集成
> 素材中，已经给大家提供了 其他模块的请求/路由/组件，只需要拷贝到src即可

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677842585521-1e44b21e-ef19-4da0-bad9-c165b33b4943.png#averageHue=%23fefefe&clientId=u7263e634-8cc4-4&from=paste&height=233&id=u0f7ea842&name=image.png&originHeight=466&originWidth=1738&originalType=binary&ratio=2&rotation=0&showTitle=false&size=50191&status=done&style=none&taskId=u9bac4787-8df2-4eb5-874e-0145000c4ef&title=&width=869)
# 8.首页-基本结构和数字滚动
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677842602093-69c9d8b8-a1e8-4de3-9967-7ed13d290c54.png#averageHue=%23fdfcfc&clientId=u7263e634-8cc4-4&from=paste&height=350&id=u70122223&name=image.png&originHeight=700&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=3590573&status=done&style=none&taskId=u489a86d0-f0d3-4014-8230-b396124f0f8&title=&width=640)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677842611362-377890c1-5b28-46ad-9e1a-8d837922354a.png#averageHue=%2393bbdc&clientId=u7263e634-8cc4-4&from=paste&height=195&id=u8582ddd7&name=image.png&originHeight=390&originWidth=658&originalType=binary&ratio=2&rotation=0&showTitle=false&size=45652&status=done&style=none&taskId=ua7a565c2-d8e0-46e0-a5a3-44294b2899d&title=&width=329)
  

- 基本结构-代码位置(**src/views/dashboard/index.vue**)
```vue
<template>
  <div class="dashboard">
    <div class="container">
      <!-- 左侧内容 -->
      <div class="left">
        <div class="panel">
          <!-- 个人信息 -->
          <div class="user-info">
            <img class="avatar" src="../../assets/common/defaultHead.png" alt="">
            <div class="company-info">
              <div class="title">
                江苏传智播客教育科技股份有限公司
                <span>体验版</span>
              </div>
              <div class="depart">庆山 ｜ 传智播客-总裁办</div>
            </div>
          </div>
          <!-- 代办 -->
          <div class="todo-list">
            <div class="todo-item">
              <span>组织总人数</span>
              <!-- 起始值 终点值  滚动时间 -->
              <span>228</span>
            </div>
            <div class="todo-item">
              <span>正式员工</span>
               <span>334</span>
            </div>
            <div class="todo-item">
              <span>合同待签署</span>
               <span>345</span>
            </div>
            <div class="todo-item">
              <span>待入职</span>
               <span>890</span>
            </div>
            <div class="todo-item">
              <span>本月待转正</span>
               <span>117</span>
            </div>
            <div class="todo-item">
              <span>本月待离职</span>
              <span>234</span>
            </div>
            <div class="todo-item">
              <span>接口总访问</span>
               <span>789</span>
            </div>
          </div>
        </div>
        <!-- 快捷入口 -->
        <div class="panel">
          <div class="panel-title">快捷入口</div>
          <div class="quick-entry">
            <div class="entry-item">
              <div class="entry-icon approval" />
              <span>假期审批</span>
            </div>
            <div class="entry-item">
              <div class="entry-icon social" />
              <span>社保管理</span>
            </div>
            <div class="entry-item">
              <div class="entry-icon role" />
              <span>角色管理</span>
            </div>
            <div class="entry-item">
              <div class="entry-icon salary" />
              <span>薪资设置</span>
            </div>
            <div class="entry-item">
              <div class="entry-icon bpm" />
              <span>流程设置</span>
            </div>
          </div>
        </div>
        <!-- 图表数据 -->
        <div class="panel">
          <div class="panel-title">社保申报数据</div>
          <div class="chart-container">
            <div class="chart-info">
              <div class="info-main">
                <span>申报人数</span>
                <span>223</span>
              </div>
              <div class="info-list">
                <div class="info-list-item">
                  <span>待申报(人)</span>
                   <span>117</span>
                </div>
                <div class="info-list-item">
                  <span>申报中(人)</span>
                   <span>167</span>
                </div>
                <div class="info-list-item">
                  <span>已申报(人)</span>
                   <span>24</span>
                </div>
              </div>
            </div>
            <div class="chart">
              <!-- 图表 -->
            </div>
          </div>
        </div>
        <!-- 图表数据 -->
        <div class="panel">
          <div class="panel-title">公积金申报数据</div>
          <div class="chart-container">
            <div class="chart-info">
              <div class="info-main">
                <span>申报人数</span>
                 <span>335</span>
              </div>
              <div class="info-list">
                <div class="info-list-item">
                  <span>待申报(人)</span>
                   <span>345</span>
                </div>
                <div class="info-list-item">
                  <span>申报中(人)</span>
                   <span>109</span>
                </div>
                <div class="info-list-item">
                  <span>已申报(人)</span>
                   <span>77</span>
                </div>
              </div>
            </div>
            <div class="chart">
              <!-- 图表 -->
            </div>
          </div>
        </div>
      </div>
      <!-- 右侧内容 -->
      <div class="right">
        <!-- 帮助链接 -->
        <div class="panel">
          <div class="help">
            <div class="help-left">
              <div class="panel-title">帮助链接</div>
              <div class="help-list">
                <div class="help-block">
                  <i class="icon-entry" />
                  入门指南
                </div>
                <div class="help-block">
                  <i class="icon-help" />
                  在线帮助手册
                </div>
                <div class="help-block">
                  <i class="icon-support" />
                  联系技术支持
                </div>
                <div class="help-block">
                  <i class="icon-add" />
                  添加链接
                </div>
              </div>
            </div>
            <div class="help-right">
              <div class="calendar">
                <!-- <el-calendar /> -->
                <el-calendar />
              </div>
            </div>
          </div>
        </div>
        <!-- 通知公告 -->
        <div class="panel">
          <div class="panel-title">通知公告</div>
          <div class="information-list">
            <div class="information-list-item">
              <img src="@/assets/common/img.jpeg" alt="">
              <div>
                <p>
                  <span class="col">朱继柳</span> 发布了
                  第1期“传智大讲堂”互动讨论获奖名单公布
                </p>
                <p>2018-07-21 15:21:38</p>
              </div>
            </div>
            <div class="information-list-item">
              <img src="@/assets/common/img.jpeg" alt="">
              <div>
                <p>
                  <span class="col">朱继柳</span> 发布了
                  第1期“传智大讲堂”互动讨论获奖名单公布
                </p>
                <p>2018-07-21 15:21:38</p>
              </div>
            </div>
            <div class="information-list-item">
              <img src="@/assets/common/img.jpeg" alt="">
              <div>
                <p>
                  <span class="col">朱继柳</span> 发布了
                  第1期“传智大讲堂”互动讨论获奖名单公布
                </p>
                <p>2018-07-21 15:21:38</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import CountTo from 'vue-count-to'
export default {
  components: {
    CountTo
  }
}
</script>

<style scoped lang="scss">
.dashboard {
  background: #f5f6f8;
  width: 100%;
  min-height: calc(100vh - 80px);

  ::v-deep .el-calendar-day {
  height:  40px;
 }
 ::v-deep .el-calendar-table__row td,::v-deep .el-calendar-table tr td:first-child, ::v-deep .el-calendar-table__row td.prev{
  border:none;
 }
.date-content {
  height: 40px;
  text-align: center;
  line-height: 40px;
  font-size: 14px;
}
.date-content .rest {
  color: #fff;
  border-radius: 50%;
  background: rgb(250, 124, 77);
  width: 20px;
  height: 20px;
  line-height: 20px;
  display: inline-block;
  font-size: 12px;
  margin-left: 10px;
}
.date-content .text{
  width: 20px;
  height: 20px;
  line-height: 20px;
 display: inline-block;

}
::v-deep .el-calendar-table td.is-selected .text{
   background: #409eff;
   color: #fff;
   border-radius: 50%;
 }
 ::v-deep .el-calendar__header {
   display: none
 }
  .container {
    display: flex;
    .right {
      width: 40%;
      .panel {
        margin-left: 8px;
      }
      :nth-child(1) {
        margin-top: 0;
      }
    }
    .left {
      flex: 1;
      :nth-child(1) {
        margin-top: 0;
      }
    }
    .panel {
      background-color: #fff;

      margin-top: 8px;
      padding: 20px;
      .panel-title {
        font-size: 16px;
        color: #383c4e;
        font-weight: 500;
      }
      // 用户信息样式
      .user-info {
        display: flex;
        .avatar {
          width: 48px;
          height: 48px;
          border-radius: 12px;
          background-color: #d9d9d9;
          line-height: 48px;
          text-align: center;
        }
         .username {
           width: 30px;
           height: 30px;
           text-align: center;
           line-height: 30px;
           border-radius: 50%;
           background: #04c9be;
           color: #fff;
           margin-right: 4px;
         }
        .company-info {
          margin-left: 10px;
          height: 48px;
          display: flex;
          flex-direction: column;
          justify-content: space-around;
          .title {
            color: #383c4e;
            font-weight: 500;
            font-size: 16px;
            font-family: PingFang SC, PingFang SC-Medium;
            span {
              font-size: 12px;
              background: #f5f6f8;
              text-align: center;
              padding: 2px 8px;
              border-radius: 2px;
              color: #697086;
            }
          }
          .depart {
            font-size: 14px;
            color: #697086;
            font-weight: 400;
          }
        }
      }
      // 代办样式
      .todo-list {
        margin-top: 10px;
        display: flex;
        flex-wrap: wrap;
        .todo-item {
          width: 18%;
          height: 90px;
          display: flex;
          flex-direction: column;
          padding: 10px;
          justify-content: space-around;
          :nth-child(1) {
            color: #697086;
            font-size: 14px;
          }
          :nth-child(2) {
            color: #383c4e;
            font-size: 30px;
            font-weight: 500;
          }
        }
      }
      // 快捷入口
      .quick-entry {
        margin-top: 16px;
        display: flex;
        .entry-item {
          display: flex;
          flex-direction: column;
          align-items: center;
          margin-left: 60px;
          &:nth-child(1) {
            margin-left: 0px;
          }
          .entry-icon {
            width: 40px;
            height: 40px;
            border-radius: 10px;
            background: #f5f6f8;
            background-size: cover;
            &.approval {
              background-image: url('~@/assets/common/approval.png');
            }
             &.social {
              background-image: url('~@/assets/common/social.png');
            }
             &.salary {
              background-image: url('~@/assets/common/salary.png');
            }
            &.role {
              background-image: url('~@/assets/common/role.png');
            }
             &.bpm {
              background-image: url('~@/assets/common/bpm.png');
            }
          }
          span {
            color: #697086;
            font-size: 14px;
            margin-top: 8px;
          }
        }
      }
      // 图表数据
      .chart-container {
        display: flex;
        .chart-info {
         width: 240px;
          margin-top: 10px;
          .info-main {
            padding: 10px;
            display: flex;
            flex-direction: column;
            :nth-child(1) {
              font-size: 14px;
              color: #697086;
            }
            :nth-child(2) {
              margin-top: 10px;
              font-size: 30px;
              color: #04c9be;
              font-weight: 500;
            }
          }
          .info-list {
            background: #f5f6f8;
            border-radius: 4px;
            padding: 12px 15px;
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            .info-list-item {
              width: 50%;
              margin-top: 10px;
              display: flex;
              flex-direction: column;

              :nth-child(1) {
                font-size: 14px;
                color: #697086;
              }
              :nth-child(2) {
                margin-top: 10px;
                font-size: 30px;
                color: #383c4e;
                font-weight: 500;
              }
            }
          }
        }
        .chart {
          flex:1
        }
      }
      // 帮助链接
      .help {
        display: flex;
        .help-left {
          width: 40%;
        }
        .help-right {
          flex: 1;
        }
        .help-list {
          .help-block {
            background: #f5f6f8;
            border-radius: 4px;
            width: 264px;
            height: 54px;
            padding: 17px 10px;
            font-size: 14px;
            color: #697086;
            margin-top: 10px;
            i {
              width: 14px;
              height: 14px;
              display: inline-block;
              background-size: cover;
              vertical-align: middle;
            }
            i.icon-help {
              background-image: url("~@/assets/common/help.png");
            }
             i.icon-support {
              background-image: url("~@/assets/common/support.png");
            }
             i.icon-add {
              background-image: url("~@/assets/common/add.png");
            }
             i.icon-entry {
              background-image: url("~@/assets/common/entry.png");
            }
          }
        }
      }
      // 通知公告
      .information-list {
        margin-top: 20px;
        .information-list-item {
          display: flex;
          align-items: center;
          margin:15px 0;
          img {
            width: 40px;
            height: 40px;
            border: 50%;
          }
         .col {
           color: #8a97f8;
         }
         div :nth-child(2) {
          color: #697086;
          font-size: 14px;
         }
        }
      }
    }
  }
}
</style>

```

- 安装数字滚动插件-vue-count-to
```bash
$ npm i vue-count-to
```

- 首页基本结构-代码位置(**src/views/dashboard/index.vue**)
```vue
<template>
  <div class="dashboard">
    <div class="container">
      <!-- 左侧内容 -->
      <div class="left">
        <div class="panel">
          <!-- 个人信息 -->
          <div class="user-info">
            <img class="avatar" src="../../assets/common/defaultHead.png" alt="">
            <div class="company-info">
              <div class="title">
                江苏传智播客教育科技股份有限公司
                <span>体验版</span>
              </div>
              <div class="depart">庆山 ｜ 传智播客-总裁办</div>
            </div>
          </div>
          <!-- 代办 -->
          <div class="todo-list">
            <div class="todo-item">
              <span>组织总人数</span>
              <!-- 起始值 终点值  滚动时间 -->
              <count-to
                :start-val="0"
                :end-val="228"
                :duration="1000"
              />
            </div>
            <div class="todo-item">
              <span>正式员工</span>
              <count-to
                :start-val="0"
                :end-val="334"
                :duration="1000"
              />
            </div>
            <div class="todo-item">
              <span>合同待签署</span>
              <count-to
                :start-val="0"
                :end-val="345"
                :duration="1000"
              />
            </div>
            <div class="todo-item">
              <span>待入职</span>
              <count-to
                :start-val="0"
                :end-val="890"
                :duration="1000"
              />            </div>
            <div class="todo-item">
              <span>本月待转正</span>
              <count-to
                :start-val="0"
                :end-val="117"
                :duration="1000"
              />
            </div>
            <div class="todo-item">
              <span>本月待离职</span>
              <count-to
                :start-val="0"
                :end-val="234"
                :duration="1000"
              />
            </div>
            <div class="todo-item">
              <span>接口总访问</span>
              <count-to
                :start-val="0"
                :end-val="789"
                :duration="1000"
              />
            </div>
          </div>
        </div>
        <!-- 快捷入口 -->
        <div class="panel">
          <div class="panel-title">快捷入口</div>
          <div class="quick-entry">
            <div class="entry-item">
              <div class="entry-icon approval" />
              <span>假期审批</span>
            </div>
            <div class="entry-item">
              <div class="entry-icon social" />
              <span>社保管理</span>
            </div>
            <div class="entry-item">
              <div class="entry-icon role" />
              <span>角色管理</span>
            </div>
            <div class="entry-item">
              <div class="entry-icon salary" />
              <span>薪资设置</span>
            </div>
            <div class="entry-item">
              <div class="entry-icon bpm" />
              <span>流程设置</span>
            </div>
          </div>
        </div>
        <!-- 图表数据 -->
        <div class="panel">
          <div class="panel-title">社保申报数据</div>
          <div class="chart-container">
            <div class="chart-info">
              <div class="info-main">
                <span>申报人数</span>
                <count-to
                  :start-val="0"
                  :end-val="223"
                  :duration="1000"
                />

              </div>
              <div class="info-list">
                <div class="info-list-item">
                  <span>待申报(人)</span>
                  <count-to
                    :start-val="0"
                    :end-val="117"
                    :duration="1000"
                  />
                </div>
                <div class="info-list-item">
                  <span>申报中(人)</span>
                  <count-to
                    :start-val="0"
                    :end-val="167"
                    :duration="1000"
                  />
                </div>
                <div class="info-list-item">
                  <span>已申报(人)</span>
                  <count-to
                    :start-val="0"
                    :end-val="24"
                    :duration="1000"
                  />
                </div>
              </div>
            </div>
            <div class="chart">
              <!-- 图表 -->
            </div>
          </div>
        </div>
        <!-- 图表数据 -->
        <div class="panel">
          <div class="panel-title">公积金申报数据</div>
          <div class="chart-container">
            <div class="chart-info">
              <div class="info-main">
                <span>申报人数</span>
                <count-to
                  :start-val="0"
                  :end-val="335"
                  :duration="1000"
                />
              </div>
              <div class="info-list">
                <div class="info-list-item">
                  <span>待申报(人)</span>
                  <count-to
                    :start-val="0"
                    :end-val="345"
                    :duration="1000"
                  />
                </div>
                <div class="info-list-item">
                  <span>申报中(人)</span>
                  <count-to
                    :start-val="0"
                    :end-val="109"
                    :duration="1000"
                  />
                </div>
                <div class="info-list-item">
                  <span>已申报(人)</span>
                  <count-to
                    :start-val="0"
                    :end-val="77"
                    :duration="1000"
                  />
                </div>
              </div>
            </div>
            <div class="chart">
              <!-- 图表 -->
            </div>
          </div>
        </div>
      </div>
      <!-- 右侧内容 -->
      <div class="right">
        <!-- 帮助链接 -->
        <div class="panel">
          <div class="help">
            <div class="help-left">
              <div class="panel-title">帮助链接</div>
              <div class="help-list">
                <div class="help-block">
                  <i class="icon-entry" />
                  入门指南
                </div>
                <div class="help-block">
                  <i class="icon-help" />
                  在线帮助手册
                </div>
                <div class="help-block">
                  <i class="icon-support" />
                  联系技术支持
                </div>
                <div class="help-block">
                  <i class="icon-add" />
                  添加链接
                </div>
              </div>
            </div>
            <div class="help-right">
              <div class="calendar">
                <!-- <el-calendar /> -->
                <el-calendar />
              </div>
            </div>
          </div>
        </div>
        <!-- 通知公告 -->
        <div class="panel">
          <div class="panel-title">通知公告</div>
          <div class="information-list">
            <div class="information-list-item">
              <img src="@/assets/common/img.jpeg" alt="">
              <div>
                <p>
                  <span class="col">朱继柳</span> 发布了
                  第1期“传智大讲堂”互动讨论获奖名单公布
                </p>
                <p>2018-07-21 15:21:38</p>
              </div>
            </div>
            <div class="information-list-item">
              <img src="@/assets/common/img.jpeg" alt="">
              <div>
                <p>
                  <span class="col">朱继柳</span> 发布了
                  第1期“传智大讲堂”互动讨论获奖名单公布
                </p>
                <p>2018-07-21 15:21:38</p>
              </div>
            </div>
            <div class="information-list-item">
              <img src="@/assets/common/img.jpeg" alt="">
              <div>
                <p>
                  <span class="col">朱继柳</span> 发布了
                  第1期“传智大讲堂”互动讨论获奖名单公布
                </p>
                <p>2018-07-21 15:21:38</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import CountTo from 'vue-count-to'
export default {
  components: {
    CountTo
  }
}
</script>

<style scoped lang="scss">
.dashboard {
  background: #f5f6f8;
  width: 100%;
  min-height: calc(100vh - 80px);

  ::v-deep .el-calendar-day {
  height:  40px;
 }
 ::v-deep .el-calendar-table__row td,::v-deep .el-calendar-table tr td:first-child, ::v-deep .el-calendar-table__row td.prev{
  border:none;
 }
.date-content {
  height: 40px;
  text-align: center;
  line-height: 40px;
  font-size: 14px;
}
.date-content .rest {
  color: #fff;
  border-radius: 50%;
  background: rgb(250, 124, 77);
  width: 20px;
  height: 20px;
  line-height: 20px;
  display: inline-block;
  font-size: 12px;
  margin-left: 10px;
}
.date-content .text{
  width: 20px;
  height: 20px;
  line-height: 20px;
 display: inline-block;

}
::v-deep .el-calendar-table td.is-selected .text{
   background: #409eff;
   color: #fff;
   border-radius: 50%;
 }
 ::v-deep .el-calendar__header {
   display: none
 }
  .container {
    display: flex;
    .right {
      width: 40%;
      .panel {
        margin-left: 8px;
      }
      :nth-child(1) {
        margin-top: 0;
      }
    }
    .left {
      flex: 1;
      :nth-child(1) {
        margin-top: 0;
      }
    }
    .panel {
      background-color: #fff;

      margin-top: 8px;
      padding: 20px;
      .panel-title {
        font-size: 16px;
        color: #383c4e;
        font-weight: 500;
      }
      // 用户信息样式
      .user-info {
        display: flex;
        .avatar {
          width: 48px;
          height: 48px;
          border-radius: 12px;
          background-color: #d9d9d9;
          line-height: 48px;
          text-align: center;
        }
         .username {
           width: 30px;
           height: 30px;
           text-align: center;
           line-height: 30px;
           border-radius: 50%;
           background: #04c9be;
           color: #fff;
           margin-right: 4px;
         }
        .company-info {
          margin-left: 10px;
          height: 48px;
          display: flex;
          flex-direction: column;
          justify-content: space-around;
          .title {
            color: #383c4e;
            font-weight: 500;
            font-size: 16px;
            font-family: PingFang SC, PingFang SC-Medium;
            span {
              font-size: 12px;
              background: #f5f6f8;
              text-align: center;
              padding: 2px 8px;
              border-radius: 2px;
              color: #697086;
            }
          }
          .depart {
            font-size: 14px;
            color: #697086;
            font-weight: 400;
          }
        }
      }
      // 代办样式
      .todo-list {
        margin-top: 10px;
        display: flex;
        flex-wrap: wrap;
        .todo-item {
          width: 18%;
          height: 90px;
          display: flex;
          flex-direction: column;
          padding: 10px;
          justify-content: space-around;
          :nth-child(1) {
            color: #697086;
            font-size: 14px;
          }
          :nth-child(2) {
            color: #383c4e;
            font-size: 30px;
            font-weight: 500;
          }
        }
      }
      // 快捷入口
      .quick-entry {
        margin-top: 16px;
        display: flex;
        .entry-item {
          display: flex;
          flex-direction: column;
          align-items: center;
          margin-left: 60px;
          &:nth-child(1) {
            margin-left: 0px;
          }
          .entry-icon {
            width: 40px;
            height: 40px;
            border-radius: 10px;
            background: #f5f6f8;
            background-size: cover;
            &.approval {
              background-image: url('~@/assets/common/approval.png');
            }
             &.social {
              background-image: url('~@/assets/common/social.png');
            }
             &.salary {
              background-image: url('~@/assets/common/salary.png');
            }
            &.role {
              background-image: url('~@/assets/common/role.png');
            }
             &.bpm {
              background-image: url('~@/assets/common/bpm.png');
            }
          }
          span {
            color: #697086;
            font-size: 14px;
            margin-top: 8px;
          }
        }
      }
      // 图表数据
      .chart-container {
        display: flex;
        .chart-info {
         width: 240px;
          margin-top: 10px;
          .info-main {
            padding: 10px;
            display: flex;
            flex-direction: column;
            :nth-child(1) {
              font-size: 14px;
              color: #697086;
            }
            :nth-child(2) {
              margin-top: 10px;
              font-size: 30px;
              color: #04c9be;
              font-weight: 500;
            }
          }
          .info-list {
            background: #f5f6f8;
            border-radius: 4px;
            padding: 12px 15px;
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            .info-list-item {
              width: 50%;
              margin-top: 10px;
              display: flex;
              flex-direction: column;

              :nth-child(1) {
                font-size: 14px;
                color: #697086;
              }
              :nth-child(2) {
                margin-top: 10px;
                font-size: 30px;
                color: #383c4e;
                font-weight: 500;
              }
            }
          }
        }
        .chart {
          flex:1
        }
      }
      // 帮助链接
      .help {
        display: flex;
        .help-left {
          width: 40%;
        }
        .help-right {
          flex: 1;
        }
        .help-list {
          .help-block {
            background: #f5f6f8;
            border-radius: 4px;
            width: 264px;
            height: 54px;
            padding: 17px 10px;
            font-size: 14px;
            color: #697086;
            margin-top: 10px;
            i {
              width: 14px;
              height: 14px;
              display: inline-block;
              background-size: cover;
              vertical-align: middle;
            }
            i.icon-help {
              background-image: url("~@/assets/common/help.png");
            }
             i.icon-support {
              background-image: url("~@/assets/common/support.png");
            }
             i.icon-add {
              background-image: url("~@/assets/common/add.png");
            }
             i.icon-entry {
              background-image: url("~@/assets/common/entry.png");
            }
          }
        }
      }
      // 通知公告
      .information-list {
        margin-top: 20px;
        .information-list-item {
          display: flex;
          align-items: center;
          margin:15px 0;
          img {
            width: 40px;
            height: 40px;
            border: 50%;
          }
         .col {
           color: #8a97f8;
         }
         div :nth-child(2) {
          color: #697086;
          font-size: 14px;
         }
        }
      }
    }
  }
}
</style>

```
# 9.首页-个人信息展示
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677842846685-0e94cd27-8fea-4e46-af58-95932dac12c9.png#averageHue=%23fefefe&clientId=u7263e634-8cc4-4&from=paste&height=129&id=u555e2bd8&name=image.png&originHeight=257&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=1318301&status=done&style=none&taskId=u4eca320b-7934-4c3d-a931-2757d930a6d&title=&width=640)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677842853819-7db359f6-20b9-4594-b403-a8e61c36e1dd.png#averageHue=%23bad4e9&clientId=u7263e634-8cc4-4&from=paste&height=203&id=u3413644d&name=image.png&originHeight=406&originWidth=1340&originalType=binary&ratio=2&rotation=0&showTitle=false&size=47226&status=done&style=none&taskId=u1817e000-b66d-44b1-8607-036064cb1ee&title=&width=670)

- 在getters中开放公司名称和所在部门属性-代码位置(**src/store/getters.js**)
```javascript
const getters = {
  sidebar: state => state.app.sidebar,
  device: state => state.app.device,
  token: state => state.user.token,
  userId: state => state.user.userInfo.userId,
  avatar: state => state.user.userInfo.staffPhoto, // 头像
  name: state => state.user.userInfo.username, // 用户名称
  routes: state => state.user.routes,
  company: state => state.user.userInfo.company, // 公司名称
  departmentName: state => state.user.userInfo.departmentName // 部门名称
}
export default getters

```

- 在首页将个人信息的数据替换成Vuex中的数据-代码位置(**src/views/dashboard/index.vue**)
```vue
<template>
  <div class="dashboard">
    <div class="container">
      <!-- 左侧内容 -->
      <div class="left">
        <div class="panel">
          <!-- 个人信息 -->
          <div class="user-info">
            <img v-if="avatar" class="avatar" :src="avatar" alt="">
            <span v-else class="username">{{ name?.charAt(0) }}</span>
            <div class="company-info">
              <div class="title">
                江苏传智播客教育科技股份有限公司
                <span>体验版</span>
              </div>
              <div class="depart">{{ name }} ｜ {{ company }}-{{ departmentName }}</div>
            </div>
          </div>
          <!-- 代办 -->
          <div class="todo-list">
            <div class="todo-item">
              <span>组织总人数</span>
              <!-- 起始值 终点值 动画时间 -->
              <count-to
                :start-val="0"
                :end-val="228"
                :duration="1000"
              />
            </div>
            <div class="todo-item">
              <span>正式员工</span>
              <count-to
                :start-val="0"
                :end-val="334"
                :duration="1000"
              />
            </div>
            <div class="todo-item">
              <span>合同待签署</span>
              <count-to
                :start-val="0"
                :end-val="345"
                :duration="1000"
              />
            </div>
            <div class="todo-item">
              <span>待入职</span>
              <count-to
                :start-val="0"
                :end-val="890"
                :duration="1000"
              />
            </div>
            <div class="todo-item">
              <span>本月待转正</span>
              <count-to
                :start-val="0"
                :end-val="117"
                :duration="1000"
              />
            </div>
            <div class="todo-item">
              <span>本月待离职</span>
              <count-to
                :start-val="0"
                :end-val="234"
                :duration="1000"
              />
            </div>
            <div class="todo-item">
              <span>接口总访问</span>
              <count-to
                :start-val="0"
                :end-val="789"
                :duration="1000"
              />
            </div>
          </div>
        </div>
        <!-- 快捷入口 -->
        <div class="panel">
          <div class="panel-title">快捷入口</div>
          <div class="quick-entry">
            <div class="entry-item">
              <div class="entry-icon approval" />
              <span>假期审批</span>
            </div>
            <div class="entry-item">
              <div class="entry-icon social" />
              <span>社保管理</span>
            </div>
            <div class="entry-item">
              <div class="entry-icon role" />
              <span>角色管理</span>
            </div>
            <div class="entry-item">
              <div class="entry-icon salary" />
              <span>薪资设置</span>
            </div>
            <div class="entry-item">
              <div class="entry-icon bpm" />
              <span>流程设置</span>
            </div>
          </div>
        </div>
        <!-- 图表数据 -->
        <div class="panel">
          <div class="panel-title">社保申报数据</div>
          <div class="chart-container">
            <div class="chart-info">
              <div class="info-main">
                <span>申报人数</span>
                <count-to
                  :start-val="0"
                  :end-val="223"
                  :duration="1000"
                />

              </div>
              <div class="info-list">
                <div class="info-list-item">
                  <span>待申报(人)</span>
                  <count-to
                    :start-val="0"
                    :end-val="117"
                    :duration="1000"
                  />
                </div>
                <div class="info-list-item">
                  <span>申报中(人)</span>
                  <count-to
                    :start-val="0"
                    :end-val="167"
                    :duration="1000"
                  />
                </div>
                <div class="info-list-item">
                  <span>已申报(人)</span>
                  <count-to
                    :start-val="0"
                    :end-val="24"
                    :duration="1000"
                  />
                </div>
              </div>
            </div>
            <div class="chart">
              <!-- 图表 -->
            </div>
          </div>
        </div>
        <!-- 图表数据 -->
        <div class="panel">
          <div class="panel-title">公积金申报数据</div>
          <div class="chart-container">
            <div class="chart-info">
              <div class="info-main">
                <span>申报人数</span>
                <count-to
                  :start-val="0"
                  :end-val="335"
                  :duration="1000"
                />
              </div>
              <div class="info-list">
                <div class="info-list-item">
                  <span>待申报(人)</span>
                  <count-to
                    :start-val="0"
                    :end-val="345"
                    :duration="1000"
                  />
                </div>
                <div class="info-list-item">
                  <span>申报中(人)</span>
                  <count-to
                    :start-val="0"
                    :end-val="109"
                    :duration="1000"
                  />
                </div>
                <div class="info-list-item">
                  <span>已申报(人)</span>
                  <count-to
                    :start-val="0"
                    :end-val="77"
                    :duration="1000"
                  />
                </div>
              </div>
            </div>
            <div class="chart">
              <!-- 图表 -->
            </div>
          </div>
        </div>
      </div>
      <!-- 右侧内容 -->
      <div class="right">
        <!-- 帮助链接 -->
        <div class="panel">
          <div class="help">
            <div class="help-left">
              <div class="panel-title">帮助链接</div>
              <div class="help-list">
                <div class="help-block">
                  <i class="icon-entry" />
                  入门指南
                </div>
                <div class="help-block">
                  <i class="icon-help" />
                  在线帮助手册
                </div>
                <div class="help-block">
                  <i class="icon-support" />
                  联系技术支持
                </div>
                <div class="help-block">
                  <i class="icon-add" />
                  添加链接
                </div>
              </div>
            </div>
            <div class="help-right">
              <div class="calendar">
                <!-- <el-calendar /> -->
                <el-calendar />
              </div>
            </div>
          </div>
        </div>
        <!-- 通知公告 -->
        <div class="panel">
          <div class="panel-title">通知公告</div>
          <div class="information-list">
            <div class="information-list-item">
              <img src="@/assets/common/img.jpeg" alt="">
              <div>
                <p>
                  <span class="col">朱继柳</span> 发布了
                  第1期“传智大讲堂”互动讨论获奖名单公布
                </p>
                <p>2018-07-21 15:21:38</p>
              </div>
            </div>
            <div class="information-list-item">
              <img src="@/assets/common/img.jpeg" alt="">
              <div>
                <p>
                  <span class="col">朱继柳</span> 发布了
                  第1期“传智大讲堂”互动讨论获奖名单公布
                </p>
                <p>2018-07-21 15:21:38</p>
              </div>
            </div>
            <div class="information-list-item">
              <img src="@/assets/common/img.jpeg" alt="">
              <div>
                <p>
                  <span class="col">朱继柳</span> 发布了
                  第1期“传智大讲堂”互动讨论获奖名单公布
                </p>
                <p>2018-07-21 15:21:38</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import CountTo from 'vue-count-to'
import { mapGetters } from 'vuex'
export default {
  components: {
    CountTo
  },
  // 计算属性
  computed: {
    ...mapGetters(['name', 'avatar', 'company', 'departmentName']) // 映射给了计算属性
  }
}
</script>

<style scoped lang="scss">
.dashboard {
  background: #f5f6f8;
  width: 100%;
  min-height: calc(100vh - 80px);

  ::v-deep .el-calendar-day {
  height:  40px;
 }
 ::v-deep .el-calendar-table__row td,::v-deep .el-calendar-table tr td:first-child, ::v-deep .el-calendar-table__row td.prev{
  border:none;
 }

.date-content {
  height: 40px;
  text-align: center;
  line-height: 40px;
  font-size: 14px;
}
.date-content .rest {
  color: #fff;
  border-radius: 50%;
  background: rgb(250, 124, 77);
  width: 20px;
  height: 20px;
  line-height: 20px;
  display: inline-block;
  font-size: 12px;
  margin-left: 10px;
}
.date-content .text{
  width: 20px;
  height: 20px;
  line-height: 20px;
 display: inline-block;

}
::v-deep .el-calendar-table td.is-selected .text{
   background: #409eff;
   color: #fff;
   border-radius: 50%;
 }
 ::v-deep .el-calendar__header {
   display: none
 }
  .container {
    display: flex;
    .right {
      width: 40%;
      .panel {
        margin-left: 8px;
      }
      :nth-child(1) {
        margin-top: 0;
      }
    }
    .left {
      flex: 1;
      :nth-child(1) {
        margin-top: 0;
      }
    }
    .panel {
      background-color: #fff;

      margin-top: 8px;
      padding: 20px;
      .panel-title {
        font-size: 16px;
        color: #383c4e;
        font-weight: 500;
      }
      // 用户信息样式
      .user-info {
        display: flex;
        .avatar {
          width: 48px;
          height: 48px;
          border-radius: 12px;
          background-color: #d9d9d9;
          line-height: 48px;
          text-align: center;
        }
         .username {
           width: 30px;
           height: 30px;
           text-align: center;
           line-height: 30px;
           border-radius: 50%;
           background: #04c9be;
           color: #fff;
           margin-right: 4px;
         }
        .company-info {
          margin-left: 10px;
          height: 48px;
          display: flex;
          flex-direction: column;
          justify-content: space-around;
          .title {
            color: #383c4e;
            font-weight: 500;
            font-size: 16px;
            font-family: PingFang SC, PingFang SC-Medium;
            span {
              font-size: 12px;
              background: #f5f6f8;
              text-align: center;
              padding: 2px 8px;
              border-radius: 2px;
              color: #697086;
            }
          }
          .depart {
            font-size: 14px;
            color: #697086;
            font-weight: 400;
          }
        }
      }
      // 代办样式
      .todo-list {
        margin-top: 10px;
        display: flex;
        flex-wrap: wrap;
        .todo-item {
          width: 18%;
          height: 90px;
          display: flex;
          flex-direction: column;
          padding: 10px;
          justify-content: space-around;
          :nth-child(1) {
            color: #697086;
            font-size: 14px;
          }
          :nth-child(2) {
            color: #383c4e;
            font-size: 30px;
            font-weight: 500;
          }
        }
      }
      // 快捷入口
      .quick-entry {
        margin-top: 16px;
        display: flex;
        .entry-item {
          display: flex;
          flex-direction: column;
          align-items: center;
          margin-left: 60px;
          &:nth-child(1) {
            margin-left: 0px;
          }
          .entry-icon {
            width: 40px;
            height: 40px;
            border-radius: 10px;
            background: #f5f6f8;
            background-size: cover;
            &.approval {
              background-image: url('~@/assets/common/approval.png');
            }
             &.social {
              background-image: url('~@/assets/common/social.png');
            }
             &.salary {
              background-image: url('~@/assets/common/salary.png');
            }
            &.role {
              background-image: url('~@/assets/common/role.png');
            }
             &.bpm {
              background-image: url('~@/assets/common/bpm.png');
            }
          }
          span {
            color: #697086;
            font-size: 14px;
            margin-top: 8px;
          }
        }
      }
      // 图表数据
      .chart-container {
        display: flex;
        .chart-info {
         width: 240px;
          margin-top: 10px;
          .info-main {
            padding: 10px;
            display: flex;
            flex-direction: column;
            :nth-child(1) {
              font-size: 14px;
              color: #697086;
            }
            :nth-child(2) {
              margin-top: 10px;
              font-size: 30px;
              color: #04c9be;
              font-weight: 500;
            }
          }
          .info-list {
            background: #f5f6f8;
            border-radius: 4px;
            padding: 12px 15px;
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            .info-list-item {
              width: 50%;
              margin-top: 10px;
              display: flex;
              flex-direction: column;

              :nth-child(1) {
                font-size: 14px;
                color: #697086;
              }
              :nth-child(2) {
                margin-top: 10px;
                font-size: 30px;
                color: #383c4e;
                font-weight: 500;
              }
            }
          }
        }
        .chart {
          flex:1
        }
      }
      // 帮助链接
      .help {
        display: flex;
        .help-left {
          width: 40%;
        }
        .help-right {
          flex: 1;
        }
        .help-list {
          .help-block {
            background: #f5f6f8;
            border-radius: 4px;
            width: 264px;
            height: 54px;
            padding: 17px 10px;
            font-size: 14px;
            color: #697086;
            margin-top: 10px;
            i {
              width: 14px;
              height: 14px;
              display: inline-block;
              background-size: cover;
              vertical-align: middle;
            }
            i.icon-help {
              background-image: url("~@/assets/common/help.png");
            }
             i.icon-support {
              background-image: url("~@/assets/common/support.png");
            }
             i.icon-add {
              background-image: url("~@/assets/common/add.png");
            }
             i.icon-entry {
              background-image: url("~@/assets/common/entry.png");
            }
          }
        }
      }
      // 通知公告
      .information-list {
        margin-top: 20px;
        .information-list-item {
          display: flex;
          align-items: center;
          margin:15px 0;
          img {
            width: 40px;
            height: 40px;
            border: 50%;
          }
         .col {
           color: #8a97f8;
         }
         div :nth-child(2) {
          color: #697086;
          font-size: 14px;
         }
        }
      }
    }
  }
}
</style>

```
# 10.首页-企业数据获取
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677843054300-72da7f93-499b-4318-aca2-e74ff746e97d.png#averageHue=%23fefefe&clientId=u7263e634-8cc4-4&from=paste&height=177&id=uf50584bc&name=image.png&originHeight=353&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=1810712&status=done&style=none&taskId=ua6766b2f-e2a4-4fa8-8a7c-87b899dbde0&title=&width=640)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677843204795-577dcf2b-9f28-4c79-a482-f8e9ceb7d17c.png#averageHue=%23b7d2e8&clientId=u7263e634-8cc4-4&from=paste&height=95&id=u3e78773a&name=image.png&originHeight=190&originWidth=1120&originalType=binary&ratio=2&rotation=0&showTitle=false&size=24883&status=done&style=none&taskId=ueeaf4a80-96e5-47c5-a99c-7bc5e8addd5&title=&width=560)

- 封装获取数据的API-代码位置(**src/api/home.js**)
```javascript
import request from '@/utils/request'

/**
 * 获取首页数据
 *
*/
export function getHomeData() {
  return request({
    url: '/home/data'
  })
}

```

- 初始化时获取数据，并替换企业数据-代码位置(**src/views/dashboard/index.vue**)
```vue
<template>
  <div class="dashboard">
    <div class="container">
      <!-- 左侧内容 -->
      <div class="left">
        <div class="panel">
          <!-- 个人信息 -->
          <div class="user-info">
            <img v-if="avatar" class="avatar" :src="avatar" alt="">
            <span v-else class="username">{{ name?.charAt(0) }}</span>
            <div class="company-info">
              <div class="title">
                江苏传智播客教育科技股份有限公司
                <span>体验版</span>
              </div>
              <div class="depart">{{ name }} ｜ {{ company }}-{{ departmentName }}</div>
            </div>
          </div>
          <!-- 代办 -->
          <div class="todo-list">
            <div class="todo-item">
              <span>组织总人数</span>
              <!-- 起始值 终点值 动画时间 -->
              <count-to
                :start-val="0"
                :end-val="homeData.employeeTotal"
                :duration="1000"
              />
            </div>
            <div class="todo-item">
              <span>正式员工</span>
              <count-to
                :start-val="0"
                :end-val="homeData.regularEmployeeTotal"
                :duration="1000"
              />
            </div>
            <div class="todo-item">
              <span>合同待签署</span>
              <count-to
                :start-val="0"
                :end-val="homeData.contractSignTotal"
                :duration="1000"
              />
            </div>
            <div class="todo-item">
              <span>待入职</span>
              <count-to
                :start-val="0"
                :end-val="homeData.toBeEmployed"
                :duration="1000"
              />
            </div>
            <div class="todo-item">
              <span>本月待转正</span>
              <count-to
                :start-val="0"
                :end-val="homeData.toBeConfirmed"
                :duration="1000"
              />
            </div>
            <div class="todo-item">
              <span>本月待离职</span>
              <count-to
                :start-val="0"
                :end-val="homeData.toBeDismissed"
                :duration="1000"
              />
            </div>
            <div class="todo-item">
              <span>接口总访问</span>
              <count-to
                :start-val="0"
                :end-val="homeData.interfaceAccessTotal"
                :duration="1000"
              />
            </div>
          </div>
        </div>
        <!-- 快捷入口 -->
        <div class="panel">
          <div class="panel-title">快捷入口</div>
          <div class="quick-entry">
            <div class="entry-item">
              <div class="entry-icon approval" />
              <span>假期审批</span>
            </div>
            <div class="entry-item">
              <div class="entry-icon social" />
              <span>社保管理</span>
            </div>
            <div class="entry-item">
              <div class="entry-icon role" />
              <span>角色管理</span>
            </div>
            <div class="entry-item">
              <div class="entry-icon salary" />
              <span>薪资设置</span>
            </div>
            <div class="entry-item">
              <div class="entry-icon bpm" />
              <span>流程设置</span>
            </div>
          </div>
        </div>
        <!-- 图表数据 -->
        <div class="panel">
          <div class="panel-title">社保申报数据</div>
          <div class="chart-container">
            <div class="chart-info">
              <div class="info-main">
                <span>申报人数</span>
                <!-- homeData: {} -->
                <count-to
                  :start-val="0"
                  :end-val="homeData.socialInsurance?.declarationTotal"
                  :duration="1000"
                />

              </div>
              <div class="info-list">
                <div class="info-list-item">
                  <span>待申报(人)</span>
                  <count-to
                    :start-val="0"
                    :end-val="homeData.socialInsurance?.toDeclareTotal"
                    :duration="1000"
                  />
                </div>
                <div class="info-list-item">
                  <span>申报中(人)</span>
                  <count-to
                    :start-val="0"
                    :end-val="homeData.socialInsurance?.declaringTotal"
                    :duration="1000"
                  />
                </div>
                <div class="info-list-item">
                  <span>已申报(人)</span>
                  <count-to
                    :start-val="0"
                    :end-val="homeData.socialInsurance?.declaredTotal"
                    :duration="1000"
                  />
                </div>
              </div>
            </div>
            <div class="chart">
              <!-- 图表 -->
            </div>
          </div>
        </div>
        <!-- 图表数据 -->
        <div class="panel">
          <div class="panel-title">公积金申报数据</div>
          <div class="chart-container">
            <div class="chart-info">
              <div class="info-main">
                <span>申报人数</span>
                <count-to
                  :start-val="0"
                  :end-val="homeData.providentFund?.declarationTotal"
                  :duration="1000"
                />
              </div>
              <div class="info-list">
                <div class="info-list-item">
                  <span>待申报(人)</span>
                  <count-to
                    :start-val="0"
                    :end-val="homeData.providentFund?.toDeclareTotal"
                    :duration="1000"
                  />
                </div>
                <div class="info-list-item">
                  <span>申报中(人)</span>
                  <count-to
                    :start-val="0"
                    :end-val="homeData.providentFund?.declaringTotal"
                    :duration="1000"
                  />
                </div>
                <div class="info-list-item">
                  <span>已申报(人)</span>
                  <count-to
                    :start-val="0"
                    :end-val="homeData.providentFund?.declaredTotal"
                    :duration="1000"
                  />
                </div>
              </div>
            </div>
            <div class="chart">
              <!-- 图表 -->
            </div>
          </div>
        </div>
      </div>
      <!-- 右侧内容 -->
      <div class="right">
        <!-- 帮助链接 -->
        <div class="panel">
          <div class="help">
            <div class="help-left">
              <div class="panel-title">帮助链接</div>
              <div class="help-list">
                <div class="help-block">
                  <i class="icon-entry" />
                  入门指南
                </div>
                <div class="help-block">
                  <i class="icon-help" />
                  在线帮助手册
                </div>
                <div class="help-block">
                  <i class="icon-support" />
                  联系技术支持
                </div>
                <div class="help-block">
                  <i class="icon-add" />
                  添加链接
                </div>
              </div>
            </div>
            <div class="help-right">
              <div class="calendar">
                <!-- <el-calendar /> -->
                <el-calendar />
              </div>
            </div>
          </div>
        </div>
        <!-- 通知公告 -->
        <div class="panel">
          <div class="panel-title">通知公告</div>
          <div class="information-list">
            <div class="information-list-item">
              <img src="@/assets/common/img.jpeg" alt="">
              <div>
                <p>
                  <span class="col">朱继柳</span> 发布了
                  第1期“传智大讲堂”互动讨论获奖名单公布
                </p>
                <p>2018-07-21 15:21:38</p>
              </div>
            </div>
            <div class="information-list-item">
              <img src="@/assets/common/img.jpeg" alt="">
              <div>
                <p>
                  <span class="col">朱继柳</span> 发布了
                  第1期“传智大讲堂”互动讨论获奖名单公布
                </p>
                <p>2018-07-21 15:21:38</p>
              </div>
            </div>
            <div class="information-list-item">
              <img src="@/assets/common/img.jpeg" alt="">
              <div>
                <p>
                  <span class="col">朱继柳</span> 发布了
                  第1期“传智大讲堂”互动讨论获奖名单公布
                </p>
                <p>2018-07-21 15:21:38</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import CountTo from 'vue-count-to'
import { mapGetters } from 'vuex'
import { getHomeData } from '@/api/home'
export default {
  components: {
    CountTo
  },
  data() {
    return {
      homeData: {} // 存放首页数据的对象
    }
  },
  // 计算属性
  computed: {
    ...mapGetters(['name', 'avatar', 'company', 'departmentName']) // 映射给了计算属性
  },
  created() {
    this.getHomeData()
  },
  methods: {
    async getHomeData() {
      this.homeData = await getHomeData()
    }
  }
}
</script>

<style scoped lang="scss">
.dashboard {
  background: #f5f6f8;
  width: 100%;
  min-height: calc(100vh - 80px);

  ::v-deep .el-calendar-day {
  height:  40px;
 }
 ::v-deep .el-calendar-table__row td,::v-deep .el-calendar-table tr td:first-child, ::v-deep .el-calendar-table__row td.prev{
  border:none;
 }

.date-content {
  height: 40px;
  text-align: center;
  line-height: 40px;
  font-size: 14px;
}
.date-content .rest {
  color: #fff;
  border-radius: 50%;
  background: rgb(250, 124, 77);
  width: 20px;
  height: 20px;
  line-height: 20px;
  display: inline-block;
  font-size: 12px;
  margin-left: 10px;
}
.date-content .text{
  width: 20px;
  height: 20px;
  line-height: 20px;
 display: inline-block;

}
::v-deep .el-calendar-table td.is-selected .text{
   background: #409eff;
   color: #fff;
   border-radius: 50%;
 }
 ::v-deep .el-calendar__header {
   display: none
 }
  .container {
    display: flex;
    .right {
      width: 40%;
      .panel {
        margin-left: 8px;
      }
      :nth-child(1) {
        margin-top: 0;
      }
    }
    .left {
      flex: 1;
      :nth-child(1) {
        margin-top: 0;
      }
    }
    .panel {
      background-color: #fff;

      margin-top: 8px;
      padding: 20px;
      .panel-title {
        font-size: 16px;
        color: #383c4e;
        font-weight: 500;
      }
      // 用户信息样式
      .user-info {
        display: flex;
        .avatar {
          width: 48px;
          height: 48px;
          border-radius: 12px;
          background-color: #d9d9d9;
          line-height: 48px;
          text-align: center;
        }
         .username {
           width: 30px;
           height: 30px;
           text-align: center;
           line-height: 30px;
           border-radius: 50%;
           background: #04c9be;
           color: #fff;
           margin-right: 4px;
         }
        .company-info {
          margin-left: 10px;
          height: 48px;
          display: flex;
          flex-direction: column;
          justify-content: space-around;
          .title {
            color: #383c4e;
            font-weight: 500;
            font-size: 16px;
            font-family: PingFang SC, PingFang SC-Medium;
            span {
              font-size: 12px;
              background: #f5f6f8;
              text-align: center;
              padding: 2px 8px;
              border-radius: 2px;
              color: #697086;
            }
          }
          .depart {
            font-size: 14px;
            color: #697086;
            font-weight: 400;
          }
        }
      }
      // 代办样式
      .todo-list {
        margin-top: 10px;
        display: flex;
        flex-wrap: wrap;
        .todo-item {
          width: 18%;
          height: 90px;
          display: flex;
          flex-direction: column;
          padding: 10px;
          justify-content: space-around;
          :nth-child(1) {
            color: #697086;
            font-size: 14px;
          }
          :nth-child(2) {
            color: #383c4e;
            font-size: 30px;
            font-weight: 500;
          }
        }
      }
      // 快捷入口
      .quick-entry {
        margin-top: 16px;
        display: flex;
        .entry-item {
          display: flex;
          flex-direction: column;
          align-items: center;
          margin-left: 60px;
          &:nth-child(1) {
            margin-left: 0px;
          }
          .entry-icon {
            width: 40px;
            height: 40px;
            border-radius: 10px;
            background: #f5f6f8;
            background-size: cover;
            &.approval {
              background-image: url('~@/assets/common/approval.png');
            }
             &.social {
              background-image: url('~@/assets/common/social.png');
            }
             &.salary {
              background-image: url('~@/assets/common/salary.png');
            }
            &.role {
              background-image: url('~@/assets/common/role.png');
            }
             &.bpm {
              background-image: url('~@/assets/common/bpm.png');
            }
          }
          span {
            color: #697086;
            font-size: 14px;
            margin-top: 8px;
          }
        }
      }
      // 图表数据
      .chart-container {
        display: flex;
        .chart-info {
         width: 240px;
          margin-top: 10px;
          .info-main {
            padding: 10px;
            display: flex;
            flex-direction: column;
            :nth-child(1) {
              font-size: 14px;
              color: #697086;
            }
            :nth-child(2) {
              margin-top: 10px;
              font-size: 30px;
              color: #04c9be;
              font-weight: 500;
            }
          }
          .info-list {
            background: #f5f6f8;
            border-radius: 4px;
            padding: 12px 15px;
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            .info-list-item {
              width: 50%;
              margin-top: 10px;
              display: flex;
              flex-direction: column;

              :nth-child(1) {
                font-size: 14px;
                color: #697086;
              }
              :nth-child(2) {
                margin-top: 10px;
                font-size: 30px;
                color: #383c4e;
                font-weight: 500;
              }
            }
          }
        }
        .chart {
          flex:1
        }
      }
      // 帮助链接
      .help {
        display: flex;
        .help-left {
          width: 40%;
        }
        .help-right {
          flex: 1;
        }
        .help-list {
          .help-block {
            background: #f5f6f8;
            border-radius: 4px;
            width: 264px;
            height: 54px;
            padding: 17px 10px;
            font-size: 14px;
            color: #697086;
            margin-top: 10px;
            i {
              width: 14px;
              height: 14px;
              display: inline-block;
              background-size: cover;
              vertical-align: middle;
            }
            i.icon-help {
              background-image: url("~@/assets/common/help.png");
            }
             i.icon-support {
              background-image: url("~@/assets/common/support.png");
            }
             i.icon-add {
              background-image: url("~@/assets/common/add.png");
            }
             i.icon-entry {
              background-image: url("~@/assets/common/entry.png");
            }
          }
        }
      }
      // 通知公告
      .information-list {
        margin-top: 20px;
        .information-list-item {
          display: flex;
          align-items: center;
          margin:15px 0;
          img {
            width: 40px;
            height: 40px;
            border: 50%;
          }
         .col {
           color: #8a97f8;
         }
         div :nth-child(2) {
          color: #697086;
          font-size: 14px;
         }
        }
      }
    }
  }
}
</style>

```

# 11.首页-通知消息获取
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677843227806-a1ebe4e4-2cf6-4d20-ad70-6283b36fd121.png#averageHue=%23f7f6f6&clientId=u7263e634-8cc4-4&from=paste&height=235&id=ud2461ec2&name=image.png&originHeight=469&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=2405714&status=done&style=none&taskId=u42750aa0-17da-41da-a891-4f0b855ea98&title=&width=640)

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677843235182-7f22d6c0-afdb-4660-b7b8-402cb8fcbf71.png#averageHue=%23bdd6ea&clientId=u7263e634-8cc4-4&from=paste&height=105&id=ub1ff82c1&name=image.png&originHeight=210&originWidth=1130&originalType=binary&ratio=2&rotation=0&showTitle=false&size=21771&status=done&style=none&taskId=uf96d532b-c7f7-4b08-9de2-aaab6c7af11&title=&width=565)

- 封装获取消息的API-代码位置(**src/api/home.js**)
```javascript
export function getMessageList() {
  return request({
    url: '/home/notice'
  })
}
```

- 初始化时获取消息列表-代码位置(**src/views/dashboard/index.vue**)
```vue
<template>
  <div class="dashboard">
    <div class="container">
      <!-- 左侧内容 -->
      <div class="left">
        <div class="panel">
          <!-- 个人信息 -->
          <div class="user-info">
            <img v-if="avatar" class="avatar" :src="avatar" alt="">
            <span v-else class="username">{{ name?.charAt(0) }}</span>
            <div class="company-info">
              <div class="title">
                江苏传智播客教育科技股份有限公司
                <span>体验版</span>
              </div>
              <div class="depart">{{ name }} ｜ {{ company }}-{{ departmentName }}</div>
            </div>
          </div>
          <!-- 代办 -->
          <div class="todo-list">
            <div class="todo-item">
              <span>组织总人数</span>
              <!-- 起始值 终点值 动画时间 -->
              <count-to
                :start-val="0"
                :end-val="homeData.employeeTotal"
                :duration="1000"
              />
            </div>
            <div class="todo-item">
              <span>正式员工</span>
              <count-to
                :start-val="0"
                :end-val="homeData.regularEmployeeTotal"
                :duration="1000"
              />
            </div>
            <div class="todo-item">
              <span>合同待签署</span>
              <count-to
                :start-val="0"
                :end-val="homeData.contractSignTotal"
                :duration="1000"
              />
            </div>
            <div class="todo-item">
              <span>待入职</span>
              <count-to
                :start-val="0"
                :end-val="homeData.toBeEmployed"
                :duration="1000"
              />
            </div>
            <div class="todo-item">
              <span>本月待转正</span>
              <count-to
                :start-val="0"
                :end-val="homeData.toBeConfirmed"
                :duration="1000"
              />
            </div>
            <div class="todo-item">
              <span>本月待离职</span>
              <count-to
                :start-val="0"
                :end-val="homeData.toBeDismissed"
                :duration="1000"
              />
            </div>
            <div class="todo-item">
              <span>接口总访问</span>
              <count-to
                :start-val="0"
                :end-val="homeData.interfaceAccessTotal"
                :duration="1000"
              />
            </div>
          </div>
        </div>
        <!-- 快捷入口 -->
        <div class="panel">
          <div class="panel-title">快捷入口</div>
          <div class="quick-entry">
            <div class="entry-item">
              <div class="entry-icon approval" />
              <span>假期审批</span>
            </div>
            <div class="entry-item">
              <div class="entry-icon social" />
              <span>社保管理</span>
            </div>
            <div class="entry-item">
              <div class="entry-icon role" />
              <span>角色管理</span>
            </div>
            <div class="entry-item">
              <div class="entry-icon salary" />
              <span>薪资设置</span>
            </div>
            <div class="entry-item">
              <div class="entry-icon bpm" />
              <span>流程设置</span>
            </div>
          </div>
        </div>
        <!-- 图表数据 -->
        <div class="panel">
          <div class="panel-title">社保申报数据</div>
          <div class="chart-container">
            <div class="chart-info">
              <div class="info-main">
                <span>申报人数</span>
                <!-- homeData: {} -->
                <count-to
                  :start-val="0"
                  :end-val="homeData.socialInsurance?.declarationTotal"
                  :duration="1000"
                />

              </div>
              <div class="info-list">
                <div class="info-list-item">
                  <span>待申报(人)</span>
                  <count-to
                    :start-val="0"
                    :end-val="homeData.socialInsurance?.toDeclareTotal"
                    :duration="1000"
                  />
                </div>
                <div class="info-list-item">
                  <span>申报中(人)</span>
                  <count-to
                    :start-val="0"
                    :end-val="homeData.socialInsurance?.declaringTotal"
                    :duration="1000"
                  />
                </div>
                <div class="info-list-item">
                  <span>已申报(人)</span>
                  <count-to
                    :start-val="0"
                    :end-val="homeData.socialInsurance?.declaredTotal"
                    :duration="1000"
                  />
                </div>
              </div>
            </div>
            <div class="chart">
              <!-- 图表 -->
            </div>
          </div>
        </div>
        <!-- 图表数据 -->
        <div class="panel">
          <div class="panel-title">公积金申报数据</div>
          <div class="chart-container">
            <div class="chart-info">
              <div class="info-main">
                <span>申报人数</span>
                <count-to
                  :start-val="0"
                  :end-val="homeData.providentFund?.declarationTotal"
                  :duration="1000"
                />
              </div>
              <div class="info-list">
                <div class="info-list-item">
                  <span>待申报(人)</span>
                  <count-to
                    :start-val="0"
                    :end-val="homeData.providentFund?.toDeclareTotal"
                    :duration="1000"
                  />
                </div>
                <div class="info-list-item">
                  <span>申报中(人)</span>
                  <count-to
                    :start-val="0"
                    :end-val="homeData.providentFund?.declaringTotal"
                    :duration="1000"
                  />
                </div>
                <div class="info-list-item">
                  <span>已申报(人)</span>
                  <count-to
                    :start-val="0"
                    :end-val="homeData.providentFund?.declaredTotal"
                    :duration="1000"
                  />
                </div>
              </div>
            </div>
            <div class="chart">
              <!-- 图表 -->
            </div>
          </div>
        </div>
      </div>
      <!-- 右侧内容 -->
      <div class="right">
        <!-- 帮助链接 -->
        <div class="panel">
          <div class="help">
            <div class="help-left">
              <div class="panel-title">帮助链接</div>
              <div class="help-list">
                <div class="help-block">
                  <i class="icon-entry" />
                  入门指南
                </div>
                <div class="help-block">
                  <i class="icon-help" />
                  在线帮助手册
                </div>
                <div class="help-block">
                  <i class="icon-support" />
                  联系技术支持
                </div>
                <div class="help-block">
                  <i class="icon-add" />
                  添加链接
                </div>
              </div>
            </div>
            <div class="help-right">
              <div class="calendar">
                <!-- <el-calendar /> -->
                <el-calendar />
              </div>
            </div>
          </div>
        </div>
        <!-- 通知公告 -->
        <div class="panel">
          <div class="panel-title">通知公告</div>
          <div class="information-list">
            <div v-for="(item,index) in list" :key="index" class="information-list-item">
              <img :src="item.icon" alt="">
              <div>
                <p>
                  {{ item.notice }}
                </p>
                <p>{{ item.createTime }}</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import CountTo from 'vue-count-to'
import { mapGetters } from 'vuex'
import { getHomeData, getMessageList } from '@/api/home'
export default {
  components: {
    CountTo
  },
  data() {
    return {
      homeData: {}, // 存放首页数据的对象
      list: []
    }
  },
  // 计算属性
  computed: {
    ...mapGetters(['name', 'avatar', 'company', 'departmentName']) // 映射给了计算属性
  },
  created() {
    this.getHomeData()
    this.getMessageList()
  },
  methods: {
    async getHomeData() {
      this.homeData = await getHomeData()
    },
    async getMessageList() {
      this.list = await getMessageList()
    }
  }
}
</script>

<style scoped lang="scss">
.dashboard {
  background: #f5f6f8;
  width: 100%;
  min-height: calc(100vh - 80px);

  ::v-deep .el-calendar-day {
  height:  40px;
 }
 ::v-deep .el-calendar-table__row td,::v-deep .el-calendar-table tr td:first-child, ::v-deep .el-calendar-table__row td.prev{
  border:none;
 }

.date-content {
  height: 40px;
  text-align: center;
  line-height: 40px;
  font-size: 14px;
}
.date-content .rest {
  color: #fff;
  border-radius: 50%;
  background: rgb(250, 124, 77);
  width: 20px;
  height: 20px;
  line-height: 20px;
  display: inline-block;
  font-size: 12px;
  margin-left: 10px;
}
.date-content .text{
  width: 20px;
  height: 20px;
  line-height: 20px;
 display: inline-block;

}
::v-deep .el-calendar-table td.is-selected .text{
   background: #409eff;
   color: #fff;
   border-radius: 50%;
 }
 ::v-deep .el-calendar__header {
   display: none
 }
  .container {
    display: flex;
    .right {
      width: 40%;
      .panel {
        margin-left: 8px;
      }
      :nth-child(1) {
        margin-top: 0;
      }
    }
    .left {
      flex: 1;
      :nth-child(1) {
        margin-top: 0;
      }
    }
    .panel {
      background-color: #fff;

      margin-top: 8px;
      padding: 20px;
      .panel-title {
        font-size: 16px;
        color: #383c4e;
        font-weight: 500;
      }
      // 用户信息样式
      .user-info {
        display: flex;
        .avatar {
          width: 48px;
          height: 48px;
          border-radius: 12px;
          background-color: #d9d9d9;
          line-height: 48px;
          text-align: center;
        }
         .username {
           width: 30px;
           height: 30px;
           text-align: center;
           line-height: 30px;
           border-radius: 50%;
           background: #04c9be;
           color: #fff;
           margin-right: 4px;
         }
        .company-info {
          margin-left: 10px;
          height: 48px;
          display: flex;
          flex-direction: column;
          justify-content: space-around;
          .title {
            color: #383c4e;
            font-weight: 500;
            font-size: 16px;
            font-family: PingFang SC, PingFang SC-Medium;
            span {
              font-size: 12px;
              background: #f5f6f8;
              text-align: center;
              padding: 2px 8px;
              border-radius: 2px;
              color: #697086;
            }
          }
          .depart {
            font-size: 14px;
            color: #697086;
            font-weight: 400;
          }
        }
      }
      // 代办样式
      .todo-list {
        margin-top: 10px;
        display: flex;
        flex-wrap: wrap;
        .todo-item {
          width: 18%;
          height: 90px;
          display: flex;
          flex-direction: column;
          padding: 10px;
          justify-content: space-around;
          :nth-child(1) {
            color: #697086;
            font-size: 14px;
          }
          :nth-child(2) {
            color: #383c4e;
            font-size: 30px;
            font-weight: 500;
          }
        }
      }
      // 快捷入口
      .quick-entry {
        margin-top: 16px;
        display: flex;
        .entry-item {
          display: flex;
          flex-direction: column;
          align-items: center;
          margin-left: 60px;
          &:nth-child(1) {
            margin-left: 0px;
          }
          .entry-icon {
            width: 40px;
            height: 40px;
            border-radius: 10px;
            background: #f5f6f8;
            background-size: cover;
            &.approval {
              background-image: url('~@/assets/common/approval.png');
            }
             &.social {
              background-image: url('~@/assets/common/social.png');
            }
             &.salary {
              background-image: url('~@/assets/common/salary.png');
            }
            &.role {
              background-image: url('~@/assets/common/role.png');
            }
             &.bpm {
              background-image: url('~@/assets/common/bpm.png');
            }
          }
          span {
            color: #697086;
            font-size: 14px;
            margin-top: 8px;
          }
        }
      }
      // 图表数据
      .chart-container {
        display: flex;
        .chart-info {
         width: 240px;
          margin-top: 10px;
          .info-main {
            padding: 10px;
            display: flex;
            flex-direction: column;
            :nth-child(1) {
              font-size: 14px;
              color: #697086;
            }
            :nth-child(2) {
              margin-top: 10px;
              font-size: 30px;
              color: #04c9be;
              font-weight: 500;
            }
          }
          .info-list {
            background: #f5f6f8;
            border-radius: 4px;
            padding: 12px 15px;
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            .info-list-item {
              width: 50%;
              margin-top: 10px;
              display: flex;
              flex-direction: column;

              :nth-child(1) {
                font-size: 14px;
                color: #697086;
              }
              :nth-child(2) {
                margin-top: 10px;
                font-size: 30px;
                color: #383c4e;
                font-weight: 500;
              }
            }
          }
        }
        .chart {
          flex:1
        }
      }
      // 帮助链接
      .help {
        display: flex;
        .help-left {
          width: 40%;
        }
        .help-right {
          flex: 1;
        }
        .help-list {
          .help-block {
            background: #f5f6f8;
            border-radius: 4px;
            width: 264px;
            height: 54px;
            padding: 17px 10px;
            font-size: 14px;
            color: #697086;
            margin-top: 10px;
            i {
              width: 14px;
              height: 14px;
              display: inline-block;
              background-size: cover;
              vertical-align: middle;
            }
            i.icon-help {
              background-image: url("~@/assets/common/help.png");
            }
             i.icon-support {
              background-image: url("~@/assets/common/support.png");
            }
             i.icon-add {
              background-image: url("~@/assets/common/add.png");
            }
             i.icon-entry {
              background-image: url("~@/assets/common/entry.png");
            }
          }
        }
      }
      // 通知公告
      .information-list {
        margin-top: 20px;
        .information-list-item {
          display: flex;
          align-items: center;
          margin:15px 0;
          img {
            width: 40px;
            height: 40px;
            border: 50%;
          }
         .col {
           color: #8a97f8;
         }
         div :nth-child(2) {
          color: #697086;
          font-size: 14px;
         }
        }
      }
    }
  }
}
</style>

```
