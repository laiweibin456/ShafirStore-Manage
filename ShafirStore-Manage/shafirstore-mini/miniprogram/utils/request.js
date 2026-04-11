// utils/request.js - API请求封装
// 对接现有莎菲尔菓子门店管理系统后端API

const BASE_URL = 'http://localhost:8080/api'

function getToken() {
  return wx.getStorageSync('token') || ''
}

function request(options) {
  return new Promise(function(resolve, reject) {
    var token = getToken()

    var url = BASE_URL + options.url
    if (options.params) {
      var query = Object.entries(options.params)
        .filter(function(entry) {
          var v = entry[1]
          return v !== undefined && v !== ''
        })
        .map(function(entry) {
          return entry[0] + '=' + entry[1]
        })
        .join('&')
      if (query) url += '?' + query
    }

    wx.showLoading({ title: '加载中...' })

    wx.request({
      url: url,
      method: options.method || 'GET',
      data: options.data,
      header: {
        'Content-Type': 'application/json',
        'Authorization': token ? 'Bearer ' + token : ''
      },
      success: function(res) {
        wx.hideLoading()

        if (res.statusCode === 200) {
          var data = res.data

          if (data.code === 200) {
            resolve(data)
          } else if (data.code === 401) {
            wx.removeStorageSync('token')
            wx.removeStorageSync('userInfo')
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
        wx.hideLoading()
        wx.showToast({ title: '网络错误', icon: 'none' })
        reject(err)
      }
    })
  })
}

// 小程序用户注册
function miniRegister(data) {
  return request({
    url: '/mini/register',
    method: 'POST',
    data: data
  })
}

// 小程序用户登录
function miniLogin(data) {
  return request({
    url: '/mini/login',
    method: 'POST',
    data: data
  })
}

// 获取小程序用户信息
function getMiniUserInfo() {
  return request({ url: '/mini/user-info' })
}

// 更新小程序用户信息
function updateMiniUserInfo(data) {
  return request({
    url: '/mini/update',
    method: 'PUT',
    data: data
  })
}

// 创建预约订单
function createReservationOrder(data) {
  return request({
    url: '/reservation-order/create',
    method: 'POST',
    data: data
  })
}

// 获取预约订单列表
function getReservationOrderList(params) {
  return request({
    url: '/reservation-order/list',
    params: params
  })
}

// 获取预约订单详情
function getReservationOrderDetail(id) {
  return request({ url: '/reservation-order/' + id })
}

// 完成预约订单取货
function completeReservationOrder(id) {
  return request({
    url: '/reservation-order/' + id + '/complete',
    method: 'PUT'
  })
}

// 取消预约订单
function cancelReservationOrder(id) {
  return request({
    url: '/reservation-order/' + id + '/cancel',
    method: 'PUT'
  })
}

// 获取商品列表
function getProductList(params) {
  return request({ url: '/products', params: params })
}

// 获取商品详情
function getProductById(id) {
  return request({ url: '/products/' + id })
}

// 获取订单列表
function getOrderList(params) {
  return request({ url: '/orders', params: params })
}

// 获取订单详情
function getOrderDetail(id) {
  return request({ url: '/orders/' + id })
}

// 取消订单
function cancelOrder(id) {
  return request({ url: '/orders/' + id + '/cancel', method: 'PUT' })
}

// 导出请求模块
module.exports = {
  miniRegister: miniRegister,
  miniLogin: miniLogin,
  getMiniUserInfo: getMiniUserInfo,
  updateMiniUserInfo: updateMiniUserInfo,
  createReservationOrder: createReservationOrder,
  getReservationOrderList: getReservationOrderList,
  getReservationOrderDetail: getReservationOrderDetail,
  completeReservationOrder: completeReservationOrder,
  cancelReservationOrder: cancelReservationOrder,
  getProductList: getProductList,
  getProductById: getProductById,
  getOrderList: getOrderList,
  getOrderDetail: getOrderDetail,
  cancelOrder: cancelOrder
}