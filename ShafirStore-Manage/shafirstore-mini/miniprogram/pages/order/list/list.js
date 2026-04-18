Page({
  data: {
    currentTab: 0,
    tabs: ['全部', '待付款', '已完成', '已取消'],
    orders: [],
    loading: false,
    isLoggedIn: false
  },

  onLoad(options) {
    var tab = options.tab ? parseInt(options.tab) : 0
    this.setData({ currentTab: tab })
    this.checkLogin()
  },

  onShow() {
    this.checkLogin()
  },

  checkLogin() {
    var token = wx.getStorageSync('token')
    this.setData({ isLoggedIn: !!token })
    if (token) {
      this.loadOrders(this.data.currentTab)
    } else {
      this.setData({ orders: [] })
    }
  },

  loadOrders(tabIndex) {
    if (!this.data.isLoggedIn) return
    if (this.data.loading) return

    this.setData({ loading: true })

    var status = null
    if (tabIndex === 1) status = 1
    else if (tabIndex === 2) status = 2
    else if (tabIndex === 3) status = 3

    var params = {}
    if (status !== null) {
      params.status = status
    }

    var that = this
    wx.$request.getReservationOrderList(params)
      .then(function(res) {
        var orders = res.data && res.data.records ? res.data.records : (res.data || [])
        var statusMap = { 1: '待付款', 2: '已完成', 3: '已取消' }
        for (var i = 0; i < orders.length; i++) {
          if (!orders[i].statusText) {
            orders[i].statusText = orders[i].statusName || statusMap[orders[i].status] || '未知'
          }
        }
        that.setData({
          orders: orders,
          loading: false
        })
      })
      .catch(function(err) {
        console.error('加载订单失败', err)
        that.setData({ loading: false })
      })
  },

  switchTab(e) {
    var index = e.currentTarget.dataset.index
    if (index === this.data.currentTab) return

    this.setData({ currentTab: index })
    this.loadOrders(index)
  },

  goToLogin() {
    wx.navigateTo({ url: '/pages/member/login/login' })
  },

  goToDetail(e) {
    var id = e.currentTarget.dataset.id
    wx.navigateTo({ url: '/pages/order/detail/detail?id=' + id })
  },

  cancelOrder(e) {
    var id = e.currentTarget.dataset.id
    var that = this
    wx.showModal({
      title: '提示',
      content: '确定要取消该预约订单吗？',
      success: function(res) {
        if (res.confirm) {
          wx.$request.cancelReservationOrder(id)
            .then(function() {
              wx.showToast({ title: '已取消', icon: 'success' })
              that.loadOrders(that.data.currentTab)
            })
            .catch(function(err) {
              console.error('取消订单失败', err)
            })
        }
      }
    })
  },

  confirmPickup(e) {
    var id = e.currentTarget.dataset.id
    var that = this
    wx.showModal({
      title: '提示',
      content: '确认已完成取货？',
      success: function(res) {
        if (res.confirm) {
          wx.$request.completeReservationOrder(id)
            .then(function(result) {
              wx.showToast({ title: '取货成功', icon: 'success' })
              if (result.data && result.data.upgraded) {
                wx.showModal({
                  title: '恭喜升级！',
                  content: '您已升级为' + result.data.newLevelName + '！',
                  showCancel: false
                })
              }
              that.loadOrders(that.data.currentTab)
            })
            .catch(function(err) {
              console.error('确认取货失败', err)
            })
        }
      }
    })
  },

  reorder() {
    wx.switchTab({ url: '/pages/product/list/list' })
  },

  goToHome() {
    wx.switchTab({ url: '/pages/index/index' })
  }
})
