// pages/product/list/list.js
Page({

  data: {
    currentCategory: 0,
    scrollTop: 0,
    cartCount: 0,
    couponCount: 1,

    categories: [
      { id: 1, name: '热销' },
      { id: 2, name: '法式甜点' },
      { id: 3, name: '欧式面包' },
      { id: 4, name: '生日蛋糕' },
      { id: 5, name: '常温蛋糕' },
      { id: 6, name: '饮品' },
      { id: 7, name: '马卡龙' },
      { id: 8, name: '餐具加购' },
      { id: 9, name: '简餐系列' },
      { id: 10, name: '4寸生日蛋糕' }
    ],

    products: []
  },

  allProducts: {
    0: [
      { id: 101, name: '巧克力脆珠包', price: 13, unit: '份', stock: 1, hasSpecs: false, isHot: false },
      { id: 102, name: '全麦吐司', price: 15, unit: '份起', stock: 3, hasSpecs: true, isHot: true },
      { id: 103, name: '黑糖吐司', price: 19, unit: '份起', stock: 1, hasSpecs: true, isHot: false },
      { id: 104, name: '压扁可颂（小）', price: 11, unit: '份', stock: 1, hasSpecs: false, isHot: false }
    ],
    1: [
      { id: 201, name: '法式马卡龙', price: 28, unit: '盒', stock: 5, hasSpecs: false, isHot: true },
      { id: 202, name: '拿破仑酥', price: 35, unit: '份', stock: 2, hasSpecs: false, isHot: false }
    ],
    2: [
      { id: 301, name: '牛角包', price: 12, unit: '个', stock: 8, hasSpecs: false, isHot: false },
      { id: 302, name: '法棍面包', price: 18, unit: '条', stock: 6, hasSpecs: false, isHot: true }
    ],
    3: [
      { id: 401, name: '草莓奶油蛋糕', price: 168, unit: '个', stock: 3, hasSpecs: true, isHot: true },
      { id: 402, name: '巧克力慕斯蛋糕', price: 188, unit: '个', stock: 2, hasSpecs: true, isHot: false }
    ],
    4: [
      { id: 501, name: '提拉米苏', price: 32, unit: '份', stock: 4, hasSpecs: false, isHot: true },
      { id: 502, name: '芝士蛋糕', price: 28, unit: '份', stock: 5, hasSpecs: false, isHot: false }
    ],
    5: [
      { id: 601, name: '拿铁咖啡', price: 22, unit: '杯', stock: 10, hasSpecs: false, isHot: false },
      { id: 602, name: '鲜榨果汁', price: 18, unit: '杯', stock: 8, hasSpecs: false, isHot: false }
    ],
    6: [
      { id: 701, name: '经典马卡龙礼盒', price: 68, unit: '盒', stock: 4, hasSpecs: false, isHot: true }
    ],
    7: [
      { id: 801, name: '精美餐具套装', price: 15, unit: '套', stock: 20, hasSpecs: false, isHot: false }
    ],
    8: [
      { id: 901, name: '三明治套餐', price: 25, unit: '份', stock: 6, hasSpecs: false, isHot: false }
    ],
    9: [
      { id: 1001, name: '迷你4寸蛋糕', price: 88, unit: '个', stock: 3, hasSpecs: true, isHot: true }
    ]
  },

  onLoad(options) {
    const mode = options.mode || '';
    this.setData({ mode });
    this.loadProducts(0);
  },

  onShow() {
    this.updateCartInfo();
  },

  loadProducts(categoryIndex) {
    const products = this.allProducts[categoryIndex] || [];
    this.setData({
      products: products,
      scrollTop: 0
    });
  },

  switchCategory(e) {
    const index = e.currentTarget.dataset.index;
    if (index === this.data.currentCategory) return;

    this.setData({ currentCategory: index });
    this.loadProducts(index);
  },

  addToCart(e) {
    const productId = e.currentTarget.dataset.id;
    const product = this.data.products.find(p => p.id === productId);

    if (product) {
      wx.showToast({
        title: `已添加 ${product.name}`,
        icon: 'success',
        duration: 1000
      });

      let cart = wx.getStorageSync('cart') || [];
      const existItem = cart.find(item => item.id === productId);

      if (existItem) {
        existItem.quantity += 1;
      } else {
        cart.push({
          ...product,
          quantity: 1
        });
      }

      wx.setStorageSync('cart', cart);
      this.updateCartInfo();
    }
  },

  showSpecs(e) {
    const productId = e.currentTarget.dataset.id;
    const product = this.data.products.find(p => p.id === productId);

    if (product) {
      wx.showModal({
        title: product.name,
        content: '请选择规格后添加到购物车',
        confirmText: '选择规格',
        success: (res) => {
          if (res.confirm) {
            wx.navigateTo({
              url: `/pages/product/detail/detail?id=${productId}`
            });
          }
        }
      });
    }
  },

  updateCartInfo() {
    const cart = wx.getStorageSync('cart') || [];
    const cartCount = cart.reduce((sum, item) => sum + item.quantity, 0);
    this.setData({ cartCount });
  },

  showCart() {
    if (this.data.cartCount > 0) {
      wx.navigateTo({
        url: '/pages/cart/cart'
      });
    } else {
      wx.showToast({
        title: '购物车为空',
        icon: 'none'
      });
    }
  },

  goToCheckout() {
    if (this.data.cartCount > 0) {
      wx.navigateTo({
        url: '/pages/order/create/create'
      });
    } else {
      wx.showToast({
        title: '请先选购商品',
        icon: 'none'
      });
    }
  }
})
