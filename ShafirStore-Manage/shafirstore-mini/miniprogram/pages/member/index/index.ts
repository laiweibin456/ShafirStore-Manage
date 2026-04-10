// pages/member/index/index.ts
import { login, getMemberInfo } from '../../../utils/request'

Page({
  data: {
    hasUserInfo: false,
    userInfo: {},
    memberInfo: {},
    memberCodeUrl: ''
  },

  onShow() {
    this.checkLoginStatus()
  },

  checkLoginStatus() {
    const token = wx.getStorageSync('token')
    const userInfo = wx.getStorageSync('userInfo')
    if (token && userInfo) {
      this.setData({
        hasUserInfo: true,
        userInfo,
        memberCodeUrl: `https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=SHAFIR_MEMBER_${userInfo.memberId}`
      })
      this.loadMemberInfo()
    }
  },

  async getUserProfile() {
    try {
      const res = await wx.getUserProfile({ desc: '用于完善会员信息' })
      const userInfo = res.userInfo
      this.setData({ userInfo })

      // 微信登录
      const loginRes = await login({
        code: '',
        nickName: userInfo.nickName,
        avatarUrl: userInfo.avatarUrl
      })

      wx.setStorageSync('token', loginRes.data.token)
      wx.setStorageSync('userInfo', { ...userInfo, memberId: loginRes.data.memberId })

      this.setData({
        hasUserInfo: true,
        memberCodeUrl: `https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=SHAFIR_MEMBER_${loginRes.data.memberId}`
      })
      this.loadMemberInfo()
    } catch (err) {
      console.error('登录失败', err)
      wx.showToast({ title: '登录失败', icon: 'none' })
    }
  },

  async loadMemberInfo() {
    try {
      const res = await getMemberInfo()
      this.setData({ memberInfo: res.data })
    } catch (err) {
      console.error('加载会员信息失败', err)
    }
  },

  goToPoints() {
    wx.navigateTo({ url: '/pages/member/points/points' })
  },

  goToOrders() {
    wx.navigateTo({ url: '/pages/order/list/list' })
  },

  goToUser() {
    wx.switchTab({ url: '/pages/user/user' })
  }
})
