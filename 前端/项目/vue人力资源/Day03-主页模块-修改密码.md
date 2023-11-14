# 1.获取用户资料在Vuex中共享
> 登录成功跳转到主页之后，可以获取用户资料，获取的资料在Vuex中共享，这样用户就可以很方便的获取该信息

- 获取流程

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677725540275-c70c9e46-288c-4179-89f5-5e2a953e5d0d.png#averageHue=%23fdfdfd&clientId=udd47902c-ce16-4&from=paste&height=402&id=uf4e4f455&name=image.png&originHeight=804&originWidth=2362&originalType=binary&ratio=2&rotation=0&showTitle=false&size=104056&status=done&style=none&taskId=u4ea30cb3-aba6-4f49-bf03-1d8bf2850c5&title=&width=1181)

- 在什么位置获取？

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677725622279-8e4d537d-81f3-41a9-9ae4-c9f779d5eea5.png#averageHue=%23fdf7f2&clientId=udd47902c-ce16-4&from=paste&height=519&id=ud26b11c7&name=image.png&originHeight=1038&originWidth=2604&originalType=binary&ratio=2&rotation=0&showTitle=false&size=139647&status=done&style=none&taskId=u041dfff2-10b4-4a0b-9d3b-49704dfa34e&title=&width=1302)
> 之前在导航守卫的位置，可以确定已经有了token，这个位置获取资料更佳，因为导航守卫在页面发生跳转时出发，这时不论你从何时何地进来，如果发现你没获取资料，都可以非常清楚直观的获取资料。判断条件也使得不会发生重复的加载。

- 封装获取用户资料的API-代码位置(**src/api/user.js**)
```javascript
export function getUserInfo() {
  return request({
    url: '/sys/profile'
  })
}
```

- Vuex中声明用户信息状态，修改用户信息的mutations， 和获取用户信息的action-代码位置(**src/store/modules/user.js**)
```javascript
const state = {
  token: getToken(),
  userInfo: {} // 这里有一个空对象，为了放置后面取数据报错
}

const mutations = {
  setUserInfo(state, userInfo) {
    state.userInfo = userInfo
  }
}
const actions = {
  async getUserInfo (context) {
    const result = await getUserInfo()
    context.commit("setUserInfo", result)
  }
}
```

- 通过getters声明userId(快捷访问)-代码位置(**src/store/getters.js**)
```javascript
const getters = {
  userId: state => state.user.userInfo.userId,
}
export default getters

```

- 在权限拦截处调用action-代码位置(**src/pemission.js**)
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
       if(!store.getters.userId) {
         await store.diapatch("user/getUserInfo")
       }
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


```

> 有同学会问，为什么用户信息不做持久化管理呢？ 不需要缓存吗？ 用户信息不同于token，token是当前用户的唯一标识，在几个小时内都是有效的，但是用户信息可能会进行修改或者发生变化，所以用户信息在一般的项目或者业务中不进行缓存。

# 2.显示用户头像和用户名

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677726529765-2fa2f60e-f387-4ec7-9e20-659cc85d91ef.png#averageHue=%23fefefe&clientId=udd47902c-ce16-4&from=paste&height=55&id=u7f3a5595&name=image.png&originHeight=110&originWidth=318&originalType=binary&ratio=2&rotation=0&showTitle=false&size=8190&status=done&style=none&taskId=u24fa1de3-3364-4f66-9b6a-afa03f03534&title=&width=159)
> 首先解析一下顶部组件的内部位置

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677726559032-2e1f090a-117d-41bc-b58f-40f778a8eefe.png#averageHue=%2399b94e&clientId=udd47902c-ce16-4&from=paste&height=393&id=u50aa26e7&name=image.png&originHeight=786&originWidth=2474&originalType=binary&ratio=2&rotation=0&showTitle=false&size=52579&status=done&style=none&taskId=ude633309-843f-416e-a748-8c63bc5be5a&title=&width=1237)
> 因为上个小节，将资料已经放到了Vuex中，可以通过getters开放属性，直接在组件中引用即可

- Vuex中使用getters暴露属性-代码位置(**src/store/getters.js**)
```javascript
const getters = {
  token: state => state.user.token,
  userId: state => state.user.userInfo.userId,
  avatar: state => state.user.userInfo.staffPhoto, // 头像
  name: state => state.user.userInfo.username, // 用户名称
}
export default getters

```

- 在Navbar组件引入getters-代码位置(**src/layout/components/NavBar.vue**)
```vue
export default {
  computed: {
    // 引入头像和用户名称
    ...mapGetters([
      'sidebar',
      'avatar',
      'name'
    ])
  },
}
```

- NavBar组件显示用户名和头像-代码位置(**src/layout/components/NavBar.vue**)
```vue
<div class="avatar-wrapper">
          <!-- 头像 -->
          <img :src="avatar" class="user-avatar">
          <!-- 用户名称 -->
          <span class="name">{{ name }}</span>
          <!-- 图标 -->
          <i class="el-icon-setting" />
</div>
```

- 设置头像和用户名的样式-代码位置(**src/layout/components/NavBar.vue**)
```css

      .avatar-wrapper {
        margin-top: 5px;
        position: relative;
        display: flex;
        align-items: center;
        .name {
          //  用户名称距离右侧距离
          margin-right: 10px;
          font-size: 16px;
        }
        .el-icon-setting {
          font-size: 20px;
        }
        .user-avatar {
          cursor: pointer;
          width: 30px;
          height: 30px;
          border-radius: 50%;
        }
      }
  
```
# 3.处理头像为空的场景
> 不是所有用户都有头像的，当用户没有头像时要显示对应的内容

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677727368214-b95869c4-4a36-4d4b-b863-cf517193964b.png#averageHue=%23fbfbfb&clientId=udd47902c-ce16-4&from=paste&height=130&id=u33bf8518&name=image.png&originHeight=260&originWidth=2208&originalType=binary&ratio=2&rotation=0&showTitle=false&size=45901&status=done&style=none&taskId=u02fcc5e0-89c4-446a-b146-09cfd69448e&title=&width=1104)

- 条件判断-代码位置(**src/layout/components/NavBar.vue**)
```vue
<div class="avatar-wrapper">
          <!-- 头像 -->
          <img v-if="avatar" :src="avatar" class="user-avatar">
          <span v-else class="username">{{ name?.charAt(0) }}</span>
          <!-- 用户名称 -->
          <span class="name">{{ name }}</span>
          <!-- 图标 -->
          <i class="el-icon-setting" />
        </div>
```

- 样式
```css
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
```
> 这里我们使用了可选链操作符 ？， 它的意思是当？前面的变量为空时，它不会继续往下执行，防止报错，如
> null?.name，但是我们当前的版本不支持？的编译，所以需要升级一下对应的版本

```bash
$ npm i vue@2.7.0  vue-template-compiler@2.7.0   # 升级vue版本️

```
> 升级完成后，重启服务就可以了。

# 4.处理token失效的问题
> token是有时效性的，当token超时，我们需要做一下处理

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677727686990-34c65c07-f755-4553-92d8-7d2bf4c44bd2.png#averageHue=%23fcfcfc&clientId=udd47902c-ce16-4&from=paste&height=167&id=ub8c1ca74&name=image.png&originHeight=334&originWidth=2666&originalType=binary&ratio=2&rotation=0&showTitle=false&size=61012&status=done&style=none&taskId=u0ee16810-fe28-4268-a33c-c3a473a3db5&title=&width=1333)

- 请求拦截器处理-代码位置(**src/utils/request.js**)
```javascript
// 响应拦截器
service.interceptors.response.use(..., async(error) => {
  if (error.response.status === 401) {
    Message({ type: 'warning', message: 'token超时了' })
    // 说明token超时了
    await store.dispatch('user/logout') // 调用action 退出登录
    //  主动跳到登录页
    router.push('/login') // 跳转到登录页
    return Promise.reject(error)
  }
  // error.message
  Message.error(error.message)
  return Promise.reject(error)
})
```

- 实现Vuex的登出action-代码位置(**src/store/modules/user.js**)
```javascript
const actions = {
  // 退出登录的action
  logout(context) {
    context.commit('removeToken') // 删除token
    context.commit('setUserInfo', {}) // 设置用户信息为空对象
  }
}
```
# 5.调整下拉菜单，实现退出登录
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677727910140-06fc9d78-ef39-4599-b16a-8b7ee22887c8.png#averageHue=%23fefefe&clientId=udd47902c-ce16-4&from=paste&height=260&id=u2cd95410&name=image.png&originHeight=520&originWidth=968&originalType=binary&ratio=2&rotation=0&showTitle=false&size=45577&status=done&style=none&taskId=u2f67ad91-cc06-4c74-a7a5-793f2d5146d&title=&width=484)
> 退出登录流程

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677727932215-56f330fe-744a-445e-bae3-c93135ce5a36.png#averageHue=%23c9dced&clientId=udd47902c-ce16-4&from=paste&height=108&id=ub1258d84&name=image.png&originHeight=216&originWidth=1756&originalType=binary&ratio=2&rotation=0&showTitle=false&size=20632&status=done&style=none&taskId=u12da800c-2010-4565-b870-5527e7e7402&title=&width=878)

- Navbar中点击退出登录-代码位置(**src/layout/components/NavBar.vue**)
```vue
  <el-dropdown-item @click.native="logout">
          <span style="display:block;">登出</span>
  </el-dropdown-item>
```

- 退出方法-代码位置(**src/layout/components/NavBar.vue**)
```vue
export default  {
  methods: {
     async logout() {
      // 调用退出登录的action
      await this.$store.dispatch('user/logout')
      this.$router.push('/login')
    },
  }
}
```
注意：native修饰符表示给组件的根元素注册事件️

# 6.修改密码功能实现

- 整体流程

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677728155379-d9fad987-a1de-45fd-87f4-1676a3b57183.png#averageHue=%23fafafa&clientId=udd47902c-ce16-4&from=paste&height=265&id=u9a28f21a&name=image.png&originHeight=530&originWidth=740&originalType=binary&ratio=2&rotation=0&showTitle=false&size=26640&status=done&style=none&taskId=u9134c956-b0c8-420b-8941-648782bdcfc&title=&width=370)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677728164073-bf525af3-d30b-41e5-92d6-c20ab5283082.png#averageHue=%23fefefe&clientId=udd47902c-ce16-4&from=paste&height=183&id=ucc7d3d7a&name=image.png&originHeight=366&originWidth=2618&originalType=binary&ratio=2&rotation=0&showTitle=false&size=55850&status=done&style=none&taskId=ufeec6765-931f-409d-ad61-001f3d9a26d&title=&width=1309)
## 6.1-修改密码-弹出层
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677728198680-76a47239-be42-4b6b-9416-42d5773dcd3b.png#averageHue=%23b6d0e8&clientId=udd47902c-ce16-4&from=paste&height=92&id=u7bb79fbd&name=image.png&originHeight=184&originWidth=818&originalType=binary&ratio=2&rotation=0&showTitle=false&size=14498&status=done&style=none&taskId=u0e179948-71ca-43e8-a405-e900bcc79b7&title=&width=409)

- 注册修改密码点击事件-代码位置(**src/layout/components/NavBar.vue**)
```html
<!-- prevent阻止默认事件 -->
 <a target="_blank" @click.prevent="updatePassword">
    <el-dropdown-item>修改密码</el-dropdown-item>
 </a>
```

- 声明变量和方法控制弹层显示-代码位置(**src/layout/components/NavBar.vue**)
```vue
export default {
  data() {
    return  {
      showDialog: false
    }
  },
  methods: {
    updatePassword() {
      this.showDialog = true
    }
  }
}
```

- 放置弹层组件-代码位置(**src/layout/components/NavBar.vue**)
```vue
<el-dialog width="500px" title="修改密码" :visible.sync="showDialog" >
</el-dialog>
```
## 6.2-修改密码-表单结构
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677728768221-22858ce9-6391-4a32-b82a-3a4f541927db.png#averageHue=%23fef9f9&clientId=udd47902c-ce16-4&from=paste&height=416&id=uea0289b2&name=image.png&originHeight=832&originWidth=1226&originalType=binary&ratio=2&rotation=0&showTitle=false&size=49020&status=done&style=none&taskId=u3b9177cb-68e1-4953-8fd8-7fd9b4337f0&title=&width=613)

- 表单结构-代码位置(**src/layout/components/NavBar.vue**)
```vue
  <el-form  label-width="120px" >
        <el-form-item label="旧密码" >
          <el-input  show-password size="small" />
        </el-form-item>
        <el-form-item label="新密码" >
          <el-input  show-password size="small" />
        </el-form-item>
        <el-form-item label="重复密码" >
          <el-input  show-password size="small" />
        </el-form-item>
        <el-form-item>
          <el-button size="mini" type="primary" >确认修改</el-button>
          <el-button size="mini" >取消</el-button>
        </el-form-item>
      </el-form>
```
## 6.3-修改密码-表单校验

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677728899527-bfb2a62b-6943-46b1-b298-68bb79e32455.png#averageHue=%23fefefe&clientId=udd47902c-ce16-4&from=paste&height=283&id=u8f036856&name=image.png&originHeight=566&originWidth=836&originalType=binary&ratio=2&rotation=0&showTitle=false&size=47652&status=done&style=none&taskId=u2841f3f1-7bed-4985-8c0c-158f6b78ba5&title=&width=418)

- 声明数据和规则-代码位置(**src/layout/components/NavBar.vue**)
```vue
export default {
  data () {
    return  {
     passForm: {
        oldPassword: '', // 旧密码
        newPassword: '', // 新密码
        confirmPassword: '' // 确认密码字段
      },
     rules: {
        oldPassword: [{ required: true, message: '旧密码不能为空', trigger: 'blur' }], // 旧密码
        newPassword: [{ required: true, message: '新密码不能为空', trigger: 'blur' }, {
          trigger: 'blur',
          min: 6,
          max: 16,
          message: '新密码的长度为6-16位之间'
        }], // 新密码
        confirmPassword: [{ required: true, message: '重复密码不能为空', trigger: 'blur' }, {
          trigger: 'blur',
          validator: (rule, value, callback) => {
            // value
            if (this.passForm.newPassword === value) {
              callback()
            } else {
              callback(new Error('重复密码和新密码输入不一致'))
            }
          }
        }] // 确认密码字段
      }
    }
  }
}
```

- 绑定属性-代码位置(**src/layout/components/NavBar.vue**)
```vue
      <el-form ref="passForm" label-width="120px" :model="passForm" :rules="rules">
        <el-form-item label="旧密码" prop="oldPassword">
          <el-input v-model="passForm.oldPassword" show-password size="small" />
        </el-form-item>
        <el-form-item label="新密码" prop="newPassword">
          <el-input v-model="passForm.newPassword" show-password size="small" />
        </el-form-item>
        <el-form-item label="重复密码" prop="confirmPassword">
          <el-input v-model="passForm.confirmPassword" show-password size="small" />
        </el-form-item>
        <el-form-item>
          <el-button size="mini" type="primary" >确认修改</el-button>
          <el-button size="mini" >取消</el-button>
        </el-form-item>
      </el-form>
```
## 6.4-修改密码-确定和取消

- 确定和取消流程

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677729151403-35755fd9-86d6-45f5-87d2-6191b963179d.png#averageHue=%23d4deee&clientId=udd47902c-ce16-4&from=paste&height=177&id=u0413e2a4&name=image.png&originHeight=354&originWidth=2250&originalType=binary&ratio=2&rotation=0&showTitle=false&size=48366&status=done&style=none&taskId=u6d0050dc-6804-4db2-a48d-f66eccc8b16&title=&width=1125)

- 封装修改密码方法-代码位置(**src/api/user.js**)
```javascript
/**
 * 更新密码
 * **/
export function updatePassword(data) {
  return request({
    url: '/sys/user/updatePass',
    method: 'put',
    data
  })
}

```

- 确定方法-代码位置(**src/layout/components/NavBar.vue**)
```javascript
// 确定
    btnOK() {
      this.$refs.passForm.validate(async isOK => {
        if (isOK) {
          // 调用接口
          await updatePassword(this.passForm)
          this.$message.success('修改密码成功')
          this.btnCancel()
        }
      })
    },
```

- 取消方法-代码位置(**src/layout/components/NavBar.vue**)
```vue
btnCancel() {
      this.$refs.passForm.resetFields() // 重置表单
      // 关闭弹层
      this.showDialog = false
}
```

- 监听弹层关闭事件
```vue
    <el-dialog @close="btnCancel" width="500px" title="修改密码" :visible.sync="showDialog" >

```
> 有同学有疑惑，不是用了.sync修饰符吗？可以直接关闭弹层，为何还要监听close事件，这是因为sync修饰符只能关闭弹层，我们还需要将表单进行重置，因为你之前打开弹层可能修改了一半或者残留一些校验信息，再打开的时候这些信息应该都被重置，所以这里用监听事件的方式再重置一下表单，保证功能的体验和完整性。


# 7. 清理组件和路由
> 主页功能开发完了，我们要清理一下模板中残余文件

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677730984195-f36c0905-61fe-4a17-9a90-f50799da088e.png#averageHue=%2360902b&clientId=udd47902c-ce16-4&from=paste&height=177&id=u7bce8ca8&name=image.png&originHeight=354&originWidth=1790&originalType=binary&ratio=2&rotation=0&showTitle=false&size=72400&status=done&style=none&taskId=ub1f58f95-317c-46d6-819a-f957e13d8b7&title=&width=895)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677731001663-0c373e48-4eb6-4691-9f60-29048729645b.png#averageHue=%23b6b6b6&clientId=udd47902c-ce16-4&from=paste&height=400&id=u4e457222&name=image.png&originHeight=800&originWidth=1908&originalType=binary&ratio=2&rotation=0&showTitle=false&size=166425&status=done&style=none&taskId=u8610b8d9-8690-445e-abf9-dac59fc210c&title=&width=954)

- 路由只保留登录-主页-404
- 请求模块只保留user.js模块
# 8.创建项目所需要的组件和路由
> 人力资源项目需要这些模块

```bash
  ├── approval            # 审批管理
  ├── attendance          # 考勤管理
  ├── department          # 组织架构
  ├── employee            # 员工管理
  ├── permission          # 权限管理
  ├── role                # 角色管理
  ├── salary              # 工资管理
  ├── social              # 社保管理

```

- 创建模块

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677731135309-109ad7b4-2576-465a-b044-e538bbdb18e0.png#averageHue=%23cddfef&clientId=udd47902c-ce16-4&from=paste&height=191&id=ue8a889a5&name=image.png&originHeight=382&originWidth=1740&originalType=binary&ratio=2&rotation=0&showTitle=false&size=42652&status=done&style=none&taskId=ua807b721-bd50-4599-a2cf-48c051ca2d8&title=&width=870)
> 大家可以直接从当天课程的素材中拷贝已经准备好的路由/组件

组件结构样例
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677731384141-1b5beae2-c8f5-4edd-aaa2-98939d810a26.png#averageHue=%23222120&clientId=udd47902c-ce16-4&from=paste&height=226&id=ufc6112db&name=image.png&originHeight=452&originWidth=540&originalType=binary&ratio=2&rotation=0&showTitle=false&size=70289&status=done&style=none&taskId=ucd35b6bf-5a4c-461b-840f-11e72e167c8&title=&width=270)
路由模块样例
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677731402492-32431cd9-9ea9-4ef2-8f4e-068618df0d50.png#averageHue=%2321201f&clientId=udd47902c-ce16-4&from=paste&height=260&id=u7541e148&name=image.png&originHeight=520&originWidth=772&originalType=binary&ratio=2&rotation=0&showTitle=false&size=84088&status=done&style=none&taskId=u43d75f87-d4a4-4c19-aac8-f80c2a98111&title=&width=386)
路由的统一导入
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677731417212-01c07f02-f5ab-4f95-927d-42a7b780e4fc.png#averageHue=%232b2624&clientId=udd47902c-ce16-4&from=paste&height=154&id=ua8283c83&name=image.png&originHeight=308&originWidth=854&originalType=binary&ratio=2&rotation=0&showTitle=false&size=177144&status=done&style=none&taskId=ub83ec474-dcc4-4199-9f27-ad45ece5e5a&title=&width=427)
在src/router/index.js中集成到当前路由中
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677731443969-cdc6e4ab-d6df-4b47-8ad4-91cd288f5af6.png#averageHue=%23271f1f&clientId=udd47902c-ce16-4&from=paste&height=243&id=ub0bdea79&name=image.png&originHeight=486&originWidth=784&originalType=binary&ratio=2&rotation=0&showTitle=false&size=105815&status=done&style=none&taskId=ue1b410a3-7458-4adf-9125-dc3d882f826&title=&width=392)

# 9.扩展-解析左侧菜单原理
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677731478801-2152aa51-ceaf-4119-b12d-a9ff559c7064.png#averageHue=%2396bd4d&clientId=udd47902c-ce16-4&from=paste&height=351&id=uc38c0284&name=image.png&originHeight=702&originWidth=1824&originalType=binary&ratio=2&rotation=0&showTitle=false&size=62927&status=done&style=none&taskId=u4d3eba61-0397-4e5b-b4b0-9d78f889520&title=&width=912)
> 左侧菜单的数据来源于路由模块的信息， 会根据路由信息的hidden属性来判断是否显示该路由信息到菜单，
> 菜单属性中的图表和标题来源于路由meta中的icon和title属性


- 分析过程

sidebar组件引入路由信息
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677731592548-6450a3c2-c0f0-4ee3-a714-26717eef2c00.png#averageHue=%23282827&clientId=udd47902c-ce16-4&from=paste&height=253&id=u247a4fd7&name=image.png&originHeight=506&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=2595497&status=done&style=none&taskId=u4ced5d02-67f0-4be4-a86c-88324c06edc&title=&width=640)
循环渲染路由信息
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677731608249-6b3fe1a3-dd74-4825-91ae-ed0c3f39933c.png#averageHue=%23212121&clientId=udd47902c-ce16-4&from=paste&height=192&id=u4bead679&name=image.png&originHeight=384&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=1969728&status=done&style=none&taskId=u3ca43961-a16a-48e5-b824-9d7b8aa56b6&title=&width=640)
sidebarItem组件根据条件渲染-传递icon和title属性给item组件
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677731639959-05b555fb-24d3-4cd0-8afd-2afe3b4c2763.png#averageHue=%23292928&clientId=udd47902c-ce16-4&from=paste&height=122&id=uacbf4751&name=image.png&originHeight=244&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=1251622&status=done&style=none&taskId=u1c0ba0bc-a751-454d-bd79-aaf923e704f&title=&width=640)
item组件接收icon和title属性，使用函数型组件完成渲染
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677731696023-0fab52a0-622f-487d-b7e9-8238d7b37150.png#averageHue=%23252524&clientId=udd47902c-ce16-4&from=paste&height=360&id=u9eef52e6&name=image.png&originHeight=720&originWidth=990&originalType=binary&ratio=2&rotation=0&showTitle=false&size=2856615&status=done&style=none&taskId=ua28d4a1e-3729-4dd0-b79a-a2a4fd00389&title=&width=495)

# 10. 左侧菜单显示项目logo
> logo有两种展示形态，当菜单展开时，显示大图，当菜单折叠时，显示小图

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677732418822-7afd682f-81c1-47be-8541-f3d4a24f8ad6.png#averageHue=%23fcfcfc&clientId=udd47902c-ce16-4&from=paste&height=167&id=u01d8597a&name=image.png&originHeight=334&originWidth=1490&originalType=binary&ratio=2&rotation=0&showTitle=false&size=37451&status=done&style=none&taskId=u38af763a-60c7-4c1d-8a32-a427944b5ee&title=&width=745)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677732426753-338d9b88-fc58-4dbc-9a1a-e34d17993a9b.png#averageHue=%23c9dced&clientId=udd47902c-ce16-4&from=paste&height=99&id=u9ebbb763&name=image.png&originHeight=198&originWidth=2024&originalType=binary&ratio=2&rotation=0&showTitle=false&size=26372&status=done&style=none&taskId=uaa5eb1bf-9482-4bf0-946a-e10a6ee5f28&title=&width=1012)

- 通过settings.js的设置，将logo显示出来-代码位置(**src/settings.js**)
```javascript
module.exports = {

  title: '人力资源后台管理系统',

  /**
   * @type {boolean} true | false
   * @description Whether fix the header
   */
  fixedHeader: false,

  /**
   * @type {boolean} true | false
   * @description Whether show the logo in sidebar
   */
  sidebarLogo: true
}

```

- 调整logo的页面结构-代码位置(**src/layout/components/Sidebar/Logo.vue**)
```vue
<template>
  <div class="sidebar-logo-container" :class="{'collapse':collapse}">
    <transition name="sidebarLogoFade">
      <router-link key="collapse" class="sidebar-logo-link" to="/">
        <img src="@/assets/common/logo.png" class="sidebar-logo">
      </router-link>
    </transition>
  </div>
</template>
```

- 调整logo样式-代码位置(**src/layout/components/Sidebar/Logo.vue**)
```vue
<style lang="scss" scoped>
.sidebarLogoFade-enter-active {
  transition: opacity 1.5s;
}

.sidebarLogoFade-enter,
.sidebarLogoFade-leave-to {
  opacity: 0;
}

.sidebar-logo-container {
  position: relative;
  width: 100%;
  height: 50px;
  line-height: 50px;
  text-align: center;
  overflow: hidden;

  & .sidebar-logo-link {
    height: 100%;
    width: 100%;

    & .sidebar-logo {
      width: 140px;
      vertical-align: middle;
      margin-right: 12px;
    }

    & .sidebar-title {
      display: inline-block;
      margin: 0;
      color: #fff;
      font-weight: 600;
      line-height: 50px;
      font-size: 14px;
      font-family: Avenir, Helvetica Neue, Arial, Helvetica, sans-serif;
      vertical-align: middle;
    }
  }

  &.collapse {
    .sidebar-logo {
      margin-right: 0px;
      width: 32px;
      height: 32px;
    }
  }
}
</style>

```
