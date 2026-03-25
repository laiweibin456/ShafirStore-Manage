<template>
  <div class="login-wrapper">
    <div class="login-container">
      <div class="brand-section">
        <img :src="logoImage" alt="品牌Logo" class="brand-logo">
        <h1 class="brand-title">莎菲尔菓子门店</h1>
        <p class="brand-slogan">发现美，创造美，分享美</p>
      </div>

      <div class="form-section">
        <h2 class="form-title">用户注册</h2>

        <el-form
          ref="registerFormRef"
          :model="registerForm"
          :rules="registerRules"
          class="login-form"
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
                v-model="registerForm.username"
                placeholder="请输入用户名"
                size="large"
              />
            </div>
          </el-form-item>

          <el-form-item prop="email">
            <div class="input-group">
              <span class="input-icon">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
                  <polyline points="22,6 12,13 2,6"></polyline>
                </svg>
              </span>
              <el-input
                v-model="registerForm.email"
                placeholder="请输入邮箱"
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
                v-model="registerForm.password"
                type="password"
                placeholder="请输入密码"
                size="large"
                show-password
              />
            </div>
          </el-form-item>

          <el-form-item prop="confirmPassword">
            <div class="input-group">
              <span class="input-icon">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                  <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                </svg>
              </span>
              <el-input
                v-model="registerForm.confirmPassword"
                type="password"
                placeholder="请确认密码"
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
              @click="handleRegister"
            >
              {{ loading ? '注册中...' : '注 册' }}
            </el-button>
          </el-form-item>
        </el-form>

        <div class="register-link">
          已有账号？<a href="#" @click.prevent="goToLogin">立即登录</a>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive } from 'vue'
import { useRouter } from 'vue-router'
import { ElMessage } from 'element-plus'
import logoImage from '@/assets/logo1.png'
import { register } from '@/api/auth'

const router = useRouter()

const registerFormRef = ref(null)
const loading = ref(false)

const registerForm = reactive({
  username: '',
  email: '',
  password: '',
  confirmPassword: ''
})

const validateConfirmPassword = (rule, value, callback) => {
  if (value === '') {
    callback(new Error('请确认密码'))
  } else if (value !== registerForm.password) {
    callback(new Error('两次输入的密码不一致'))
  } else {
    callback()
  }
}

const registerRules = {
  username: [
    { required: true, message: '请输入用户名', trigger: 'blur' },
    { min: 3, max: 20, message: '用户名长度需在3-20个字符之间', trigger: 'blur' }
  ],
  email: [
    { required: true, message: '请输入邮箱', trigger: 'blur' },
    { type: 'email', message: '邮箱格式不正确', trigger: 'blur' }
  ],
  password: [
    { required: true, message: '请输入密码', trigger: 'blur' },
    { min: 6, max: 20, message: '密码长度需在6-20个字符之间', trigger: 'blur' }
  ],
  confirmPassword: [
    { required: true, message: '请确认密码', trigger: 'blur' },
    { validator: validateConfirmPassword, trigger: 'blur' }
  ]
}

const handleRegister = async () => {
  if (!registerFormRef.value) return

  await registerFormRef.value.validate(async (valid) => {
    if (!valid) return

    loading.value = true
    try {
      await register(registerForm)
      ElMessage.success('注册成功，请登录')
      router.push('/login')
    } catch (error) {
      const errorMsg = error?.response?.data?.message || '注册失败，请稍后重试'
      ElMessage.error(errorMsg)
    } finally {
      loading.value = false
    }
  })
}

const goToLogin = () => {
  router.push('/login')
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
  height: 600px;
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
  padding: 40px;
}

.form-title {
  font-size: 28px;
  color: #1e293b;
  margin-bottom: 30px;
  font-weight: 700;
}

.login-form {
  width: 100%;
  max-width: 280px;
  margin-left: auto;
  margin-right: auto;
}

.login-form :deep(.el-form-item) {
  width: 100%;
  max-width: 280px;
  margin-left: auto;
  margin-right: auto;
  margin-bottom: 20px;
}

.login-form :deep(.el-form-item:last-child) {
  margin-bottom: 0;
}

.input-group {
  position: relative;
  width: 100%;
  max-width: 280px;
  margin-bottom: 0;
}

.input-group :deep(.el-input) {
  width: 100%;
}

.input-group :deep(.el-input__wrapper) {
  width: 100%;
  max-width: 280px;
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
  max-width: 280px;
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

.login-footer {
  margin-top: 20px;
  text-align: center;
  font-size: 12px;
  color: #64748b;
}

.register-link {
  margin-top: 15px;
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
