// pages/user/user.ts
Page({
  data: {
    hasUserInfo: false,
    userInfo: {}
  },

  onShow() {
    const token = wx.getStorageSync('token')
    const userInfo = wx.getStorageSync('userInfo')
    if (token && userInfo) {
      this.setData({ hasUserInfo: true, userInfo })
    }
  },

  login() {
    wx.navigateTo({ url: '/pages/member/index/index' })
  },

  goToOrders() {
    wx.navigateTo({ url: '/pages/order/list/list' })
  },

  clearCache() {
    wx.showModal({
      title: '提示',
      content: '确定要清除缓存吗？',
      success: (res) => {
        if (res.confirm) {
          wx.clearStorageSync()
          wx.showToast({ title: '缓存已清除', icon: 'success' })
          this.setData({ hasUserInfo: false, userInfo: {} })
        }
      }
    })
  },

  aboutUs() {
    wx.showModal({
      title: '关于我们',
      content: '莎菲尔菓子门店管理系统\n为您提供优质的烘焙产品',
      showCancel: false
    })
  },

  logout() {
    wx.showModal({
      title: '提示',
      content: '确定要退出登录吗？',
      success: (res) => {
        if (res.confirm) {
          wx.removeStorageSync('token')
          wx.removeStorageSync('userInfo')
          wx.removeStorageSync('cartItems')
          wx.removeStorageSync('cartCount')
          wx.showToast({ title: '已退出登录', icon: 'success' })
          this.setData({ hasUserInfo: false, userInfo: {} })
        }
      }
    })
  }
})
