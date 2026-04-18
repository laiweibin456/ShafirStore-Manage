// pages/member/points/points.js
var app = getApp()

Page({
  data: {
    points: 0,
    activeTab: 'exchange',
    exchangeProducts: [],
    records: [],
    showExchangeModal: false,
    selectedProduct: null,
    pageNum: 1,
    pageSize: 20,
    hasMore: true,
    loading: false
  },

  onLoad: function(options) {
    this.loadUserInfo()
    this.loadExchangeProducts()
  },

  onShow: function() {
    this.loadUserInfo()
    if (this.data.activeTab === 'exchange') {
      this.loadExchangeProducts()
    } else {
      this.loadPointsRecords()
    }
  },

  loadUserInfo: function() {
    var userInfo = wx.getStorageSync('userInfo')
    if (userInfo && userInfo.points !== undefined) {
      this.setData({ points: userInfo.points })
    }
  },

  switchTab: function(e) {
    var tab = e.currentTarget.dataset.tab
    this.setData({ activeTab: tab })
    
    if (tab === 'exchange') {
      this.loadExchangeProducts()
    } else {
      this.setData({ pageNum: 1, records: [], hasMore: true })
      this.loadPointsRecords()
    }
  },

  loadExchangeProducts: function() {
    var that = this
    that.setData({ loading: true })
    
    wx.$request.getExchangeProducts()
      .then(function(res) {
        that.setData({
          exchangeProducts: res.data || [],
          loading: false
        })
      })
      .catch(function(err) {
        console.error('加载兑换商品失败', err)
        that.setData({ loading: false })
      })
  },

  loadPointsRecords: function() {
    var that = this
    if (!that.data.hasMore || that.data.loading) return
    
    that.setData({ loading: true })
    
    wx.$request.getPointsRecords({
      pageNum: that.data.pageNum,
      pageSize: that.data.pageSize
    })
      .then(function(res) {
        var records = res.data && res.data.records ? res.data.records : []
        var hasMore = records.length >= that.data.pageSize
        
        that.setData({
          records: that.data.records.concat(records),
          hasMore: hasMore,
          pageNum: that.data.pageNum + 1,
          loading: false
        })
      })
      .catch(function(err) {
        console.error('加载积分记录失败', err)
        that.setData({ loading: false })
      })
  },

  handleExchange: function(e) {
    var product = e.currentTarget.dataset.product
    
    if (!product.canExchange) {
      if (product.stockQuantity === 0) {
        wx.showToast({ title: '商品库存不足', icon: 'none' })
      } else {
        wx.showToast({ title: '积分不足', icon: 'none' })
      }
      return
    }
    
    this.setData({
      showExchangeModal: true,
      selectedProduct: product
    })
  },

  hideExchangeModal: function() {
    this.setData({
      showExchangeModal: false,
      selectedProduct: null
    })
  },

  confirmExchange: function() {
    var that = this
    var product = that.data.selectedProduct
    
    if (!product) return

    var cartItems = wx.getStorageSync('cartItems') || []
    var cartKey = product.id + '_exchange'
    
    var existIndex = -1
    for (var i = 0; i < cartItems.length; i++) {
      if (cartItems[i].cartKey === cartKey) {
        existIndex = i
        break
      }
    }

    if (existIndex > -1) {
      cartItems[existIndex].quantity += 1
    } else {
      cartItems.push({
        cartKey: cartKey,
        id: product.id,
        name: product.name,
        price: 0,
        originalPrice: product.price,
        imageUrl: product.imageUrl,
        quantity: 1,
        selected: true,
        isPointsExchange: true,
        requiredPoints: product.requiredPoints
      })
    }

    wx.setStorageSync('cartItems', cartItems)
    
    wx.showToast({ title: '已加入购物车', icon: 'success' })
    
    that.setData({
      showExchangeModal: false,
      selectedProduct: null
    })
  },

  onPullDownRefresh: function() {
    this.setData({ pageNum: 1, records: [], hasMore: true })
    
    if (this.data.activeTab === 'exchange') {
      this.loadExchangeProducts()
    } else {
      this.loadPointsRecords()
    }
    
    this.loadUserInfo()
    wx.stopPullDownRefresh()
  },

  onReachBottom: function() {
    if (this.data.activeTab === 'records') {
      this.loadPointsRecords()
    }
  },

  onShareAppMessage: function() {
    return {
      title: '莎菲尔菓子 - 积分兑换',
      path: '/pages/index/index'
    }
  }
})
