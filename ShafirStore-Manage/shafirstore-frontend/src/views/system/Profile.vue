<template>
  <div class="profile-container">
    <el-card>
      <template #header>
        <span>个人中心</span>
      </template>

      <el-tabs v-model="activeTab" class="profile-tabs">
        <el-tab-pane label="基本信息" name="info">
          <el-form
            ref="infoFormRef"
            :model="infoForm"
            :rules="infoRules"
            label-width="100px"
            class="info-form"
          >
            <el-form-item label="用户名">
              <el-input v-model="infoForm.username" disabled />
            </el-form-item>

            <el-form-item label="真实姓名" prop="realName">
              <el-input v-model="infoForm.realName" placeholder="请输入真实姓名" />
            </el-form-item>

            <el-form-item label="手机号码" prop="phone">
              <el-input v-model="infoForm.phone" placeholder="请输入手机号码" />
            </el-form-item>

            <el-form-item label="邮箱" prop="email">
              <el-input v-model="infoForm.email" placeholder="请输入邮箱" />
            </el-form-item>

            <el-form-item label="角色">
              <el-input v-model="infoForm.roleName" disabled />
            </el-form-item>

            <el-form-item label="创建时间">
              <el-input v-model="infoForm.createTime" disabled />
            </el-form-item>

            <el-form-item>
              <el-button type="primary" @click="handleUpdateInfo" :loading="infoLoading">
                保存修改
              </el-button>
            </el-form-item>
          </el-form>
        </el-tab-pane>

        <el-tab-pane label="修改密码" name="password">
          <el-form
            ref="passwordFormRef"
            :model="passwordForm"
            :rules="passwordRules"
            label-width="120px"
            class="password-form"
          >
            <el-form-item label="当前密码" prop="oldPassword">
              <el-input
                v-model="passwordForm.oldPassword"
                type="password"
                placeholder="请输入当前密码"
                show-password
              />
            </el-form-item>

            <el-form-item label="新密码" prop="newPassword">
              <el-input
                v-model="passwordForm.newPassword"
                type="password"
                placeholder="请输入新密码"
                show-password
              />
            </el-form-item>

            <el-form-item label="确认新密码" prop="confirmPassword">
              <el-input
                v-model="passwordForm.confirmPassword"
                type="password"
                placeholder="请再次输入新密码"
                show-password
              />
            </el-form-item>

            <el-form-item>
              <el-button type="primary" @click="handleChangePassword" :loading="passwordLoading">
                修改密码
              </el-button>
              <el-button @click="resetPasswordForm">重置</el-button>
            </el-form-item>
          </el-form>
        </el-tab-pane>
      </el-tabs>
    </el-card>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue'
import { ElMessage } from 'element-plus'
import { useUserStore } from '@/store/user'
import { getCurrentUser, updateCurrentUser } from '@/api/auth'
import { resetPassword } from '@/api/user'

const userStore = useUserStore()

const activeTab = ref('info')
const infoFormRef = ref(null)
const passwordFormRef = ref(null)
const infoLoading = ref(false)
const passwordLoading = ref(false)

const infoForm = reactive({
  username: '',
  realName: '',
  phone: '',
  email: '',
  roleName: '',
  createTime: ''
})

const passwordForm = reactive({
  oldPassword: '',
  newPassword: '',
  confirmPassword: ''
})

const validateConfirmPassword = (rule, value, callback) => {
  if (value !== passwordForm.newPassword) {
    callback(new Error('两次输入的新密码不一致'))
  } else {
    callback()
  }
}

const infoRules = {
  realName: [
    { required: true, message: '请输入真实姓名', trigger: 'blur' }
  ],
  phone: [
    { pattern: /^1[3-9]\d{9}$/, message: '请输入正确的手机号码', trigger: 'blur' }
  ],
  email: [
    { type: 'email', message: '请输入正确的邮箱地址', trigger: 'blur' }
  ]
}

const passwordRules = {
  oldPassword: [
    { required: true, message: '请输入当前密码', trigger: 'blur' }
  ],
  newPassword: [
    { required: true, message: '请输入新密码', trigger: 'blur' },
    { min: 6, max: 20, message: '密码长度在 6 到 20 个字符', trigger: 'blur' }
  ],
  confirmPassword: [
    { required: true, message: '请再次输入新密码', trigger: 'blur' },
    { validator: validateConfirmPassword, trigger: 'blur' }
  ]
}

const fetchUserInfo = async () => {
  try {
    const res = await getCurrentUser()
    const userData = res.data || {}

    infoForm.username = userData.username || userStore.username || ''
    infoForm.realName = userData.realName || userStore.realName || ''
    infoForm.phone = userData.phone || ''
    infoForm.email = userData.email || ''
    infoForm.roleName = userData.roleName || userStore.roleName || ''
    infoForm.createTime = userData.createTime ? formatDate(userData.createTime) : ''
  } catch (error) {
    console.error('获取用户信息失败', error)
    ElMessage.error('获取用户信息失败')
  }
}

const formatDate = (dateString) => {
  if (!dateString) return ''
  const date = new Date(dateString)
  const year = date.getFullYear()
  const month = String(date.getMonth() + 1).padStart(2, '0')
  const day = String(date.getDate()).padStart(2, '0')
  const hours = String(date.getHours()).padStart(2, '0')
  const minutes = String(date.getMinutes()).padStart(2, '0')
  return `${year}-${month}-${day} ${hours}:${minutes}`
}

const handleUpdateInfo = async () => {
  if (!infoFormRef.value) return

  await infoFormRef.value.validate(async (valid) => {
    if (valid) {
      infoLoading.value = true
      try {
        const res = await updateCurrentUser({
          realName: infoForm.realName,
          phone: infoForm.phone,
          email: infoForm.email
        })

        if (res.code === 200 || res.code === 0) {
          ElMessage.success('个人信息更新成功')

          userStore.userInfo = {
            ...userStore.userInfo,
            realName: infoForm.realName,
            phone: infoForm.phone,
            email: infoForm.email
          }
          localStorage.setItem('userInfo', JSON.stringify(userStore.userInfo))
        } else {
          ElMessage.error(res.message || '更新失败')
        }
      } catch (error) {
        console.error('更新个人信息失败', error)
        ElMessage.error('更新个人信息失败')
      } finally {
        infoLoading.value = false
      }
    }
  })
}

const handleChangePassword = async () => {
  if (!passwordFormRef.value) return

  await passwordFormRef.value.validate(async (valid) => {
    if (valid) {
      passwordLoading.value = true
      try {
        const userId = userStore.userInfo?.id
        if (!userId) {
          ElMessage.error('用户信息不完整')
          return
        }

        const res = await resetPassword(userId, passwordForm.newPassword)

        if (res.code === 200 || res.code === 0) {
          ElMessage.success('密码修改成功，请重新登录')

          passwordFormRef.value.resetFields()

          setTimeout(() => {
            userStore.logout()
          }, 1500)
        } else {
          ElMessage.error(res.message || '密码修改失败')
        }
      } catch (error) {
        console.error('修改密码失败', error)
        ElMessage.error('修改密码失败')
      } finally {
        passwordLoading.value = false
      }
    }
  })
}

const resetPasswordForm = () => {
  if (passwordFormRef.value) {
    passwordFormRef.value.resetFields()
  }
}

onMounted(() => {
  fetchUserInfo()
})
</script>

<style scoped>
.profile-container {
  max-width: 800px;
}

.profile-tabs {
  margin-top: 20px;
}

.info-form,
.password-form {
  max-width: 500px;
  margin: 0 auto;
}

.password-form {
  margin-top: 30px;
}
</style>
