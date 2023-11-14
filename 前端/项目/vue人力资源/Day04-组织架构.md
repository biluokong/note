# 1.组织架构-树组件应用
- 树形组件-用层级结构展示信息，可展开或折叠。

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677738110068-ea692e72-4e8a-4315-9957-2e721d6b8b16.png#averageHue=%23fefefe&clientId=u3b925e71-c3f3-4&from=paste&height=360&id=ucd0d6c58&name=image.png&originHeight=720&originWidth=997&originalType=binary&ratio=2&rotation=0&showTitle=false&size=2876799&status=done&style=none&taskId=uc9542946-8a3f-4e34-8717-0356f37e030&title=&width=498.5)

- element-ui提供了树组件[el-tree](https://element.eleme.cn/#/zh-CN/component/tree)的应用
- data（绑定数据）
- props (设置属性) - children(设置子节点的字段名) / label(设置显示内容的字段名)
- default-expand-all (默认展开所有节点)


- 在组织架构组件中放置树形组件-代码位置(**src/views/department/index.vue**)
```vue
<el-tree default-expand-all :data="depts" :props="defaultProps">
```

- 声明树组件相关的数据
```vue
export default {
  name: 'Department',
  data() {
    return  {
      depts: [{
        name: '传智教育',
        children: [
          { name: '总裁办'},
          { name: '行政部'},
          { name: '财务部'}
        ]
      }],
      defaultProps: {
        children: 'children',
        label: 'name'
      }
    }
  }
}
```

# 2.组织架构-树组件自定义结构

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677738592558-c28bc123-0649-442d-a9e7-3ffae394ceb8.png#averageHue=%23c4c2c2&clientId=u3b925e71-c3f3-4&from=paste&height=491&id=u79ab5491&name=image.png&originHeight=982&originWidth=2302&originalType=binary&ratio=2&rotation=0&showTitle=false&size=292590&status=done&style=none&taskId=ubb6bbea7-b8cf-42b2-a424-43139f0211f&title=&width=1151)
> 通过在el-tree中传入插槽内容，就可以渲染数据


- 自定义树形结构-代码位置(**src/views/department/index.vue**)
```vue
<el-tree default-expand-all :data="depts" :props="defaultProps">
        <!-- 节点结构 -->
        <!-- v-slot="{ node, data }" 只能作用在template -->
        <template v-slot="{ data }">
          <el-row style="width:100%;height:40px" type="flex" justify="space-between" align="middle">
            <el-col>{{ data.name }}</el-col>
            <el-col :span="4">
              <span class="tree-manager">{{ data.managerName }}</span>
              <!-- $event 实参 表示类型 -->
              <el-dropdown >
                <!-- 显示区域内容 -->
                <span class="el-dropdown-link">
                  操作<i class="el-icon-arrow-down el-icon--right" />
                </span>
                <!-- 下拉菜单选项 -->
                <el-dropdown-menu slot="dropdown">
                  <el-dropdown-item command="add">添加子部门</el-dropdown-item>
                  <el-dropdown-item command="edit">编辑部门</el-dropdown-item>
                  <el-dropdown-item command="del">删除</el-dropdown-item>
                </el-dropdown-menu>
              </el-dropdown>
            </el-col>
          </el-row>
        </template>
  </el-tree>
```

- 样式-代码位置(**src/views/department/index.vue**)
```vue
<style scoped>
.app-container {
  padding: 30px 140px;
  font-size: 14px;
}
.tree-manager {
  width: 50px;
  display: inline-block;
  margin: 10px;
}
</style>

```
# 3.组织架构-获取组织架构数据

- 封装获取组织的API-代码位置(**src/api/department.js**)
```javascript
import request from '@/utils/request'

/**
 *
 * 获取组织架构数据
 *
*/
export function getDepartment() {
  return request({
    url: '/company/department'
  })
}

```

- 在组织架构初始化时调用方法-代码位置(**src/views/department/index.vue**)
```vue
<script>
import { getDepartment } from '@/api/department'
export default {
  name: 'Department',
  data() {
    return  {
      depts: [],
      defaultProps: {
        children: 'children',
        label: 'name'
      }
    }
  },
  created() {
    this.getDepartment()
  },
  methods: {
   async getDepartment() {
    const result = await getDepartment()
    this.depts = result
   }
  }
}
  </script>
```

# 4.组织架构-递归转化树形结构
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677739143296-91524ee5-f620-4bfd-ba98-8daff7b3d776.png#averageHue=%23fefefe&clientId=u3b925e71-c3f3-4&from=paste&height=294&id=u4b62e80d&name=image.png&originHeight=588&originWidth=1404&originalType=binary&ratio=2&rotation=0&showTitle=false&size=62715&status=done&style=none&taskId=u24312e6d-526b-43b2-8b9e-2443f5e294d&title=&width=702)

1. 首先分析数据的关联关系
2. 封装递归函数根据关联关系转化层级结构

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677739203020-4b45dd92-17de-42a5-a48d-bd2a4681a9f6.png#averageHue=%23c0bfbf&clientId=u3b925e71-c3f3-4&from=paste&height=279&id=u6aa1eb4d&name=image.png&originHeight=558&originWidth=1844&originalType=binary&ratio=2&rotation=0&showTitle=false&size=107834&status=done&style=none&taskId=u31461297-c03b-410d-8d62-4aa539330b7&title=&width=922)
> 通过分析了解到，父级的id为子级的pid

- 封装公共方法-代码位置(src/utils/index.js)
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
      // 当前节点的id 和 当前节点的子节点的pid是想等的
      const children = transListToTreeData(list, item.id) // 找到的节点的子节点
      item.children = children  // 将子节点赋值给当前节点
      arr.push(item)
    }
  })
  return arr
}

```

- 获取完的组织数据使用转化方法转化成树形-代码位置(**src/views/department/index.vue**)
```vue
  created() {
    this.getDepartment() // 调用获取数据的接口
  },
  methods: {
    // 封装好方法
    async getDepartment() {
      const result = await getDepartment()
      this.depts = transListToTreeData(result, 0)
    }
  }
```

总结：递归特点

- 一般用来处理未知层级的数据
- 递归要有跳出条件
- 自身调用自身时参数不能重复

# 5.组织架构-添加子部门-新建弹层组件
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677739452145-7877672e-185c-46d1-9fbb-b7b2da8dee5e.png#averageHue=%23f9f9f9&clientId=u3b925e71-c3f3-4&from=paste&height=332&id=u2c8da4a9&name=image.png&originHeight=664&originWidth=1240&originalType=binary&ratio=2&rotation=0&showTitle=false&size=65831&status=done&style=none&taskId=uff964e6c-ad54-4166-a952-5d92820aef1&title=&width=620)
步骤：

- 注册添加子部门事件
- 封装弹层组件
- 控制弹层显示隐藏

- 注册下拉菜单点击事件-代码位置(**src/views/department/index.vue**)
```html
<el-dropdown @command="operateDept">
      <!-- 显示区域内容 -->
      <span class="el-dropdown-link">
            操作<i class="el-icon-arrow-down el-icon--right" />
      </span>
                <!-- 下拉菜单选项 -->
      <el-dropdown-menu slot="dropdown">
            <el-dropdown-item command="add">添加子部门</el-dropdown-item>
            <el-dropdown-item command="edit">编辑部门</el-dropdown-item>
            <el-dropdown-item command="del">删除</el-dropdown-item>
      </el-dropdown-menu>
</el-dropdown>
```

- 声明变量控制弹层显示隐藏-代码位置(**src/views/department/index.vue**)
```vue
<script>
export default {
  data () {
    return {
      showDialog: false
    }
  },
  methods: {
    operateDept(type) {
      if(type === 'add') {
        this.showDialog = true
      }
    }
  }
}
</script>
```

- 封装新增组织部门组件-代码位置(**src/views/department/components/add-dept.vue**)
```vue
<template>
  <el-dialog title="新增部门" :visible="showDialog" @close="close">
  </el-dialog>
</template>
<script>
export default {
  name: 'AddDept'
  props: {
    showDialog: {
      type: Boolean,
      default: false
    },
  },
  methods: {
    close() {
      this.$emit('update:showDialog', false)
    }
  }
}
</script>

```

- 在组织架构中放置新增部门组件-代码位置(**src/views/department/index.vue**)
```html
<add-dept  :show-dialog.sync="showDialog"  />
```
> 这里我们同样使用了sync修饰符，可以监听子组件传过来的 **update:属性名**的事件，直接将父组件的值进行修改

- 设置el-tree组件的点击属性-(点击树不可以折叠，只有点击折叠展开图标才可以)-代码位置(**src/views/department/index.vue**)
```html
<el-tree :expand-on-click-node="false" ></el-tree>
```
# 6.组织架构-添加子部门-表单结构
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677740130758-34c131b8-39b0-4d6a-b2b6-6d662e7cf87e.png#averageHue=%23fefefe&clientId=u3b925e71-c3f3-4&from=paste&height=360&id=uc47dc97e&name=image.png&originHeight=720&originWidth=784&originalType=binary&ratio=2&rotation=0&showTitle=false&size=2262364&status=done&style=none&taskId=uf84ab241-8b8c-48a0-9bfc-390aec453ac&title=&width=392)

- 新增组织架构结构-代码位置(**src/views/department/components/add-dept.vue**)
```vue
<el-form  label-width="120px">
      <el-form-item prop="name" label="部门名称">
        <el-input  placeholder="2-10个字符" style="width: 80%" size="mini" />
      </el-form-item>
      <el-form-item label="部门编码">
        <el-input  placeholder="2-10个字符" style="width: 80%" size="mini" />
      </el-form-item>
      <el-form-item label="部门负责人">
        <el-select  placeholder="请选择负责人" style="width: 80%" size="mini">
        </el-select>
      </el-form-item>
      <el-form-item  label="部门介绍">
        <el-input  placeholder="1-100个字符" type="textarea" size="mini" :rows="4" style="width: 80%" />
      </el-form-item>
      <el-form-item>
        <!-- 按钮 -->
        <el-row type="flex" justify="center">
          <el-col :span="12">
            <el-button size="mini" type="primary" >确定</el-button>
            <el-button size="mini" >取消</el-button>
          </el-col>
        </el-row>
      </el-form-item>
    </el-form>
```

# 7.组织架构-添加子部门-表单基本校验

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677740252464-0d9c9975-41f6-44d3-b8a9-c8015f5e4d15.png#averageHue=%23fefafa&clientId=u3b925e71-c3f3-4&from=paste&height=360&id=u8da041d6&name=image.png&originHeight=720&originWidth=906&originalType=binary&ratio=2&rotation=0&showTitle=false&size=2614295&status=done&style=none&taskId=u1cb0e091-6020-4854-bbe1-f5054c14c5a&title=&width=453)
表单校验规则

- 规则表单项必填/表单项长度限制
- 部门名称和已有部门不重复
- 部门编码和已有编码不重复

步骤：

1. 定义数据架构
2. 绑定属性
3. 定义规则

基本校验

- 声明数据和规则-代码位置(**src/views/department/components/add-dept.vue**)
```javascript
export default {
  data () {
    return  {
      formData: {
        code: '', // 部门编码
        introduce: '', // 部门介绍
        managerId: '', // 部门负责人id
        name: '', // 部门名称
        pid: '' // 父级部门的id
      },
       rules: {
        code: [{ required: true, message: '部门编码不能为空', trigger: 'blur' },
          {
            min: 2, max: 10, message: '部门编码的长度为2-10个字符', trigger: 'blur'
          }
        ], // 部门编码
        introduce: [{ required: true, message: '部门介绍不能为空', trigger: 'blur' }, {
          min: 1, max: 100, message: '部门介绍的长度为1-100个字符', trigger: 'blur'
        }], // 部门介绍
        managerId: [{ required: true, message: '部门负责人不能为空', trigger: 'blur' }], // 部门负责人id
        name: [{ required: true, message: '部门名称不能为空', trigger: 'blur' },
          {
            min: 2, max: 10, message: '部门名称的长度为2-10个字符', trigger: 'blur'
          }] // 部门名称
        // pid: '' // 父级部门的id 不需要做校验
      }
    }
  }
}
```

- 绑定属性-代码位置(**src/views/department/components/add-dept.vue**)
```html
<el-form ref="addDept" :model="formData" :rules="rules" label-width="120px">
      <el-form-item prop="name" label="部门名称">
        <el-input v-model="formData.name" placeholder="2-10个字符" style="width: 80%" size="mini" />
      </el-form-item>
      <el-form-item prop="code" label="部门编码">
        <el-input v-model="formData.code" placeholder="2-10个字符" style="width: 80%" size="mini" />
      </el-form-item>
      <el-form-item prop="managerId" label="部门负责人">
        <el-select v-model="formData.managerId" placeholder="请选择负责人" style="width: 80%" size="mini">
        </el-select>
      </el-form-item>
      <el-form-item prop="introduce" label="部门介绍">
        <el-input v-model="formData.introduce" placeholder="1-100个字符" type="textarea" size="mini" :rows="4" style="width: 80%" />
      </el-form-item>
      <el-form-item>
        <!-- 按钮 -->
        <el-row type="flex" justify="center">
          <el-col :span="12">
            <el-button size="mini" type="primary" >确定</el-button>
            <el-button size="mini" >取消</el-button>
          </el-col>
        </el-row>
      </el-form-item>
    </el-form>
```

# 8.组织架构-添加子部门-表单业务校验

- 部门名称和已有部门不重复
- 部门编码和已有编码不重复

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677740531860-8d534228-e565-42b1-a47c-b0c9a38809b2.png#averageHue=%23fcf9f9&clientId=u3b925e71-c3f3-4&from=paste&height=242&id=ud8aa5b0c&name=image.png&originHeight=484&originWidth=1426&originalType=binary&ratio=2&rotation=0&showTitle=false&size=42075&status=done&style=none&taskId=u4839b548-7161-419a-b3af-26ac17c69e6&title=&width=713)

- 部门和编码的重复校验-代码位置(**src/views/department/components/add-dept.vue**)

> 编码的校验规则

```javascript
{
            trigger: 'blur',
            // 自定义校验模式
            validator: async(rule, value, callback) => {
              // value就是输入的编码
              let result = await getDepartment()
              // result数组中是否存在 value值
              if (result.some(item => item.code === value)) {
                callback(new Error('部门中已经有该编码了'))
              } else {
                callback()
              }
            }
}
```
> 部门的校验规则

```javascript
{
            trigger: 'blur',
            // 自定义校验模式
            validator: async(rule, value, callback) => {
              // value就是输入的编码
              let result = await getDepartment()
              // result数组中是否存在 value值
              if (result.some(item => item.name === value)) {
                callback(new Error('部门中已经有该名称了'))
              } else {
                callback()
              }
            }
          }
```

# 9.组织架构-添加子部门-获取负责人数据
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677740718946-ac222593-9fe0-4369-97eb-6e601eabf3ec.png#averageHue=%23f4f4f4&clientId=u3b925e71-c3f3-4&from=paste&height=360&id=uf8eae448&name=image.png&originHeight=720&originWidth=818&originalType=binary&ratio=2&rotation=0&showTitle=false&size=2360443&status=done&style=none&taskId=ua749931f-b32b-4783-b18b-54bf03954b6&title=&width=409)
步骤：

1. 获取负责人列表
2. 绑定下拉组件

- 封装获取负责人的API-代码位置(**src/api/department.js**)
```javascript
/**
 *
 *  获取部门负责人的数据
 * **/

export function getManagerList() {
  return request({
    url: '/sys/user/simple'
  })
}
```

- 在组件初始化时调用-代码位置(**src/views/department/components/add-dept.vue**)
```javascript
import { getManagerList } from '@/api/department'
export default {
  data () {
    return {
      managerList: [], // 存储负责人列表
    }
  },
  created() {
    this.getManagerList()
  },
  methods: {
   async getManagerList() {
     this.managerList = await getManagerList()
    }
  }
  
}
```

- select渲染下拉选项-代码位置(**src/views/department/components/add-dept.vue**)
```html
<el-select v-model="formData.managerId" placeholder="请选择负责人" style="width: 80%" size="mini">
   <!-- 下拉选项 循环 负责人数据 label表示显示的字段 value 存储字段 -->
    <el-option v-for="item in managerList" 
      :key="item.id" 
      :label="item.username"
      :value="item.id" />
</el-select>
```

# 10.组织架构-添加子部门-记录部门
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677741042399-77e6810f-8b6e-4397-ba67-d4a38be77a7c.png#averageHue=%23fefefe&clientId=u3b925e71-c3f3-4&from=paste&height=154&id=u584ab5d6&name=image.png&originHeight=307&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=1574758&status=done&style=none&taskId=ueae27dbc-8048-4de9-89cc-746b0faa92e&title=&width=640)
> 因为添加子部门是基于当前部门，所以需要记录当前是在哪个部门添加的

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677741085317-7668531f-1b72-4692-9524-f1ee90d38e97.png#averageHue=%23c5d3e9&clientId=u3b925e71-c3f3-4&from=paste&height=300&id=ua000d23b&name=image.png&originHeight=600&originWidth=754&originalType=binary&ratio=2&rotation=0&showTitle=false&size=35663&status=done&style=none&taskId=u15c3d28d-d195-46f3-8b59-3dd0a9ec43e&title=&width=377)

- 点击添加子部门时传递id-代码位置(**src/views/department/index.vue**)
```html
 <el-dropdown @command="operateDept($event, data.id)">

```
> $event 实参 表示点击菜单传出来的类型

- 声明一个响应式数据记录该id-代码位置(**src/views/department/index.vue**)
```javascript
export default {
  data () {
    return  {
      currentNodeId: null, // 存储当前点击的id
    }
  }
}
```

- 添加子部门方法-记录id-代码位置(**src/views/department/index.vue**)
```javascript
   // 操作部门方法
    operateDept(type, id) {
      if (type === 'add') {
        // 添加子部门
        this.showDialog = true // 显示弹层
        this.currentNodeId = id
      } 
    }
```

- 通过组件传递id-代码位置(**src/views/department/index.vue**)
```javascript
<add-dept :current-node-id="currentNodeId" :show-dialog.sync="showDialog"  />

```

- 子组件接收id-代码位置(**src/views/department/components/add-dept.vue**)
```javascript
export default {
  props: {
    currentNodeId: {
      type: Number,
      default: null
    }
  }
}
```

# 11.组织架构-添加子部门-确定取消
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677741723760-d075c93f-fe2e-4dc6-b714-4196ed7540f4.png#averageHue=%23dae3f1&clientId=u3b925e71-c3f3-4&from=paste&height=177&id=u7c41303e&name=image.png&originHeight=354&originWidth=2330&originalType=binary&ratio=2&rotation=0&showTitle=false&size=50802&status=done&style=none&taskId=u41d4b88c-a6e4-47db-af0b-faee8034fb1&title=&width=1165)

- 封装新增部门的API-代码位置(**src/api/department.js**)
```javascript
/**
 * 新增组织
 * ***/
export function addDepartment(data) {
  return request({
    method: 'post',
    url: '/company/department',
    data
  })
}
```

- 确定方法-代码位置(**src/views/department/components/add-dept.vue**)
```javascript
  // 点击确定时调用
    btnOK() {
      this.$refs.addDept.validate(async isOK => {
        if (isOK) {
          await addDepartment({ ...this.formData, pid: this.currentNodeId })
          // 通知父组件更新
          this.$emit('updateDepartment')
          // 提示消息
          this.$message.success(`新增部门成功`)
          this.close()
        }
      })
    },
```

- 取消方法-代码位置(**src/views/department/components/add-dept.vue**)
```javascript
close() {
      this.$refs.addDept.resetFields() // 重置表单
      this.$emit('update:showDialog', false)
},
```

- 父组件监听updateDepartment事件
```html
    <add-dept @updateDepartment="getDepartment" />

```
