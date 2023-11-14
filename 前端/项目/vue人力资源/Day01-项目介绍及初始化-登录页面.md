完整gitee项目代码地址: https://gitee.com/shuiruohanyu/heimahr/tree/master


项目接口文档地址: https://www.apifox.cn/apidoc/shared-e2644216-aad4-4529-a630-78f0631ab076/api-49562537


项目演示地址: https://heimahr.itheima.net/
接口实际地址: 示例-https://heimahr.itheima.net/api/sys/login


项目演示备份地址: https://heimahr-t.itheima.net/ 


备份接口实际地址: 示例-https://heimahr-t.itheima.net/prod-api/sys/login


项目笔记地址(语雀-在线，线下笔记已经在资源中): https://www.yuque.com/shuiruohanyu/agxcua


登录密码：网络安全需要，密码以由原来的123456 变更为hm#qd@23! ， 管理员不可修改密码，新建用户的密码仍为123456

# 1.人力资源项目介绍

### 1.1 项目架构和解决方案
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677638069702-b1d74f78-3c4d-4491-bbcb-5984cd6a2740.png#averageHue=%23526a27&clientId=u27a6c102-7f89-4&from=paste&height=529&id=ub74513ae&name=image.png&originHeight=1058&originWidth=2164&originalType=binary&ratio=2&rotation=0&showTitle=false&size=236996&status=done&style=none&taskId=u8aa4e64f-2e8e-46fc-b2eb-bbc40084251&title=&width=1082)
### 1.2 课程安排
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677638782885-2deeb032-d14b-414a-96c6-327f92556f19.png#averageHue=%23cf8b85&clientId=ud3ec7d2a-274d-4&from=paste&height=567&id=uc976fb79&name=image.png&originHeight=1134&originWidth=1840&originalType=binary&ratio=2&rotation=0&showTitle=false&size=158299&status=done&style=none&taskId=uc07f59b9-3667-4883-8194-2493d06660f&title=&width=920)

### 1.3 课程具备能力

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677638817350-1233e8af-2c01-419d-ae0b-21fd71338458.png#averageHue=%2394bd4b&clientId=ud3ec7d2a-274d-4&from=paste&height=619&id=u0de52d47&name=image.png&originHeight=1238&originWidth=2758&originalType=binary&ratio=2&rotation=0&showTitle=false&size=293029&status=done&style=none&taskId=u42e4b301-34e9-4f99-859f-c5d6d34b3f3&title=&width=1379)

### 1.4 课程地址

 

- vue-element-admin文档地址：[链接](https://panjiachen.gitee.io/vue-element-admin-site/zh/)
- 演示地址：  [链接]()    
- 人力资源项目演示地址：  [链接]()


# 2. 拉取项目基础代码

- 拉取命令
```bash
$ git clone  https://github.com/PanJiaChen/vue-admin-template.git  heimahr
```

- 升级core-js版本到**3.25.5**
```bash
$ npm i core-js@3.25.5 # npm
$ yarn add core-js@3.25.5 # yarn
```

- 安装完整依赖
```bash
$ npm i # npm
$ yarn  # yarn
```

- 启动命令在package.json中查看
```bash
$ yarn dev
```

- 需要检查VsCode本身的插件ESLint 和 Vutur

![image.png](https://cdn.nlark.com/yuque/0/2022/png/8435673/1659364299958-47e73c1f-2f5c-42e6-8fd2-bfbad780409e.png#averageHue=%239bc3ab&clientId=uf62994b2-772f-4&from=paste&height=512&id=u6a6eec52&name=image.png&originHeight=512&originWidth=1608&originalType=binary&ratio=1&rotation=0&showTitle=false&size=218110&status=done&style=none&taskId=u2732c5b4-866a-4d9c-82df-288bb980d87&title=&width=1608)

# 3.项目目录和入口文件介绍

- 项目目录
```bash
├── src                        # 源代码目录
│   ├── api                    # 所有请求
│   ├── assets                 # 主题 字体等静态资源
│   ├── components             # 全局公用组件
│   ├── icons                  # 项目所有 svg icons
│   ├── layout                 # 全局 layout
│   ├── router                 # 路由
│   ├── store                  # 全局 store管理
│   ├── styles                 # 全局样式
│   ├── utils                  # 全局公用方法
│   ├── views                  # views 所有页面
│   ├── App.vue                # 入口页面
│   ├── main.js                # 入口文件 加载组件 初始化等
│   └── permission.js          # 权限管理
│   └── settings.js            # 配置文件

```

- 入口文件

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677639601650-458e85fc-929d-4283-8269-e0cfd126d7b3.png#averageHue=%23f6f9f0&clientId=ud3ec7d2a-274d-4&from=paste&height=492&id=u7c509a22&name=image.png&originHeight=984&originWidth=1326&originalType=binary&ratio=2&rotation=0&showTitle=false&size=46177&status=done&style=none&taskId=u9243a48a-aa3d-4544-bc44-8badf5a90c6&title=&width=663)
# 4.App.vue根组件解析

- App.vue组件

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677639734533-f9c83c9d-9d5f-4ddd-8eff-b3c83db92c57.png#averageHue=%23fefefe&clientId=ud3ec7d2a-274d-4&from=paste&height=553&id=ufe990178&name=image.png&originHeight=1106&originWidth=2170&originalType=binary&ratio=2&rotation=0&showTitle=false&size=88375&status=done&style=none&taskId=u2577d214-b4a7-484c-82bc-872cbb8f20b&title=&width=1085)

- layout布局

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677639748076-1d466f54-67c1-4b6e-8744-c53ec8e4b6b9.png#averageHue=%2395b54b&clientId=ud3ec7d2a-274d-4&from=paste&height=481&id=ucdd357e7&name=image.png&originHeight=962&originWidth=2548&originalType=binary&ratio=2&rotation=0&showTitle=false&size=52548&status=done&style=none&taskId=ub9aae84e-55db-4d60-93d8-54620825eaf&title=&width=1274)
# 5.基础设置settings.js和导航守卫permission.js

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677639923771-14256f1c-309c-425e-89e9-66a22a593090.png#averageHue=%2320201f&clientId=ud3ec7d2a-274d-4&from=paste&height=508&id=ub171e779&name=image.png&originHeight=1016&originWidth=1246&originalType=binary&ratio=2&rotation=0&showTitle=false&size=133769&status=done&style=none&taskId=u86833936-6fc4-4f5d-8986-a2a0b98f0b1&title=&width=623)
settings.js导出网站基础配置，包括：网站标题、固定header、显示logo
permission.js(权限)，主要负责路由导航守卫

# 6.Vuex的结构

- 模板中的结构

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677640092537-3312b3af-d04a-4dd5-bfff-5e6f2da4a49f.png#averageHue=%23fefefe&clientId=ud3ec7d2a-274d-4&from=paste&height=422&id=ue30fae1f&name=image.png&originHeight=844&originWidth=2640&originalType=binary&ratio=2&rotation=0&showTitle=false&size=104404&status=done&style=none&taskId=u11771e23-4ccb-4c32-8052-3fa68827d7b&title=&width=1320)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677640123080-97dd11f7-ebe2-4120-a678-0894d444d1ce.png#averageHue=%23201f1f&clientId=ud3ec7d2a-274d-4&from=paste&height=558&id=ua4ffc2ca&name=image.png&originHeight=1116&originWidth=1360&originalType=binary&ratio=2&rotation=0&showTitle=false&size=142833&status=done&style=none&taskId=u1217faef-ae67-47cf-b92d-8be2a28dc95&title=&width=680)
注意：人资资源项目主要针对**用户模块user **进行改造和重写

- Vuex的设计思想

1.页面交互状态（折叠侧边栏-固定头部）
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677640312841-479deeea-caa9-4664-827c-df4288dc6a2f.png#averageHue=%23212121&clientId=ud3ec7d2a-274d-4&from=paste&height=244&id=u2ed66178&name=image.png&originHeight=648&originWidth=1594&originalType=binary&ratio=2&rotation=0&showTitle=false&size=109484&status=done&style=none&taskId=ub6fd4bef-4c86-4a3b-a696-4cd3a53bd85&title=&width=600)
2.使用全局状态Vuex根据功能拆分成不同的模块（modules）
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677640340361-8ee4e706-8834-49ae-bae8-58569f9b8492.png#averageHue=%231e1e1e&clientId=ud3ec7d2a-274d-4&from=paste&height=211&id=u7513036c&name=image.png&originHeight=422&originWidth=758&originalType=binary&ratio=2&rotation=0&showTitle=false&size=31562&status=done&style=none&taskId=uc360f2ee-0ccf-4c3c-a3df-42c49b5cc71&title=&width=379)
3.进行状态管理通过getters建立对于模块中属性的快捷访问
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677640395635-1f821307-aa62-4c03-821b-b79b94a97798.png#averageHue=%23b8b77e&clientId=ud3ec7d2a-274d-4&from=paste&height=195&id=u11d55aac&name=image.png&originHeight=390&originWidth=1276&originalType=binary&ratio=2&rotation=0&showTitle=false&size=67413&status=done&style=none&taskId=u5c2c5b5f-14c3-4f8b-89da-1f834f697d5&title=&width=638)

# 7.使用模板中的Icon图标

- src/icons/svg目录下的图标都可以使用

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677640480400-583a63ef-d270-4893-93cc-3a6738249d07.png#averageHue=%23262627&clientId=ud3ec7d2a-274d-4&from=paste&height=272&id=u478dd639&name=image.png&originHeight=1100&originWidth=720&originalType=binary&ratio=2&rotation=0&showTitle=false&size=3174296&status=done&style=none&taskId=uec309321-2ea4-4792-a1ac-fa29e79c932&title=&width=178)

- 图标文件名直接设置为svg-icon组件的iconClass属性

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677640547884-53a85baa-3a0e-4dc5-9d4f-c9ddb1364c34.png#averageHue=%23272423&clientId=ud3ec7d2a-274d-4&from=paste&height=110&id=u50cc1a21&name=image.png&originHeight=266&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=1364467&status=done&style=none&taskId=u2c520021-f318-49c1-8549-3529a0aac08&title=&width=531)

# 8.扩展-解析Icon图标的实现思路

- 引入目录所有的svg

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677640698454-71b9b26a-20d7-4d51-82ae-fb674c33fa0c.png#averageHue=%23201f1f&clientId=ud3ec7d2a-274d-4&from=paste&height=85&id=u8e45866f&name=image.png&originHeight=170&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=872056&status=done&style=none&taskId=uff9dfd26-97f7-4571-ad9a-b135e7fb4eb&title=&width=640)

- 全局注册svg-icon组件

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677640655098-0aceb937-dea6-468d-97a5-1451e41bfda3.png#averageHue=%2321201f&clientId=ud3ec7d2a-274d-4&from=paste&height=89&id=ua9c42a2c&name=image.png&originHeight=238&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=1220843&status=done&style=none&taskId=u83c3b3ba-42d0-4354-bb7c-4ad3b7860fb&title=&width=476)

- loader插件打包svg

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677640818980-5b7c4145-b023-4fb7-87a9-5f9c927696e5.png#averageHue=%23222020&clientId=ud3ec7d2a-274d-4&from=paste&height=305&id=ufbee4883&name=image.png&originHeight=805&originWidth=720&originalType=binary&ratio=2&rotation=0&showTitle=false&size=2323035&status=done&style=none&taskId=u76b4288a-987d-451c-ac64-4a44228c40d&title=&width=273)

- svg-icon引用svg的链接

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677640847037-8ecda371-e9ed-44e0-b333-6b5f0dac6f33.png#averageHue=%23232121&clientId=ud3ec7d2a-274d-4&from=paste&height=183&id=u105cf8e3&name=image.png&originHeight=517&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=2651917&status=done&style=none&taskId=u2cd0334e-b5ce-4f98-b89e-3799ef56260&title=&width=452)

- 知识扩展

1.了解：require.context(路径，是否扫描子目录， 正则匹配) 可以引入某个目录下的内容
2.了解：svg-sprite-loader打包了所有svg到一个svg标签上，将svg名称作为symbol标签的id属性
3.了解：svg-icon使用iconClass属性引用了symbol的id

# 9.导入样式资源并使用git管理

- 将教学资源中的初始化**图片-样式-svg **拷贝到src目录下

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677658346411-2d854c54-1178-4f98-8410-d08eaabf267b.png#averageHue=%23fcfcfc&clientId=ud3ec7d2a-274d-4&from=paste&height=146&id=uba19f391&name=image.png&originHeight=498&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=2554459&status=done&style=none&taskId=u318bfd9d-acbd-4977-b65e-868973dd4d6&title=&width=374)
> 因为项目是从github上拉取下来的，所以git记录了之前模版的信息，所以删除需要建立git

- 删除原有的.git文件
- 初始化仓库
```bash
$ git init # 初始化仓库
```

- 添加到暂存区
```bash
$ git add . # 添加到暂存区
```

- 提交本地仓库
```bash
$ git commit -m "初始化人力资源项目" # 提交本地仓库
```
> 接下来，同学们需要在gitee上新建一个自己的远程仓库，然后将本地的仓库推送到远程仓库托管

- 本地仓库配置远程仓库地址
```bash
$ git remote add origin <你的远程仓库地址>  # 本地仓库配置远程仓库地址
```

- 推送到远程仓库
```bash
$ git push -u origin master # 推送到远程仓库
```
# 10.登录页的结构和表单
> 接下来需要实现登录页的表单结构和表单内容

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677658662771-f85ecb01-134c-4469-9de4-233a425e07cb.png#averageHue=%23e4e9fc&clientId=ud3ec7d2a-274d-4&from=paste&height=250&id=uc992a3cf&name=image.png&originHeight=720&originWidth=896&originalType=binary&ratio=2&rotation=0&showTitle=false&size=2585454&status=done&style=none&taskId=u03a60f9b-30ce-4c00-bbf9-4cba44744dd&title=&width=311)

- 拷贝登录页的基本结构布局-代码位置(**src/views/login/index.vue)**
```vue
<template>
  <div class="login-container">
    <div class="logo" />
    <div class="form">
      <h1>登录</h1>
      <el-card shadow="never" class="login-card">
        <!--登录表单-->
      </el-card>
    </div>
  </div>
</template>
<script>
export default {
  name : "Login"
}
</script>
<style lang="scss">
.login-container {
  display: flex;
  align-items: stretch;
  height: 100vh;
  .logo {
    flex: 3;
    background: rgba(38, 72, 176) url(../../assets/common/login_back.png)
      no-repeat center / cover;
    border-top-right-radius: 60px;
    display: flex;
    flex-direction: column;
    align-items: flex-end;
    justify-content: center;
    padding: 0 100px;
    .icon {
      background: url(../../assets/common/logo.png) no-repeat 70px center /
        contain;
      width: 300px;
      height: 50px;
      margin-bottom: 50px;
    }
    p {
      color: #fff;
      font-size: 18px;
      margin-top: 20px;
      width: 300px;
      text-align: center;
    }
  }
  .form {
    flex: 2;
    display: flex;
    flex-direction: column;
    justify-content: center;
    padding-left: 176px;
    .el-card {
      border: none;
      padding: 0;
    }
    h1 {
      padding-left: 20px;
      font-size: 24px;
    }
    .el-input {
      width: 350px;
      height: 44px;
      .el-input__inner {
        background: #f4f5fb;
      }
    }
    .el-checkbox {
      color:#606266;
    }
  }
}
</style>

```

- 实现登录表单的结构
```html
<div class="form">
  <h1>登录</h1>
  <el-card shadow="never" class="login-card">
    <!--登录表单-->
    <!-- el-form > el-form-item > el-input -->
    <el-form>
      <el-form-item>
        <el-input placeholder="请输入手机号" />
      </el-form-item>
      <el-form-item>
        <el-input placeholder="请输入密码" />
      </el-form-item>
      <el-form-item>
        <el-checkbox>
          用户平台使用协议
        </el-checkbox>
      </el-form-item>
      <el-form-item>
        <el-button style="width:350px" type="primary">登录</el-button>
   </el-form-item>
</el-form>
```

- 提交代码
# 11.登录表单校验-实现

1. 定义数据和校验规则
```vue
export default {
  name: 'Login'
  name: 'Login',
  data() {
    return {
      loginForm: {
        mobile: '',
        password: '',
        isAgree: false
      },
      loginRules: {
        mobile: [{
          required: true,
          message: '请输入手机号',
          trigger: 'blur'
        }, {
          pattern: /^1[3-9]\d{9}$/,
          message: '手机号格式不正确',
          trigger: 'blur'

        }],
        password: [{
          required: true,
          message: '请输入密码',
          trigger: 'blur'
        }, {
          min: 6,
          max: 16,
          message: '密码长度应该为6-16位之间',
          trigger: 'blur'

        }],
        // required只能检查 null "" undefined
        isAgree: [{
          validator: (rule, value, callback) => {
            // rule规则
            // value检查的数据 true/false
            // callback 函数 执行这个函数
            // 成功执行callback 失败也执行callback(错误对象 new Error(错误信息))
            value ? callback() : callback(new Error('没有勾选用户平台协议'))
          }
        }]
      }
    }
  },
  methods: {
    login() {
      this.$refs.form.validate((isOK) => {
        if (isOK) {
          alert('校验通过')
        }
      })
    }
  }
}
</script>
```

2. 绑定组件的对应属性
```vue
 <el-form ref="form" :model="loginForm" :rules="loginRules">
      <el-form-item prop="mobile">
            <el-input v-model="loginForm.mobile" placeholder="请输入手机号" />
      </el-form-item>
      <el-form-item prop="password">
          <el-input v-model="loginForm.password" show-password placeholder="请输入密码" />
      </el-form-item>
      <el-form-item prop="isAgree">
          <el-checkbox v-model="loginForm.isAgree">
              用户平台使用协议
          </el-checkbox>
      </el-form-item>
      <el-form-item>
          <el-button style="width:350px" type="primary" @click="login">登录</el-button>
      </el-form-item>
</el-form>
```
