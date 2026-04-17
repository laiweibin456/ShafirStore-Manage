var app = getApp()

Page({
  data: {
    userInfo: {
      nickName: '',
      avatarUrl: ''
    },
    memberInfo: {
      levelName: '普通会员',
      balance: 0,
      points: 0,
      coupons: 1
    },
    hasUserInfo: false,
    currentStoreName: ''
  },

  onLoad: function(options) {
    this.checkUserInfo()
    this.loadMemberInfo()
    this.updateStoreInfo()
  },

  onShow: function() {
    this.checkUserInfo()
    this.updateStoreInfo()
  },

  updateStoreInfo: function() {
    var store = app.globalData.currentStore
    if (store) {
      this.setData({ currentStoreName: store.storeName })
    } else {
      this.setData({ currentStoreName: '' })
    }
  },

  checkUserInfo: function() {
    var userInfo = wx.getStorageSync('userInfo')
    var token = wx.getStorageSync('token')
    if (userInfo && token) {
      this.setData({
        userInfo: userInfo,
        hasUserInfo: true
      })
    } else {
      this.setData({
        hasUserInfo: false
      })
    }
  },

  loadMemberInfo: function() {
    var token = wx.getStorageSync('token')
    if (!token) return

    var that = this
    wx.$request.getMiniUserInfo()
      .then(function(res) {
        if (res.data) {
          var userType = res.data.userType
          var levelName = '普通会员'
          if (userType === 2) {
            levelName = 'VIP会员'
          }
          that.setData({
            memberInfo: {
              levelName: levelName,
              balance: res.data.balance || 0,
              points: res.data.points || 0,
              coupons: res.data.coupons || 0
            }
          })
          wx.setStorageSync('userType', userType)
          wx.setStorageSync('userInfo', res.data)
        }
      })
      .catch(function(err) {
        console.error('加载会员信息失败', err)
      })
  },

  goToMember: function() {
    wx.navigateTo({
      url: '/pages/member/index/index'
    })
  },

  goToPickup: function() {
    wx.switchTab({
      url: '/pages/product/list/list'
    })
  },

  goToPoints: function() {
    var token = wx.getStorageSync('token')
    if (!token) {
      wx.navigateTo({ url: '/pages/member/login/login' })
      return
    }
    wx.navigateTo({
      url: '/pages/member/points/points'
    })
  },

  goToStoreSelect: function() {
    wx.navigateTo({
      url: '/pages/store/select/select'
    })
  },

  onPullDownRefresh: function() {
    this.loadMemberInfo()
    this.updateStoreInfo()
    wx.stopPullDownRefresh()
  },

  onShareAppMessage: function() {
    return {
      title: '莎菲尔菓子 - 精致烘焙·甜蜜生活',
      path: '/pages/index/index',
      imageUrl: '/images/share-poster.jpg'
    }
  }
})
