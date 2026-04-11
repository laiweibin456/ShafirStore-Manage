// pages/product/list/list.ts
import { getProductList, getHomeData } from '../../../utils/request'

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

  onLoad(options: any) {
    if (options.categoryId) {
      this.setData({ categoryId: Number(options.categoryId) })
    }
    this.loadHomeData()
    this.loadCategories()
    this.loadProducts()
  },

  onShow() {
    this.loadCartData()
  },

  async loadHomeData() {
    try {
      const res = await getHomeData()
      this.setData({
        hotProducts: res.data.hotProducts || []
      })
    } catch (err) {
      console.error('加载首页数据失败', err)
    }
  },

  async loadCategories() {
    this.setData({ categories: [] })
  },

  async loadProducts() {
    if (this.data.loading) return
    this.setData({ loading: true })

    try {
      const res = await getProductList({
        pageNum: this.data.pageNum,
        pageSize: this.data.pageSize,
        name: this.data.keyword,
        categoryId: this.data.categoryId
      })
      const list = res.data.records || []
      this.setData({
        products: this.data.pageNum === 1 ? list : [...this.data.products, ...list],
        hasMore: list.length >= this.data.pageSize,
        loading: false
      })
    } catch (err) {
      console.error('加载商品失败', err)
      this.setData({ loading: false })
    }
  },

  loadCartData() {
    const cartItems = wx.getStorageSync('cartItems') || []
    const cartCount = cartItems.reduce((sum, item) => sum + item.quantity, 0)
    const cartTotal = cartItems.reduce((sum, item) => sum + item.price * item.quantity, 0)
    this.setData({ cartCount, cartTotal })
  },

  onSearch(e: any) {
    this.setData({ keyword: e.detail.value, pageNum: 1 })
    this.loadProducts()
  },

  selectCategory(e: any) {
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

  goToDetail(e: any) {
    wx.navigateTo({ url: `/pages/product/detail/detail?id=${e.currentTarget.dataset.id}` })
  },

  goToCart() {
    wx.switchTab({ url: '/pages/cart/cart' })
  },

  addToCart(e: any) {
    const productId = e.currentTarget.dataset.id
    const product = this.data.products.find(p => p.id === productId) ||
                     this.data.hotProducts.find(p => p.id === productId)

    if (!product) return

    const cartItems = wx.getStorageSync('cartItems') || []
    const existIndex = cartItems.findIndex(item => item.id === productId)

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
