// pages/index/index.ts
Page({
  data: {
    hasUserInfo: false,
    userInfo: {},
    memberInfo: {}
  },

  onLoad() {
    this.checkLoginStatus()
  },

  onShow() {
    this.checkLoginStatus()
    this.updateTabBarBadge()
  },

  checkLoginStatus() {
    const token = wx.getStorageSync('token')
    const userInfo = wx.getStorageSync('userInfo')
    const memberInfo = wx.getStorageSync('memberInfo') || {}

    if (token && userInfo) {
      this.setData({
        hasUserInfo: true,
        userInfo,
        memberInfo
      })
    } else {
      this.setData({
        hasUserInfo: false,
        userInfo: {},
        memberInfo: {}
      })
    }
  },

  updateTabBarBadge() {
    const cartCount = wx.getStorageSync('cartCount') || 0
    if (cartCount > 0) {
      wx.setTabBarBadge({ index: 1, text: String(cartCount) })
    } else {
      wx.removeTabBarBadge({ index: 1 })
    }
  },

  goToMember() {
    wx.switchTab({ url: '/pages/member/index/index' })
  },

  goToReserve() {
    wx.switchTab({ url: '/pages/product/list/list' })
  },

  goToPoints() {
    wx.navigateTo({ url: '/pages/member/points/points' })
  },

  goToOrders() {
    wx.switchTab({ url: '/pages/order/list/list' })
  },

  callPhone() {
    wx.makePhoneCall({
      phoneNumber: '400-888-8888'
    })
  },

  callService() {
    wx.makePhoneCall({
      phoneNumber: '400-888-8888'
    })
  },

  goToHelp() {
    wx.showToast({ title: '帮助中心开发中', icon: 'none' })
  },

  goToActivity() {
    wx.showToast({ title: '活动页面开发中', icon: 'none' })
  },

  goToAddress() {
    wx.showToast({ title: '门店自取功能开发中', icon: 'none' })
  },

  goToSettings() {
    wx.showToast({ title: '设置功能开发中', icon: 'none' })
  }
})
