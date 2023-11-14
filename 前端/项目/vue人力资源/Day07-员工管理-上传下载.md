# 1.员工管理-导出excel
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677828319753-31bcffaf-2a61-4267-ae24-00941106fe4e.png#averageHue=%23e5deef&clientId=u1e237bb2-9603-4&from=paste&height=92&id=uc1d3da70&name=image.png&originHeight=242&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=1241363&status=done&style=none&taskId=u2062e4e2-b90b-4c00-b546-2c46133a705&title=&width=487)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677828330545-ab121cdb-4746-4352-aa84-0e3b35149d5e.png#averageHue=%23c3d9eb&clientId=u1e237bb2-9603-4&from=paste&height=76&id=u4c19b094&name=image.png&originHeight=152&originWidth=1100&originalType=binary&ratio=2&rotation=0&showTitle=false&size=21421&status=done&style=none&taskId=u6f61d557-53e9-45dc-acc0-59df84ba7c7&title=&width=550)

- 导出员工接口返回的是二进制流
- axios配置responseType为blob接收二进制流文件为Blob格式
- 安装file-saver包，实现下载Blob文件  yarn add file-saver

- 封装导出员工excel的API-代码位置(**src/api/employee.js**)
```javascript
/**
 * 导出员工的excel
 * **/

export function exportEmployee() {
  return request({
    url: '/sys/user/export',
    // 改变接收数据的类型
    responseType: 'blob' // 使用blob接收二进制文件流
  })
}
```

- 拦截器判断是不是blob类型，如果是直接返回数据，不再进行解构-代码位置(**src/utils/request.js**)
```javascript
// 响应拦截器
service.interceptors.response.use((response) => {
  // axios默认包裹了data
  // 判断是不是Blob
  if (response.data instanceof Blob) return response.data // 返回了Blob对象
  const { data, message, success } = response.data // 默认json格式
  if (success) {
    return data
  } else {
    Message({ type: 'error', message })
    return Promise.reject(new Error(message))
  }
},
```
  

- 安装file-saver
```bash
$ npm i file-saver
$ yarn add file-saver
```

- 点击按钮调用接口，使用file-saver将blob转化成文件下载-代码位置(**src/views/employee/index.vue**)
```javascript
<el-button size="mini" @click="exportEmployee">excel导出</el-button>
 import FileSaver from 'file-saver'
 import { exportEmployee } from '@/api/employee'
  async  exportEmployee() {
      const result = await exportEmployee() // 导出所有的员工接口
      // console.log(result) // 使用一个npm包 直接将blob文件下载到本地 file-saver
      // FileSaver.saveAs(blob对象,文件名称)
      FileSaver.saveAs(result, '员工信息表.xlsx') // 下载文件
 }
```
# 2.员工管理-excel组件封装
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677828812770-b9e9a610-169f-48bf-875e-d9c63ed6187e.png#averageHue=%23fcfcfc&clientId=u1e237bb2-9603-4&from=paste&height=360&id=u9bc36810&name=image.png&originHeight=720&originWidth=998&originalType=binary&ratio=2&rotation=0&showTitle=false&size=2879691&status=done&style=none&taskId=ub5492142-a24b-42ff-bf59-be522824230&title=&width=499)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677828819899-364cd3ae-488b-4211-a194-f00032c4ca42.png#averageHue=%23fcfcfc&clientId=u1e237bb2-9603-4&from=paste&height=143&id=u267cb8bb&name=image.png&originHeight=286&originWidth=1534&originalType=binary&ratio=2&rotation=0&showTitle=false&size=51173&status=done&style=none&taskId=uabb6f6d5-a5c3-441c-ae67-0f061bff0f2&title=&width=767)

- 创建员工导入组件-代码位置(**src/views/employee/components/import-excel.vue**)
```html
<template>
  <el-dialog
    width="500px"
    title="员工导入"
    :visible="showExcelDialog"
    @close="$emit('update:showExcelDialog', false)"
  >
    <el-row type="flex" justify="center">
      <div class="upload-excel">
        <input
          ref="excel-upload-input"
          class="excel-upload-input"
          type="file"
          accept=".xlsx, .xls"
        >
        <div class="drop">
          <i class="el-icon-upload" />
          <el-button type="text">下载导入模板</el-button>
          <span>将文件拖到此处或
            <el-button type="text">点击上传</el-button>
          </span>
        </div>
      </div>
    </el-row>
    <el-row type="flex" justify="end">
      <!-- update:props属性名，值 直接修改 .sync修饰符的属性值 -->
      <el-button size="mini" type="primary" @click="$emit('update:showExcelDialog', false)">取消</el-button>
    </el-row>
  </el-dialog>
</template>
<script>

export default {
  props: {
    showExcelDialog: {
      type: Boolean,
      default: false
    }
  },
  methods: {

  }
}
</script>

<style scoped lang="scss">
    .upload-excel {
      display: flex;
      justify-content: center;
      margin: 20px;
      width: 360px;
      height: 180px;
      align-items: center;
      color: #697086;
      .excel-upload-input {
        display: none;
        z-index: -9999;
      }
      .btn-upload,
      .drop {
        border: 1px dashed #dcdfe6;
        width: 100%;
        height: 100%;
        text-align: center;
        line-height: 160px;
        border-radius: 8px;
        display: flex;
        flex-direction: column;
        justify-content: center;
      }
      .drop {
        line-height: 40px;
        color: #bbb;
        i {
          font-size: 60px;
          display: block;
          color: #c0c4cc;
        }
      }
    }
</style>
```

- 在员工管理页面-导入该组件并注册使用-代码位置(**src/views/employee/index.vue**)
```javascript
import ImportExcel from './components/import-excel.vue'

export default {
  components: {
    ImportExcel
  }
}
}
```

- 声明一个控制该弹层的变量-代码位置(**src/views/employee/index.vue**)
```javascript
data () {
  return  {
      showExcelDialog: false // 控制excel的弹层显示和隐藏
  }
}
```

- 使用该组件，并且应用变量-代码位置(**src/views/employee/index.vue**)
```html
    <import-excel :show-excel-dialog.sync="showExcelDialog" />

```

- 点击员工导入弹出层-代码位置(**src/views/employee/index.vue**)
```html
 <el-button size="mini" @click="showExcelDialog = true">excel导入</el-button>
```

# 3.员工管理-下载导入模板
# ![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677829153067-cc9f9119-fd81-4451-b5f8-9bde624873ed.png#averageHue=%23fefefe&clientId=u1e237bb2-9603-4&from=paste&height=217&id=uae695f2f&name=image.png&originHeight=720&originWidth=925&originalType=binary&ratio=2&rotation=0&showTitle=false&size=2669109&status=done&style=none&taskId=ud401a925-90e3-404f-8ca4-ffd3323492d&title=&width=278.5)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677829173910-e6cee8ba-7daf-4edf-9329-a4ed20861aa5.png#averageHue=%23cbdeed&clientId=u1e237bb2-9603-4&from=paste&height=84&id=ucb62a407&name=image.png&originHeight=168&originWidth=1132&originalType=binary&ratio=2&rotation=0&showTitle=false&size=22361&status=done&style=none&taskId=u25492fba-9271-4bb2-ba48-2331535b3ca&title=&width=566)

- 封装下载模板的API-代码位置(**src/api/employee.js**)
```javascript
/**
 * 下载员工导入模版
 * **/

export function getExportTemplate() {
  return request({
    url: '/sys/user/import/template',
    responseType: 'blob' // 二进制文件流
  })
}

```

- 点击按钮进行下载模板-代码位置(**src/views/employee/components/import-excel.vue**)
```javascript
<el-button type="text" @click="getTemplate">下载导入模板</el-button>

async getTemplate() {
    const data = await getExportTemplate()
    FileSaver.saveAs(data, '员工导入模版.xlsx')
 }

```
# 4.员工管理-员工导入-上传excel
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677829341053-f23b778f-3c92-4006-b61d-911acbcc3b3d.png#averageHue=%23fefefe&clientId=u1e237bb2-9603-4&from=paste&height=207&id=u078a50f7&name=image.png&originHeight=720&originWidth=934&originalType=binary&ratio=2&rotation=0&showTitle=false&size=2695070&status=done&style=none&taskId=ua071a0fa-743f-4d4d-8a0a-f210132158b&title=&width=269)

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677829369801-572567fc-d90f-45ac-b98e-b24004490f96.png#averageHue=%23fcfcfc&clientId=u1e237bb2-9603-4&from=paste&height=141&id=u20edb1a6&name=image.png&originHeight=282&originWidth=1562&originalType=binary&ratio=2&rotation=0&showTitle=false&size=52252&status=done&style=none&taskId=u00c29fc3-cd91-4fb0-b5ce-2f4e20ab27f&title=&width=781)

- 封装上传excel的API-代码位置(**src/api/employee.js**)
```javascript
/**
 * 上传用户的excel
 *
*/
export function uploadExcel(data) {
  return request({
    url: '/sys/user/import',
    method: 'post',
    data // form-data类型 因为要上传文件类型
  })
}
```

- 点击上传-弹出文件选择框-代码位置(**src/views/employee/components/import-excel.vue**)
```javascript
<el-button type="text" @click="handleUpload">点击上传</el-button>
handleUpload() {
      this.$refs['excel-upload-input'].click() // this.$refs.属性名 和 this.$refs[属性名] 等价
},
```

- 监听文件改变-上传excel-关闭弹层-代码位置(**src/views/employee/components/import-excel.vue**)
```javascript
 <input
          ref="excel-upload-input"
          class="excel-upload-input"
          type="file"
          accept=".xlsx, .xls"
          @change="uploadChange"
  >
  async uploadChange(event) {
      console.log(event.target.files)
      // 调用上传接口
      // uploadExcel() // 参数  form-data 需要文件file
      const files = event.target.files // input的文件列表
      if (files.length > 0) {
        // 大于0 说明有文件要上传
        const data = new FormData()
        // file: file类型
        data.append('file', files[0]) // 将文件参数加入到formData中
        try {
          await uploadExcel(data)
          // 成功
          this.$emit('uploadSuccess') // 通知父组件 我上传成功
          this.$emit('update:showExcelDialog', false) // 关闭弹层
          // this.$refs['excel-upload-input'].value = ''
        } catch (error) {
          // 捕获失败
          // this.$refs['excel-upload-input'].value = ''
        } finally {
          // 不论成功或者失败都会执行finally
          this.$refs['excel-upload-input'].value = ''
        }
      }
}
```
> 这里为什么不管成功或者失败都要清空文件选择器中的内容呢？ 因为不论成功或者失败，再点击上传都会去选择一个新的excel，所以这里使用finally等到最后，将内容清空。

- 父组件需要监听上传成功的事件-代码位置(**src/views/employee/index.vue**)
```html
<import-excel :show-excel-dialog.sync="showExcelDialog" @uploadSuccess="getEmployeeList" />

```
# 5.员工管理-删除员工
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677829894228-3c9d629b-8553-45c9-a92f-1e1793ef7790.png#averageHue=%23fdfdfd&clientId=u1e237bb2-9603-4&from=paste&height=210&id=ud0b96090&name=image.png&originHeight=720&originWidth=945&originalType=binary&ratio=2&rotation=0&showTitle=false&size=2726803&status=done&style=none&taskId=u36a6aa1d-3fba-4b36-87aa-1a47cc8a0ce&title=&width=275.5)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677829907895-eb1818ed-ec92-4fe1-9157-46a002057238.png#averageHue=%23fdfdfd&clientId=u1e237bb2-9603-4&from=paste&height=210&id=u414785b8&name=image.png&originHeight=420&originWidth=1524&originalType=binary&ratio=2&rotation=0&showTitle=false&size=46875&status=done&style=none&taskId=u502d5507-d92b-45fa-81cf-12eb17ea2f1&title=&width=762)

- 封装删除员工的API-代码位置(**src/api/employee.js**)
```javascript
/**
 * 删除员工
 * **/

export function delEmployee(id) {
  return request({
    method: 'delete',
    url: `/sys/user/${id}`
  })
}
```

- 放置气泡框确认框-代码位置(**src/views/employee/index.vue**)
```html
<el-popconfirm title="确认删除该行数据吗？"  @onConfirm="confirmDel(row.id)">
    <el-button slot="reference" style="margin-left:10px" size="mini" type="text">删除</el-button>
</el-popconfirm>
```

- 删除方法实现-代码位置(**src/views/employee/index.vue**)
```javascript
// 删除员工方法
    async confirmDel(id) {
      await delEmployee(id)
      if (this.list.length === 1 && this.queryParams.page > 1) this.queryParams.page--
      this.getEmployeeList()
      this.$message.success('删除员工成功')
    }
```
# 6.员工详情和路由
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677830085850-39f1eeaf-1f8b-40b3-bc97-555f43ace21d.png#averageHue=%23fefefe&clientId=u1e237bb2-9603-4&from=paste&height=469&id=uced5dfc8&name=image.png&originHeight=938&originWidth=720&originalType=binary&ratio=2&rotation=0&showTitle=false&size=2706820&status=done&style=none&taskId=u73b43943-e2ba-4b1b-93f8-be6bbccd801&title=&width=360)

- (拷贝)创建一个员工详情页面-代码位置(**src/views/employee/detail.vue**)
```html
<template>
  <div class="dashboard-container">
    <div class="app-container">
      <div class="edit-form">
        <el-form ref="userForm" label-width="220px">
          <!-- 姓名 部门 -->
          <el-row>
            <el-col :span="12">
              <el-form-item label="姓名" prop="username">
                <el-input size="mini" class="inputW" />
              </el-form-item>
            </el-col>

          </el-row>
          <!-- 工号 入职时间 -->
          <el-row>
            <el-col :span="12">
              <el-form-item label="工号" prop="workNumber">
                <el-input size="mini" class="inputW" />
              </el-form-item>
            </el-col>
          </el-row>
          <!--手机 聘用形式  -->
          <el-row>
            <el-col :span="12">
              <el-form-item label="手机" prop="mobile">
                <el-input
                  size="mini"
                  class="inputW"
                />
              </el-form-item>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="12">
              <el-form-item label="部门" prop="departmentId">
                <!-- 放置及联部门组件 -->
              </el-form-item>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="12">
              <el-form-item label="聘用形式" prop="formOfEmployment">
                <el-select size="mini" class="inputW" />
              </el-form-item>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="12">
              <el-form-item label="入职时间" prop="timeOfEntry">
                <el-date-picker
                  size="mini"
                  type="date"
                  value-format="yyyy-MM-dd"
                  class="inputW"
                />
              </el-form-item>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="12">
              <el-form-item label="转正时间">
                <el-date-picker
                  size="mini"
                  type="date"
                  class="inputW"
                />
              </el-form-item>
            </el-col>
          </el-row>
          <!-- 员工照片 -->
          <el-row>
            <el-col :span="12">
              <el-form-item label="员工头像">
                <!-- 放置上传图片 -->
              </el-form-item>
            </el-col>
          </el-row>
          <!-- 保存个人信息 -->
          <el-row type="flex">
            <el-col :span="12" style="margin-left:220px">
              <el-button size="mini" type="primary">保存更新</el-button>
            </el-col>
          </el-row>
        </el-form>
      </div>

    </div>
  </div>
</template>

<script>

export default {

}
</script>

<style scoped lang="scss">
    .edit-form {
      background: #fff;
      padding: 20px;
      .inputW {
        width: 380px
      }
    }

</style>
```

- 配置员工详情的路由信息-代码位置(**src/router/modules/employee.js**)
```javascript
import layout from '@/layout'
export default {
  path: '/employee',
  component: layout,
  children: [{
    path: '',
    name: 'employee',
    component: () => import('@/views/employee'),
    meta: {
      title: '员工',
      icon: 'people'
    }
  }, {
    path: '/employee/detail', // 员工详情的地址
    component: () => import('@/views/employee/detail.vue'),
    hidden: true, // 表示隐藏在左侧菜单
    meta: {
      title: '员工详情' // 显示在导航的文本
    }
  }]
}
```

- 点击添加员工跳转到详情页-代码位置(**src/views/employee/index.vue**)
```html
<el-button size="mini" type="primary" @click="$router.push('/employee/detail')">添加员工</el-button>

```
# 7.员工详情-表单数据校验
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677830387309-505f03ca-5183-4fa2-a432-2d1bfea97fb3.png#averageHue=%23fefbfb&clientId=u1e237bb2-9603-4&from=paste&height=151&id=ua9d48718&name=image.png&originHeight=659&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=3380277&status=done&style=none&taskId=u514f2999-943c-4554-8da3-ecee8378c6c&title=&width=293)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677830403129-b7d5f450-e75c-4fa6-9cb1-0130f5e34c10.png#averageHue=%23c1d7eb&clientId=u1e237bb2-9603-4&from=paste&height=235&id=u1769acf7&name=image.png&originHeight=470&originWidth=754&originalType=binary&ratio=2&rotation=0&showTitle=false&size=32911&status=done&style=none&taskId=u51b89ca1-f0cc-4ce9-829c-3a3f7d8b1ec&title=&width=377)
> 表单校验规则

- 姓名-必填-1-4个字符
- 手机号-必填-格式校验
- 部门-必填
- 聘用形式-必填
- 入职时间-必填
- 转正时间-必填-不能小于入职时间

- 定义数据和规则-代码位置(**src/views/employee/detail.vue**)
```vue
<script>

export default {
  data() {
    return {
      userInfo: {
        username: '', // 用户名
        mobile: '', // 手机号
        workNumber: '', // 工号
        formOfEmployment: null, // 聘用形式
        departmentId: null, // 部门id
        timeOfEntry: '', // 入职时间
        correctionTime: '' // 转正时间
      },
      rules: {
        username: [{ required: true, message: '请输入姓名', trigger: 'blur' }, {
          min: 1, max: 4, message: '姓名为1-4位'
        }],
        mobile: [{ required: true, message: '请输入手机号', trigger: 'blur' }, {
        //   pattern 正则表达式
          pattern: /^1[3-9]\d{9}$/,
          message: '手机号格式不正确',
          trigger: 'blur'
        }],
        formOfEmployment: [{ required: true, message: '请选择聘用形式', trigger: 'blur' }],
        departmentId: [{ required: true, message: '请选择部门', trigger: 'blur' }],
        timeOfEntry: [{ required: true, message: '请选择入职时间', trigger: 'blur' }],
        correctionTime: [{ required: true, message: '请选择转正时间', trigger: 'blur' }, {
          validator: (rule, value, callback) => {
            if (this.userInfo.timeOfEntry) {
              if (new Date(this.userInfo.timeOfEntry) > new Date(value)) {
                callback(new Error('转正时间不能小于入职时间'))
                return
              }
            }
            callback()
          }
        }]
      }

    }
  },
  methods: {
    saveData() {
      this.$refs.userForm.validate()
    }
  }
}
</script>
```

- 绑定表单数据和属性-代码位置(**src/views/employee/detail.vue**)
```html
 <el-form ref="userForm" :model="userInfo" :rules="rules" label-width="220px">
          <!-- 姓名 -->
          <el-row>
            <el-col :span="12">
              <el-form-item label="姓名" prop="username">
                <el-input v-model="userInfo.username" size="mini" class="inputW" />
              </el-form-item>
            </el-col>

          </el-row>
          <!-- 工号 -->
          <el-row>
            <el-col :span="12">
              <el-form-item label="工号" prop="workNumber">
                <!-- 工号是系统生成的  禁用这个组件-->
                <el-input v-model="userInfo.workNumber" disabled size="mini" class="inputW" />
              </el-form-item>
            </el-col>
          </el-row>
          <!--手机  -->
          <el-row>
            <el-col :span="12">
              <el-form-item label="手机" prop="mobile">
                <el-input
                  v-model="userInfo.mobile"
                  size="mini"
                  class="inputW"
                />
              </el-form-item>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="12">
              <el-form-item label="部门" prop="departmentId">
                <!-- 放置及联部门组件 会单独封装-->
              </el-form-item>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="12">
              <el-form-item label="聘用形式" prop="formOfEmployment">
                <el-select v-model="userInfo.formOfEmployment" size="mini" class="inputW">
                  <el-option label="正式" :value="1" />
                  <el-option label="非正式" :value="2" />
                </el-select>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="12">
              <el-form-item label="入职时间" prop="timeOfEntry">
                <el-date-picker
                  v-model="userInfo.timeOfEntry"
                  size="mini"
                  type="date"
                  value-format="yyyy-MM-dd"
                  class="inputW"
                />
              </el-form-item>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="12">
              <el-form-item label="转正时间" prop="correctionTime">
                <el-date-picker
                  v-model="userInfo.correctionTime"
                  size="mini"
                  type="date"
                  class="inputW"
                />
              </el-form-item>
            </el-col>
          </el-row>
          <!-- 员工照片 -->
          <el-row>
            <el-col :span="12">
              <el-form-item label="员工头像">
                <!-- 放置上传图片 -->
              </el-form-item>
            </el-col>
          </el-row>
          <!-- 保存个人信息 -->
          <el-row type="flex">
            <el-col :span="12" style="margin-left:220px">
              <el-button size="mini" type="primary" @click="saveData">保存更新</el-button>
            </el-col>
          </el-row>
        </el-form>
```
# 8.员工详情-封装部门级联组件
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677830958823-382c48a4-3758-4a38-a81e-1cad5055ab56.png#averageHue=%23fefefe&clientId=u1e237bb2-9603-4&from=paste&height=295&id=uad0fc54d&name=image.png&originHeight=589&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=3021229&status=done&style=none&taskId=ub0892135-f60d-4f7e-adc6-69d9879fb94&title=&width=640)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677830967822-96b40509-bbcb-4892-bade-bfe1c76a82ed.png#averageHue=%23c5daec&clientId=u1e237bb2-9603-4&from=paste&height=181&id=udb159183&name=image.png&originHeight=362&originWidth=798&originalType=binary&ratio=2&rotation=0&showTitle=false&size=33059&status=done&style=none&taskId=ue715dad5-3d63-41f0-a625-03dd1ddb5bb&title=&width=399)
#### Cascader级联组件的特性

1. options为一个树形结构的数据源
2. props可以设置数据源中的字段如 label (展示)  value（存取）
3. separator为展示的分隔符

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677831436880-afdcff2a-8901-4008-9304-0f41e4fc58c3.png#averageHue=%23202020&clientId=u1e237bb2-9603-4&from=paste&height=128&id=u8fac2217&name=image.png&originHeight=644&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=3303332&status=done&style=none&taskId=ue7bfa337-4ae8-43ad-8f4b-63357b427c8&title=&width=254)![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677831446397-5c5fa77f-ba2d-47c7-a8d3-255d6eda4ebb.png#averageHue=%23222120&clientId=u1e237bb2-9603-4&from=paste&height=130&id=uf76ade42&name=image.png&originHeight=697&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=3575181&status=done&style=none&taskId=u3a80d5f4-69b9-4337-b38e-7aef64aacf5&title=&width=238)


- 创建select-tree组件-代码位置(**src/views/employee/components/select-tree.vue**)
```vue
<template>
  <!-- element-ui级联组件 -->
  <el-cascader
    size="mini"
    :options="treeData"
    :props="props"
    separator="-"
  />
</template>
<script>
import { getDepartment } from '@/api/department'
import { transListToTreeData } from '@/utils'
export default {
  data() {
    return {
      treeData: [], // 赋值给 级联组件的options
      props: {
        label: 'name', // 要展示的字段
        value: 'id' // 要存储的字段
      }
    }
  },
  created() {
    this.getDepartment()
  },
  methods: {
    async getDepartment() {
      this.treeData = transListToTreeData(await getDepartment(), 0) // 将组织架构的数据 转化树形赋值给treeData
    }
  }
}
</script>
```

- 解决转化树形中的问题-代码位置(**src/utils/index.js**)
```javascript
/**
 *
 * 列表型数据转化树形
*/

export function transListToTreeData(list, rootValue) {
  const arr = []
  list.forEach(item => {
    if (item.pid === rootValue) {
      // 找到了匹配的节点
      arr.push(item)
      // 当前节点的id 和 当前节点的子节点的pid是想等的
      const children = transListToTreeData(list, item.id) // 找到的节点的子节点
      if (children.length) { item.children = children } // 将子节点赋值给当前节点
    }
  })
  return arr
}
```
> 这里我们加了一个判断，就是只有当前节点有子节点时才添加children属性，否则会造成级联组件本身就已经是最末端了，但是发现它的children属性存在，就会呈现不同的表现形式。

- 使用select-tree组件-代码位置(**src/views/employee/detail.vue**)
> 不要忘记引入注册

```html
<el-form-item label="部门" prop="departmentId">
      <!-- 放置及联部门组件 会单独封装-->
      <!-- inputW样式会给到selectTree中 template第一层的组件 -->
      <select-tree class="inputW" />
</el-form-item>
```
# 9.员工详情-级联组件-双向绑定
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677831500136-e6c90091-aa4a-485d-a564-769f3e421c98.png#averageHue=%23222120&clientId=u1e237bb2-9603-4&from=paste&height=106&id=u397f690a&name=image.png&originHeight=239&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=1225976&status=done&style=none&taskId=u2cf97501-2701-40db-89be-981ae38af4e&title=&width=569)

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677831496148-6c0291f7-2ec7-4821-9211-e9ab7ddfe5e2.png#averageHue=%23c4d9ec&clientId=u1e237bb2-9603-4&from=paste&height=149&id=ue8fd4fa3&name=image.png&originHeight=298&originWidth=1170&originalType=binary&ratio=2&rotation=0&showTitle=false&size=36509&status=done&style=none&taskId=u7953b151-cc26-4746-832b-66b4364b54e&title=&width=585)

- 接收value属性-代码位置(**src/views/employee/components/select-tree.vue**)
```vue
export default {
  props: {
    value: {
      type: Number, // 存储的是部门的id  3 4 5
      default: null
    }
  }
}
```

- 级联改变触发input事件-代码位置(**src/views/employee/components/select-tree.vue**)
```javascript
 <el-cascader
    :value="value"
    size="mini"
    :options="treeData"
    :props="props"
    separator="-"
    @change="changeValue"
  />

 changeValue(list) {
      // 取到数组的最后一次
      if (list.length > 0) {
        this.$emit('input', list[list.length - 1]) // 将最后一位的id取出来 传出去
      } else {
        this.$emit('input', null) // 如果长度为0 说明值为空
      }
}
```

- 在父组件使用v-model双向绑定-代码位置(**src/views/employee/detail.vue**)
```html
<select-tree v-model="userInfo.departmentId" class="inputW" />

```
# 10.员工详情-新增员工

# ![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677831737125-acf11821-e54f-4a71-bf71-019c35b47751.png#averageHue=%23cedff2&clientId=u951ac65c-8775-4&from=paste&height=97&id=ub5586899&name=image.png&originHeight=194&originWidth=1796&originalType=binary&ratio=2&rotation=0&showTitle=false&size=31353&status=done&style=none&taskId=u963aa9b2-4d99-4473-bde1-b4de026390e&title=&width=898)

- 封装新增员工API-代码位置(**src/api/employee.js**)
```javascript
export function addEmployee(data) {
  return request({
    url: '/sys/user',
    method: 'post',
    data
  })
}
```

- 点击保存按钮进行新增-代码位置(**src/views/employee/detail.vue**)
```javascript
 saveData() {
      this.$refs.userForm.validate(async isOK => {
        if (isOK) {
          // 校验通过
          await addEmployee(this.userInfo)
          this.$message.success('新增员工成功')
          this.$router.push('/employee')
        }
      })
}
```
# 11.员工详情-编辑员工-查看员工

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677831908303-83b4bc88-11a2-49cf-8760-5916ce0c6e04.png#averageHue=%23fefdfd&clientId=u951ac65c-8775-4&from=paste&height=163&id=u34931e8e&name=image.png&originHeight=326&originWidth=952&originalType=binary&ratio=2&rotation=0&showTitle=false&size=23071&status=done&style=none&taskId=ue08bef27-0c5f-49b3-8a3f-a995e0e8cf7&title=&width=476)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677831920297-a24e912d-1c68-46d3-ac41-b13e8756c749.png#averageHue=%23c1d7eb&clientId=u951ac65c-8775-4&from=paste&height=94&id=u1ae29ad4&name=image.png&originHeight=188&originWidth=1006&originalType=binary&ratio=2&rotation=0&showTitle=false&size=18540&status=done&style=none&taskId=u080bd213-e2f4-4a0a-93b8-929d3a24939&title=&width=503)

- 封装获取员工详情的API-代码位置(**src/api/employee.js**)
```javascript
/**
 *  获取员工详情
 * **/

export function getEmployeeDetail(id) {
  return request({
    url: `/sys/user/${id}`
  })
}
```

- 点击查看时跳转到详情携带id-代码位置(**src/views/employee/index.vue**)
```html
<el-button size="mini" type="text" @click="$router.push(`/employee/detail/${row.id}`)">查看</el-button>

```

- 配置详情的路由支持新增模式和编辑模式-代码位置(**src/router/modules/employee.js**)
> ? 标识可有可无，可以传id也可以选择不传，页面都能正确显示

```javascript
export default {
  path: '/employee',
  component: layout,
  children: [{
    path: '',
    name: 'employee',
    component: () => import('@/views/employee'),
    meta: {
      title: '员工',
      icon: 'people'
    }
  }, {
    path: '/employee/detail/:id?', // 员工详情的地址
    component: () => import('@/views/employee/detail.vue'),
    hidden: true, // 表示隐藏在左侧菜单
    meta: {
      title: '员工详情' // 显示在导航的文本
    }
  }]
}
```

- 员工详情页判断是否有id，有id就查询详情数据-代码位置(**src/views/employee/detail.vue**)
```javascript
 created() {
    // 如何获取路由参数的中id
    // if (this.$route.params.id) { this.getEmployeeDetail() }
    this.$route.params.id && this.getEmployeeDetail()
  },
  methods: {
    async getEmployeeDetail() {
      this.userInfo = await getEmployeeDetail(this.$route.params.id)
    }
  }
```
# 12.员工详情-编辑员工-保存
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677832251952-f1464678-293e-46ad-b0a8-366acd547f5a.png#averageHue=%23c9dcf0&clientId=u951ac65c-8775-4&from=paste&height=95&id=u69f87a7c&name=image.png&originHeight=190&originWidth=2040&originalType=binary&ratio=2&rotation=0&showTitle=false&size=37274&status=done&style=none&taskId=u1407c038-b696-4c0f-9beb-39a9dd7ce69&title=&width=1020)

- 封装更新员工的API-代码位置(**src/api/employee.js**)
```javascript
export function updateEmployee(data) {
  return request({
    url: `/sys/user/${data.id}`,
    method: 'put',
    data
  })
}
```

- 保存时区分保存和新增场景-代码位置(**src/views/employee/detail.vue**)
```javascript
  saveData() {
      this.$refs.userForm.validate(async isOK => {
        if (isOK) {
          // 编辑模式
          if (this.$route.params.id) {
            // 编辑模式
            await updateEmployee(this.userInfo)
            this.$message.success('更新员工成功')
          } else {
            // 新增模式
            // 校验通过
            await addEmployee(this.userInfo)
            this.$message.success('新增员工成功')
          }
          this.$router.push('/employee')
        }
      })
    }
```

- 在当编辑模式时，让手机号不可编辑-代码位置(**src/views/employee/detail.vue**)
> 因为新增时手机号已经注册成功，手机号如果修改了，用户就不能再成功登录。所以编辑时，用户的手机号允许修改。

```html
 <el-input
        v-model="userInfo.mobile"
        :disabled="!!$route.params.id"
        size="mini"
        class="inputW"
  />
```
