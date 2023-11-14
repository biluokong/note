# 1.组织架构-编辑部门-弹出层获取数据
> 编辑部门和新增部门会共用一个组件，也就是add-dept组件要支持两种场景-新增场景-编辑场景

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677742067981-f8ab6950-5698-42d5-a50c-cffa19b829c0.png#averageHue=%23fefefe&clientId=ua42ead4b-648e-4&from=paste&height=263&id=u86f6ca26&name=image.png&originHeight=526&originWidth=2660&originalType=binary&ratio=2&rotation=0&showTitle=false&size=72568&status=done&style=none&taskId=uc35249c6-9dbc-435c-9bf6-dfb7857b3ac&title=&width=1330)

- 封装获取部门详情的API-代码位置(**src/api/department.js**)
```javascript
/**
 * 获取部门详情
 *
 * ***/

export function getDepartmentDetail(id) {
  return request({
    url: `/company/department/${id}`
  })
}
```

- 点击编辑时，弹出层，通过ref获取组件实例，调用获取详情的方法-代码位置(**src/views/department/index.vue**)
```vue
    <add-dept ref="addDept" :current-node-id="currentNodeId" :show-dialog.sync="showDialog" @updateDepartment="getDepartment" />

```

- 调用子组件方法-代码位置(**src/views/department/index.vue**)
```javascript
 // 操作部门方法
    operateDept(type, id) {
      if (type === 'add') {
        // 添加子部门
        this.showDialog = true // 显示弹层
        this.currentNodeId = id
      } else if (type === 'edit') {
        // 编辑部门场景
        this.showDialog = true
        this.currentNodeId = id // 记录id 要用它获取数据
        // 更新props- 异步动作
        // 直接调用了子组件的方法 同步的方法
        // 要在子组件获取数据
        // 父组件调用子组件的方法来获取数据
        this.$nextTick(() => {
          this.$refs.addDept.getDepartmentDetail() // this.$refs.addDept等同于子组件的this
        })
      } 
    }
```
> 这里为什么要用$nextTick，因为弹出层之后紧接着要调用子组件方法，第一次弹出层时，里面的组件还未完成渲染，所以要等到showDialog这个属性设置的数据完成渲染之后才进行调用

- 子组件提供获取详情的方法-代码位置(**src/views/department/components/add-dept.vue**)
```javascript
 // 获取组织的详情
    async getDepartmentDetail() {
      this.formData = await getDepartmentDetail(this.currentNodeId)
    }
```
# 2.组织架构-编辑部门-编辑表单校验
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677749422442-081bec29-e180-4c1a-83d3-aace6190562d.png#averageHue=%23fefdfd&clientId=ua42ead4b-648e-4&from=paste&height=360&id=u147751ef&name=image.png&originHeight=720&originWidth=1033&originalType=binary&ratio=2&rotation=0&showTitle=false&size=2980655&status=done&style=none&taskId=uead3e4c9-3a95-4d52-bf97-975a50cbfc1&title=&width=516.5)
> 编辑部门表单校验和新增部门表单校验的区别就是编辑的数据已经在数据库存在了，必然是存在重复的

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677749512586-299e5a21-7b22-46a0-b5f8-381b22e65d76.png#averageHue=%23f4eded&clientId=ua42ead4b-648e-4&from=paste&height=274&id=u9ed8a13a&name=image.png&originHeight=548&originWidth=1304&originalType=binary&ratio=2&rotation=0&showTitle=false&size=71305&status=done&style=none&taskId=u8d664683-563d-4049-8545-b10d63433a1&title=&width=652)

- 编辑场景下排出自身-

- 检查部门编码-代码位置(**src/views/department/components/add-dept.vue**)
```javascript
{
            trigger: 'blur',
            // 自定义校验模式
            validator: async(rule, value, callback) => {
              // value就是输入的编码
              let result = await getDepartment()
              // 判断是否是编辑模式
              if (this.formData.id) {
                // 编辑场景
                result = result.filter(item => item.id !== this.formData.id)
              }
              // result数组中是否存在 value值
              if (result.some(item => item.code === value)) {
                callback(new Error('部门中已经有该编码了'))
              } else {
                callback()
              }
            }
```

- 检查部门名称-代码位置(**src/views/department/components/add-dept.vue**)
```javascript
{
            trigger: 'blur',
            // 自定义校验模式
            validator: async(rule, value, callback) => {
              // value就是输入的名称
              let result = await getDepartment()
              if (this.formData.id) {
                // 编辑场景 排除自身
                result = result.filter(item => item.id !== this.formData.id)
              }
              // result数组中是否存在 value值
              if (result.some(item => item.name === value)) {
                callback(new Error('部门中已经有该名称了'))
              } else {
                callback()
              }
            }
```
# 3.组织架构-编辑部门-确认取消
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677749747629-225cb31d-1994-410f-9173-ab02e903aed1.png#averageHue=%23fafbf8&clientId=ua42ead4b-648e-4&from=paste&height=157&id=u4520238e&name=image.png&originHeight=314&originWidth=2090&originalType=binary&ratio=2&rotation=0&showTitle=false&size=49815&status=done&style=none&taskId=ue31427df-e912-47ee-9f54-3a5fbb1fe16&title=&width=1045)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677749760932-3785d6c4-e5e3-4c4a-9af7-b7b202a3ccb8.png#averageHue=%23c4d9ec&clientId=ua42ead4b-648e-4&from=paste&height=76&id=u7b10cdc0&name=image.png&originHeight=152&originWidth=976&originalType=binary&ratio=2&rotation=0&showTitle=false&size=13226&status=done&style=none&taskId=u32b46a76-87e1-4267-915a-5a0a85b9d22&title=&width=488)

- 封装更新部门的API-代码位置(**src/api/department.js**)
```javascript
/** *
 * 更新部门
 * ***/
export function updateDepartment(data) {
  return request({
    method: 'put',
    url: `/company/department/${data.id}`,
    data
  })
}
```

- 确认时区分当前时编辑还是新增场景-代码位置(**src/views/department/components/add-dept.vue**)
```javascript
 // 点击确定时调用
    btnOK() {
      this.$refs.addDept.validate(async isOK => {
        if (isOK) {
          let msg = '新增'
          // 通过formData中id
          if (this.formData.id) {
            // 编辑场景
            msg = '更新'
            await updateDepartment(this.formData)
          } else {
            // 新增场景
            await addDepartment({ ...this.formData, pid: this.currentNodeId })
          }
          // 通知父组件更新
          this.$emit('updateDepartment')
          // 提示消息
          this.$message.success(`${msg}部门成功`)
          this.close()
        }
      })
    },
```

- 取消时重置数据-代码位置(**src/views/department/components/add-dept.vue**)
```javascript
 close() {
      // 修改父组件的值 子传父
      // resetFields 只能重置在模板中绑定的数据
      this.formData = {
        code: '', // 部门编码
        introduce: '', // 部门介绍
        managerId: '', // 部门负责人id
        name: '', // 部门名称
        pid: '' // 父级部门的id
      }
      this.$refs.addDept.resetFields() // 重置表单
      this.$emit('update:showDialog', false)
    },
```

- 使用计算属性生成当前显示的弹层标题-代码位置(**src/views/department/components/add-dept.vue**)
```javascript
  computed: {
    showTitle() {
      return this.formData.id ? '编辑部门' : '新增部门'
    }
  }
```

- 弹层标题使用计算属性-代码位置(**src/views/department/components/add-dept.vue**)
```vue
<el-dialog :title="showTitle" :visible="showDialog" @close="close">
```
# 4.组织架构-删除部门
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677750220065-3f20f651-b754-4eba-be34-dac79785eadb.png#averageHue=%23fefefe&clientId=ua42ead4b-648e-4&from=paste&height=138&id=u52dbcdf8&name=image.png&originHeight=276&originWidth=1904&originalType=binary&ratio=2&rotation=0&showTitle=false&size=37582&status=done&style=none&taskId=ua7b244a0-1dcd-414f-bcf4-c153139a33a&title=&width=952)

- 封装删除部门的API-代码位置(**src/api/department.js**)
```javascript
/**
 * 删除部门
 *
*/

export function delDepartment(id) {
  return request({
    method: 'delete',
    url: `/company/department/${id}`
  })
}

```

- 在删除场景下调用API删除-代码位置(**src/views/department/index.vue**)
```javascript
  // 操作部门方法
    operateDept(type, id) {
      if (type === 'add') {
        // 添加子部门
        this.showDialog = true // 显示弹层
        this.currentNodeId = id
      } else if (type === 'edit') {
        // 编辑部门场景
        this.showDialog = true
        this.currentNodeId = id // 记录id 要用它获取数据
        // 更新props- 异步动作
        // 直接调用了子组件的方法 同步的方法
        // 要在子组件获取数据
        // 父组件调用子组件的方法来获取数据
        this.$nextTick(() => {
          this.$refs.addDept.getDepartmentDetail() // this.$refs.addDept等同于子组件的this
        })
      } else {
        // 删除部门
        this.$confirm('您确认要删除该部门吗').then(async() => {
          await delDepartment(id)
          // 提示消息
          this.$message.success('删除部门成功')
          this.getDepartment()
        })
      }
    }
```

# 5.角色管理-搭建页面结构
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677750341972-7ca4904e-2010-4272-a5b6-2f4362ad8001.png#averageHue=%23fefefe&clientId=ua42ead4b-648e-4&from=paste&height=199&id=u2ff9100c&name=image.png&originHeight=398&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=2041528&status=done&style=none&taskId=u17e62b53-0ac4-484a-8bae-27e54b6cc2d&title=&width=640)

- 搭建角色管理的页面结构-代码位置(**src/views/role/index.vue**)
```vue
<template>
  <div class="container">
    <div class="app-container">
      <!-- 角色管理内容 -->
      <div class="role-operate">
        <el-button size="mini" type="primary">添加角色</el-button>
      </div>
      <!-- 放置table组件 -->
      <el-table>
        <!-- 放置列 -->
        <el-table-column align="center" width="200" label="角色" />
        <el-table-column align="center" width="200" label="启用" />
        <el-table-column align="center" label="描述" />
        <el-table-column align="center" label="操作" />
      </el-table>
      <!-- 放置分页组件 -->
      <el-row type="flex" style="height:60px" align="middle" justify="end">
        <!-- 放置分页组件 -->
        <el-pagination layout="prev, pager, next" />
      </el-row>
    </div>
  </div>
</template>
```

- 样式-代码位置(**src/views/role/index.vue**)
```css
<style scoped>
.role-operate {
  padding: 10px;
}
</style>
```
# 6.角色管理-获取数据
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677750786822-7ea00314-9161-4aa4-9d41-b5d955bfc2e0.png#averageHue=%23c7dbed&clientId=ua42ead4b-648e-4&from=paste&height=263&id=u93f2476d&name=image.png&originHeight=526&originWidth=550&originalType=binary&ratio=2&rotation=0&showTitle=false&size=25900&status=done&style=none&taskId=u0c9f5c96-c03e-4efd-bd4f-b547e695b80&title=&width=275)

- 封装获取角色API-代码位置(**src/api/role.js**)
```javascript
import request from '@/utils/request'

/** *
 * 获取角色列表
 * **/
export function getRoleList(params) {
  return request({
    url: '/sys/role',
    params // 查询参数
  })
}
```

- 在初始化时调用API-赋值给数据-代码位置(**src/views/role/index.vue**)
```javascript
import { getRoleList } from '@/api/role'
export default {
  name: 'Role'
  name: 'Role',
  data() {
    return {
      list: []
    }
  },
  created() {
    this.getRoleList()
  },
  methods: {
    async getRoleList() {
      const { rows } = await getRoleList()
      this.list = rows // 赋值数据
    }
  }
}
```

- 绑定表格属性-代码位置(**src/views/role/index.vue**)
```html
<el-table :data="list">
        <!-- 放置列 -->
        <el-table-column prop="name" align="center" width="200" label="角色" />
        <el-table-column prop="state" align="center" width="200" label="启用" />
        <el-table-column prop="description" align="center" label="描述" />
        <el-table-column align="center" label="操作" />
</el-table>
```
# 7.角色管理-表格自定义结构

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677751037457-270397b9-7383-41d1-92f1-911ea4d368f1.png#averageHue=%23fefefe&clientId=ua42ead4b-648e-4&from=paste&height=252&id=uec1fc2a8&name=image.png&originHeight=503&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=2580105&status=done&style=none&taskId=u36d8a8c9-4d8d-4cee-b44e-96de4d6e2fa&title=&width=640)

- 自定义启用列和操作列的结构-代码位置(**src/views/role/index.vue**)
```html
<el-table-column prop="state" align="center" width="200" label="启用">
          <!-- 自定义列结构 -->
    <template v-slot="{ row }">
      <span>  {{ row.state === 1 ? "已启用" : row.state === 0 ? "未启用" : "无" }} </span>
    </template>
</el-table-column>
```

- 自定义操作列结构-代码位置(**src/views/role/index.vue**)
```html
<el-table-column align="center" label="操作">
          <!-- 放置操作按钮 -->
    <template>
        <el-button size="mini" type="text">分配权限</el-button>
        <el-button size="mini" type="text">编辑</el-button>
        <el-button size="mini" type="text">删除</el-button>
    </template>
</el-table-column>
```
# 8.角色管理-分页功能
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677751209547-e8d2d074-e33b-4623-a81e-a883d90c7fcc.png#averageHue=%23fefefe&clientId=ua42ead4b-648e-4&from=paste&height=95&id=ue1a0d6e0&name=image.png&originHeight=445&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=2282610&status=done&style=none&taskId=u94be0492-8ea1-454f-b4a5-05ccb6d0f25&title=&width=274)
分页功能

- 展示页码
- 切换分页获取数据

分页组件属性

- 当前页码
- 每页条数
- 总数

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677751267057-b6c8aaea-963f-4683-bcdf-858c6b6c2bc3.png#averageHue=%23b7d1e8&clientId=ua42ead4b-648e-4&from=paste&height=236&id=u8d28e99e&name=image.png&originHeight=472&originWidth=460&originalType=binary&ratio=2&rotation=0&showTitle=false&size=30041&status=done&style=none&taskId=u56ffd116-400d-433d-ad7c-a3990b71f17&title=&width=230)

- 定义分页信息-代码位置(**src/views/role/index.vue**)
```javascript
export default {
  data () {
    return  {
      pageParams: {
          page: 1, // 第几页
          pagesize: 5, // 每页多少条
          total: 0
      }
    }
  }
}
```

- 绑定分页信息-代码位置(**src/views/role/index.vue**)
```html
 <el-pagination
      :page-size="pageParams.pagesize"
      :current-page="pageParams.page"
      :total="pageParams.total"
      layout="prev, pager, next"
      @current-change="changePage"
/>
```

- 初始化时将总数赋值-代码位置(**src/views/role/index.vue**)
```javascript
async getRoleList() {
  const { rows, total } = await getRoleList(this.pageParams)
  this.list = rows // 赋值数据
  this.pageParams.total = total
},
```

- 切换分页时，获取对应页码的数据-代码位置(**src/views/role/index.vue**)
```javascript
    // 切换分页时 请求新的数据
    changePage(newPage) {
      this.pageParams.page = newPage // 赋值当前页码
      this.getRoleList()
    }
```
# 9.角色管理-新增功能弹层

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677751613316-0e9487be-1d0d-4256-8289-7ee9705d2e74.png#averageHue=%23fefefe&clientId=ua42ead4b-648e-4&from=paste&height=360&id=ua274e34b&name=image.png&originHeight=720&originWidth=1001&originalType=binary&ratio=2&rotation=0&showTitle=false&size=2888348&status=done&style=none&taskId=ue8366f4d-8ebe-4212-a807-19db839e6bc&title=&width=500.5)

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677751624887-4fe9d764-97ac-45c8-bbca-dc58be82b72b.png#averageHue=%23ccdeee&clientId=ua42ead4b-648e-4&from=paste&height=102&id=u31ebf0a8&name=image.png&originHeight=204&originWidth=1102&originalType=binary&ratio=2&rotation=0&showTitle=false&size=18749&status=done&style=none&taskId=u7f5ec068-d812-460d-b5e1-4cc1b341c8f&title=&width=551)

- 放置弹层组件-代码位置(**src/views/role/index.vue**)
```html
<el-dialog width="500px" title="新增角色" :visible.sync="showDialog">
      <!-- 表单内容 -->
      <el-form label-width="120px">
        <el-form-item label="角色名称">
          <el-input style="width:300px" size="mini" />
        </el-form-item>
        <el-form-item label="启用">
          <el-switch size="mini" />
        </el-form-item>
        <el-form-item label="角色描述">
          <el-input type="textarea" :rows="3" style="width:300px" size="mini" />
        </el-form-item>
        <el-form-item>
          <el-row type="flex" justify="center">
            <el-col :span="12">
              <el-button type="primary" size="mini">确定</el-button>
              <el-button size="mini">取消</el-button>
            </el-col>
          </el-row>
        </el-form-item>
      </el-form>
    </el-dialog>
```

- 声明变量控制弹层显示-代码位置(**src/views/role/index.vue**)
```javascript
export default {
  data () {
    return  {
      showDialog: false
    }
  }
}
```

- 点击按钮弹出层-代码位置(**src/views/role/index.vue**)
```html
<el-button size="mini" type="primary" @click="showDialog = true">添加角色</el-button>

```

> 有同学可能会问，为啥组织架构要新增和编辑要单独封装一个组件，而角色管理不用呢?这里面有什么原因和讲究吗？ 其实在企业开发过程中，封装组件并不是必须的，当一个业务或者需求明确，并且会有复用的场景下，封装组件会更佳规范一些，而有的企业为了提升开发效率，速度优先, 不封装组件的情况也是很常见的。

# 10.角色管理-表单数据校验
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677751944119-138591df-f25f-46fa-a6e9-7a23949d20dd.png#averageHue=%23fefdfd&clientId=ua42ead4b-648e-4&from=paste&height=347&id=u77e8e185&name=image.png&originHeight=694&originWidth=970&originalType=binary&ratio=2&rotation=0&showTitle=false&size=35661&status=done&style=none&taskId=ub633231d-1846-4d67-b4ed-cfd259b135c&title=&width=485)

- 声明数据和规则-代码位置(**src/views/role/index.vue**)
```javascript
export default  {
  data () {
    return {
      roleForm: {
        name: '',
        description: '',
        state: 0 // 默认未1启用 关闭 0 打开1
      },
      rules: {
        name: [{ required: true, message: '角色名称不能为空', trigger: 'blur' }],
        description: [{ required: true, message: '角色描述不能为空', trigger: 'blur' }]
      }
    }
  }
}
```

- 绑定表单校验和数据-代码位置(**src/views/role/index.vue**)
```html
<el-form ref="roleForm" :model="roleForm" :rules="rules" label-width="120px">
        <el-form-item prop="name" label="角色名称">
          <el-input v-model="roleForm.name" style="width:300px" size="mini" />
        </el-form-item>
        <el-form-item label="启用">
          <!-- 如果不需要校验 就不需要写 prop属性 -->
          <el-switch v-model="roleForm.state" :active-value="1" :inactive-value="0" size="mini" />
        </el-form-item>
        <el-form-item prop="description" label="角色描述">
          <el-input v-model="roleForm.description" type="textarea" :rows="3" style="width:300px" size="mini" />
        </el-form-item>
        
```

# 11.角色管理-新增角色-确定取消
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677752279579-6c531a7f-0853-4425-85e2-7b3084b757ad.png#averageHue=%23d4e3f2&clientId=ua42ead4b-648e-4&from=paste&height=134&id=u659ee9bf&name=image.png&originHeight=268&originWidth=1992&originalType=binary&ratio=2&rotation=0&showTitle=false&size=48351&status=done&style=none&taskId=u227dae1a-48f2-46c5-8ed2-f2294472668&title=&width=996)

- 封装新增角色的API-代码位置(**src/api/role.js**)
```javascript
/** **
 * 新增角色
 * ***/

export function addRole(data) {
  return request({
    url: '/sys/role',
    method: 'post',
    data
  })
}
```

- 确定和取消方法
```javascript
btnOK() {
      this.$refs.roleForm.validate(async isOK => {
        if (isOK) {
          await addRole(this.roleForm)
          this.$message.success('新增角色成功')
          this.getRoleList()
          this.btnCancel()
        }
      })
    },
btnCancel() {
      this.$refs.roleForm.resetFields() // 重置表单数据
      this.showDialog = false // 关闭弹层
},
```

- 弹层绑定关闭方法
```html
  <el-dialog width="500px" title="新增角色" :visible.sync="showDialog" @close="btnCancel">

```

