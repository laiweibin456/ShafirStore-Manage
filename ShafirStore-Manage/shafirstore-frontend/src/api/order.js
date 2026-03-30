import request from './request'

export function createOrder(data) {
  return request({
    url: '/orders',
    method: 'post',
    data
  })
}

export function getOrderList(params) {
  return request({
    url: '/orders',
    method: 'get',
    params
  })
}

export function getOrderDetail(id) {
  return request({
    url: `/orders/${id}`,
    method: 'get'
  })
}

export function cancelOrder(id) {
  return request({
    url: `/orders/${id}/cancel`,
    method: 'put'
  })
}

export function refundOrder(id, reason) {
  return request({
    url: `/orders/${id}/refund`,
    method: 'put',
    data: { reason }
  })
}

export function getTodayOrderCount() {
  return request({
    url: '/orders/today/count',
    method: 'get'
  })
}

export function getTodaySalesAmount() {
  return request({
    url: '/orders/today/sales',
    method: 'get'
  })
}