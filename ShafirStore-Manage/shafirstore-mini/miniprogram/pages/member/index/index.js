// pages/member/index/index.js
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
      coupons: 0,
      memberNo: 'SF20260001'
    },
    hasUserInfo: false
  },

  onLoad() {
    this.checkUserInfo();
  },

  onShow() {
    this.checkUserInfo();
    this.loadMemberInfo();
  },

  checkUserInfo() {
    const userInfo = wx.getStorageSync('userInfo');
    if (userInfo) {
      this.setData({
        userInfo: userInfo,
        hasUserInfo: true
      });
    }
  },

  loadMemberInfo() {
    const memberInfo = wx.getStorageSync('memberInfo');
    if (memberInfo) {
      this.setData({ memberInfo: memberInfo });
    }
  },

  goToProfile() {
    if (!this.data.hasUserInfo) {
      wx.navigateTo({
        url: '/pages/user/user'
      });
    } else {
      wx.navigateTo({
        url: '/pages/user/user'
      });
    }
  },

  goToBalance() {
    wx.showToast({
      title: '余额明细开发中',
      icon: 'none'
    });
  },

  goToPoints() {
    wx.navigateTo({
      url: '/pages/member/points/points'
    });
  },

  goToCoupons() {
    wx.showToast({
      title: '优惠券开发中',
      icon: 'none'
    });
  },

  goToOrders() {
    wx.switchTab({
      url: '/pages/order/list/list'
    });
  },

  goToAddress() {
    wx.openLocation({
      latitude: 30.5728,
      longitude: 104.0668,
      name: '莎菲尔菓子',
      address: '四川省成都市武侯区xxx路xxx号',
      scale: 15
    });
  },

  callService() {
    wx.makePhoneCall({
      phoneNumber: '028-88888888'
    });
  },

  goToSettings() {
    wx.navigateTo({
      url: '/pages/user/user'
    });
  }
})
