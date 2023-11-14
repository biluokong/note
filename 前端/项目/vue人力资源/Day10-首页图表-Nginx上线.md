# 1.首页-echarts图表的应用
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677843414405-1bc80c4f-0036-41d0-a343-345acca4be97.png#averageHue=%23cbefed&clientId=u6a4ee274-1cea-4&from=paste&height=265&id=u96585014&name=image.png&originHeight=530&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=2718596&status=done&style=none&taskId=u8859e143-2236-4f0b-9ce5-861d6faeeb5&title=&width=640)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677843432463-2fbfe16a-ce1b-4fb5-b844-aa0cd09b394c.png#averageHue=%2396bddc&clientId=u6a4ee274-1cea-4&from=paste&height=287&id=u0df0add9&name=image.png&originHeight=574&originWidth=1850&originalType=binary&ratio=2&rotation=0&showTitle=false&size=134460&status=done&style=none&taskId=u86f2fcd2-c05d-421c-bd42-e8de9e264e3&title=&width=925)

- 安装echarts包
```bash
$ npm i echarts 
$ yarn add echarts
```

- 放置两个图表的div，并给定高宽，代码位置(**src/views/dashboard/index.vue**)
```html
 <div class="chart">
    <!-- 图表 -->
    <div ref="social" style=" width: 100%; height:100% " />
</div>
  <div class="chart">
              <!-- 图表 -->
    <div ref="provident" style=" width: 100%; height:100% " />
  </div>
```

- 在mounted中初始化图表-代码位置(**src/views/dashboard/index.vue**)
```vue
<script>
import CountTo from 'vue-count-to'
import { mapGetters } from 'vuex'
import { getHomeData, getMessageList } from '@/api/home'
import * as echarts from 'echarts' // 引入所有的echarts
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
  watch: {
    homeData() {
      console.log(this.homeData)
      // 设置图表
      this.social.setOption({
        xAxis: {
          type: 'category',
          boundaryGap: false,
          data: this.homeData.socialInsurance?.xAxis
        },
        yAxis: {
          type: 'value'
        },
        series: [
          {
            data: this.homeData.socialInsurance?.yAxis,
            type: 'line',
            areaStyle: {
              color: '#04c9be' // 填充颜色
            },
            lineStyle: {
              color: '#04c9be' // 线的颜色
            }
          }
        ]
      })
      this.provident.setOption({
        xAxis: {
          type: 'category',
          boundaryGap: false,
          data: this.homeData.providentFund?.xAxis
        },
        yAxis: {
          type: 'value'
        },
        series: [
          {
            data: this.homeData.providentFund?.yAxis,
            type: 'line',
            areaStyle: {
              color: '#04c9be' // 填充颜色
            },
            lineStyle: {
              color: '#04c9be' // 线的颜色
            }
          }
        ]
      })
    }
  },
  created() {
    this.getHomeData()
    this.getMessageList()
  },
  mounted() {
    // 获取展示的数据 设置给图表
    // 监听homeData的变化
    this.social = echarts.init(this.$refs.social) // 初始化echart
    // data中没有声明 不是响应式
    this.provident = echarts.init(this.$refs.provident)
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
```
> 这里为什么要用watch，因为获取数据在created，初始化图表在mounted，执行mouted时，数据并不能保证能够获取到，所以采用获取watch监听数据变化，只要数据变化，就设置图表的options


> 为什么 this.social和this.provident 并没有在data中声明，注意，在data中声明的表示它是响应式数据，即它的变化要引起template模板的刷新，但是这里我们只是记录一下当前图表的实例，实例本身会有setOption来影响图表的动态渲染，所以这里并没有必要在data中声明这两个变量


# 2.首页-echarts图表的按需导入
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677843874842-3c458a40-1b7f-4de7-88e3-7a23abe03dcb.png#averageHue=%23cbefed&clientId=u6a4ee274-1cea-4&from=paste&height=265&id=u9430f006&name=image.png&originHeight=530&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=2718596&status=done&style=none&taskId=u1a4e09b4-7088-4f5e-9419-926538f5fc8&title=&width=640)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677843886811-efc90a51-99f2-4921-8c52-554a862bfe3c.png#averageHue=%2382594b&clientId=u6a4ee274-1cea-4&from=paste&height=253&id=ue7b77bea&name=image.png&originHeight=506&originWidth=1422&originalType=binary&ratio=2&rotation=0&showTitle=false&size=74387&status=done&style=none&taskId=ubaa738ab-9330-4e7c-af81-aaf4fa5041d&title=&width=711)

- echarts图表的按需导入-代码位置(**src/views/dashboard/index.vue**)
```javascript
import * as echarts from 'echarts/core' // 引入核心包
import { LineChart } from 'echarts/charts' // 引入折线图
import { GridComponent } from 'echarts/components' // 引入组件
import { CanvasRenderer } from 'echarts/renderers'
echarts.use([
  LineChart,
  GridComponent,
  CanvasRenderer
])
```
# 3.路由模式-将路由改成history模式
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677843996006-6a4c7eba-43a4-46e4-8594-d6e840c2fde0.png#averageHue=%23fdfbfb&clientId=u6a4ee274-1cea-4&from=paste&height=234&id=u8549b434&name=image.png&originHeight=468&originWidth=2202&originalType=binary&ratio=2&rotation=0&showTitle=false&size=108281&status=done&style=none&taskId=u6a32e7fa-71df-4ce7-b968-033ff6063e1&title=&width=1101)

- hash模式带#，#后面的地址变化不会引起页面的刷新
- history没有#，地址变化会引起页面刷新，更符合页面地址的规范（开发环境不刷新-webpack配置）

- 将路由模式修改成history模式-代码位置(**src/router/index.js)**
```javascript
const createRouter = () => new Router({
  mode: 'history', // require service support
  scrollBehavior: () => ({ y: 0 }),
  routes: constantRoutes // 默认引入静态路由
})
```
# 4. 打包分析-分析
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677844109668-4e5f5692-e760-4799-8956-cacd246c1d45.png#averageHue=%23f8f8db&clientId=u6a4ee274-1cea-4&from=paste&height=114&id=ue6328082&name=image.png&originHeight=228&originWidth=1990&originalType=binary&ratio=2&rotation=0&showTitle=false&size=40337&status=done&style=none&taskId=u35846a2a-c930-410e-bd0e-9163cd4374b&title=&width=995)

- 打包分析代码
```bash
$ npm run preview -- --report
```
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677860576748-d3af499b-ca5c-404f-94a7-e292c86d15a9.png#averageHue=%23c7e59a&clientId=u0f540d11-b7d4-4&from=paste&height=258&id=uc335b4cd&name=image.png&originHeight=516&originWidth=954&originalType=binary&ratio=2&rotation=0&showTitle=false&size=381245&status=done&style=none&taskId=u9b2b4566-a99b-4c00-9dda-afa6f7785e1&title=&width=477)

- 去除main.js中对于mock.js的引用

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677860606834-11a34fdd-46a1-4f2a-b8c7-3cecfde531a5.png#averageHue=%234b4b4b&clientId=u0f540d11-b7d4-4&from=paste&height=112&id=u9136f2ff&name=image.png&originHeight=224&originWidth=820&originalType=binary&ratio=2&rotation=0&showTitle=false&size=37215&status=done&style=none&taskId=u7fae7a2a-a05c-4803-95b7-707b1d24b7c&title=&width=410)
# 5.CDN加速
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677860649908-9d614b46-8fa1-41f2-b132-6218fe6fac55.png#averageHue=%23cbe4a5&clientId=u0f540d11-b7d4-4&from=paste&height=327&id=u75f63725&name=image.png&originHeight=653&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=3349503&status=done&style=none&taskId=uc06712a7-08ba-497e-b03c-631e4e09408&title=&width=640)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677860641069-726b7fb7-2724-4e23-b574-08b82fc9eb8e.png#averageHue=%23cadeee&clientId=u0f540d11-b7d4-4&from=paste&height=128&id=u07a5e314&name=image.png&originHeight=256&originWidth=1288&originalType=binary&ratio=2&rotation=0&showTitle=false&size=27504&status=done&style=none&taskId=u25dc44c1-df7f-484b-936f-34eca798b29&title=&width=644)
> 将几个比较大的多在打包时排除，这样可以缩小整体打包的大小，保证js的加载速度，排除的包采用cdn的方式用外链去引入，cdn本名为分发服务器，意为更近的访问区间更快的访问速度将所需要的文件返回给客户端

- webpack排除打包-代码位置(**vue.config.js**)
```javascript
 configureWebpack: {
    // provide the app's title in webpack's name field, so that
    // it can be accessed in index.html to inject the correct title.
    name: name,
    resolve: {
      alias: {
        '@': resolve('src')
      }
    },
    // 配置需要排出的包
    externals: {
      'vue': 'Vue',
      'element-ui': 'ELEMENT',
      'cos-js-sdk-v5': 'COS'
    }
  },
```

- 在html中采用外链引入排除的文件-代码位置(**public/index.html**)
```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="icon" href="<%= BASE_URL %>favicon.ico">
    <title><%= webpackConfig.name %></title>
    <link href="https://cdn.bootcdn.net/ajax/libs/element-ui/2.15.13/theme-chalk/index.min.css" rel="stylesheet">
  </head>
  <body>
    <noscript>
      <strong>We're sorry but <%= webpackConfig.name %> doesn't work properly without JavaScript enabled. Please enable it to continue.</strong>
    </noscript>
    <div id="app"></div>
    <!-- built files will be auto injected -->
    <script src="https://lf9-cdn-tos.bytecdntp.com/cdn/expire-1-M/vue/2.6.14/vue.min.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/element-ui/2.15.13/index.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/cos-js-sdk-v5/dist/cos-js-sdk-v5.min.js" ></script>

  </body>
</html>

```

# 6.项目打包-安装nginx
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677861215372-0e121332-d5bd-4a39-90da-cf8bd02ad3bb.png#averageHue=%23fdfdfd&clientId=u0f540d11-b7d4-4&from=paste&height=304&id=ue9acc474&name=image.png&originHeight=608&originWidth=2066&originalType=binary&ratio=2&rotation=0&showTitle=false&size=84252&status=done&style=none&taskId=ua1ea17a8-fc55-403a-b0a8-eed1a691c18&title=&width=1033)

- 执行打包命令
```bash
$ npm run build:prod
$ yarn build:prod
```
> 得到dist文件包

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677861289047-75b91eb0-124e-4e57-af00-fb10f254f90d.png#averageHue=%231e2b35&clientId=u0f540d11-b7d4-4&from=paste&height=121&id=ua0d8f63f&name=image.png&originHeight=597&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=3062262&status=done&style=none&taskId=u001517dc-4838-4bb6-8f6d-2355386d9d5&title=&width=260)

- 安装nginx-mac
```bash
$ brew install nginx  # mac安装nginx
```

- 查看版本-mac
```bash
$ nginx -v  # 查看版本
```

- 查看nginx-mac
```bash
$ brew info nginx #查看nginx
```

- nginx-windows版本
> 直接解压就可以直接使用

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677861435558-15cfdbf2-3a3a-4c7d-b036-8ed7d3c6a2ad.png#averageHue=%23fbfbfb&clientId=u0f540d11-b7d4-4&from=paste&height=190&id=u778fd62c&name=image.png&originHeight=380&originWidth=862&originalType=binary&ratio=2&rotation=0&showTitle=false&size=38390&status=done&style=none&taskId=ub5348533-01e7-4082-9f3f-9c137c8655b&title=&width=431)


注意：**mac安装**可能遇到的问题

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677861482662-8497aa6d-35f2-4a64-b6a5-828135ac94a9.png#averageHue=%23173c46&clientId=u0f540d11-b7d4-4&from=paste&height=97&id=ue091659c&name=image.png&originHeight=194&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=995160&status=done&style=none&taskId=u48ee8f82-60c6-447a-aaf4-3374a861d86&title=&width=640)
遇到某个包发生错误，直接使用brew安装这个包，再安装nginx

```bash
$ brew install pcre2  # 安装出错的包
$ brew install nginx  # 安装nginx
```
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677861513259-ad09f8a0-71a2-427f-817b-40af94130ed2.png#averageHue=%233b4349&clientId=u0f540d11-b7d4-4&from=paste&height=122&id=u48f6e853&name=image.png&originHeight=244&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=1251622&status=done&style=none&taskId=u5b127742-cc2b-449d-bf4b-20b2a721e45&title=&width=640)
遇到这个错误，可以直接执行该命令，安装对应的工具，再安装nginx

```bash
$  xcode-select --install  # 安装对应工具
$  brew install nginx  # 安装nginx
```
# 7.mac/windows环境下nginx部署启动项目

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677861587484-c1541d97-1b35-4597-b336-fd9b797de83a.png#averageHue=%239dc2df&clientId=u0f540d11-b7d4-4&from=paste&height=65&id=u271b3125&name=image.png&originHeight=130&originWidth=1742&originalType=binary&ratio=2&rotation=0&showTitle=false&size=31679&status=done&style=none&taskId=ud8b2cf52-5929-4627-aaea-ddc83f960dc&title=&width=871)

- mac查看nginx的相关目录
```bash
brew info nginx #查看nginx

```
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677861609109-f1747f8c-ea6b-4808-a5f1-a7972c82a332.png#averageHue=%23191919&clientId=u0f540d11-b7d4-4&from=paste&height=360&id=u263cc82e&name=image.png&originHeight=720&originWidth=998&originalType=binary&ratio=2&rotation=0&showTitle=false&size=2879691&status=done&style=none&taskId=ub82426c4-8e6f-4c9e-9370-e74b022a2ac&title=&width=499)

mac-nginx安装目录-/opt/homebrew/Cellar/nginx/1.23.3 
mac-配置文件路-/opt/homebrew/etc/nginx/nginx.conf 

- 将打包的文件放置到安装目录/html下

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677861665031-da2a64e6-7b58-4b59-8652-f38284a9215f.png#averageHue=%23f5f5f5&clientId=u0f540d11-b7d4-4&from=paste&height=192&id=u571941af&name=image.png&originHeight=720&originWidth=1133&originalType=binary&ratio=2&rotation=0&showTitle=false&size=3269115&status=done&style=none&taskId=u0e93a61d-0fc7-4206-9084-102defd7494&title=&width=302.5)

- mac-启动服务命令
```bash
$ /opt/homebrew/Cellar/nginx/1.23.3/bin/nginx #启动命令

```

- mac-重启服务
```bash
$ /opt/homebrew/Cellar/nginx/1.23.3/bin/nginx -s stop  #停止命令

```
> 注意： mac版本的nginx的默认端口为8080

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677861743190-64ba2366-f63c-4566-bf73-eb4d1355ac1b.png#averageHue=%239aa8a3&clientId=u0f540d11-b7d4-4&from=paste&height=360&id=u9057323c&name=image.png&originHeight=720&originWidth=1206&originalType=binary&ratio=2&rotation=0&showTitle=false&size=3479702&status=done&style=none&taskId=ud9b5b029-de3c-4b14-ad17-6a093462e8b&title=&width=603)

- windows版本启动服务
- ![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677861771519-bca919e2-2d6a-456e-bd44-c3143be8b611.png#averageHue=%23fdfcfa&clientId=u0f540d11-b7d4-4&from=paste&height=215&id=u1bb29196&name=image.png&originHeight=1070&originWidth=720&originalType=binary&ratio=2&rotation=0&showTitle=false&size=3087736&status=done&style=none&taskId=ud3bf29f4-b08f-472e-b254-74e03f3bc35&title=&width=145)![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677861787675-9dd348f5-86b5-4a6b-a0cb-b95740ba169d.png#averageHue=%23fafafa&clientId=u0f540d11-b7d4-4&from=paste&height=133&id=ue8a9d2bf&name=image.png&originHeight=380&originWidth=1614&originalType=binary&ratio=2&rotation=0&showTitle=false&size=61192&status=done&style=none&taskId=u6b6997bd-db6f-45a3-b3e2-2ed22ce2882&title=&width=565)
- windows下停止服务
```bash
$ ./nginx -s stop  #停止命令

```
注意: nginx默认的访问端口为80

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677861833368-8a533b5b-35f7-498c-8041-1fb4f334f8e6.png#averageHue=%23557367&clientId=u0f540d11-b7d4-4&from=paste&height=360&id=u69ca2001&name=image.png&originHeight=720&originWidth=1257&originalType=binary&ratio=2&rotation=0&showTitle=false&size=3626818&status=done&style=none&taskId=u3d1bfd72-7fe8-47d3-9871-0618cbb5af0&title=&width=628.5)

# 8.nginx解决history的404问题
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677861855748-b9e3b549-1f04-4f89-a824-9c95f8d9a6af.png#averageHue=%23d5d8e3&clientId=u0f540d11-b7d4-4&from=paste&height=118&id=ua9d13a47&name=image.png&originHeight=236&originWidth=2134&originalType=binary&ratio=2&rotation=0&showTitle=false&size=66400&status=done&style=none&taskId=uadbbd4c3-450f-4d6f-b0f6-aa8339cd9c8&title=&width=1067)

- 修改mac-windows配置文件
```bash
location / {
   try_files $uri $uri/ /index.html;
}
```
> 设置不论请求什么地址，都返回index.html

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677861939613-eba82e02-4e61-47a6-9bdc-e63290fbf604.png#averageHue=%23030303&clientId=u0f540d11-b7d4-4&from=paste&height=32&id=u6dd0b12f&name=image.png&originHeight=64&originWidth=366&originalType=binary&ratio=2&rotation=0&showTitle=false&size=4911&status=done&style=none&taskId=u69e55578-dd36-4974-a0c8-ffbf6e32eb8&title=&width=183)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677861958095-3583ae30-2f69-4fd4-a676-951bd60286b9.png#averageHue=%23f7f7f7&clientId=u0f540d11-b7d4-4&from=paste&height=360&id=u5455ae9a&name=image.png&originHeight=720&originWidth=930&originalType=binary&ratio=2&rotation=0&showTitle=false&size=2683533&status=done&style=none&taskId=udcb50778-09a1-4103-974d-89492babe6d&title=&width=465)
windows配置文件
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677861973536-3b3ed9fd-bb6f-4d47-8638-42e60e661062.png#averageHue=%23fcfcfc&clientId=u0f540d11-b7d4-4&from=paste&height=483&id=u67d37f66&name=image.png&originHeight=966&originWidth=720&originalType=binary&ratio=2&rotation=0&showTitle=false&size=2787618&status=done&style=none&taskId=u8bcf6c8e-1962-4663-927c-0c23c1a59cd&title=&width=360)

- mac重启服务
```bash
$ /opt/homebrew/Cellar/nginx/1.23.3/bin/nginx -s reload  #重启
```

- windows重启服务
```bash
$ ./nginx -s reload  #重启
```
# 9.nginx配置代理解决生产环境跨域问题
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677862046625-2fba1cae-6d0b-4edd-91e9-ed18094987d3.png#averageHue=%23cdcbcb&clientId=u0f540d11-b7d4-4&from=paste&height=244&id=ua9c9499a&name=image.png&originHeight=488&originWidth=1882&originalType=binary&ratio=2&rotation=0&showTitle=false&size=144717&status=done&style=none&taskId=uc6be76e8-33b0-436e-9cbf-c9c22416db6&title=&width=941)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677862058407-f6b3725c-a57c-4711-acff-3088574d814b.png#averageHue=%23fdfdfd&clientId=u0f540d11-b7d4-4&from=paste&height=270&id=uf3364958&name=image.png&originHeight=540&originWidth=1918&originalType=binary&ratio=2&rotation=0&showTitle=false&size=53889&status=done&style=none&taskId=uda212cc3-d7e4-47b7-83bf-5b394037c9d&title=&width=959)

- nginx解决生产环境跨域

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677862085701-af444e51-9d9a-459c-b155-d852fa19a98b.png#averageHue=%23b3cfe6&clientId=u0f540d11-b7d4-4&from=paste&height=86&id=u408d2eba&name=image.png&originHeight=172&originWidth=1286&originalType=binary&ratio=2&rotation=0&showTitle=false&size=23695&status=done&style=none&taskId=u93f5218b-6b17-4370-8202-2a8e07430b9&title=&width=643)

- 修改配置文件
```bash
location /prod-api  {
  proxy_pass https://heimahr-t.itheima.net;
}
```

- mac重启服务
```bash
$ /opt/homebrew/Cellar/nginx/1.23.3/bin/nginx -s reload  #重启
```

- windows重启服务
```bash
$ ./nginx -s reload  #重启
```
