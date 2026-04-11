Page({

  data: {
    phone: '',
    password: '',
    confirmPassword: '',
    nickname: ''
  },

  onPhoneInput(e) {
    this.setData({ phone: e.detail.value })
  },

  onPasswordInput(e) {
    this.setData({ password: e.detail.value })
  },

  onConfirmPasswordInput(e) {
    this.setData({ confirmPassword: e.detail.value })
  },

  onNicknameInput(e) {
    this.setData({ nickname: e.detail.value })
  },

  onRegister() {
    const { phone, password, confirmPassword, nickname } = this.data

    if (!phone || phone.length !== 11) {
      wx.showToast({ title: '请输入正确手机号', icon: 'none' })
      return
    }

    if (!password || password.length < 6) {
      wx.showToast({ title: '密码至少6位', icon: 'none' })
      return
    }

    if (password !== confirmPassword) {
      wx.showToast({ title: '两次密码不一致', icon: 'none' })
      return
    }

    wx.$request.miniRegister({
      phone,
      password,
      nickname: nickname || undefined
    })
      .then(res => {
        wx.showToast({ title: '注册成功，正在登录...', icon: 'success' })

        setTimeout(() => {
          wx.$request.miniLogin({ phone, password })
            .then(loginRes => {
              wx.setStorageSync('token', loginRes.data.token)
              wx.setStorageSync('userType', loginRes.data.userType)
              wx.setStorageSync('userInfo', loginRes.data.userInfo)

              wx.switchTab({ url: '/pages/member/index/index' })
            })
            .catch(err => {
              console.error('自动登录失败', err)
              wx.switchTab({ url: '/pages/member/index/index' })
            })
        }, 1500)
      })
      .catch(err => {
        console.error('注册失败', err)
      })
  },

  goToLogin() {
    wx.navigateTo({ url: '/pages/member/login/login' })
  }
})