// pages/product/detail/detail.js
Page({
  data: {
    product: {},
    productId: 0
  },

  onLoad(options) {
    if (options.id) {
      this.setData({ productId: Number(options.id) })
      this.loadProduct()
    }
  },

  loadProduct() {
    wx.$request.getProductById(this.data.productId)
      .then(res => {
        this.setData({ product: res.data })
      })
      .catch(err => {
        console.error('加载商品详情失败', err)
      })
  },

  goToHome() {
    wx.switchTab({ url: '/pages/index/index' })
  },

  goToCart() {
    wx.switchTab({ url: '/pages/cart/cart' })
  },

  addToCart() {
    wx.showToast({ title: '已加入购物车', icon: 'success' })
  },

  buyNow() {
    wx.navigateTo({
      url: '/pages/order/create/create?productId=' + this.data.productId
    })
  }
})