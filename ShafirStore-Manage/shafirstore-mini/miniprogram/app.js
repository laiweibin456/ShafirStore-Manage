var request = require('./utils/request.js')

App({
  globalData: {
    baseUrl: 'http://localhost:8080/api',
    token: '',
    currentStoreId: null,
    currentStore: null
  },

  onLaunch: function() {
    wx.$request = request

    var token = wx.getStorageSync('token')
    if (token) {
      this.globalData.token = token
    }

    var storeId = wx.getStorageSync('currentStoreId')
    if (storeId) {
      this.globalData.currentStoreId = storeId
    }

    var store = wx.getStorageSync('currentStore')
    if (store) {
      this.globalData.currentStore = store
    }
  },

  setCurrentStore: function(store) {
    this.globalData.currentStoreId = store.id
    this.globalData.currentStore = store
    wx.setStorageSync('currentStoreId', store.id)
    wx.setStorageSync('currentStore', store)
  },

  clearCurrentStore: function() {
    this.globalData.currentStoreId = null
    this.globalData.currentStore = null
    wx.removeStorageSync('currentStoreId')
    wx.removeStorageSync('currentStore')
  }
})
