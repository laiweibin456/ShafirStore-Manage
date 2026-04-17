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

export function getReservationList(params) {
  return request({
    url: '/reservation-order/admin/list',
    method: 'get',
    params
  })
}

export function getReservationDetail(id) {
  return request({
    url: `/reservation-order/admin/${id}`,
    method: 'get'
  })
}

export function confirmReservationPayment(id, payType) {
  return request({
    url: `/reservation-order/admin/${id}/confirm-payment`,
    method: 'put',
    params: { payType }
  })
}

export function cancelReservation(id) {
  return request({
    url: `/reservation-order/admin/${id}/cancel`,
    method: 'put'
  })
}