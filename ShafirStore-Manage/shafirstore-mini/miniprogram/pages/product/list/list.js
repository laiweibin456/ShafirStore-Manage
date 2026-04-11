// pages/product/list/list.js
Page({
  data: {
    products: [],
    hotProducts: [],
    categories: [],
    categoryId: null,
    keyword: '',
    pageNum: 1,
    pageSize: 10,
    hasMore: true,
    loading: false,
    cartCount: 0,
    cartTotal: 0
  },

  onLoad(options) {
    if (options.categoryId) {
      this.setData({ categoryId: Number(options.categoryId) })
    }
    this.loadProducts()
  },

  onShow() {
    this.loadCartData()
  },

  loadProducts() {
    if (this.data.loading) return
    this.setData({ loading: true })

    wx.$request.getProductList({
      pageNum: this.data.pageNum,
      pageSize: this.data.pageSize,
      name: this.data.keyword,
      categoryId: this.data.categoryId
    })
      .then(res => {
        const list = res.data.records || []
        this.setData({
          products: this.data.pageNum === 1 ? list : this.data.products.concat(list),
          hasMore: list.length >= this.data.pageSize,
          loading: false
        })
      })
      .catch(err => {
        console.error('加载商品失败', err)
        this.setData({ loading: false })
      })
  },

  loadCartData() {
    const cartItems = wx.getStorageSync('cartItems') || []
    var cartCount = 0
    var cartTotal = 0
    cartItems.forEach(function(item) {
      cartCount += item.quantity
      cartTotal += item.price * item.quantity
    })
    this.setData({ cartCount: cartCount, cartTotal: cartTotal })
  },

  onSearch(e) {
    this.setData({ keyword: e.detail.value, pageNum: 1 })
    this.loadProducts()
  },

  selectCategory(e) {
    const categoryId = e.currentTarget.dataset.id
    this.setData({ categoryId: categoryId || null, pageNum: 1 })
    this.loadProducts()
  },

  loadMore() {
    if (this.data.hasMore) {
      this.setData({ pageNum: this.data.pageNum + 1 })
      this.loadProducts()
    }
  },

  goToDetail(e) {
    wx.navigateTo({ url: '/pages/product/detail/detail?id=' + e.currentTarget.dataset.id })
  },

  goToCart() {
    wx.switchTab({ url: '/pages/cart/cart' })
  },

  addToCart(e) {
    const productId = e.currentTarget.dataset.id
    const products = this.data.products
    const hotProducts = this.data.hotProducts

    var product = null
    for (var i = 0; i < products.length; i++) {
      if (products[i].id === productId) {
        product = products[i]
        break
      }
    }
    if (!product) {
      for (var i = 0; i < hotProducts.length; i++) {
        if (hotProducts[i].id === productId) {
          product = hotProducts[i]
          break
        }
      }
    }

    if (!product) return

    const cartItems = wx.getStorageSync('cartItems') || []
    var existIndex = -1
    for (var i = 0; i < cartItems.length; i++) {
      if (cartItems[i].id === productId) {
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
    this.loadCartData()
    wx.showToast({ title: '已加入购物车', icon: 'success' })
  }
})