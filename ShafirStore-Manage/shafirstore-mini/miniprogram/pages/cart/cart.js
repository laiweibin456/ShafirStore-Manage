Page({
  data: {
    cartItems: [],
    isAllSelected: true,
    totalPrice: '0.00',
    totalPoints: 0,
    selectedCount: 0
  },

  onLoad() {
    this.loadCartData()
  },

  onShow() {
    this.loadCartData()
  },

  loadCartData() {
    var cartItems = wx.getStorageSync('cartItems') || []
    for (var i = 0; i < cartItems.length; i++) {
      if (cartItems[i].selected === undefined) {
        cartItems[i].selected = true
      }
      if (!cartItems[i].cartKey) {
        cartItems[i].cartKey = cartItems[i].id + '_' + (cartItems[i].isPointsExchange ? 'exchange' : 'normal')
      }
    }
    this.setData({ cartItems: cartItems })
    this.calculateTotal()
  },

  saveCartData() {
    wx.setStorageSync('cartItems', this.data.cartItems)
    this.calculateTotal()
  },

  calculateTotal() {
    var cartItems = this.data.cartItems
    var total = 0
    var points = 0
    var selectedCount = 0
    var allSelected = cartItems.length > 0

    for (var i = 0; i < cartItems.length; i++) {
      if (cartItems[i].selected) {
        total += cartItems[i].price * cartItems[i].quantity
        if (cartItems[i].isPointsExchange && cartItems[i].requiredPoints) {
          points += cartItems[i].requiredPoints * cartItems[i].quantity
        }
        selectedCount += cartItems[i].quantity
      } else {
        allSelected = false
      }
    }

    this.setData({
      totalPrice: total.toFixed(2),
      totalPoints: points,
      selectedCount: selectedCount,
      isAllSelected: allSelected
    })
  },

  toggleSelect(e) {
    var cartKey = e.currentTarget.dataset.cartkey
    var cartItems = this.data.cartItems
    for (var i = 0; i < cartItems.length; i++) {
      if (cartItems[i].cartKey === cartKey) {
        cartItems[i].selected = !cartItems[i].selected
        break
      }
    }
    this.setData({ cartItems: cartItems })
    this.saveCartData()
  },

  toggleAllSelect() {
    var cartItems = this.data.cartItems
    var newSelected = !this.data.isAllSelected
    for (var i = 0; i < cartItems.length; i++) {
      cartItems[i].selected = newSelected
    }
    this.setData({ cartItems: cartItems })
    this.saveCartData()
  },

  increase(e) {
    var cartKey = e.currentTarget.dataset.cartkey
    var cartItems = this.data.cartItems
    for (var i = 0; i < cartItems.length; i++) {
      if (cartItems[i].cartKey === cartKey) {
        cartItems[i].quantity += 1
        break
      }
    }
    this.setData({ cartItems: cartItems })
    this.saveCartData()
  },

  decrease(e) {
    var cartKey = e.currentTarget.dataset.cartkey
    var cartItems = this.data.cartItems
    for (var i = 0; i < cartItems.length; i++) {
      if (cartItems[i].cartKey === cartKey) {
        if (cartItems[i].quantity > 1) {
          cartItems[i].quantity -= 1
        }
        break
      }
    }
    this.setData({ cartItems: cartItems })
    this.saveCartData()
  },

  deleteItem(e) {
    var cartKey = e.currentTarget.dataset.cartkey
    var cartItems = this.data.cartItems
    var newItems = []
    for (var i = 0; i < cartItems.length; i++) {
      if (cartItems[i].cartKey !== cartKey) {
        newItems.push(cartItems[i])
      }
    }
    this.setData({ cartItems: newItems })
    wx.setStorageSync('cartItems', newItems)
    this.calculateTotal()
    wx.showToast({ title: '已删除', icon: 'success' })
  },

  checkout() {
    var selectedItems = []
    var cartItems = this.data.cartItems
    for (var i = 0; i < cartItems.length; i++) {
      if (cartItems[i].selected) {
        selectedItems.push(cartItems[i])
      }
    }

    if (selectedItems.length === 0) {
      wx.showToast({ title: '请选择商品', icon: 'none' })
      return
    }

    var userInfo = wx.getStorageSync('userInfo')
    var totalPoints = 0
    for (var i = 0; i < selectedItems.length; i++) {
      if (selectedItems[i].isPointsExchange && selectedItems[i].requiredPoints) {
        totalPoints += selectedItems[i].requiredPoints * selectedItems[i].quantity
      }
    }

    if (totalPoints > 0) {
      if (!userInfo || !userInfo.id) {
        wx.showToast({ title: '请先登录', icon: 'none' })
        return
      }
      var userPoints = userInfo.points || 0
      if (userPoints < totalPoints) {
        wx.showToast({ title: '积分不足，需要' + totalPoints + '积分', icon: 'none' })
        return
      }
    }

    wx.setStorageSync('cartItems', cartItems)
    wx.navigateTo({
      url: '/pages/order/create/create'
    })
  },

  goShopping() {
    wx.switchTab({
      url: '/pages/index/index'
    })
  }
})
