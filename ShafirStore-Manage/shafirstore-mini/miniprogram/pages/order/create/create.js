Page({

  data: {
    orderItems: [],
    totalAmount: 0,
    discountAmount: 0,
    payAmount: 0,
    discount: 1,
    remark: '',
    pickupTime: '',
    pickupTimeDisplay: '',
    hasPickupTime: false,
    pickupTimeIndex: [0, 0],
    pickupTimeRange: [[], []],
    minDate: null
  },

  onLoad(options) {
    this.initPickupTimeRange()
    this.loadCartData()
    this.loadUserDiscount()
  },

  initPickupTimeRange() {
    const now = new Date()
    const hours = []
    const minutes = ['00', '30']

    for (let i = 9; i <= 20; i++) {
      hours.push(i < 10 ? '0' + i : '' + i)
    }

    this.setData({
      pickupTimeRange: [hours, minutes],
      minDate: now.getTime()
    })
  },

  loadCartData() {
    const cartItems = wx.getStorageSync('cartItems') || []
    if (cartItems.length === 0) {
      wx.showToast({ title: '购物车为空', icon: 'none' })
      setTimeout(() => {
        wx.navigateBack()
      }, 1500)
      return
    }

    let totalAmount = 0
    cartItems.forEach(item => {
      totalAmount += item.price * item.quantity
    })

    this.setData({
      orderItems: cartItems,
      totalAmount: totalAmount.toFixed(2),
      payAmount: totalAmount.toFixed(2)
    })
  },

  loadUserDiscount() {
    const userInfo = wx.getStorageSync('userInfo')
    const userType = wx.getStorageSync('userType')

    if (userType == 2 && userInfo && userInfo.discount) {
      const discount = userInfo.discount
      const totalAmount = this.data.totalAmount
      const discountAmount = totalAmount * (1 - discount)
      const payAmount = totalAmount * discount

      this.setData({
        discount: discount,
        discountAmount: discountAmount.toFixed(2),
        payAmount: payAmount.toFixed(2)
      })
    }
  },

  onPickupTimeChange(e) {
    const index = e.detail.value
    const hours = this.data.pickupTimeRange[0]
    const minutes = this.data.pickupTimeRange[1]

    const hour = hours[index[0]]
    const minute = minutes[index[1]]

    const now = new Date()
    const year = now.getFullYear()
    const month = now.getMonth() + 1
    const day = now.getDate()

    const pickupTime = year + '-' + month.toString().padStart(2, '0') + '-' + day.toString().padStart(2, '0') + ' ' + hour + ':' + minute + ':00'
    const pickupTimeDisplay = month + '月' + day + '日 ' + hour + ':' + minute

    this.setData({
      pickupTime: pickupTime,
      pickupTimeDisplay: pickupTimeDisplay,
      hasPickupTime: true,
      pickupTimeIndex: index
    })
  },

  onRemarkInput(e) {
    this.setData({ remark: e.detail.value })
  },

  submitOrder() {
    if (!this.data.hasPickupTime) {
      wx.showToast({ title: '请选择取货时间', icon: 'none' })
      return
    }

    const token = wx.getStorageSync('token')
    if (!token) {
      wx.showToast({ title: '请先登录', icon: 'none' })
      setTimeout(() => {
        wx.navigateTo({ url: '/pages/member/login/login' })
      }, 1500)
      return
    }

    const productIds = this.data.orderItems.map(item => item.id)
    const quantities = this.data.orderItems.map(item => item.quantity)

    wx.$request.createReservationOrder({
      productIds: productIds,
      quantities: quantities,
      pickupTime: this.data.pickupTime,
      remark: this.data.remark
    })
      .then(res => {
        wx.removeStorageSync('cartItems')
        wx.showToast({ title: '预约成功', icon: 'success' })

        setTimeout(() => {
          wx.switchTab({ url: '/pages/order/list/list' })
        }, 1500)
      })
      .catch(err => {
        console.error('创建订单失败', err)
      })
  }
})