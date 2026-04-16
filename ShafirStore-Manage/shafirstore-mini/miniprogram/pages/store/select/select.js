var app = getApp()

Page({
  data: {
    stores: [],
    loading: true,
    currentStoreId: null
  },

  onLoad: function() {
    this.setData({
      currentStoreId: app.globalData.currentStoreId
    })
    this.loadStores()
  },

  loadStores: function() {
    var that = this
    wx.$request.getAllStores()
      .then(function(res) {
        that.setData({
          stores: res.data || [],
          loading: false
        })
      })
      .catch(function() {
        that.setData({ loading: false })
        wx.showToast({ title: '获取店铺列表失败', icon: 'none' })
      })
  },

  selectStore: function(e) {
    var storeId = e.currentTarget.dataset.id
    var storeName = e.currentTarget.dataset.name
    var store = null

    for (var i = 0; i < this.data.stores.length; i++) {
      if (this.data.stores[i].id === storeId) {
        store = this.data.stores[i]
        break
      }
    }

    if (!store) return

    app.setCurrentStore(store)
    this.setData({ currentStoreId: storeId })

    wx.showToast({ title: '已选择：' + storeName, icon: 'success' })

    setTimeout(function() {
      wx.navigateBack()
    }, 1000)
  },

  goBack: function() {
    wx.navigateBack()
  }
})
