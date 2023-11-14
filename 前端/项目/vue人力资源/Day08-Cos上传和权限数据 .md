# 1.员工详情-封装员工头像组件
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677833005395-f17c7423-3376-4c00-96d1-67c3167f7412.png#averageHue=%23fbfcfd&clientId=u4c56d459-399b-4&from=paste&height=194&id=u17995a34&name=image.png&originHeight=720&originWidth=1160&originalType=binary&ratio=2&rotation=0&showTitle=false&size=3346993&status=done&style=none&taskId=udfc1e3ab-ddcf-4bbf-8fa5-c0b08a8e16b&title=&width=313)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677833020435-9b0d3283-7792-4052-b334-e71b9aad9428.png#averageHue=%2386b42d&clientId=u4c56d459-399b-4&from=paste&height=126&id=ubd9721b3&name=image.png&originHeight=252&originWidth=1580&originalType=binary&ratio=2&rotation=0&showTitle=false&size=50936&status=done&style=none&taskId=u1e41f982-65ec-4541-a46e-27912e313d7&title=&width=790)

- 创建image-upload组件-代码位置(**src/views/employee/components/image-upload.vue**)
```vue
<template>
  <el-upload
    class="avatar-uploader"
    action=""
    :show-file-list="false"
    :before-upload="beforeAvatarUpload"
  >
    <!-- (自动上传)action是上传地址 人资项目不需要 人资项目(手动上传)  -->
    <!-- show-file-list不展示列表 -->
    <img v-if="value" :src="value" class="avatar">
    <i v-else class="el-icon-plus avatar-uploader-icon" />
  </el-upload>
</template>

<script>
export default {
  props: {
    value: {
      type: String,
      default: ''
    }
  },
  methods: {
    // 检查函数 判断文件的类型还有大小 return  true(继续上传)/false(停止上传)
    beforeAvatarUpload(file) {
      // jpeg png gif bmp

      const isJPG = ['image/jpeg', 'image/png', 'image/gif', 'image/bmp'].includes(file.type)
      const isLt2M = file.size / 1024 / 1024 < 5 // 5M

      if (!isJPG) {
        this.$message.error('上传头像图片只能是 JPG PNG GIF BMP 格式!')
      }
      if (!isLt2M) {
        this.$message.error('上传头像图片大小不能超过 5MB!')
      }
      return isJPG && isLt2M
    }
  }
}
</script>

<style>
  .avatar-uploader .el-upload {
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
  }
  .avatar-uploader .el-upload:hover {
    border-color: #409EFF;
  }
  .avatar-uploader-icon {
    font-size: 28px;
    color: #8c939d;
    width: 178px;
    height: 178px;
    line-height: 178px;
    text-align: center;
  }
  .avatar {
    width: 178px;
    height: 178px;
    display: block;
  }
</style>
```

- 在父组件中应用-代码位置(**src/views/employee/detail.vue**)
```html
  <image-upload v-model="userInfo.staffPhoto" />
```
# 2.员工详情-上传图片-创建腾讯云存储桶

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677833258270-eee271c3-5ab1-4484-9c0f-97f6817af64f.png#averageHue=%23c3d9ec&clientId=u4c56d459-399b-4&from=paste&height=92&id=u68c58fd9&name=image.png&originHeight=184&originWidth=1670&originalType=binary&ratio=2&rotation=0&showTitle=false&size=29580&status=done&style=none&taskId=ua8153662-e6bb-479d-8269-62be9e760b7&title=&width=835)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677833270507-5fc631dc-8bc0-427b-b6fc-6731d5d8960e.png#averageHue=%23e8e4dc&clientId=u4c56d459-399b-4&from=paste&height=187&id=u6cd76483&name=image.png&originHeight=374&originWidth=1476&originalType=binary&ratio=2&rotation=0&showTitle=false&size=126500&status=done&style=none&taskId=uadca734a-ec8b-48e9-8239-d5f2e2c92f6&title=&width=738)
1.注册腾讯云账号-课前完成[https://cloud.tencent.com/login](https://cloud.tencent.com/login)  
2.创建腾讯云存储桶
3.得到应用密钥和应用标识

- 创建存储桶

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677833319333-ada7a14d-3dc2-449d-a9c9-5b5fb00d9fe3.png#averageHue=%231c1f28&clientId=u4c56d459-399b-4&from=paste&height=264&id=ue3bf684f&name=image.png&originHeight=720&originWidth=1272&originalType=binary&ratio=2&rotation=0&showTitle=false&size=3670083&status=done&style=none&taskId=u27544305-f443-4d08-9e41-513a836530c&title=&width=466)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677833333438-7867e505-14c6-4abf-b61a-23f8a370e1c8.png#averageHue=%23fafafa&clientId=u4c56d459-399b-4&from=paste&height=317&id=u7d26f2f4&name=image.png&originHeight=720&originWidth=1049&originalType=binary&ratio=2&rotation=0&showTitle=false&size=3026800&status=done&style=none&taskId=u51b093b7-d9c7-42ce-9016-70c4c9c8ede&title=&width=462.5)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677833344558-6f548828-6a72-464f-8a67-60d1ace6efa7.png#averageHue=%23fbf3ee&clientId=u4c56d459-399b-4&from=paste&height=360&id=uc11ba825&name=image.png&originHeight=720&originWidth=1008&originalType=binary&ratio=2&rotation=0&showTitle=false&size=2908532&status=done&style=none&taskId=u9199e9d8-739f-4fd2-bbb4-99691aeaf24&title=&width=504)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677833350344-1a8b6f3c-cea8-4df0-a5aa-4dd7caf2ee3f.png#averageHue=%23fbfbfb&clientId=u4c56d459-399b-4&from=paste&height=360&id=u4648f900&name=image.png&originHeight=720&originWidth=844&originalType=binary&ratio=2&rotation=0&showTitle=false&size=2435446&status=done&style=none&taskId=u356ae19d-7e0f-4aef-a833-be616db90b4&title=&width=422)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677833354890-226ff7c8-0f51-4406-bc3a-adf30f6ffba1.png#averageHue=%23f4f4f4&clientId=u4c56d459-399b-4&from=paste&height=349&id=u7601d039&name=image.png&originHeight=1280&originWidth=664&originalType=binary&ratio=2&rotation=0&showTitle=false&size=3406539&status=done&style=none&taskId=uccfd9cff-e367-4399-842a-d5648dc33ef&title=&width=181)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677833364446-1c41ff0e-4a99-4843-9ac8-e6196cd15b0d.png#averageHue=%23fafafa&clientId=u4c56d459-399b-4&from=paste&height=200&id=ud7178459&name=image.png&originHeight=540&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=2769888&status=done&style=none&taskId=u704f0064-3b24-4b0b-b910-8e28d5a461c&title=&width=473)

## 2.1获取存储桶相关信息

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677833395741-421e5f68-e815-47cc-b3d6-f0259e75cd08.png#averageHue=%23f9f9f8&clientId=u4c56d459-399b-4&from=paste&height=188&id=u78bf5e6d&name=image.png&originHeight=568&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=2913512&status=done&style=none&taskId=u2b3ca8ed-9418-4f37-9aea-b7c8e77bbba&title=&width=423)
> 将存储桶和所属地域拷贝下来，备用

- 获取应用标识[https://console.cloud.tencent.com/cam/capi](https://console.cloud.tencent.com/cam/capi)

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677833458836-4629c1cf-32ab-4b6a-9b26-6a4862bc0299.png#averageHue=%23f9f9f9&clientId=u4c56d459-399b-4&from=paste&height=146&id=uf87d5b81&name=image.png&originHeight=291&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=1492692&status=done&style=none&taskId=u31f9e329-b250-4b5c-ab7c-af26c19399b&title=&width=640)
> 将SecretId和SecretKey拷贝下来，备用



# 3.员工详情-使用cos-sdk完成上传

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677833552518-92362551-cb15-481b-82a7-8d1430938cda.png#averageHue=%23caddee&clientId=u4c56d459-399b-4&from=paste&height=89&id=u1ca7c711&name=image.png&originHeight=214&originWidth=1634&originalType=binary&ratio=2&rotation=0&showTitle=false&size=29863&status=done&style=none&taskId=u71fec65b-680e-4615-9412-1cce1f412af&title=&width=683)

- 安装腾讯云js-sdk
```bash
$ npm i cos-js-sdk-v5 
$ yarn add  cos-js-sdk-v5

```

- 使用el-upload自定义上传-代码位置(**src/views/employee/components/image-upload.vue**)
```html
<template>
  <el-upload
    class="avatar-uploader"
    action=""
    :show-file-list="false"
    :before-upload="beforeAvatarUpload"
    :http-request="uploadImage"
  >
    <!-- (自动上传)action是上传地址 人资项目不需要 人资项目(手动上传)  -->
    <!-- show-file-list不展示列表 -->
    <img v-if="value" :src="value" class="avatar">
    <i v-else class="el-icon-plus avatar-uploader-icon" />
  </el-upload>
</template>

```

- 实现上传方法-代码位置
```javascript

    // 选择图片上传
    uploadImage(params) {
      console.log(params.file)
      const cos = new COS({
        SecretId: 'AKIDDSdjgnjT1NZ3a7VjkfVIwOdfv9IH2b8e',
        SecretKey: 'WEwe9WJ9vLeq1BHNLLKF5Up10ndUDk24'
      }) // 完成cos对象的初始化
      cos.putObject({
        Bucket: 'heimachengxuyuan-1302806742', // 存储桶名称
        Region: 'ap-nanjing', // 地域名称
        Key: params.file.name, // 文件名称
        StorageClass: 'STANDARD', // 固定值
        Body: params.file // 文件对象
      }, (err, data) => {
        if (data.statusCode === 200 && data.Location) {
          // 拿到了腾讯云返回的地址
          // 通过input自定义事件将地址传出去
          this.$emit('input', 'http://' + data.Location) // 将地址返回了
        } else {
          this.$message.error(err.Message) // 上传失败提示消息
        }
      })
    }
```
> 这里需要使用 上个小节准备好的存储桶的名称-地域名称-应用标识-应用密钥


这里需要知道Cos的初始化和上传的方法
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677833817089-4f668b24-9c77-4cac-912f-ffdbaf6af09e.png#averageHue=%23f4f4e5&clientId=u4c56d459-399b-4&from=paste&height=150&id=ua0daf110&name=image.png&originHeight=300&originWidth=954&originalType=binary&ratio=2&rotation=0&showTitle=false&size=32482&status=done&style=none&taskId=u7c39a9e6-b10c-4c13-89ec-74e21670494&title=&width=477)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677833842743-a46c4235-2b40-4664-93f8-a826709b6d93.png#averageHue=%23f9f9dc&clientId=u4c56d459-399b-4&from=paste&height=179&id=ue9b81845&name=image.png&originHeight=358&originWidth=900&originalType=binary&ratio=2&rotation=0&showTitle=false&size=63540&status=done&style=none&taskId=uc722b42c-a51b-4aa7-b405-2e1228f4c62&title=&width=450)


# 4. 权限管理-搭建权限页面
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677833885187-f484a9b4-ade0-47c0-b720-12b2a3c01c5a.png#averageHue=%23fefefe&clientId=u4c56d459-399b-4&from=paste&height=303&id=u66c40e4b&name=image.png&originHeight=605&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=3103295&status=done&style=none&taskId=u736dae85-0d0e-4793-a6b6-b7146ef59a3&title=&width=640)

- 实现权限管理的页面结构-代码位置(**src/views/permission/index.vue**)
```vue
<template>
  <div class="container">
    <div class="app-container">
      <el-button class="btn-add" size="mini" type="primary">添加权限</el-button>
      <el-table>
        <el-table-column label="名称" />
        <el-table-column label="标识" />
        <el-table-column label="描述" />
        <el-table-column label="操作">
          <el-button size="mini" type="text">添加</el-button>
          <el-button size="mini" type="text">编辑</el-button>
          <el-button size="mini" type="text">删除</el-button>
        </el-table-column>
      </el-table>
    </div>
  </div>
</template>
<script>
export default {
  name: 'Permission'
}
</script>
<style>
.btn-add {
  margin: 10px;
}
</style>
```
# 5.权限管理-获取数据转化树形

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677833971421-774b3214-fd61-4b1c-9413-652c9dfb5f33.png#averageHue=%23bed5ea&clientId=u4c56d459-399b-4&from=paste&height=78&id=ub48bd2ad&name=image.png&originHeight=156&originWidth=1814&originalType=binary&ratio=2&rotation=0&showTitle=false&size=38850&status=done&style=none&taskId=u859ed293-642b-424a-a8a4-801b83c91fa&title=&width=907)

- 封装获取权限API-代码位置(**src/api/permission.js**)
```javascript
import request from '@/utils/request'

/** *
 * 获取权限列表
 * **/

export function getPermissionList() {
  return request({
    url: '/sys/permission'
  })
}
```

- 获取数据-转化树形-控制二级权限不显示添加按钮(**src/views/permission/index.vue**)
```vue
<template>
  <div class="container">
    <div class="app-container">
      <el-button class="btn-add" size="mini" type="primary">添加权限</el-button>
      <el-table default-expand-all :data="list" row-key="id">
        <el-table-column prop="name" label="名称" />
        <el-table-column prop="code" label="标识" />
        <el-table-column prop="description" label="描述" />
        <el-table-column label="操作">
          <template v-slot="{ row }">
            <el-button v-if="row.type === 1" size="mini" type="text">添加</el-button>
            <el-button size="mini" type="text">编辑</el-button>
            <el-button size="mini" type="text">删除</el-button>
          </template>

        </el-table-column>
      </el-table>
    </div>
  </div>
</template>
<script>
import { getPermissionList } from '@/api/permission'
import { transListToTreeData } from '@/utils'
export default {
  name: 'Permission',
  data() {
    return {
      list: []
    }
  },
  created() {
    this.getPermissionList()
  },
  methods: {
    async getPermissionList() {
      this.list = transListToTreeData(await getPermissionList(), 0) // 将列表数据转化成树形结构
    }
  }
}
</script>
<style>
.btn-add {
  margin: 10px;
}
</style>
```
# 6.权限管理-作业

基于权限接口和线上效果完成 权限点的新增- 删除- 编辑

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677834122259-9436fa47-4384-4ab9-b16a-20dd95bf049e.png#averageHue=%23f6a478&clientId=u4c56d459-399b-4&from=paste&height=238&id=u2c53508b&name=image.png&originHeight=720&originWidth=1040&originalType=binary&ratio=2&rotation=0&showTitle=false&size=3000839&status=done&style=none&taskId=u987c8f26-fa0f-452f-aa23-ff6962a18e7&title=&width=344)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677834238397-7f0bfb87-40bc-434e-91fd-a618a504ca57.png#averageHue=%23fefefe&clientId=u4c56d459-399b-4&from=paste&height=360&id=u8a8bf2c0&name=image.png&originHeight=720&originWidth=861&originalType=binary&ratio=2&rotation=0&showTitle=false&size=2484483&status=done&style=none&taskId=u826e46df-af90-4b8d-8eca-cdc991ae381&title=&width=430.5)

要求： 

1. 实现新增-删除-编辑功能
2. 编辑模式不做限制-弹层-行内-跳转都可
3. 注意：二级权限和一级权限的区别为type，当type为1时，为一级权限，当type为2时，为二级权限
4. 二级权限应该添加在一级权限下，二者是通过id和pid进行关联的，其类似于组织架构中的添加子部门。



作业实现

1. 封装权限管理的API接口-代码位置(**src/api/permission.js**)
```javascript
// 新增权限
export function addPermission(data) {
  return request({
    url: '/sys/permission',
    method: 'post',
    data
  })
}

// 更新权限
export function updatePermission(data) {
  return request({
    url: `/sys/permission/${data.id}`,
    method: 'put',
    data
  })
}

// 删除权限
export function delPermission(id) {
  return request({
    url: `/sys/permission/${id}`,
    method: 'delete'
  })
}
// 获取权限详情
export function getPermissionDetail(id) {
  return request({
    url: `/sys/permission/${id}`
  })
}
```
2.新增编辑权限的弹层-代码位置(**src/views/permission/index.vue**)
```vue
<!-- 放置一个弹层 用来编辑新增节点 -->
   <el-dialog :title="`${showText}权限点`" :visible="showDialog" @close="btnCancel">
      <!-- 表单 -->
      <el-form ref="perForm" :model="formData" :rules="rules" label-width="120px">
        <el-form-item label="权限名称" prop="name">
          <el-input v-model="formData.name" style="width:90%" />
        </el-form-item>
        <el-form-item label="权限标识" prop="code">
          <el-input v-model="formData.code" style="width:90%" />
        </el-form-item>
        <el-form-item label="权限描述">
          <el-input v-model="formData.description" style="width:90%" />
        </el-form-item>
        <el-form-item label="开启">
          <el-switch
            v-model="formData.enVisible"
            active-value="1"
            inactive-value="0"
          />
        </el-form-item>
      </el-form>
      <el-row slot="footer" type="flex" justify="center">
        <el-col :span="6">
          <el-button size="small" type="primary" @click="btnOK">确定</el-button>
          <el-button size="small" @click="btnCancel">取消</el-button>
        </el-col>
      </el-row>
    </el-dialog>
```
声明弹层需要的变量和表单数据和校验规则-代码位置(**src/views/permission/index.vue**)
```javascript
import { getPermissionList, updatePermission, addPermission, getPermissionDetail, delPermission } from '@/api/permission'
import { transListToTreeData } from '@/utils'
export default {
  data() {
    return {
      list: [],
      formData: {
        name: '', // 名称
        code: '', // 标识
        description: '', // 描述
        type: '', // 类型 该类型 不需要显示 因为点击添加的时候已经知道类型了
        pid: '', // 因为做的是树 需要知道添加到哪个节点下了
        enVisible: "0" // 默认关闭
      },
      rules: {
        name: [{ required: true, message: '权限名称不能为空', trigger: 'blur' }],
        code: [{ required: true, message: '权限标识不能为空', trigger: 'blur' }]
      },
      showDialog: false
    }
  },
  computed: {
    showText() {
      return this.formData.id ? '编辑' : '新增'
    }
  },
  created() {
    this.getPermissionList()
  },
  methods: {
    async  getPermissionList() {
      this.list = transListToTreeData(await getPermissionList(), 0)
    }
  }

}
```

3. 实现一级权限新增-二级权限新增-代码位置(**src/views/permission/index.vue**)

添加一级权限-![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1678074254526-7cfd6266-26bb-4c13-b9e6-86345d401eb5.png#averageHue=%23afc1fd&clientId=u7b1a501c-532c-4&from=paste&height=49&id=u037666a6&name=image.png&originHeight=98&originWidth=222&originalType=binary&ratio=2&rotation=0&showTitle=false&size=3926&status=done&style=none&taskId=u26ad6743-5893-4817-87de-bd1ff2c9d9a&title=&width=111)
```vue
<el-button class="btn-add" size="mini" type="primary" @click="addPermission(row.id, 1)">添加权限</el-button>

```
添加二级权限-![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1678074274228-dccc6d48-9587-4d97-ab5a-b858d7c1aa9c.png#averageHue=%23fefefe&clientId=u7b1a501c-532c-4&from=paste&height=115&id=uaf0b478b&name=image.png&originHeight=230&originWidth=348&originalType=binary&ratio=2&rotation=0&showTitle=false&size=7273&status=done&style=none&taskId=u3831f006-ebce-44eb-ba5f-ad6e4e05cbd&title=&width=174)

> 注意：一级添加的type为1， 二级添加的type为2


点击添加调用的方法
```javascript
   addPermission(pid, type) {
      this.formData.pid = pid
      this.formData.type = type
      this.showDialog = true
  },
```
实现确定和取消方法

```javascript
btnOK() {
      this.$refs.perForm.validate().then(() => {
        if (this.formData.id) {
          return updatePermission(this.formData)
        }
        return addPermission(this.formData)
      }).then(() => {
        //  提示消息
        this.$message.success('新增成功')
        this.getPermissionList()
        this.showDialog = false
      })
    },
    btnCancel() {
      this.formData = {
        name: '', // 名称
        code: '', // 标识
        description: '', // 描述
        type: '', // 类型 该类型 不需要显示 因为点击添加的时候已经知道类型了
        pid: '', // 因为做的是树 需要知道添加到哪个节点下了
        enVisible: "0" // 默认关闭
      }
      this.$refs.perForm.resetFields()
      this.showDialog = false
    },
```
实现编辑弹层
```vue
<el-button type="text" size="mini" @click="editPermission(row.id)">编辑</el-button>

```
点击编辑方法
```javascript
 async editPermission(id) {
      // 根据获取id获取详情
      this.formData = await getPermissionDetail(id)
      this.showDialog = true
}
```

点击删除
```vue
<el-button type="text" size="mini" @click="delPermission(row.id)"> 删除</el-button>

```
删除方法
```javascript
  // 删除操作
    async delPermission(id) {
      try {
        await this.$confirm('确定要删除该数据吗')
        await delPermission(id)
        this.getPermissionList()
        this.$message.success('删除成功')
      } catch (error) {
        console.log(error)
      }
    },
```
# 7.权限应用-权限概念
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677834304319-dbfd8faf-bd57-4719-8450-4c03a656e4be.png#averageHue=%23b6d0e7&clientId=u4c56d459-399b-4&from=paste&height=182&id=ufe5f4cac&name=image.png&originHeight=364&originWidth=1238&originalType=binary&ratio=2&rotation=0&showTitle=false&size=42816&status=done&style=none&taskId=ud740de6a-bee8-4e87-88b5-86e225e698a&title=&width=619)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677834314017-e9d78635-e9d8-44e9-93f7-42b81a27aa8e.png#averageHue=%23fdfdfd&clientId=u4c56d459-399b-4&from=paste&height=158&id=u34e536b5&name=image.png&originHeight=316&originWidth=1124&originalType=binary&ratio=2&rotation=0&showTitle=false&size=22602&status=done&style=none&taskId=u31de76fa-a41e-4bdc-ac7a-b55b841527f&title=&width=562)

> 权限是通过角色这个中间人实现，首先员工拥有角色，角色拥有权限，那么员工自动拥有了角色所对应的权限。

所以接下来，我们需要实现 给员工分配角色，给角色分配权限。

- 分配过程-给员工分角色

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677834416868-5e31e01e-e5e9-4261-ab5d-04dcc35a6165.png#averageHue=%23d0d0d0&clientId=u4c56d459-399b-4&from=paste&height=180&id=u054c55cf&name=image.png&originHeight=360&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=1846624&status=done&style=none&taskId=ub98ea7a2-374d-4b01-97a3-54e4933434c&title=&width=640)

- 分配过程-给角色分权限

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677834426135-cbfcb3d8-6fff-403a-b971-fdef39077f65.png#averageHue=%23e4e4e4&clientId=u4c56d459-399b-4&from=paste&height=360&id=u3440f90d&name=image.png&originHeight=720&originWidth=1132&originalType=binary&ratio=2&rotation=0&showTitle=false&size=3266235&status=done&style=none&taskId=u7bb220a2-e649-460c-8966-5c0a857a505&title=&width=566)

# 8.权限应用-员工分配角色-弹出层
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677834466527-d20cd145-69c2-46ad-9dcc-c833f0403268.png#averageHue=%23fefefe&clientId=u4c56d459-399b-4&from=paste&height=67&id=u254cf4cd&name=image.png&originHeight=267&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=1369588&status=done&style=none&taskId=ub2f6eb3d-3333-459c-aa62-cfe973041c9&title=&width=323)![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677834477921-35954767-07b5-49d3-8ac8-f422128a5852.png#averageHue=%23fefefe&clientId=u4c56d459-399b-4&from=paste&height=96&id=ufba0eaa6&name=image.png&originHeight=350&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=1795320&status=done&style=none&taskId=u3d3ef042-ff7f-4f54-8155-63e07094ccb&title=&width=351)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677834495411-f054d3f5-19f1-4c2f-ad2a-b774c4f36e54.png#averageHue=%23b5d0e7&clientId=u4c56d459-399b-4&from=paste&height=67&id=u44db7def&name=image.png&originHeight=134&originWidth=1014&originalType=binary&ratio=2&rotation=0&showTitle=false&size=14655&status=done&style=none&taskId=ub20aa228-1fe7-45b2-b7eb-344b31296db&title=&width=507)

- 封装获取可用角色的API-代码位置(**src/api/employee.js**)
```javascript
/**
 * 获取可用的角色
 * **/

export function getEnableRoleList() {
  return request({
    url: '/sys/role/list/enabled'
  })
}
```

- 声明变量控制弹层显示-和角色列表-代码位置(**src/views/employee/index.vue**)
```javascript
data () {
  return {
      showRoleDialog: false, // 用来控制角色弹层的显示
      roleList: [], // 接收角色列表
      roleIds: [] // 用来双向绑定数据的
  }
}
```

- 点击角色按钮-获取角色列表-代码位置(**src/views/employee/index.vue**)
```javascript
// 点击角色按钮弹出层
    async btnRole() {
      this.showRoleDialog = true
      this.roleList = await getEnableRoleList()
    }
```

- 放置弹层-绑定变量和渲染checkbox-代码位置(**src/views/employee/index.vue**)
```html
<el-dialog :visible.sync="showRoleDialog" title="分配角色">
      <!-- 弹层内容 -->
      <!-- checkbox -->
      <el-checkbox-group v-model="roleIds">
        <!-- 放置n个的checkbox  要执行checkbox的存储值 item.id-->
        <el-checkbox
          v-for="item in roleList"
          :key="item.id"
          :label="item.id"
        >{{ item.name }}</el-checkbox>
      </el-checkbox-group>
</el-dialog>
```
# 9.权限应用-员工分配角色-回显数据并提交

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677834822261-0ccc70cf-1091-4922-ba62-0b06815fad6f.png#averageHue=%2387b52e&clientId=u4c56d459-399b-4&from=paste&height=184&id=u3b177e32&name=image.png&originHeight=368&originWidth=1556&originalType=binary&ratio=2&rotation=0&showTitle=false&size=52739&status=done&style=none&taskId=u878da963-daa2-42c7-b04f-72662d6ad2f&title=&width=778)

- 封装给员工分配角色的接口-代码位置(**src/api/employee.js**)
```javascript
/**
 * 分配员工角色
 * ***/

export function assignRole(data) {
  return request({
    url: '/sys/user/assignRoles',
    method: 'put',
    data
  })
}
```

- 点击角色按钮时，获取员工已经拥有的角色，并记录当前点击的用户id-代码位置(**src/views/employee/index.vue**)

     在data中声明一个id用来记录

```javascript
data () {
  return  {
    currentUserId: null // 用来记录当前点击的用户id
  }
}
```
```javascript
async btnRole(id) {
      this.roleList = await getEnableRoleList()
      // 记录当前点击的id 因为后边 确定取消要存取给对应的用户
      this.currentUserId = id
      const { roleIds } = await getEmployeeDetail(id)
      this.roleIds = roleIds
      this.showRoleDialog = true // 调整顺序
},
```
> 注意，这里我们特地调整了弹层的顺序，因为获取已经拥有的角色是一个异步的过程，如果弹层显示在前，会出现卡顿的效果，表现出缓慢的效果，所以等到获取所有数据之后再弹层。

- 点击确定实现给用户分配角色-代码位置(**src/views/employee/index.vue**)
```javascript
 // 点击角色的确定
    async  btnRoleOK() {
      await assignRole({
        id: this.currentUserId,
        roleIds: this.roleIds
      })
      this.$message.success('分配用户角色成功')
      this.showRoleDialog = false
    }
```

- 取消关闭弹层-代码位置(**src/views/employee/index.vue**)
```html
<el-row slot="footer" type="flex" justify="center">
  <el-col :span="6">
    <el-button type="primary" size="mini" @click="btnRoleOK">确定</el-button>
    <el-button size="mini" @click="showRoleDialog = false">取消</el-button>
  </el-col>
</el-row>
```
# 9.权限应用-给角色分配权限-弹出层
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677835230908-40c17c33-b3d5-434c-a518-ea3ff24acf5c.png#averageHue=%23f4e3e9&clientId=u4c56d459-399b-4&from=paste&height=65&id=udc267641&name=image.png&originHeight=437&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=2241577&status=done&style=none&taskId=uae0dfe4b-c231-4e08-830d-b8b7d30508b&title=&width=191)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677835321380-483e544d-32b4-4b48-81fb-ea5e677a0264.png#averageHue=%23d2e2f1&clientId=u4c56d459-399b-4&from=paste&height=194&id=ua855eb4f&name=image.png&originHeight=388&originWidth=912&originalType=binary&ratio=2&rotation=0&showTitle=false&size=26875&status=done&style=none&taskId=ue88be67e-a628-4cdd-87e9-1bbb396a924&title=&width=456)

- 声明变量控制弹层显示和接收权限数据-代码位置(**src/views/role/index.vue**)
```javascript
data () {
  return {
     showPermissionDialog: false,
     permissionData: []
  }
}
```

- 点击分配权限-弹出层-获取数据并转化树形-代码位置(**src/views/role/index.vue**)
```javascript
<el-button size="mini" type="text" @click="btnPermission">分配权限</el-button>
async  btnPermission() {
      this.showPermissionDialog = true
      this.permissionData = transListToTreeData(await getPermissionList(), 0)
}
```

- 放置弹层和树组件-代码位置(**src/views/role/index.vue**)
```html
<!-- 放置权限弹层 -->
    <el-dialog :visible.sync="showPermissionDialog" title="分配权限">
      <!-- 放置权限数据 -->
      <el-tree
        :data="permissionData"
        :props="{ label: 'name' }"
        show-checkbox
        default-expand-all
      />
    </el-dialog>
```
# 10.权限应用-角色分配权限-显示已有权限数据
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677835574407-3f4ad4a4-65fd-4a0f-a2e8-074dabe043a1.png#averageHue=%23f4e3e9&clientId=u4c56d459-399b-4&from=paste&height=87&id=ua69ac3b1&name=image.png&originHeight=437&originWidth=1280&originalType=binary&ratio=2&rotation=0&showTitle=false&size=2241577&status=done&style=none&taskId=u41cdbe97-7e2a-4b7e-818d-2cc09ff0764&title=&width=254)
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677835588018-bba64874-f186-44e3-9f6f-18d2a14d4582.png#averageHue=%23eff4e5&clientId=u4c56d459-399b-4&from=paste&height=167&id=u1193adcc&name=image.png&originHeight=334&originWidth=1718&originalType=binary&ratio=2&rotation=0&showTitle=false&size=53471&status=done&style=none&taskId=u9f6c56be-f21b-47d6-90ba-831fe530144&title=&width=859)

- 封装获取角色详情的API-代码位置(**src/api/role.js**)
```javascript
/**
 * 获取角色详情
 * **/

export function getRoleDetail(id) {
  return request({
    url: `/sys/role/${id}`
  })
}
```

- 声明变量记录当前点击的角色id和角色所拥有的权限数据-代码位置(**src/views/role/index.vue**)
```javascript
data () {
  return {
      currentRoleId: null,
      permIds: []
  }
}
```

- 点击分配权限按钮时传递角色id，并根据id获取该角色所拥有的权限-代码位置(**src/views/role/index.vue**)
```javascript
<el-button size="mini" type="text" @click="btnPermission(row.id)">分配权限</el-button>
async  btnPermission(id) {
      this.currentRoleId = id
      const { permIds } = await getRoleDetail(id)
      this.permIds = permIds
      this.permissionData = transListToTreeData(await getPermissionList(), 0)
      this.showPermissionDialog = true
}
```

- 设置el-tree组件的属性-node-key和当前选中数据-代码位置(**src/views/role/index.vue**)
```html
<el-tree
        node-key="id"
        :data="permissionData"
        :props="{ label: 'name' }"
        show-checkbox
        default-expand-all
        :default-checked-keys="permIds"
  />
```
> default-checked-keys的属性是设置当前选中的节点，但是必须配合node-key属性，因为permIds变量中存储的都是id，必须el-tree组件知道key是哪个字段，所以设置node-key="id"

# 11.权限应用-角色分配权限-确定提交

![image.png](https://cdn.nlark.com/yuque/0/2023/png/8435673/1677836272564-462602b4-6059-4b73-9ffb-f6b13de8ab2d.png#averageHue=%23a5c7e2&clientId=u4c56d459-399b-4&from=paste&height=109&id=u6a76f137&name=image.png&originHeight=218&originWidth=984&originalType=binary&ratio=2&rotation=0&showTitle=false&size=25675&status=done&style=none&taskId=u32b777b0-4e91-4f53-9cb2-6e972d1c64d&title=&width=492)

- 封装分配权限的接口API-代码位置(**src/api/role.js**)
```javascript
/**
 * 给角色分配权限
 *
 * ***/

export function assignPerm(data) {
  return request({
    url: '/sys/role/assignPrem',
    method: 'put',
    data
  })
}
```

- 确定和取消事件-代码位置(**src/views/role/index.vue**)
```javascript
 <el-row slot="footer" type="flex" justify="center">
        <el-col :span="6">
          <el-button type="primary" size="mini" @click="btnPermissionOK">确定</el-button>
          <el-button size="mini" @click="showPermissionDialog = false">取消</el-button>
      </el-col>
  </el-row>

// 点击确定时触发
    async  btnPermissionOK() {
      await assignPerm({
        id: this.currentRoleId,
        permIds: this.$refs.permTree.getCheckedKeys()
      })
      this.$message.success('角色分配权限成功')
      this.showPermissionDialog = false
    }
```
