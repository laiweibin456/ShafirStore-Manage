Page({
  data: {
    nickname: '',
    phone: '',
    levelName: '普通用户',
    totalConsume: '0.00',
    points: 0,
    oldPassword: '',
    newPassword: '',
    confirmPassword: ''
  },

  onLoad() {
    this.loadUserInfo()
  },

  onShow() {
    this.loadUserInfo()
  },

  loadUserInfo() {
    var userInfo = wx.getStorageSync('userInfo')
    if (userInfo) {
      this.setData({
        nickname: userInfo.nickname || '',
        phone: userInfo.phone || '',
        levelName: userInfo.levelName || '普通用户',
        totalConsume: userInfo.totalConsume || '0.00',
        points: userInfo.points || 0
      })
    }
  },

  onNicknameInput(e) {
    this.setData({
      nickname: e.detail.value
    })
  },

  onOldPasswordInput(e) {
    this.setData({
      oldPassword: e.detail.value
    })
  },

  onNewPasswordInput(e) {
    this.setData({
      newPassword: e.detail.value
    })
  },

  onConfirmPasswordInput(e) {
    this.setData({
      confirmPassword: e.detail.value
    })
  },

  saveUserInfo() {
    var nickname = this.data.nickname.trim()
    var oldPassword = this.data.oldPassword.trim()
    var newPassword = this.data.newPassword.trim()
    var confirmPassword = this.data.confirmPassword.trim()
    
    if (!nickname) {
      wx.showToast({
        title: '请输入昵称',
        icon: 'none'
      })
      return
    }

    if (oldPassword || newPassword || confirmPassword) {
      if (!oldPassword) {
        wx.showToast({
          title: '请输入原密码',
          icon: 'none'
        })
        return
      }
      if (!newPassword) {
        wx.showToast({
          title: '请输入新密码',
          icon: 'none'
        })
        return
      }
      if (newPassword !== confirmPassword) {
        wx.showToast({
          title: '两次密码不一致',
          icon: 'none'
        })
        return
      }
      if (newPassword.length < 6) {
        wx.showToast({
          title: '密码至少6位',
          icon: 'none'
        })
        return
      }
    }

    wx.showLoading({ title: '保存中...' })

    var that = this
    wx.$request.updateMiniUserInfo({ 
      nickname: nickname,
      oldPassword: oldPassword || null,
      newPassword: newPassword || null
    })
      .then(function(res) {
        wx.hideLoading()
        wx.showToast({
          title: '保存成功',
          icon: 'success'
        })

        var userInfo = wx.getStorageSync('userInfo') || {}
        userInfo.nickname = nickname
        wx.setStorageSync('userInfo', userInfo)

        that.setData({
          oldPassword: '',
          newPassword: '',
          confirmPassword: ''
        })

        setTimeout(function() {
          wx.navigateBack()
        }, 1500)
      })
      .catch(function(err) {
        wx.hideLoading()
        wx.showToast({
          title: err.message || '保存失败',
          icon: 'none'
        })
      })
  }
})
