var BASE_URL = 'http://localhost:8080/api'

function getToken() {
  return wx.getStorageSync('token') || ''
}

function getStoreId() {
  return wx.getStorageSync('currentStoreId') || ''
}

function request(options) {
  return new Promise(function(resolve, reject) {
    var token = getToken()
    var storeId = getStoreId()
    var url = BASE_URL + options.url

    if (options.params) {
      var query = Object.entries(options.params)
        .filter(function(entry) { return entry[1] !== undefined && entry[1] !== '' })
        .map(function(entry) { return entry[0] + '=' + entry[1] })
        .join('&')
      if (query) url += '?' + query
    }

    var header = {
      'Content-Type': 'application/json'
    }
    if (token) {
      header['Authorization'] = 'Bearer ' + token
    }
    if (storeId) {
      header['X-Store-Id'] = storeId
    }

    wx.request({
      url: url,
      method: options.method || 'GET',
      data: options.data,
      header: header,
      timeout: 30000,
      success: function(res) {
        if (res.statusCode === 200) {
          var data = res.data
          if (data.code === 200) {
            resolve(data)
          } else if (data.code === 401) {
            wx.removeStorageSync('token')
            wx.showToast({ title: '请先登录', icon: 'none' })
            reject(data)
          } else {
            wx.showToast({ title: data.message || '请求失败', icon: 'none' })
            reject(data)
          }
        } else {
          wx.showToast({ title: '网络请求失败', icon: 'none' })
          reject(res)
        }
      },
      fail: function(err) {
        wx.showToast({ title: '网络错误', icon: 'none' })
        reject(err)
      }
    })
  })
}

module.exports = {
  miniRegister: function(data) { return request({ url: '/mini/register', method: 'POST', data: data }) },
  miniLogin: function(data) { return request({ url: '/mini/login', method: 'POST', data: data }) },
  getMiniUserInfo: function() { return request({ url: '/mini/user-info' }) },
  updateMiniUserInfo: function(data) { return request({ url: '/mini/update', method: 'PUT', data: data }) },
  createReservationOrder: function(data) { return request({ url: '/reservation-order/create', method: 'POST', data: data }) },
  getReservationOrderList: function(params) { return request({ url: '/reservation-order/list', params: params }) },
  getReservationOrderDetail: function(id) { return request({ url: '/reservation-order/' + id }) },
  completeReservationOrder: function(id) { return request({ url: '/reservation-order/' + id + '/complete', method: 'PUT' }) },
  cancelReservationOrder: function(id) { return request({ url: '/reservation-order/' + id + '/cancel', method: 'PUT' }) },
  getProductList: function(params) { return request({ url: '/products', params: params }) },
  getProductById: function(id) { return request({ url: '/products/' + id }) },
  getProductCategories: function() { return request({ url: '/categories' }) },
  getOrderList: function(params) { return request({ url: '/orders', params: params }) },
  getOrderDetail: function(id) { return request({ url: '/orders/' + id }) },
  cancelOrder: function(id) { return request({ url: '/orders/' + id + '/cancel', method: 'PUT' }) },
  getAllStores: function() { return request({ url: '/stores/all' }) },
  getStoreDetail: function(id) { return request({ url: '/stores/' + id }) }
}
