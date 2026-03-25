<template>
  <div class="login-wrapper">
    <div class="login-container">
      <div class="brand-section">
        <img :src="logoImage" alt="品牌Logo" class="brand-logo">
        <h1 class="brand-title">莎菲尔菓子门店</h1>
        <p class="brand-slogan">发现美，创造美，分享美</p>
      </div>

      <div class="form-section">
        <h2 class="form-title">欢迎登录</h2>

        <el-form
          ref="loginFormRef"
          :model="loginForm"
          :rules="loginRules"
          class="login-form"
          @keyup.enter="handleLogin"
        >
          <el-form-item prop="username">
            <div class="input-group">
              <span class="input-icon">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                  <circle cx="12" cy="7" r="4"></circle>
                </svg>
              </span>
              <el-input
                v-model="loginForm.username"
                placeholder="请输入账号"
                size="large"
              />
            </div>
          </el-form-item>

          <el-form-item prop="password">
            <div class="input-group">
              <span class="input-icon">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                  <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                </svg>
              </span>
              <el-input
                v-model="loginForm.password"
                type="password"
                placeholder="请输入密码"
                size="large"
                show-password
              />
            </div>
          </el-form-item>

          <el-form-item>
            <el-button
              type="primary"
              size="large"
              :loading="loading"
              class="login-btn"
              @click="handleLogin"
            >
              {{ loading ? '登录中...' : '登 录' }}
            </el-button>
          </el-form-item>
        </el-form>

        <div class="register-link">
          还没有账号？<a href="#" @click.prevent="goToRegister">立即注册</a>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive } from 'vue'
import { useRouter } from 'vue-router'
import { useUserStore } from '@/store/user'
import { ElMessageBox, ElMessage } from 'element-plus'
import logoImage from '@/assets/logo1.png'

const router = useRouter()
const userStore = useUserStore()

const loginFormRef = ref(null)
const loading = ref(false)

const loginForm = reactive({
  username: '',
  password: ''
})

const loginRules = {
  username: [
    { required: true, message: '请输入账号', trigger: 'blur' }
  ],
  password: [
    { required: true, message: '请输入密码', trigger: 'blur' }
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

const goToRegister = () => {
  router.push('/register')
}

const showSuccessDialog = () => {
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
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

.login-wrapper {
  width: 100%;
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  background-image: url('@/assets/login.png');
  background-size: cover;
  background-position: center center;
  background-repeat: no-repeat;
  font-family: 'PingFang SC', 'Microsoft YaHei', sans-serif;
}

.login-container {
  display: flex;
  width: 900px;
  height: 550px;
  background-color: #fff;
  border-radius: 12px;
  box-shadow: 0 15px 35px rgba(30, 58, 138, 0.2);
  overflow: hidden;
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

.brand-section {
  flex: 1;
  background: linear-gradient(135deg, #152a52 0%, #1d3a6b 100%);
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  color: #fff;
  padding: 40px;
  text-align: center;
}

.brand-logo {
  width: 280px;
  height: 280px;
  margin-bottom: 20px;
  border-radius: 8px;
  object-fit: contain;
}

.brand-title {
  font-size: 32px;
  font-weight: bold;
  margin-bottom: 10px;
  color: #fff;
  text-shadow: 0 2px 4px rgba(0,0,0,0.3);
}

.brand-slogan {
  font-size: 16px;
  opacity: 0.9;
  color: #dbeafe;
}

.form-section {
  flex: 1;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  padding: 50px;
}

.form-title {
  font-size: 28px;
  color: #1e293b;
  margin-bottom: 40px;
  font-weight: 700;
}

.login-form {
  width: 100%;
  max-width: 320px;
  margin-left: auto;
  margin-right: auto;
}

.login-form :deep(.el-form-item) {
  width: 100%;
  max-width: 320px;
  margin-left: auto;
  margin-right: auto;
  margin-bottom: 25px;
}

.login-form :deep(.el-form-item:last-child) {
  margin-bottom: 0;
}

.input-group {
  position: relative;
  width: 100%;
  max-width: 320px;
  margin-bottom: 0;
}

.input-group :deep(.el-input) {
  width: 100%;
}

.input-group :deep(.el-input__wrapper) {
  width: 100%;
  max-width: 320px;
  height: 45px;
  padding: 8px 15px 8px 45px;
  border: 1px solid #cbd5e1;
  border-radius: 8px;
  font-size: 15px;
  background-color: #f8fafc;
  box-shadow: none !important;
  transition: all 0.3s ease;
  box-sizing: border-box;
}

.input-group :deep(.el-input__inner) {
  color: #334155;
  height: 24px;
  line-height: 24px;
}

.input-group :deep(.el-input__wrapper:hover) {
  border-color: #94a3b8;
}

.input-group :deep(.el-input__wrapper.is-focus) {
  border-color: #1e40af;
  background-color: #fff;
  box-shadow: 0 0 0 3px rgba(30, 64, 175, 0.15) !important;
}

.input-group :deep(.el-input__inner) {
  color: #334155;
  height: 24px;
  line-height: 24px;
}

.input-group :deep(.el-input__inner::placeholder) {
  color: #94a3b8;
}

.input-icon {
  position: absolute;
  left: 14px;
  top: 50%;
  transform: translateY(-50%);
  display: flex;
  align-items: center;
  justify-content: center;
  color: #94a3b8;
  transition: color 0.3s ease;
  z-index: 1;
  pointer-events: none;
}

.input-group :deep(.el-input__wrapper.is-focus) ~ .input-icon {
  color: #1e40af;
}

.input-icon svg {
  width: 18px;
  height: 18px;
  stroke: currentColor;
}

.login-btn {
  width: 100%;
  max-width: 320px;
  padding: 14px;
  background: linear-gradient(135deg, #152a52 0%, #1d3a6b 100%);
  color: white;
  border: none;
  border-radius: 8px;
  font-size: 17px;
  font-weight: bold;
  cursor: pointer;
  transition: transform 0.2s, box-shadow 0.2s;
  box-shadow: 0 4px 15px rgba(30, 64, 175, 0.4);
}

.login-btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 6px 20px rgba(30, 64, 175, 0.6);
  background: linear-gradient(135deg, #1e4ed1 0%, #1c55b1 100%);
}

.login-btn:active {
  transform: translateY(0);
}

.login-btn.is-loading {
  background: linear-gradient(135deg, #152a52 0%, #1d3a6b 100%);
}

.login-footer {
  margin-top: 25px;
  text-align: center;
  font-size: 14px;
  color: #64748b;
}

.register-link {
  margin-top: 25px;
  font-size: 14px;
  color: #64748b;
  text-align: center;
}

.register-link a {
  color: #1e40af;
  text-decoration: none;
  font-weight: 600;
}

.register-link a:hover {
  text-decoration: underline;
}

@media (max-width: 768px) {
  .login-container {
    flex-direction: column;
    width: 90%;
    height: auto;
  }

  .brand-section {
    padding: 30px 20px;
  }

  .brand-logo {
    width: 180px;
    height: 180px;
  }

  .brand-title {
    font-size: 24px;
  }

  .form-section {
    padding: 40px 20px;
  }

  .form-title {
    font-size: 24px;
    margin-bottom: 30px;
  }

  .login-form,
  .login-form :deep(.el-form-item),
  .input-group,
  .login-btn {
    max-width: 100% !important;
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
  background: linear-gradient(135deg, #152a52 0%, #1d3a6b 100%) !important;
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
  border-color: #1e40af !important;
  color: #1e40af !important;
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
