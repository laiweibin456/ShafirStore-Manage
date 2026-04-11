// pages/order/list/list.js
Page({

  data: {
    currentTab: 0,
    tabs: ['全部', '待取货', '已完成', '已取消'],
    orders: [],
    loading: false
  },

  allOrders: [
    {
      id: 1,
      status: 1,
      statusText: '待取货',
      payAmount: 46,
      totalCount: 3,
      createTime: '2026-04-10 14:30',
      items: [
        { id: 101, name: '全麦吐司', specName: '原味/大份', price: 15, quantity: 2 },
        { id: 102, name: '巧克力脆珠包', specName: '', price: 13, quantity: 1 }
      ]
    },
    {
      id: 2,
      status: 2,
      statusText: '已完成',
      payAmount: 168,
      totalCount: 1,
      createTime: '2026-04-08 10:15',
      items: [
        { id: 201, name: '草莓奶油蛋糕', specName: '6寸/草莓味', price: 168, quantity: 1 }
      ]
    },
    {
      id: 3,
      status: 2,
      statusText: '已完成',
      payAmount: 35,
      totalCount: 2,
      createTime: '2026-04-05 16:20',
      items: [
        { id: 301, name: '拿破仑酥', specName: '', price: 35, quantity: 1 },
        { id: 302, name: '拿铁咖啡', specName: '大杯/热饮', price: 22, quantity: 1 }
      ]
    },
    {
      id: 4,
      status: 3,
      statusText: '已取消',
      payAmount: 28,
      totalCount: 1,
      createTime: '2026-04-03 09:45',
      items: [
        { id: 401, name: '法式马卡龙', specName: '混合口味', price: 28, quantity: 1 }
      ]
    }
  ],

  onLoad(options) {
    const tab = options.tab ? parseInt(options.tab) : 0;
    this.setData({ currentTab: tab });
    this.loadOrders(tab);
  },

  onShow() {
    this.loadOrders(this.data.currentTab);
  },

  loadOrders(tabIndex) {
    this.setData({ loading: true });

    let filtered = [];
    if (tabIndex === 0) {
      filtered = this.allOrders;
    } else {
      filtered = this.allOrders.filter(order => order.status === tabIndex);
    }

    this.setData({
      orders: filtered,
      loading: false
    });
  },

  switchTab(e) {
    const index = e.currentTarget.dataset.index;
    if (index === this.data.currentTab) return;

    this.setData({ currentTab: index });
    this.loadOrders(index);
  },

  goToDetail(e) {
    const id = e.currentTarget.dataset.id;
    wx.navigateTo({
      url: `/pages/order/detail/detail?id=${id}`
    });
  },

  cancelOrder(e) {
    const id = e.currentTarget.dataset.id;
    wx.showModal({
      title: '提示',
      content: '确定要取消该订单吗？',
      success: (res) => {
        if (res.confirm) {
          const order = this.allOrders.find(o => o.id === id);
          if (order) {
            order.status = 3;
            order.statusText = '已取消';
            this.loadOrders(this.data.currentTab);
            wx.showToast({ title: '已取消', icon: 'success' });
          }
        }
      }
    });
  },

  confirmPickup(e) {
    const id = e.currentTarget.dataset.id;
    const order = this.allOrders.find(o => o.id === id);
    if (order) {
      order.status = 2;
      order.statusText = '已完成';
      this.loadOrders(this.data.currentTab);
      wx.showToast({ title: '取货成功', icon: 'success' });
    }
  },

  reorder(e) {
    wx.switchTab({
      url: '/pages/product/list/list'
    });
  }
})
