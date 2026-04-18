Page({
  data: {
    order: {},
    statusText: '',
    statusColor: '#E6A23C'
  },

  onLoad(options) {
    if (options.id) {
      this.loadOrderDetail(Number(options.id))
    }
  },

  loadOrderDetail(id) {
    var that = this
    wx.$request.getReservationOrderDetail(id)
      .then(function(res) {
        var order = res.data
        var statusInfo = that.getStatusInfo(order.status)
        that.setData({
          order: order,
          statusText: statusInfo.text,
          statusColor: statusInfo.color
        })
      })
      .catch(function(err) {
        console.error('加载订单详情失败', err)
      })
  },

  getStatusInfo(status) {
    var statusMap = {
      1: { text: '待付款', color: '#E6A23C' },
      2: { text: '已完成', color: '#67C23A' },
      3: { text: '已取消', color: '#F56C6C' }
    }
    return statusMap[status] || { text: '未知', color: '#909399' }
  },

  cancelOrder() {
    var that = this
    wx.showModal({
      title: '提示',
      content: '确定要取消该预约订单吗？',
      success: function(res) {
        if (res.confirm) {
          wx.$request.cancelReservationOrder(that.data.order.id)
            .then(function() {
              wx.showToast({ title: '订单已取消', icon: 'success' })
              that.refreshUserInfo()
              that.loadOrderDetail(that.data.order.id)
            })
            .catch(function() {
              wx.showToast({ title: '取消失败', icon: 'none' })
            })
        }
      }
    })
  },

  refreshUserInfo() {
    wx.$request.getMiniUserInfo()
      .then(function(res) {
        if (res.data) {
          wx.setStorageSync('userInfo', res.data)
        }
      })
      .catch(function(err) {
        console.error('刷新用户信息失败', err)
      })
  },

  goToProductList() {
    wx.switchTab({ url: '/pages/product/list/list' })
  }
})
