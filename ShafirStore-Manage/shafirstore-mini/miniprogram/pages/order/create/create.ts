// pages/order/create/create.ts
import { createOrder } from '../../../utils/request'

Page({
  data: {
    orderItems: [],
    payType: 2,
    remark: '',
    totalAmount: 0
  },

  onLoad() {
    const cartItems = wx.getStorageSync('cartItems') || []
    const selectedItems = cartItems.filter((item) => item.selected)
    const totalAmount = selectedItems.reduce((sum, item) => sum + item.price * item.quantity, 0)
    this.setData({
      orderItems: selectedItems,
      totalAmount
    })
  },

  onPayTypeChange(e) {
    this.setData({ payType: Number(e.detail.value) })
  },

  onRemarkInput(e) {
    this.setData({ remark: e.detail.value })
  },

  async submitOrder() {
    if (this.data.orderItems.length === 0) {
      wx.showToast({ title: '请选择商品', icon: 'none' })
      return
    }

    try {
      const productIds = this.data.orderItems.map((item) => item.productId)
      const quantities = this.data.orderItems.map((item) => item.quantity)

      const res = await createOrder({
        productIds,
        quantities,
        payType: this.data.payType,
        remark: this.data.remark
      })

      // 清空已购买的购物车商品
      const cartItems = wx.getStorageSync('cartItems') || []
      const remainingItems = cartItems.filter((item) => !item.selected)
      wx.setStorageSync('cartItems', remainingItems)

      wx.showToast({ title: '订单创建成功', icon: 'success' })
      wx.redirectTo({ url: `/pages/order/detail/detail?id=${res.data.id}` })
    } catch (err) {
      console.error('创建订单失败', err)
      wx.showToast({ title: '创建订单失败', icon: 'none' })
    }
  }
})
