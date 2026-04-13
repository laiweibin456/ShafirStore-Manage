Page({
  data: {
    product: {},
    productId: 0,
    cartCount: 0
  },

  onLoad(options) {
    if (options.id) {
      this.setData({ productId: Number(options.id) })
      this.loadProduct()
    }
  },

  onShow() {
    this.loadCartCount()
  },

  loadProduct() {
    wx.$request.getProductById(this.data.productId)
      .then(res => {
        var product = res.data
        if (product.imageUrl) {
          product.imageList = [product.imageUrl]
        } else {
          product.imageList = []
        }
        this.setData({ product: product })
      })
      .catch(err => {
        console.error('加载商品详情失败', err)
      })
  },

  loadCartCount() {
    var cartItems = wx.getStorageSync('cartItems') || []
    var count = 0
    for (var i = 0; i < cartItems.length; i++) {
      count += cartItems[i].quantity
    }
    this.setData({ cartCount: count })
  },

  goToHome() {
    wx.switchTab({ url: '/pages/index/index' })
  },

  goToCart() {
    wx.navigateTo({ url: '/pages/cart/cart' })
  },

  addToCart() {
    var product = this.data.product
    if (!product || !product.id) return

    var cartItems = wx.getStorageSync('cartItems') || []
    var existIndex = -1
    for (var i = 0; i < cartItems.length; i++) {
      if (cartItems[i].id === product.id) {
        existIndex = i
        break
      }
    }

    if (existIndex > -1) {
      cartItems[existIndex].quantity += 1
    } else {
      cartItems.push({
        id: product.id,
        name: product.name,
        price: product.price,
        imageUrl: product.imageUrl,
        quantity: 1,
        selected: true
      })
    }

    wx.setStorageSync('cartItems', cartItems)
    this.loadCartCount()
    wx.showToast({ title: '已加入购物车', icon: 'success' })
  },

  buyNow() {
    var product = this.data.product
    if (!product || !product.id) return

    var cartItems = wx.getStorageSync('cartItems') || []
    var existIndex = -1
    for (var i = 0; i < cartItems.length; i++) {
      if (cartItems[i].id === product.id) {
        existIndex = i
        break
      }
    }

    if (existIndex > -1) {
      cartItems[existIndex].quantity += 1
    } else {
      cartItems.push({
        id: product.id,
        name: product.name,
        price: product.price,
        imageUrl: product.imageUrl,
        quantity: 1,
        selected: true
      })
    }

    wx.setStorageSync('cartItems', cartItems)
    wx.navigateTo({
      url: '/pages/order/create/create'
    })
  }
})
