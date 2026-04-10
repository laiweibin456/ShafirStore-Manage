// pages/index/index.ts
import { getHomeData } from '../../utils/request'

Page({
  data: {
    banners: [],
    categories: [],
    hotProducts: [],
    newProducts: []
  },

  onLoad() {
    this.loadHomeData()
  },

  onShow() {
    // 更新tabBar购物车数量
    const cartCount = wx.getStorageSync('cartCount') || 0
    if (cartCount > 0) {
      wx.setTabBarBadge({ index: 2, text: String(cartCount) })
    } else {
      wx.removeTabBarBadge({ index: 2 })
    }
  },

  async loadHomeData() {
    try {
      const res = await getHomeData()
      this.setData({
        banners: res.data.banners || [],
        categories: res.data.categories || [],
        hotProducts: res.data.hotProducts || [],
        newProducts: res.data.newProducts || []
      })
    } catch (err) {
      console.error('加载首页数据失败', err)
    }
  },

  goToSearch() {
    wx.navigateTo({ url: '/pages/product/list/list' })
  },

  goToCategory(e: any) {
    const categoryId = e.currentTarget.dataset.id
    wx.navigateTo({
      url: `/pages/product/list/list?categoryId=${categoryId}`
    })
  },

  goToList(e: any) {
    const type = e.currentTarget.dataset.type
    wx.navigateTo({
      url: `/pages/product/list/list?type=${type}`
    })
  },

  goToDetail(e: any) {
    const productId = e.currentTarget.dataset.id
    wx.navigateTo({
      url: `/pages/product/detail/detail?id=${productId}`
    })
  }
})
