<template>
  <el-dialog
    :model-value="visible"
    :title="isEdit ? '编辑用户' : '新增用户'"
    width="500px"
    @close="handleClose"
  >
    <el-form
      ref="formRef"
      :model="form"
      :rules="rules"
      label-width="80px"
    >
      <el-form-item label="用户名" prop="username">
        <el-input v-model="form.username" placeholder="请输入用户名" :disabled="isEdit" />
      </el-form-item>

      <el-form-item label="姓名" prop="realName">
        <el-input v-model="form.realName" placeholder="请输入姓名" />
      </el-form-item>

      <el-form-item label="所属店铺" prop="storeId" v-if="userStore.isSuperAdmin">
        <el-select v-model="form.storeId" placeholder="请选择店铺" style="width: 100%">
          <el-option
            v-for="store in storeList"
            :key="store.id"
            :label="store.storeName"
            :value="store.id"
          />
        </el-select>
      </el-form-item>

      <el-form-item label="手机号" prop="phone">
        <el-input v-model="form.phone" placeholder="请输入手机号" />
      </el-form-item>

      <el-form-item label="邮箱" prop="email">
        <el-input v-model="form.email" placeholder="请输入邮箱" />
      </el-form-item>

      <el-form-item label="角色" prop="roleId" v-if="userStore.isSuperAdmin">
        <el-select v-model="form.roleId" placeholder="请选择角色" style="width: 100%">
          <el-option
            v-for="role in roleList"
            :key="role.roleId"
            :label="role.roleName"
            :value="role.roleId"
          />
        </el-select>
      </el-form-item>

      <el-form-item label="角色" v-if="!userStore.isSuperAdmin">
        <el-tag type="info">店员</el-tag>
      </el-form-item>

      <el-form-item label="状态" prop="status">
        <el-radio-group v-model="form.status">
          <el-radio :label="1">正常</el-radio>
          <el-radio :label="0">禁用</el-radio>
        </el-radio-group>
      </el-form-item>

      <el-form-item v-if="!isEdit" label="密码" prop="password">
        <el-input v-model="form.password" type="password" placeholder="请输入密码（默认123456）" show-password />
      </el-form-item>

      <el-form-item v-if="isEdit" label="新密码">
        <el-input
          v-model="form.newPassword"
          type="password"
          placeholder="留空则不修改密码"
          show-password
        />
      </el-form-item>
    </el-form>

    <template #footer>
      <el-button @click="handleClose">取消</el-button>
      <el-button type="primary" :loading="loading" @click="handleSubmit">确定</el-button>
    </template>
  </el-dialog>
</template>

<script setup>
import { ref, computed, watch } from 'vue'
import { ElMessage } from 'element-plus'
import { getUserById, addUser, updateUser } from '@/api/user'
import { useUserStore } from '@/store/user'

const userStore = useUserStore()

const props = defineProps({
  visible: Boolean,
  userId: Number,
  roleList: {
    type: Array,
    default: () => []
  },
  storeList: {
    type: Array,
    default: () => []
  }
})

const emit = defineEmits(['update:visible', 'success'])

const formRef = ref(null)
const loading = ref(false)

const isEdit = computed(() => !!props.userId)

const form = ref({
  username: '',
  realName: '',
  storeId: null,
  phone: '',
  email: '',
  roleId: null,
  status: 1,
  password: '',
  newPassword: ''
})

const rules = computed(() => ({
  username: [
    { required: true, message: '请输入用户名', trigger: 'blur' },
    { min: 3, max: 20, message: '用户名长度需在3-20个字符之间', trigger: 'blur' }
  ],
  realName: [
    { required: true, message: '请输入姓名', trigger: 'blur' }
  ],
  roleId: userStore.isSuperAdmin ? [
    { required: true, message: '请选择角色', trigger: 'change' }
  ] : [],
  storeId: userStore.isSuperAdmin ? [
    { required: true, message: '请选择店铺', trigger: 'change' }
  ] : [],
  email: [
    { type: 'email', message: '邮箱格式不正确', trigger: 'blur' }
  ]
}))

const fetchUserData = async () => {
  if (!props.userId) return

  try {
    const res = await getUserById(props.userId)
    const userData = res.data
    form.value = {
      username: userData.username,
      realName: userData.realName,
      storeId: userData.storeId,
      phone: userData.phone || '',
      email: userData.email || '',
      roleId: userData.roleId,
      status: userData.status,
      password: '',
      newPassword: ''
    }
  } catch (error) {
    ElMessage.error('获取用户信息失败')
  }
}

const handleClose = () => {
  formRef.value?.resetFields()
  form.value = {
    username: '',
    realName: '',
    storeId: null,
    phone: '',
    email: '',
    roleId: null,
    status: 1,
    password: '',
    newPassword: ''
  }
  emit('update:visible', false)
}

const handleSubmit = async () => {
  if (!formRef.value) return

  await formRef.value.validate(async (valid) => {
    if (!valid) return

    loading.value = true
    try {
      const data = {
        username: form.value.username,
        realName: form.value.realName,
        phone: form.value.phone,
        email: form.value.email,
        status: form.value.status
      }

      if (userStore.isSuperAdmin) {
        data.roleId = form.value.roleId
        data.storeId = form.value.storeId
      } else {
        data.roleId = 6
        data.storeId = userStore.storeId
      }

      if (isEdit.value) {
        if (form.value.newPassword) {
          data.password = form.value.newPassword
        }
        await updateUser(props.userId, data)
        ElMessage.success('更新成功')
      } else {
        data.password = form.value.password || '123456'
        await addUser(data)
        ElMessage.success('新增成功')
      }

      emit('success')
      handleClose()
    } catch (error) {
      const msg = error?.message || (isEdit.value ? '更新失败' : '新增失败')
      ElMessage.error(msg)
    } finally {
      loading.value = false
    }
  })
}

watch(() => props.visible, (val) => {
  if (val) {
    if (!userStore.isSuperAdmin && !isEdit.value) {
      form.value.roleId = 6
      form.value.storeId = userStore.storeId
    }
    fetchUserData()
  }
})
</script>
