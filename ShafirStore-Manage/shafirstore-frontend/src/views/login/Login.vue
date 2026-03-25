<template>
  <div class="login-container">
    <div class="login-box">
      <div class="login-header">
        <h1 class="title">莎菲尔菓子</h1>
        <p class="subtitle">门店管理系统</p>
      </div>

      <el-form
        ref="loginFormRef"
        :model="loginForm"
        :rules="loginRules"
        class="login-form"
        @keyup.enter="handleLogin"
      >
        <el-form-item prop="username">
          <el-input
            v-model="loginForm.username"
            placeholder="请输入用户名"
            size="large"
            prefix-icon="User"
          />
        </el-form-item>

        <el-form-item prop="password">
          <el-input
            v-model="loginForm.password"
            type="password"
            placeholder="请输入密码"
            size="large"
            prefix-icon="Lock"
            show-password
          />
        </el-form-item>

        <el-form-item>
          <el-button
            type="primary"
            size="large"
            :loading="loading"
            class="login-button"
            @click="handleLogin"
          >
            {{ loading ? '登录中...' : '登 录' }}
          </el-button>
        </el-form-item>
      </el-form>

      <div class="login-footer">
        <p>默认账号：admin / 123456</p>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive } from 'vue'
import { useRouter } from 'vue-router'
import { useUserStore } from '@/store/user'
import { ElMessageBox, ElMessage } from 'element-plus'

const router = useRouter()
const userStore = useUserStore()

const loginFormRef = ref(null)
const loading = ref(false)

const loginForm = reactive({
  username: 'admin',
  password: '123456'
})

const loginRules = {
  username: [
    { required: true, message: '请输入用户名', trigger: 'blur' }
  ],
  password: [
    { required: true, message: '请输入密码', trigger: 'blur' },
    { min: 3, message: '密码长度不能少于3位', trigger: 'blur' }
  ]
}

const handleLogin = async () => {
  if (!loginFormRef.value) return

  await loginFormRef.value.validate(async (valid) => {
    if (!valid) return

    loading.value = true
    try {
      await userStore.login(loginForm)
      showSuccessDialog()
    } catch (error) {
      showErrorDialog(error)
    } finally {
      loading.value = false
    }
  })
}

const showSuccessDialog = () => {
  let dialogInstance = null

  ElMessageBox.alert(
    '<div style="text-align: center;">' +
      '<i class="el-icon-success" style="font-size: 48px; color: #67C23A; display: block; margin-bottom: 10px;"></i>' +
      '<p style="font-size: 16px; color: #303133; margin: 0;">登录成功</p>' +
      '<p style="font-size: 12px; color: #909399; margin-top: 8px;">正在跳转至主页...</p>' +
    '</div>',
    '',
    {
      confirmButtonText: '确定',
      showClose: false,
      dangerouslyUseHTMLString: true,
      customClass: 'login-success-dialog',
      beforeClose: (action, instance, done) => {
        if (action === 'confirm' || action === 'close') {
          done()
        }
      }
    }
  ).then(() => {
    router.push('/')
  }).catch(() => {})

  setTimeout(() => {
    try {
      document.querySelector('.login-success-dialog .el-message-box__btns .el-button')?.click()
    } catch (e) {
      ElMessage.success('登录成功')
      router.push('/')
    }
  }, 1500)
}

const showErrorDialog = (error) => {
  let errorMessage = '登录失败，请稍后重试'
  if (error?.response?.data?.message) {
    errorMessage = error.response.data.message
  } else if (error?.message) {
    if (error.message.includes('Network') || error.message.includes('network')) {
      errorMessage = '网络连接失败，请检查网络设置'
    } else if (error.message.includes('timeout')) {
      errorMessage = '请求超时，请稍后重试'
    }
  }

  ElMessageBox.alert(
    '<div style="text-align: center;">' +
      '<i class="el-icon-error" style="font-size: 48px; color: #F56C6C; display: block; margin-bottom: 10px;"></i>' +
      '<p style="font-size: 14px; color: #303133; margin: 0;">' + errorMessage + '</p>' +
    '</div>',
    '登录失败',
    {
      confirmButtonText: '重新登录',
      showCancelButton: true,
      cancelButtonText: '关闭',
      dangerouslyUseHTMLString: true,
      customClass: 'login-error-dialog',
      callback: (action) => {
        if (action === 'confirm') {
          loginForm.password = ''
        }
      }
    }
  )
}
</script>

<style scoped>
.login-container {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background-image: url('@/assets/login.png');
  background-size: cover;
  background-position: center center;
  background-repeat: no-repeat;
  animation: fadeIn 0.5s ease-out;
}

@keyframes fadeIn {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

.login-box {
  width: 400px;
  padding: 40px;
  background: rgba(255, 255, 255, 0.95);
  border-radius: 12px;
  box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
  animation: slideUp 0.5s ease-out;
  backdrop-filter: blur(10px);
}

@keyframes slideUp {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.login-header {
  text-align: center;
  margin-bottom: 30px;
}

.title {
  font-size: 28px;
  color: #333;
  margin-bottom: 8px;
}

.subtitle {
  font-size: 14px;
  color: #999;
}

.login-form {
  margin-top: 20px;
}

.login-button {
  width: 100%;
  height: 44px;
  font-size: 16px;
  transition: all 0.3s ease;
}

.login-button:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(102, 126, 234, 0.4);
}

.login-button:active {
  transform: translateY(0);
}

.login-footer {
  margin-top: 20px;
  text-align: center;
  font-size: 12px;
  color: #999;
}

@media screen and (max-width: 480px) {
  .login-container {
    background-size: 100% 100%;
  }

  .login-box {
    width: 90%;
    padding: 24px;
    margin: 0 16px;
  }

  .title {
    font-size: 24px;
  }

  .login-form {
    margin-top: 16px;
  }
}

@media screen and (min-width: 1921px) {
  .login-container {
    background-size: 100% 100%;
  }
}
</style>

<style>
.login-success-dialog {
  border-radius: 12px !important;
  padding: 20px !important;
  max-width: 320px !important;
}

.login-success-dialog .el-message-box__header {
  display: none !important;
}

.login-success-dialog .el-message-box__content {
  padding: 10px 20px 20px !important;
}

.login-success-dialog .el-message-box__btns {
  padding-top: 0 !important;
}

.login-error-dialog {
  border-radius: 12px !important;
  padding: 20px !important;
  max-width: 360px !important;
}

.login-error-dialog .el-message-box__header {
  padding-bottom: 10px !important;
  border-bottom: 1px solid #ebeef5 !important;
}

.login-error-dialog .el-message-box__content {
  padding: 20px !important;
}

.login-error-dialog .el-message-box__btns {
  padding-top: 20px !important;
  display: flex !important;
  gap: 12px !important;
  justify-content: center !important;
}

.login-error-dialog .el-button {
  border-radius: 8px !important;
  padding: 10px 24px !important;
  transition: all 0.3s ease !important;
}

.login-error-dialog .el-button:hover {
  transform: translateY(-1px);
}

.login-error-dialog .el-button--primary {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%) !important;
  border: none !important;
}

.login-error-dialog .el-button--primary:hover {
  opacity: 0.9;
}

.login-error-dialog .el-button--default {
  border-color: #dcdfe6 !important;
  color: #606266 !important;
}

.login-error-dialog .el-button--default:hover {
  border-color: #667eea !important;
  color: #667eea !important;
}

.el-message-box {
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1) !important;
}

.el-message-box.zoom-enter-active,
.el-message-box.zoom-leave-active {
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1) !important;
}

.el-message-box.zoom-enter-from,
.el-message-box.zoom-leave-to {
  opacity: 0;
  transform: scale(0.9) !important;
}
</style>
