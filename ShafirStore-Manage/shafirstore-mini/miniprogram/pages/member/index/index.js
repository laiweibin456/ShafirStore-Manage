Page({

  data: {
    userInfo: null,
    hasUserInfo: false,
    userAvatar: 'U',
    progressPercent: 0,
    nextLevelAmount: 0,
    showDiscount: false,
    discountText: '1.0',
    isMaxLevel: false
  },

  onLoad() {
    this.checkLoginStatus()
  },

  onShow() {
    this.checkLoginStatus()
    if (this.data.hasUserInfo) {
      this.loadUserInfo()
    }
  },

  checkLoginStatus() {
    const token = wx.getStorageSync('token')
    const userInfo = wx.getStorageSync('userInfo')
    if (token && userInfo) {
      this.setData({
        userInfo: userInfo,
        hasUserInfo: true
      })
      this.calculateProgress(userInfo)
      this.calculateDiscount(userInfo)
    } else {
      this.setData({
        userInfo: null,
        hasUserInfo: false
      })
    }
  },

  loadUserInfo() {
    wx.$request.getMiniUserInfo()
      .then(res => {
        if (res.data) {
          wx.setStorageSync('userInfo', res.data)
          this.setData({
            userInfo: res.data,
            hasUserInfo: true
          })
          this.calculateProgress(res.data)
          this.calculateDiscount(res.data)
          this.calculateAvatar(res.data)
        }
      })
      .catch(err => {
        console.error('获取用户信息失败', err)
      })
  },

  calculateProgress(userInfo) {
    if (userInfo.nextLevelThreshold && userInfo.nextLevelThreshold > 0) {
      const total = userInfo.nextLevelThreshold
      const current = userInfo.totalConsume || 0
      const percent = Math.min((current / total) * 100, 100)
      const remain = Math.max(total - current, 0)
      this.setData({
        progressPercent: percent,
        nextLevelAmount: remain.toFixed(2),
        isMaxLevel: false
      })
    } else {
      this.setData({
        isMaxLevel: true
      })
    }
  },

  calculateDiscount(userInfo) {
    const discount = userInfo.discount || 1
    if (discount < 1) {
      this.setData({
        showDiscount: true,
        discountText: (discount * 10).toFixed(1)
      })
    } else {
      this.setData({
        showDiscount: false,
        discountText: '1.0'
      })
    }
  },

  calculateAvatar(userInfo) {
    if (userInfo.nickname) {
      this.setData({
        userAvatar: userInfo.nickname.substring(0, 1)
      })
    }
  },

  goToLogin() {
    wx.navigateTo({
      url: '/pages/member/login/login'
    })
  },

  onLogout() {
    wx.showModal({
      title: '提示',
      content: '确定要退出登录吗？',
      success: (res) => {
        if (res.confirm) {
          wx.removeStorageSync('token')
          wx.removeStorageSync('userInfo')
          wx.removeStorageSync('userType')
          this.setData({
            userInfo: null,
            hasUserInfo: false,
            userAvatar: 'U',
            progressPercent: 0,
            nextLevelAmount: 0,
            showDiscount: false,
            discountText: '1.0',
            isMaxLevel: false
          })
          wx.showToast({ title: '已退出登录', icon: 'success' })
        }
      }
    })
  },

  goToOrders() {
    if (!this.data.hasUserInfo) {
      wx.navigateTo({ url: '/pages/member/login/login' })
      return
    }
    wx.switchTab({
      url: '/pages/order/list/list'
    })
  },

  goToPoints() {
    if (!this.data.hasUserInfo) {
      wx.navigateTo({ url: '/pages/member/login/login' })
      return
    }
    wx.navigateTo({
      url: '/pages/member/points/points'
    })
  },

  goToAddress() {
    wx.openLocation({
      latitude: 30.5728,
      longitude: 104.0668,
      name: '莎菲尔菓子',
      address: '四川省成都市武侯区xxx路xxx号',
      scale: 15
    })
  },

  callService() {
    wx.makePhoneCall({
      phoneNumber: '028-88888888'
    })
  },

  goToSettings() {
    wx.showToast({
      title: '设置功能开发中',
      icon: 'none'
    })
  }
})