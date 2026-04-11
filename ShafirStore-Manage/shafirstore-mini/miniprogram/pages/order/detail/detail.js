// pages/order/detail/detail.js
Page({
  data: {
    order: {},
    statusText: ''
  },

  onLoad(options) {
    if (options.id) {
      this.loadOrderDetail(Number(options.id))
    }
  },

  loadOrderDetail(id) {
    wx.$request.getOrderDetail(id)
      .then(res => {
        this.setData({
          order: res.data,
          statusText: this.getStatusText(res.data.status)
        })
      })
      .catch(err => {
        console.error('加载订单详情失败', err)
      })
  },

  getStatusText(status) {
    var statusMap = {
      1: '待取货',
      2: '已完成',
      3: '已取消',
      4: '已退款'
    }
    return statusMap[status] || '未知'
  },

  cancelOrder() {
    var self = this
    wx.showModal({
      title: '提示',
      content: '确定要取消该订单吗？',
      success: function(res) {
        if (res.confirm) {
          wx.$request.cancelOrder(self.data.order.id)
            .then(function() {
              wx.showToast({ title: '订单已取消', icon: 'success' })
              self.loadOrderDetail(self.data.order.id)
            })
            .catch(function() {
              wx.showToast({ title: '取消失败', icon: 'none' })
            })
        }
      }
    })
  }
})