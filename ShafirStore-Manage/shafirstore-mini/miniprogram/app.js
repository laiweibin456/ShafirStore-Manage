// app.js
var request = require('./utils/request.js')

App({
  globalData: {
    baseUrl: 'http://localhost:8080/api',
    token: ''
  },
  onLaunch: function() {
    wx.$request = request

    var token = wx.getStorageSync('token')
    if (token) {
      this.globalData.token = token
    }
  }
})