// pages/index/index.js
Page({

  /**
   * 页面的初始数据
   */
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
    hasUserInfo: false
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad(options) {
    this.checkUserInfo();
    this.loadMemberInfo();
  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow() {
    this.checkUserInfo();
  },

  /**
   * 检查用户信息
   */
  checkUserInfo() {
    const userInfo = wx.getStorageSync('userInfo');
    if (userInfo) {
      this.setData({
        userInfo: userInfo,
        hasUserInfo: true
      });
    }
  },

  /**
   * 加载会员信息
   */
  loadMemberInfo() {
    // TODO: 从后端API获取会员信息
    const memberInfo = wx.getStorageSync('memberInfo');
    if (memberInfo) {
      this.setData({
        memberInfo: memberInfo
      });
    }
  },

  /**
   * 跳转到会员中心
   */
  goToMember() {
    wx.navigateTo({
      url: '/pages/member/index/index'
    });
  },

  /**
   * 跳转到到店自提
   */
  goToPickup() {
    wx.navigateTo({
      url: '/pages/product/list/list?mode=pickup'
    });
  },

  /**
   * 跳转到自营外卖
   */
  goToTakeaway() {
    wx.navigateTo({
      url: '/pages/product/list/list?mode=takeaway'
    });
  },

  /**
   * 跳转到积分兑换
   */
  goToPoints() {
    wx.navigateTo({
      url: '/pages/member/points/points'
    });
  },

  /**
   * 跳转到门店地址
   */
  goToAddress() {
    wx.openLocation({
      latitude: 30.5728,
      longitude: 104.0668,
      name: '莎菲尔菓子',
      address: '四川省成都市武侯区xxx路xxx号',
      scale: 15
    });
  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh() {
    this.loadMemberInfo();
    wx.stopPullDownRefresh();
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage() {
    return {
      title: '莎菲尔菓子 - 精致烘焙·甜蜜生活',
      path: '/pages/index/index',
      imageUrl: '/images/share-poster.jpg'
    };
  }
})
