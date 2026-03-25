import { defineStore } from 'pinia'
import { login, logout, getCurrentUser } from '@/api/auth'

export const useUserStore = defineStore('user', {
  state: () => ({
    token: localStorage.getItem('token') || '',
    userInfo: JSON.parse(localStorage.getItem('userInfo') || 'null')
  }),

  getters: {
    isLoggedIn: (state) => !!state.token,
    username: (state) => state.userInfo?.username || '',
    realName: (state) => state.userInfo?.realName || '',
    roleName: (state) => state.userInfo?.roleName || '',
    roleKey: (state) => state.userInfo?.roleKey || ''
  },

  actions: {
    async login(credentials) {
      try {
        const res = await login(credentials)
        this.token = res.data.token
        this.userInfo = res.data.userInfo

        localStorage.setItem('token', this.token)
        localStorage.setItem('userInfo', JSON.stringify(this.userInfo))

        return res
      } catch (error) {
        throw error
      }
    },

    async logout() {
      try {
        await logout()
      } catch (error) {
        console.error('登出请求失败:', error)
      } finally {
        this.token = ''
        this.userInfo = null
        localStorage.removeItem('token')
        localStorage.removeItem('userInfo')
      }
    },

    async fetchUserInfo() {
      if (!this.token) return
      try {
        const res = await getCurrentUser()
        this.userInfo = res.data
        localStorage.setItem('userInfo', JSON.stringify(this.userInfo))
      } catch (error) {
        console.error('获取用户信息失败:', error)
        throw error
      }
    }
  }
})
