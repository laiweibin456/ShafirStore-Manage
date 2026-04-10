// utils/request.ts - API请求封装
// 对接现有莎菲尔菓子门店管理系统后端API

const BASE_URL = 'http://localhost:8080/api'

interface RequestOptions {
  url: string
  method?: 'GET' | 'POST' | 'PUT' | 'DELETE'
  data?: any
}

interface ResponseData<T = any> {
  code: number
  message: string
  data: T
  timestamp: number
}

function getToken(): string {
  return wx.getStorageSync('token') || ''
}

function request<T = any>(options: RequestOptions): Promise<ResponseData<T>> {
  return new Promise((resolve, reject) => {
    const token = getToken()

    wx.showLoading({ title: '加载中...' })

    wx.request({
      url: BASE_URL + options.url,
      method: options.method || 'GET',
      data: options.data,
      header: {
        'Content-Type': 'application/json',
        'Authorization': token ? `Bearer ${token}` : ''
      },
      success: (res) => {
        wx.hideLoading()

        if (res.statusCode === 200) {
          const data = res.data as ResponseData<T>

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
      fail: (err) => {
        wx.hideLoading()
        wx.showToast({ title: '网络错误', icon: 'none' })
        reject(err)
      }
    })
  })
}

// 首页数据
export async function getHomeData(): Promise<ResponseData> {
  // TODO: 后端需要新增 /api/index/home 接口
  // 临时返回模拟数据
  return Promise.resolve({
    code: 200,
    message: 'success',
    data: {
      banners: [
        { id: 1, image: 'https://img.yzcdn.cn/vant/cat.jpeg' },
        { id: 2, image: 'https://img.yzcdn.cn/vant/cat.jpeg' }
      ],
      categories: [
        { id: 1, name: '蛋糕', icon: '🎂' },
        { id: 2, name: '面包', icon: '🍞' },
        { id: 3, name: '饼干', icon: '🍪' },
        { id: 4, name: '饮品', icon: '🥤' }
      ],
      hotProducts: [
        { id: 1, name: '草莓奶油蛋糕', price: 168, imageUrl: 'https://img.yzcdn.cn/vant/cat.jpeg' },
        { id: 2, name: '提拉米苏', price: 88, imageUrl: 'https://img.yzcdn.cn/vant/cat.jpeg' }
      ],
      newProducts: [
        { id: 3, name: '原味吐司', price: 12, imageUrl: 'https://img.yzcdn.cn/vant/cat.jpeg' }
      ]
    },
    timestamp: Date.now()
  })
}

// 获取商品列表 - 对接 ProductController
export async function getProductList(params: {
  pageNum?: number
  pageSize?: number
  name?: string
  categoryId?: number
  status?: number
}): Promise<ResponseData> {
  const query = Object.entries(params)
    .filter(([_, v]) => v !== undefined && v !== '')
    .map(([k, v]) => `${k}=${v}`)
    .join('&')
  return request({ url: `/products${query ? '?' + query : ''}` })
}

// 获取商品详情 - 对接 ProductController
export async function getProductById(id: number): Promise<ResponseData> {
  return request({ url: `/products/${id}` })
}

// 获取会员信息 - 对接 MemberController
export async function getMemberInfo(): Promise<ResponseData> {
  const userInfo = wx.getStorageSync('userInfo')
  if (!userInfo?.memberId) {
    return Promise.reject({ code: 401, message: '请先登录' })
  }
  return request({ url: `/members/${userInfo.memberId}` })
}

// 获取会员列表
export async function getMemberList(params: any): Promise<ResponseData> {
  const query = Object.entries(params)
    .filter(([_, v]) => v !== undefined && v !== '')
    .map(([k, v]) => `${k}=${v}`)
    .join('&')
  return request({ url: `/members${query ? '?' + query : ''}` })
}

// 微信登录 - 后端需要新增接口
export async function login(params: {
  code: string
  nickName?: string
  avatarUrl?: string
}): Promise<ResponseData> {
  // TODO: 后端需要新增 /api/auth/wechat-login 接口
  // 临时模拟登录
  return Promise.resolve({
    code: 200,
    message: 'success',
    data: {
      token: 'mock_token_' + Date.now(),
      memberId: 1
    },
    timestamp: Date.now()
  })
}

// 创建订单 - 对接 OrderController
export async function createOrder(data: {
  productIds: number[]
  quantities: number[]
  memberId?: number
  payType: number
  remark?: string
}): Promise<ResponseData> {
  return request({
    url: '/orders',
    method: 'POST',
    data
  })
}

// 获取订单列表 - 对接 OrderController
export async function getOrderList(params: {
  pageNum?: number
  pageSize?: number
  orderNo?: string
  status?: number
}): Promise<ResponseData> {
  const query = Object.entries(params)
    .filter(([_, v]) => v !== undefined && v !== '')
    .map(([k, v]) => `${k}=${v}`)
    .join('&')
  return request({ url: `/orders${query ? '?' + query : ''}` })
}

// 获取订单详情 - 对接 OrderController
export async function getOrderDetail(id: number): Promise<ResponseData> {
  return request({ url: `/orders/${id}` })
}

// 取消订单 - 对接 OrderController
export async function cancelOrder(id: number): Promise<ResponseData> {
  return request({ url: `/orders/${id}/cancel`, method: 'PUT' })
}

// 微信登录获取code
export function wxLogin(): Promise<string> {
  return new Promise((resolve, reject) => {
    wx.login({
      success: (res) => {
        if (res.code) {
          resolve(res.code)
        } else {
          reject(new Error('获取code失败'))
        }
      },
      fail: reject
    })
  })
}

// 获取手机号
export function getPhoneNumber(e: any): Promise<string> {
  return new Promise((resolve, reject) => {
    if (e.detail.errMsg === 'getPhoneNumber:ok') {
      resolve(e.detail.code)
    } else {
      reject(new Error('获取手机号失败'))
    }
  })
}
