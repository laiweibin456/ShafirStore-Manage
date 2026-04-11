Page({

  data: {
    phone: '',
    password: ''
  },

  onPhoneInput(e) {
    this.setData({ phone: e.detail.value })
  },

  onPasswordInput(e) {
    this.setData({ password: e.detail.value })
  },

  onLogin() {
    const { phone, password } = this.data

    if (!phone || phone.length !== 11) {
      wx.showToast({ title: '请输入正确手机号', icon: 'none' })
      return
    }

    if (!password) {
      wx.showToast({ title: '请输入密码', icon: 'none' })
      return
    }

    wx.$request.miniLogin({ phone, password })
      .then(res => {
        wx.setStorageSync('token', res.data.token)
        wx.setStorageSync('userType', res.data.userType)
        wx.setStorageSync('userInfo', res.data.userInfo)

        wx.showToast({ title: '登录成功', icon: 'success' })

        setTimeout(() => {
          wx.switchTab({ url: '/pages/member/index/index' })
        }, 1500)
      })
      .catch(err => {
        console.error('登录失败', err)
      })
  },

  goToRegister() {
    wx.navigateTo({ url: '/pages/member/register/register' })
  }
})