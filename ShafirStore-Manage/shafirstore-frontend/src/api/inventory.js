import request from './request'

export function getInventoryList(params) {
  return request({
    url: '/inventory',
    method: 'get',
    params
  })
}

export function getInventoryByProductId(productId) {
  return request({
    url: `/inventory/product/${productId}`,
    method: 'get'
  })
}

export function stockIn(data) {
  return request({
    url: '/inventory/in',
    method: 'post',
    data
  })
}

export function stockOut(data) {
  return request({
    url: '/inventory/out',
    method: 'post',
    data
  })
}

export function adjustStock(data) {
  return request({
    url: '/inventory/adjust',
    method: 'post',
    data
  })
}

export function getInventoryRecords(params) {
  return request({
    url: '/inventory/records',
    method: 'get',
    params
  })
}

export function getLowStockAlerts() {
  return request({
    url: '/inventory/alerts',
    method: 'get'
  })
}

export function updateAlertThreshold(productId, threshold) {
  return request({
    url: `/inventory/alerts/${productId}`,
    method: 'put',
    params: { threshold }
  })
}

export function getInventoryStatistics() {
  return request({
    url: '/inventory/statistics',
    method: 'get'
  })
}
