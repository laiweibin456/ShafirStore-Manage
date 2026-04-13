Page({
  data: {
    orderItems: [],
    totalAmount: 0,
    discountAmount: 0,
    payAmount: 0,
    discount: 1,
    remark: '',
    pickupDate: '',
    pickupTime: '',
    pickupTimeDisplay: '',
    hasPickupTime: false,
    dateIndex: 0,
    dateRange: [],
    timeIndex: [0, 0],
    timeRange: [[], []],
    submitting: false
  },

  onLoad() {
    this.initDateRange()
    this.initTimeRange()
    this.loadCartData()
    this.loadUserDiscount()
  },

  initDateRange() {
    var dateRange = []
    for (var i = 0; i < 7; i++) {
      var d = new Date()
      d.setDate(d.getDate() + i)
      var month = d.getMonth() + 1
      var day = d.getDate()
      var weekDays = ['周日', '周一', '周二', '周三', '周四', '周五', '周六']
      var label = ''
      if (i === 0) {
        label = '今天'
      } else if (i === 1) {
        label = '明天'
      } else if (i === 2) {
        label = '后天'
      } else {
        label = weekDays[d.getDay()]
      }
      dateRange.push({
        label: label,
        date: d.getFullYear() + '-' + (month < 10 ? '0' + month : '' + month) + '-' + (day < 10 ? '0' + day : '' + day),
        display: month + '月' + day + '日'
      })
    }
    this.setData({ dateRange: dateRange })
  },

  initTimeRange() {
    var hours = []
    var minutes = ['00', '30']
    for (var i = 9; i <= 20; i++) {
      hours.push(i < 10 ? '0' + i : '' + i)
    }
    this.setData({ timeRange: [hours, minutes] })
  },

  loadCartData() {
    var cartItems = wx.getStorageSync('cartItems') || []
    var selectedItems = []
    for (var i = 0; i < cartItems.length; i++) {
      if (cartItems[i].selected) {
        selectedItems.push(cartItems[i])
      }
    }

    if (selectedItems.length === 0) {
      wx.showToast({ title: '请先选择商品', icon: 'none' })
      setTimeout(function() {
        wx.navigateBack()
      }, 1500)
      return
    }

    var totalAmount = 0
    for (var j = 0; j < selectedItems.length; j++) {
      totalAmount += selectedItems[j].price * selectedItems[j].quantity
    }

    this.setData({
      orderItems: selectedItems,
      totalAmount: totalAmount.toFixed(2),
      payAmount: totalAmount.toFixed(2)
    })
  },

  loadUserDiscount() {
    var userInfo = wx.getStorageSync('userInfo')
    var userType = wx.getStorageSync('userType')

    if (userType == 2 && userInfo && userInfo.discount) {
      var discount = userInfo.discount
      var totalAmount = parseFloat(this.data.totalAmount)
      var discountAmount = totalAmount * (1 - discount)
      var payAmount = totalAmount * discount

      this.setData({
        discount: discount,
        discountAmount: discountAmount.toFixed(2),
        payAmount: payAmount.toFixed(2)
      })
    }
  },

  onDateChange(e) {
    var index = e.detail.value
    this.setData({ dateIndex: index })
    this.updatePickupTimeDisplay()
  },

  onTimeChange(e) {
    var index = e.detail.value
    this.setData({ timeIndex: index })
    this.updatePickupTimeDisplay()
  },

  updatePickupTimeDisplay() {
    var dateItem = this.data.dateRange[this.data.dateIndex]
    var hours = this.data.timeRange[0]
    var minutes = this.data.timeRange[1]
    var hour = hours[this.data.timeIndex[0]]
    var minute = minutes[this.data.timeIndex[1]]

    if (!dateItem || !hour || !minute) return

    var pickupTime = dateItem.date + ' ' + hour + ':' + minute + ':00'
    var pickupTimeDisplay = dateItem.display + ' ' + hour + ':' + minute

    this.setData({
      pickupDate: dateItem.date,
      pickupTime: pickupTime,
      pickupTimeDisplay: pickupTimeDisplay,
      hasPickupTime: true
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

    var token = wx.getStorageSync('token')
    if (!token) {
      wx.showToast({ title: '请先登录', icon: 'none' })
      setTimeout(function() {
        wx.navigateTo({ url: '/pages/member/login/login' })
      }, 1500)
      return
    }

    if (this.data.submitting) return
    this.setData({ submitting: true })

    var productIds = []
    var quantities = []
    for (var i = 0; i < this.data.orderItems.length; i++) {
      productIds.push(this.data.orderItems[i].id)
      quantities.push(this.data.orderItems[i].quantity)
    }

    var that = this
    wx.$request.createReservationOrder({
      productIds: productIds,
      quantities: quantities,
      pickupTime: this.data.pickupTime,
      remark: this.data.remark
    })
      .then(function(res) {
        var cartItems = wx.getStorageSync('cartItems') || []
        var remainingItems = []
        for (var i = 0; i < cartItems.length; i++) {
          if (!cartItems[i].selected) {
            remainingItems.push(cartItems[i])
          }
        }
        wx.setStorageSync('cartItems', remainingItems)

        wx.showToast({ title: '预约成功', icon: 'success' })
        setTimeout(function() {
          wx.switchTab({ url: '/pages/order/list/list' })
        }, 1500)
      })
      .catch(function(err) {
        console.error('创建订单失败', err)
        that.setData({ submitting: false })
      })
  }
})
