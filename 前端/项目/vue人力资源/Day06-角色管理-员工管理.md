# 1.角色管理-编辑角色-进入行内编辑
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677752748383-1782735a-c06e-4870-bb74-6b90ae30b768.png#averageHue=%23fefefe&clientId=u437893ff-a4ad-4&from=paste&height=350&id=u02826ef4&name=image.png&originHeight=700&originWidth=2542&originalType=binary&ratio=2&rotation=0&showTitle=false&size=115772&status=done&style=none&taskId=u1952efda-2d03-4dbd-9087-7182c3f99e9&title=&width=1271)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677752762094-a0a67f8f-852d-4562-b351-e13bb19d5546.png#averageHue=%23c6daec&clientId=u437893ff-a4ad-4&from=paste&height=124&id=ue23dbb1e&name=image.png&originHeight=248&originWidth=2046&originalType=binary&ratio=2&rotation=0&showTitle=false&size=37554&status=done&style=none&taskId=u094ccf42-5d1a-4fdc-bf33-a8c74276aea&title=&width=1023)

- 获取数据之后针对每个数据定义标识-使用$set-代码位置(**src/views/role/index.vue**)
```javascript
 // 针对每一行数据添加一个编辑标记
      this.list.forEach(item => {
        // item.isEdit = false // 添加一个属性 初始值为false
        // 数据响应式的问题  数据变化 视图更新
        // 添加的动态属性 不具备响应式特点
        // this.$set(目标对象, 属性名称, 初始值) 可以针对目标对象 添加的属性 添加响应式
        this.$set(item, 'isEdit', false)
      })
```
> 为什么不使用item.isEdit = false , 因为动态添加的属性不具备响应式的特点，如果想要具备响应式，可以使用$set


- 点击编辑时，将当前行的标记isEdit设置为true-代码位置(**src/views/role/index.vue**)
```vue
<el-table-column align="center" label="操作">
    <template>
        <!-- 非编辑状态 -->
        <el-button size="mini" type="text">分配权限</el-button>
        <el-button size="mini" type="text" @click="btnEditRow(row)">编辑</el-button>
        <el-button size="mini" type="text">删除</el-button>
    </template>
</el-table-column>
```

- 点击编辑的方法-代码位置(**src/views/role/index.vue**)
```javascript
    // 点击编辑行
    btnEditRow(row) {
      row.isEdit = true // 改变行的编辑状态
    }
```

- 表格列中根据当前的isEdit标记-渲染结构-代码位置(**src/views/role/index.vue**)
```html
<el-table-column prop="name" align="center" width="200" label="角色">
      <template v-slot="{ row }">
        <!-- 条件判断 -->
        <el-input v-if="row.isEdit" size="mini" />
        <span v-else>{{ row.name }}</span>
      </template>
</el-table-column>
<el-table-column prop="state" align="center" width="200" label="启用">
          <!-- 自定义列结构 -->
    <template v-slot="{ row }">
        <el-switch v-if="row.isEdit" />
        <span v-else>  {{ row.state === 1 ? "已启用" : row.state === 0 ? "未启用" : "无" }} </span>
    </template>
</el-table-column>
<el-table-column prop="description" align="center" label="描述">
     <template v-slot="{ row }">
            <el-input v-if="row.isEdit" type="textarea" />
            <span v-else>{{ row.description }}</span>
      </template>
</el-table-column>
 <el-table-column align="center" label="操作">
    <template v-slot="{ row }">
        <template v-if="row.isEdit">
            <!-- 编辑状态 -->
            <el-button type="primary" size="mini">确定</el-button>
            <el-button size="mini">取消</el-button>
        </template>
        <template v-else>
              <!-- 非编辑状态 -->
            <el-button size="mini" type="text">分配权限</el-button>
            <el-button size="mini" type="text" @click="btnEditRow(row)">编辑</el-button>
            <el-button size="mini" type="text">删除</el-button>
        </template>
    </template>
</el-table-column>
```

> $set的应用

- this.$set(目标对象, 属性名称, 初始值 ) 
- 等价于 Vue.set(目标对象, 属性名称, 初始值)
- 向响应式对象中添加一个属性，并确保这个新属性同样是响应式的，且触发视图更新。

# 2.角色管理-行内编辑-数据缓存

> 为什么要做数据缓存？

答： 因为编辑时，可以取消会滚到之前的状态，所以编辑时的数据是临时的数据。

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677753910169-3091b434-bb01-48f0-9fb1-59c027c01fb2.png#averageHue=%23f8f8f8&clientId=u437893ff-a4ad-4&from=paste&height=341&id=ue432bda9&name=image.png&originHeight=681&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=3493115&status=done&style=none&taskId=uecfa0ac6-3c20-4b5d-98cd-7f4085284c4&title=&width=640)
如图，editRow的数据是针对当前行的数据做了一份拷贝，针对这个拷贝，我们可以随意修改。

- 初始化时缓存数据-代码位置(**src/views/role/index.vue**)
```javascript
    this.list.forEach(item => {
        // item.isEdit = false // 添加一个属性 初始值为false
        // 数据响应式的问题  数据变化 视图更新
        // 添加的动态属性 不具备响应式特点
        // this.$set(目标对象, 属性名称, 初始值) 可以针对目标对象 添加的属性 添加响应式
        this.$set(item, 'isEdit', false)
        this.$set(item, 'editRow', {
          name: item.name,
          state: item.state,
          description: item.description
        })
  })

```

- 点击编辑时更新缓存数据-代码位置(**src/views/role/index.vue**)
```javascript
btnEditRow(row) {
      row.isEdit = true // 改变行的编辑状态
      // 更新缓存数据
      row.editRow.name = row.name
      row.editRow.state = row.state
      row.editRow.description = row.description
}
```

- 将编辑时的表单双向绑定缓存数据-代码位置(**src/views/role/index.vue**)
```html
        <el-table-column prop="name" align="center" width="200" label="角色">
          <template v-slot="{ row }">
            <!-- 条件判断 -->
            <el-input v-if="row.isEdit" v-model="row.editRow.name" size="mini" />
            <span v-else>{{ row.name }}</span>
          </template>
        </el-table-column>
        <el-table-column prop="state" align="center" width="200" label="启用">
          <!-- 自定义列结构 -->
          <template v-slot="{ row }">
            <!-- 开 1 关 0 -->
            <el-switch v-if="row.isEdit" v-model="row.editRow.state" :active-value="1" :inactive-value="0" />
            <span v-else>  {{ row.state === 1 ? "已启用" : row.state === 0 ? "未启用" : "无" }} </span>
          </template>
        </el-table-column>
        <el-table-column prop="description" align="center" label="描述">
          <template v-slot="{ row }">
            <el-input v-if="row.isEdit" v-model="row.editRow.description" size="mini" type="textarea" />
            <span v-else>{{ row.description }}</span>
          </template>
        </el-table-column>
```
# 3.角色管理-编辑角色-确定取消
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677815201836-ee9de62a-2722-4efe-8c14-03e95447bb21.png#averageHue=%23d4e3f2&clientId=u37856cab-f36d-4&from=paste&height=136&id=uc8cefcb9&name=image.png&originHeight=272&originWidth=1794&originalType=binary&ratio=2&rotation=0&showTitle=false&size=41194&status=done&style=none&taskId=u424968bc-f124-408d-adee-be1947ee0c8&title=&width=897)

- 封装更新角色信息的API-代码位置(**src/api/role.js**)
```javascript
/**
 * 更新角色
 * ***/

export function updateRole(data) {
  return request({
    url: `/sys/role/${data.id}`,
    method: 'put',
    data
  })
}
```

- 确定方法-代码位置(**src/views/role/index.vue**)
```javascript
<el-button type="primary" size="mini" @click="btnEditOK(row)">确定</el-button>

// 点击确定时触发
    async  btnEditOK(row) {
      if (row.editRow.name && row.editRow.description) {
        // 下一步操作
        await updateRole({ ...row.editRow, id: row.id })
        // 更新成功
        this.$message.success('更新角色成功')
        // 更新显示数据  退出编辑状态
        // row.name = row.editRow.name // eslint的一校验 误判
        // Object.assign(target, source)
        Object.assign(row, {
          ...row.editRow,
          isEdit: false // 退出编辑模式
        }) // 规避eslint的误判
      } else {
        this.$message.warning('角色和描述不能为空')
      }
    }
```
> 注意： 这里既然更新成功了，要把缓存数据回显到页面上，并且关闭编辑模式

- 取消方法-代码位置(**src/views/role/index.vue**)
```vue
<el-button size="mini" @click="row.isEdit = false">取消</el-button>
```
# 4.角色管理-删除角色

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677815711766-d29bdb45-9e3f-4a4a-922b-c864b49f4447.png#averageHue=%23fefefd&clientId=u37856cab-f36d-4&from=paste&height=167&id=u2413844e&name=image.png&originHeight=334&originWidth=444&originalType=binary&ratio=2&rotation=0&showTitle=false&size=25813&status=done&style=none&taskId=ud942de5c-d5e7-4f1f-a04d-ec01dc0ec26&title=&width=222)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677815719746-6273b8a0-5158-4838-8416-2773e639e55a.png#averageHue=%23fefefe&clientId=u37856cab-f36d-4&from=paste&height=209&id=u0a0aa608&name=image.png&originHeight=418&originWidth=1516&originalType=binary&ratio=2&rotation=0&showTitle=false&size=45323&status=done&style=none&taskId=ud8c76115-7c2a-4820-a47b-77a15bfe773&title=&width=758)

- 封装删除角色的API-代码位置(**src/api/role.js**)
```javascript
/** *
 * 删除角色
 * **/

export function delRole(id) {
  return request({
    url: `/sys/role/${id}`,
    method: 'delete'
  })
}
```

- 在删除位置加入气泡框-代码位置(**src/views/role/index.vue**)
```html
<el-popconfirm title="这是一段内容确定删除吗？" @onConfirm="confirmDel(row.id)" >
      <el-button slot="reference" style="margin-left:10px" size="mini" type="text">删除</el-button>
  </el-popconfirm>
```
> 注意：这里element-ui文档有点问题，el-popconfirm的确认事件是onConfirm，但是文档上写的是confirm事件，这里需要注意

- 删除方法-代码位置(**src/views/role/index.vue**)
```javascript
 async  confirmDel(id) {
      await delRole(id) // 后端删除
      this.$message.success('删除角色成功')
      // 删除的如果是最后一个
      if (this.list.length === 1) this.pageParams.page--
      this.getRoleList()
}
```
# 5.员工管理-页面结构
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677816490770-ee9d2bce-f4b5-40b9-a575-1a255231ae19.png#averageHue=%23fefefe&clientId=u37856cab-f36d-4&from=paste&height=341&id=ue79a6a55&name=image.png&originHeight=681&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=3493115&status=done&style=none&taskId=u67e085fb-dc9c-4f94-8c13-d96d614062c&title=&width=640)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677816509712-d992ed11-cee6-49f9-b218-cd4f63b88ccf.png#averageHue=%238dbe2e&clientId=u37856cab-f36d-4&from=paste&height=281&id=uc666d420&name=image.png&originHeight=562&originWidth=742&originalType=binary&ratio=2&rotation=0&showTitle=false&size=22041&status=done&style=none&taskId=u01928562-e8e8-4a63-9aee-c6c18071357&title=&width=371)

- 基本的页面结构-代码位置(**src/views/employee/index.vue**)
```vue
<template>
  <div class="container">
    <div class="app-container">
      <div class="left">
        <el-input style="margin-bottom:10px" type="text" prefix-icon="el-icon-search" size="small" placeholder="输入员工姓名全员搜索" />
        <!-- 树形组件 -->
      </div>
      <div class="right">
        <el-row class="opeate-tools" type="flex" justify="end">
          <el-button size="mini" type="primary">添加员工</el-button>
          <el-button size="mini">excel导入</el-button>
          <el-button size="mini">excel导出</el-button>
        </el-row>
        <!-- 表格组件 -->
        <!-- 分页 -->
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Employee'
}
</script>

<style lang="scss" scoped>
.app-container {
  background: #fff;
  display: flex;
  .left {
    width: 280px;
    padding: 20px;
    border-right: 1px solid #eaeef4;
  }
  .right {
    flex: 1;
    padding: 20px;
    .opeate-tools {
      margin:10px ;
    }
    .username {
      height: 30px;
      width: 30px;
      line-height: 30px;
      text-align: center;
      border-radius: 50%;
      color: #fff;
      background: #04C9BE;
      font-size: 12px;
      display:inline-block;
    }
  }
}

</style>
```

# 6.员工管理-左侧树的加载
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677816656553-49dffaa1-aa72-4da7-8031-87d9c1488391.png#averageHue=%23fefefe&clientId=u37856cab-f36d-4&from=paste&height=640&id=u1822f880&name=image.png&originHeight=1280&originWidth=579&originalType=binary&ratio=2&rotation=0&showTitle=false&size=2970638&status=done&style=none&taskId=u904fe851-097a-4112-a8c2-e3dd7ff6d20&title=&width=289.5)

- 定义树组件需要的数据-代码位置(**src/views/employee/index.vue**)
```javascript
data() {
    return {
      depts: [], // 组织数据
      defaultProps: {
        label: 'name',
        children: 'children'
      }
    }
}
```

- 放置树形组件-代码位置(**src/views/employee/index.vue**)
```vue
<el-tree
          :data="depts"
          :props="defaultProps"
          default-expand-all
          :expand-on-click-node="false"
          highlight-current
  />
```

- 初始化时加载数据转化树形-代码位置(**src/views/employee/index.vue**)
```javascript
  created() {
    this.getDepartment()
  },
  methods: {
    async getDepartment() {
      // 递归方法 将列表转化成树形
      // let result = await getDepartment()
      this.depts = transListToTreeData(await getDepartment(), 0)
    }
  }
```
# 7.员工管理-选中首个节点
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677816840246-720dc478-86b9-4cb6-8c93-62240b4f4846.png#averageHue=%23faf3f5&clientId=u37856cab-f36d-4&from=paste&height=202&id=u232ce612&name=image.png&originHeight=404&originWidth=460&originalType=binary&ratio=2&rotation=0&showTitle=false&size=23833&status=done&style=none&taskId=u8e9e498b-14e6-47d1-b84c-2bd95edc389&title=&width=230)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677816999813-cd851a56-56ea-4380-a859-a4eaa9708b3a.png#averageHue=%23f5f8ef&clientId=u37856cab-f36d-4&from=paste&height=152&id=u769a010b&name=image.png&originHeight=304&originWidth=1510&originalType=binary&ratio=2&rotation=0&showTitle=false&size=40889&status=done&style=none&taskId=u5689e306-11d9-491a-9c7a-f8f97239ad5&title=&width=755)

- 在data中声明一个记录id的参数-代码位置(**src/views/employee/index.vue**)
```javascript
data () {
  return  {
    // 存储查询参数
      queryParams: {
        departmentId: null
      }
  }
}
```
> 为什么要放在queryParams中，因为后面的查询会有很多查询条件，到时候查询条件都会聚合到一起，所以使用一个公共的对象来管理更方便和合适

- 初始化时首个id节点，并且选中-代码位置(**src/views/employee/index.vue**)
```javascript
methods: {
    async getDepartment() {
      // 递归方法 将列表转化成树形
      // let result = await getDepartment()
      this.depts = transListToTreeData(await getDepartment(), 0)
      this.queryParams.departmentId = this.depts[0].id
      // 设置选中节点
      // 树组件渲染是异步的 等到更新完毕
      this.$nextTick(() => {
        // 此时意味着树渲染完毕
        this.$refs.deptTree.setCurrentKey(this.queryParams.departmentId)
      })
    }
  }
```
> 为什么使用$nextTick，因为我们设置完树形之后立刻选中首个节点，此时更新还没有完成，必须等待更新完成后，再去选中首个节点，所以需要使用$nextTick

- 监听树组件的节点切换事件-代码位置(**src/views/employee/index.vue**)
```html
 <el-tree
          ref="deptTree"
          node-key="id"
          :data="depts"
          :props="defaultProps"
          default-expand-all
          :expand-on-click-node="false"
          highlight-current
          @current-change="selectNode"
  />
```
> 这里需要明白，需要给定node-key属性，否则setCurrentKey方法不知道设置的是哪个字段的值

- 切换节点时再次记录id-代码位置(**src/views/employee/index.vue**)
```javascript
selectNode(node) {
  this.queryParams.departmentId = node.id
}
```
# 8.员工管理-员工列表结构
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677825894381-07247eb0-dacc-4b1f-9466-694bf4bcda3e.png#averageHue=%23fefefe&clientId=u37856cab-f36d-4&from=paste&height=139&id=ub1215292&name=image.png&originHeight=277&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=1420892&status=done&style=none&taskId=u18ba85c5-e30a-4ab0-8b61-04fd45f5a94&title=&width=640)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677825898302-a01e05a6-8b83-47fd-901f-7030b9750138.png#averageHue=%23fefefe&clientId=u37856cab-f36d-4&from=paste&height=45&id=u3b973573&name=image.png&originHeight=235&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=1205451&status=done&style=none&taskId=u457f4e2e-c2f6-49b3-8924-d0ad8cceff4&title=&width=243)

- 右侧列表页面结构-代码位置(**src/views/employee/index.vue**)
```html
<el-table>
    <el-table-column align="center" label="头像" />
    <el-table-column label="姓名" />
    <el-table-column label="手机号" sortable />
    <el-table-column label="工号" sortable />
    <el-table-column label="聘用形式" />
    <el-table-column label="部门" />
    <el-table-column label="入职时间" sortable />
    <el-table-column label="操作" width="280px">
          <template>
              <el-button size="mini" type="text">查看</el-button>
              <el-button size="mini" type="text">角色</el-button>
              <el-button size="mini" type="text">删除</el-button>
          </template>
    </el-table-column>
</el-table>
<!-- 分页 -->
<el-row style="height: 60px" align="middle" type="flex" justify="end">
    <el-pagination
        layout="total,prev, pager, next"
        :total="1000"
     />
</el-row>
```
# 9.员工管理-获取员工数据
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677826089100-e3f11e19-6d18-4fec-9ad5-e746c947887a.png#averageHue=%23fefefe&clientId=u37856cab-f36d-4&from=paste&height=165&id=u518b2953&name=image.png&originHeight=330&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=1692741&status=done&style=none&taskId=u5c1030a2-debc-41d5-ac1b-f7eae5402a6&title=&width=640)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677826096399-05624c46-2979-423c-85ba-4452b679cb10.png#averageHue=%23fdfdfd&clientId=u37856cab-f36d-4&from=paste&height=166&id=u4dce478c&name=image.png&originHeight=332&originWidth=772&originalType=binary&ratio=2&rotation=0&showTitle=false&size=26176&status=done&style=none&taskId=ue93bd7f0-3e3d-45ed-a796-5ff8c370f3c&title=&width=386)
> 第一次加载之后 或者是切换节点之后，都要去根据点击的节点去查询员工的数据


- 封装获取员工数据的API-代码位置(**src/api/employee.js**)
```javascript
export function getEmployeeList(params) {
  return request({
    url: '/sys/user',
    params // 地址参数 查询参数
  })
}
```

- 声明一个list数据进行接受list-代码位置(**src/views/employee/index.vue**)
```javascript
data () {
  return {
    list: []
  }
}
```

- 初始化后获取右侧表格数据-代码位置(**src/views/employee/index.vue**)
```javascript
methods: {
    async getDepartment() {
      // 递归方法 将列表转化成树形
      // let result = await getDepartment()
      this.depts = transListToTreeData(await getDepartment(), 0)
      this.queryParams.departmentId = this.depts[0].id
      // 设置选中节点
      // 树组件渲染是异步的 等到更新完毕
      this.$nextTick(() => {
        // 此时意味着树渲染完毕
        this.$refs.deptTree.setCurrentKey(this.queryParams.departmentId)
      })
      // 这个时候参数 记录了id
      this.getEmployeeList()
    },
    // 获取员工列表的方法
    async getEmployeeList() {
      const { rows } = await getEmployeeList(this.queryParams)
      this.list = rows
    }
  }
```

- 切换节点时，获取右侧表格数据-代码位置(**src/views/employee/index.vue**)
```javascript
selectNode(node) {
      this.queryParams.departmentId = node.id // 重新记录了参数
      this.getEmployeeList()
},
```

- 绑定表格-代码位置(**src/views/employee/index.vue**)
```html
<el-table :data="list">
          <el-table-column prop="staffPhoto" align="center" label="头像" />
          <el-table-column prop="username" label="姓名" />
          <el-table-column prop="mobile" label="手机号" sortable />
          <el-table-column prop="workNumber" label="工号" sortable />
          <el-table-column prop="formOfEmployment" label="聘用形式" />
          <el-table-column prop="departmentName" label="部门" />
          <el-table-column prop="timeOfEntry" label="入职时间" sortable />
          ...
</el-table>
```
# 10.员工管理-头像和聘用形式的处理
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677827015639-63729fb1-ae4d-44eb-89a5-dd33206e9674.png#averageHue=%23f6f5f5&clientId=u37856cab-f36d-4&from=paste&height=278&id=u5ef74224&name=image.png&originHeight=720&originWidth=1113&originalType=binary&ratio=2&rotation=0&showTitle=false&size=3211421&status=done&style=none&taskId=u08328c10-5941-480a-b36e-a5e866075a7&title=&width=429.5)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677827027780-4e5833ab-00ec-4221-bfd8-493cdd059f38.png#averageHue=%23bbd4e9&clientId=u37856cab-f36d-4&from=paste&height=151&id=u34cad627&name=image.png&originHeight=302&originWidth=766&originalType=binary&ratio=2&rotation=0&showTitle=false&size=20783&status=done&style=none&taskId=u6ab4b6bf-8d8e-4c49-be8e-ec3992b3fa0&title=&width=383)

- 头像的设置-代码位置(**src/views/employee/index.vue**)
```html
 <el-table-column prop="staffPhoto" align="center" label="头像">
      <template v-slot="{ row }">
          <el-avatar v-if="row.staffPhoto" :src="row.staffPhoto" :size="30" />
          <span v-else class="username">{{ row.username?.charAt(0) }}</span>
      </template>
</el-table-column>
```

- 聘用形式的处理-代码位置(**src/views/employee/index.vue**)
```html
<el-table-column prop="formOfEmployment" label="聘用形式">
    <template v-slot="{ row }">
        <span v-if="row.formOfEmployment === 1">正式</span>
        <span v-else-if="row.formOfEmployment === 2">非正式</span>
        <span v-else>无</span>
    </template>
</el-table-column>
```
# 11.员工管理-员工分页处理
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677827702383-06c2c5cb-4c7f-4ab1-bfe5-0406095796b8.png#averageHue=%23fefefe&clientId=u37856cab-f36d-4&from=paste&height=69&id=u1b12ccbc&name=image.png&originHeight=225&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=1154164&status=done&style=none&taskId=uc4c8e202-39a4-4009-9246-3c8d936ef81&title=&width=394)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677827714376-1d8178bb-2cb2-43a3-b713-1675009e4d2c.png#averageHue=%23ecf2df&clientId=u37856cab-f36d-4&from=paste&height=211&id=u204b8e07&name=image.png&originHeight=422&originWidth=1236&originalType=binary&ratio=2&rotation=0&showTitle=false&size=53481&status=done&style=none&taskId=u9ed84bc8-d2b6-4c0d-b2b2-a2af88d8ace&title=&width=618)

- 定义分页参数-代码位置(**src/views/employee/index.vue**)
```javascript
data () {
  return {
    queryParams: {
        departmentId: null,
        page: 1, // 当前页码
        pagesize: 10
      },
      total: 0, // 记录员工的总数
  }
}
```

- 绑定分页参数-代码位置(**src/views/employee/index.vue**)
```html
<el-pagination
            layout="total,prev, pager, next"
            :total="total"
            :current-page="queryParams.page"
            :page-size="queryParams.pagesize"
            @current-change="changePage"
  />
```

- 切换页码事件-代码位置(**src/views/employee/index.vue**)
```javascript
// 切换页码
    changePage(newPage) {
      this.queryParams.page = newPage // 赋值新页码
      this.getEmployeeList() // 查询数据
    }
```

- 切换部门时，查询第一页数据-代码位置(**src/views/employee/index.vue**)
```javascript
selectNode(node) {
      this.queryParams.departmentId = node.id // 重新记录了参数
      this.queryParams.page = 1 // 设置第一页
      this.getEmployeeList()
},
```

- 设置ElementUI的语言为中文-代码位置(**src/main.js**)
```javascript
Vue.use(ElementUI)
```
# 12.员工管理-员工模糊搜索

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677828020009-c760b866-5375-4d0c-8f23-11aa5d1fe065.png#averageHue=%23fefefe&clientId=u37856cab-f36d-4&from=paste&height=198&id=u00f56db5&name=image.png&originHeight=396&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=2031269&status=done&style=none&taskId=u74be04ed-1f6a-403c-bcb2-a96c0f6ca08&title=&width=640)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677828027949-0da76fe9-e36b-487c-893e-90ff008b4b24.png#averageHue=%23fdfdfd&clientId=u37856cab-f36d-4&from=paste&height=152&id=ufc4872ac&name=image.png&originHeight=304&originWidth=886&originalType=binary&ratio=2&rotation=0&showTitle=false&size=24172&status=done&style=none&taskId=uf0905b22-f703-49d8-8a58-addcd1278c3&title=&width=443)

- 设置模糊搜索的参数字段-代码位置(**src/views/employee/index.vue**)
```javascript
data () {
  return {
    queryParams: {
        departmentId: null,
        page: 1, // 当前页码
        pagesize: 10,
        keyword: '' // 模糊搜索字段
      },
  }
}
```

- 双向绑定input输入框，监听值改变事件-代码位置(**src/views/employee/index.vue**)
```html
<el-input
          v-model="queryParams.keyword"
          style="margin-bottom:10px"
          type="text"
          prefix-icon="el-icon-search"
          size="small"
          placeholder="输入员工姓名全员搜索"
          @input="changeValue"
/>
```
> 这里监听的事件是input，有同学可能会问，为什么不用change事件，注意change事件是离开焦点触发，input是只要内容发生变化就会触发，所以这里使用input更符合使用场景

- 值改变查询数据-支持防抖查询-代码位置(**src/views/employee/index.vue**)
```javascript
 changeValue() {
      // 单位时间内只执行最后一次
      // this的实例上赋值了一个timer的属性
      clearTimeout(this.timer) // 清理上一次的定时器
      this.timer = setTimeout(() => {
        this.queryParams.page = 1
        this.getEmployeeList()
      }, 300)
}
```
