// pages/order/list/list.ts
import { getOrderList } from '../../../utils/request'

Page({
  data: {
    orders: [],
    status: 0,
    pageNum: 1,
    pageSize: 10
  },

  onLoad() {
    this.loadOrders()
  },

  async loadOrders() {
    try {
      const res = await getOrderList({
        pageNum: this.data.pageNum,
        pageSize: this.data.pageSize,
        status: this.data.status || undefined
      })
      this.setData({ orders: res.data.records || [] })
    } catch (err) {
      console.error('加载订单失败', err)
    }
  },

  changeTab(e) {
    const status = Number(e.currentTarget.dataset.status)
    this.setData({ status, pageNum: 1 })
    this.loadOrders()
  },

  goToDetail(e) {
    wx.navigateTo({ url: `/pages/order/detail/detail?id=${e.currentTarget.dataset.id}` })
  },

  getStatusText(status) {
    const statusMap = {
      1: '待取货',
      2: '已完成',
      3: '已取消',
      4: '已退款'
    }
    return statusMap[status] || '未知'
  }
})
