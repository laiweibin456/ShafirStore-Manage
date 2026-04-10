// pages/cart/cart.ts
Page({
  data: {
    cartItems: [],
    isAllSelected: false
  },

  onShow() {
    this.loadCart()
  },

  loadCart() {
    const cartData = wx.getStorageSync('cartItems') || []
    this.setData({
      cartItems: cartData,
      isAllSelected: cartData.length > 0 && cartData.every((item) => item.selected)
    })
    this.updateCartCount()
  },

  updateCartCount() {
    const count = this.data.cartItems.reduce((sum, item) => {
      return sum + (item.selected ? item.quantity : 0)
    }, 0)
    if (count > 0) {
      wx.setTabBarBadge({ index: 2, text: String(count) })
    } else {
      wx.removeTabBarBadge({ index: 2 })
    }
    wx.setStorageSync('cartCount', count)
  },

  getTotalPrice() {
    return this.data.cartItems.reduce((sum, item) => {
      return sum + (item.selected ? item.price * item.quantity : 0)
    }, 0)
  },

  toggleSelect(e) {
    const id = e.currentTarget.dataset.id
    const items = this.data.cartItems.map((item) => {
      if (item.id === id) {
        return { ...item, selected: !item.selected }
      }
      return item
    })
    this.setData({
      cartItems: items,
      isAllSelected: items.every((item) => item.selected)
    })
    this.updateCartCount()
  },

  toggleAllSelect() {
    const allSelected = !this.data.isAllSelected
    const items = this.data.cartItems.map((item) => ({
      ...item,
      selected: allSelected
    }))
    this.setData({ cartItems: items, isAllSelected: allSelected })
    this.updateCartCount()
  },

  increase(e) {
    const id = e.currentTarget.dataset.id
    const items = this.data.cartItems.map((item) => {
      if (item.id === id) {
        return { ...item, quantity: item.quantity + 1 }
      }
      return item
    })
    this.setData({ cartItems: items })
    wx.setStorageSync('cartItems', items)
    this.updateCartCount()
  },

  decrease(e) {
    const id = e.currentTarget.dataset.id
    const items = this.data.cartItems.map((item) => {
      if (item.id === id && item.quantity > 1) {
        return { ...item, quantity: item.quantity - 1 }
      }
      return item
    })
    this.setData({ cartItems: items })
    wx.setStorageSync('cartItems', items)
    this.updateCartCount()
  },

  deleteItem(e) {
    const id = e.currentTarget.dataset.id
    const items = this.data.cartItems.filter((item) => item.id !== id)
    this.setData({ cartItems: items })
    wx.setStorageSync('cartItems', items)
    this.updateCartCount()
  },

  goShopping() {
    wx.switchTab({ url: '/pages/index/index' })
  },

  checkout() {
    const selectedItems = this.data.cartItems.filter((item) => item.selected)
    if (selectedItems.length === 0) {
      wx.showToast({ title: '请选择商品', icon: 'none' })
      return
    }
    wx.navigateTo({ url: '/pages/order/create/create' })
  }
})
