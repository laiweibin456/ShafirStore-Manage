// app.ts
App({
  globalData: {
    baseUrl: 'http://localhost:8080/api',
    token: ''
  },
  onLaunch() {
    // 检查登录状态
    const token = wx.getStorageSync('token')
    if (token) {
      this.globalData.token = token
    }
  }
})
