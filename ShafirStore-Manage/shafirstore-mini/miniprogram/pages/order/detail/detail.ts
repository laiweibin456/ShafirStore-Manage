// pages/order/detail/detail.ts
import { getOrderDetail, cancelOrder as cancelOrderApi } from '../../../utils/request'

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

  async loadOrderDetail(id) {
    try {
      const res = await getOrderDetail(id)
      this.setData({
        order: res.data,
        statusText: this.getStatusText(res.data.status)
      })
    } catch (err) {
      console.error('加载订单详情失败', err)
    }
  },

  getStatusText(status) {
    const statusMap = {
      1: '待取货',
      2: '已完成',
      3: '已取消',
      4: '已退款'
    }
    return statusMap[status] || '未知'
  },

  async cancelOrder() {
    wx.showModal({
      title: '提示',
      content: '确定要取消该订单吗？',
      success: async (res) => {
        if (res.confirm) {
          try {
            await cancelOrderApi(this.data.order.id)
            wx.showToast({ title: '订单已取消', icon: 'success' })
            this.loadOrderDetail(this.data.order.id)
          } catch (err) {
            wx.showToast({ title: '取消失败', icon: 'none' })
          }
        }
      }
    })
  }
})
