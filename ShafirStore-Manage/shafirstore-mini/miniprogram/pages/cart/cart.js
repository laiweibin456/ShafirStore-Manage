Page({
  data: {
    cartItems: [],
    isAllSelected: true,
    totalPrice: '0.00',
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
    var selectedCount = 0
    var allSelected = cartItems.length > 0

    for (var i = 0; i < cartItems.length; i++) {
      if (cartItems[i].selected) {
        total += cartItems[i].price * cartItems[i].quantity
        selectedCount += cartItems[i].quantity
      } else {
        allSelected = false
      }
    }

    this.setData({
      totalPrice: total.toFixed(2),
      selectedCount: selectedCount,
      isAllSelected: allSelected
    })
  },

  toggleSelect(e) {
    var id = e.currentTarget.dataset.id
    var cartItems = this.data.cartItems
    for (var i = 0; i < cartItems.length; i++) {
      if (cartItems[i].id === id) {
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
    var id = e.currentTarget.dataset.id
    var cartItems = this.data.cartItems
    for (var i = 0; i < cartItems.length; i++) {
      if (cartItems[i].id === id) {
        cartItems[i].quantity += 1
        break
      }
    }
    this.setData({ cartItems: cartItems })
    this.saveCartData()
  },

  decrease(e) {
    var id = e.currentTarget.dataset.id
    var cartItems = this.data.cartItems
    for (var i = 0; i < cartItems.length; i++) {
      if (cartItems[i].id === id) {
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
    var id = e.currentTarget.dataset.id
    var cartItems = this.data.cartItems
    var newItems = []
    for (var i = 0; i < cartItems.length; i++) {
      if (cartItems[i].id !== id) {
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
