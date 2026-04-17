Page({
  data: {
    categories: [],
    currentCategoryIndex: 0,
    products: [],
    loading: false,
    cartCount: 0,
    currentStoreName: '',
    hasStore: false,
    lastStoreId: null
  },

  onLoad() {
    this.checkStore()
    this.loadCategories()
  },

  onShow() {
    this.loadCartCount()
    var prevStoreId = this.data.lastStoreId
    this.checkStore()
    if (this.data.hasStore) {
      var currentStoreId = getApp().globalData.currentStoreId
      if (currentStoreId !== prevStoreId || this.data.categories.length === 0) {
        this.setData({ lastStoreId: currentStoreId, categories: [], products: [] })
        this.loadCategories()
      }
    }
  },

  checkStore() {
    var app = getApp()
    var store = app.globalData.currentStore
    var hasStore = !!store
    var storeName = store ? store.storeName : ''
    this.setData({
      hasStore: hasStore,
      currentStoreName: storeName
    })
    if (!hasStore) {
      this.setData({ products: [], categories: [] })
    }
  },

  goToStoreSelect() {
    wx.navigateTo({ url: '/pages/store/select/select' })
  },

  loadCategories() {
    var app = getApp()
    if (!app.globalData.currentStoreId) return

    var that = this
    wx.$request.getProductCategories()
      .then(function(res) {
        var categories = []
        if (res.data && res.data.length > 0) {
          categories = res.data
        }
        that.setData({ categories: categories })
        if (categories.length > 0) {
          that.loadProductsByCategory(categories[0].id, 0)
        }
      })
      .catch(function(err) {
        console.error('加载分类失败', err)
      })
  },

  switchCategory(e) {
    var index = e.currentTarget.dataset.index
    var category = this.data.categories[index]
    if (!category) return
    if (index === this.data.currentCategoryIndex) return

    this.setData({
      currentCategoryIndex: index,
      products: [],
      loading: true
    })
    this.loadProductsByCategory(category.id, index)
  },

  loadProductsByCategory(categoryId, categoryIndex) {
    var that = this
    this.setData({ loading: true })

    wx.$request.getProductList({ pageNum: 1, pageSize: 50, categoryId: categoryId })
      .then(function(res) {
        var list = res.data && res.data.records ? res.data.records : (res.data || [])
        that.setData({
          products: list,
          loading: false
        })
      })
      .catch(function(err) {
        console.error('加载商品失败', err)
        that.setData({ loading: false })
      })
  },

  goToDetail(e) {
    var id = e.currentTarget.dataset.id
    wx.navigateTo({ url: '/pages/product/detail/detail?id=' + id })
  },

  addToCart(e) {
    var product = e.currentTarget.dataset.item
    if (!product) return

    if (product.stockQuantity !== undefined && product.stockQuantity <= 0) {
      wx.showToast({ title: '该商品暂无库存', icon: 'none' })
      return
    }

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

  loadCartCount() {
    var cartItems = wx.getStorageSync('cartItems') || []
    var count = 0
    for (var i = 0; i < cartItems.length; i++) {
      count += cartItems[i].quantity
    }
    this.setData({ cartCount: count })
  },

  goToCart() {
    wx.navigateTo({ url: '/pages/cart/cart' })
  }
})
