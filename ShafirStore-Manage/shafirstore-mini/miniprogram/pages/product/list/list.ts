// pages/product/list/list.ts
import { getProductList } from '../../../utils/request'

Page({
  data: {
    products: [],
    categories: [],
    categoryId: null,
    keyword: '',
    pageNum: 1,
    pageSize: 10,
    hasMore: true,
    loading: false
  },

  onLoad(options: any) {
    if (options.categoryId) {
      this.setData({ categoryId: Number(options.categoryId) })
    }
    this.loadCategories()
    this.loadProducts()
  },

  async loadCategories() {
    // TODO: 调用分类接口
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

  addToCart(e: any) {
    const productId = e.currentTarget.dataset.id
    wx.showToast({ title: '已加入购物车', icon: 'success' })
  }
})
