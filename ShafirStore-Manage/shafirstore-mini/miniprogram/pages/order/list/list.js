Page({

  data: {
    currentTab: 0,
    tabs: ['全部', '待取货', '已完成', '已取消'],
    orders: [],
    loading: false,
    isLoggedIn: false
  },

  onLoad(options) {
    const tab = options.tab ? parseInt(options.tab) : 0
    this.setData({ currentTab: tab })
    this.checkLogin()
  },

  onShow() {
    this.checkLogin()
  },

  checkLogin() {
    const token = wx.getStorageSync('token')
    this.setData({ isLoggedIn: !!token })
    if (token) {
      this.loadOrders(this.data.currentTab)
    } else {
      this.setData({ orders: [] })
    }
  },

  async loadOrders(tabIndex) {
    if (!this.data.isLoggedIn) {
      return
    }

    this.setData({ loading: true })

    let status = null
    if (tabIndex === 1) status = 1
    else if (tabIndex === 2) status = 2
    else if (tabIndex === 3) status = 3

    try {
      const res = await wx.$request.getReservationOrderList({ status })
      this.setData({
        orders: res.data || [],
        loading: false
      })
    } catch (err) {
      console.error('加载订单失败', err)
      this.setData({ loading: false })
    }
  },

  switchTab(e) {
    const index = e.currentTarget.dataset.index
    if (index === this.data.currentTab) return

    this.setData({ currentTab: index })
    this.loadOrders(index)
  },

  goToLogin() {
    wx.navigateTo({
      url: '/pages/member/login/login'
    })
  },

  goToDetail(e) {
    const id = e.currentTarget.dataset.id
    wx.navigateTo({
      url: `/pages/order/detail/detail?id=${id}`
    })
  },

  async cancelOrder(e) {
    const id = e.currentTarget.dataset.id
    wx.showModal({
      title: '提示',
      content: '确定要取消该订单吗？',
      success: async (res) => {
        if (res.confirm) {
          try {
            await wx.$request.cancelReservationOrder(id)
            wx.showToast({ title: '已取消', icon: 'success' })
            this.loadOrders(this.data.currentTab)
          } catch (err) {
            console.error('取消订单失败', err)
          }
        }
      }
    })
  },

  async confirmPickup(e) {
    const id = e.currentTarget.dataset.id
    wx.showModal({
      title: '提示',
      content: '确认已完成取货？',
      success: async (res) => {
        if (res.confirm) {
          try {
            const result = await wx.$request.completeReservationOrder(id)
            wx.showToast({ title: '取货成功', icon: 'success' })

            if (result.data && result.data.upgraded) {
              wx.showModal({
                title: '恭喜升级！',
                content: `您已升级为${result.data.newLevelName}！`,
                showCancel: false
              })
            }

            this.loadOrders(this.data.currentTab)
          } catch (err) {
            console.error('确认取货失败', err)
          }
        }
      }
    })
  },

  reorder() {
    wx.switchTab({
      url: '/pages/product/list/list'
    })
  },

  goToHome() {
    wx.switchTab({
      url: '/pages/index/index'
    })
  }
})