import request from './request'

export function getDailySales(params) {
  return request({
    url: '/statistics/sales/daily',
    method: 'get',
    params
  })
}

export function getMonthlySales(params) {
  return request({
    url: '/statistics/sales/monthly',
    method: 'get',
    params
  })
}

export function getProductSalesRanking(params) {
  return request({
    url: '/statistics/sales/products',
    method: 'get',
    params
  })
}

export function getInventorySummary() {
  return request({
    url: '/statistics/inventory/summary',
    method: 'get'
  })
}

export function getLowStockProducts(params) {
  return request({
    url: '/statistics/inventory/low-stock',
    method: 'get',
    params
  })
}

export function getMemberSummary() {
  return request({
    url: '/statistics/member/summary',
    method: 'get'
  })
}

export function getNewMembers(params) {
  return request({
    url: '/statistics/member/new',
    method: 'get',
    params
  })
}

export function getMemberConsumeRanking(params) {
  return request({
    url: '/statistics/member/consume',
    method: 'get',
    params
  })
}

export function getOverview() {
  return request({
    url: '/statistics/overview',
    method: 'get'
  })
}