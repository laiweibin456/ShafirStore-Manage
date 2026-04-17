import axios from 'axios'
import { ElMessage } from 'element-plus'
import { useShopStore } from '@/store/shop'

const service = axios.create({
  baseURL: import.meta.env.VITE_API_BASE_URL || '/api',
  timeout: 10000
})

service.interceptors.request.use(
  (config) => {
    const token = localStorage.getItem('token')
    if (token) {
      config.headers.Authorization = `Bearer ${token}`
    }

    try {
      const shopStore = useShopStore()
      if (shopStore.currentStoreId) {
        config.headers['X-Store-Id'] = shopStore.currentStoreId
      }
    } catch (e) {
      // Pinia store may not be initialized yet during app startup
    }

    return config
  },
  (error) => {
    console.error('请求错误:', error)
    return Promise.reject(error)
  }
)

service.interceptors.response.use(
  (response) => {
    const res = response.data
    if (res.code !== 200) {
      if (res.code === 401) {
        const isLoginPage = window.location.pathname === '/login'
        const isLoginRequest = response.config.url.includes('/auth/login')
        if (!isLoginPage && !isLoginRequest) {
          localStorage.removeItem('token')
          localStorage.removeItem('userInfo')
          window.location.href = '/login'
        }
      }
      const error = new Error(res.message || '请求失败')
      error.response = response
      error.code = res.code
      return Promise.reject(error)
    }
    return res
  },
  (error) => {
    if (error.response && error.response.status === 401) {
      const isLoginPage = window.location.pathname === '/login'
      const isLoginRequest = error.config?.url?.includes('/auth/login')
      if (!isLoginPage && !isLoginRequest) {
        localStorage.removeItem('token')
        localStorage.removeItem('userInfo')
        window.location.href = '/login'
      }
    }
    console.error('响应错误:', error)
    return Promise.reject(error)
  }
)

export default service
