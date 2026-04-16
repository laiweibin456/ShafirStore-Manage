import request from './request'

export function getMyStores() {
  return request({
    url: '/stores/my',
    method: 'get'
  })
}

export function getAllStores() {
  return request({
    url: '/stores/all',
    method: 'get'
  })
}

export function getStoreList(params) {
  return request({
    url: '/stores',
    method: 'get',
    params
  })
}

export function createStore(data) {
  return request({
    url: '/stores',
    method: 'post',
    data
  })
}

export function updateStore(id, data) {
  return request({
    url: `/stores/${id}`,
    method: 'put',
    data
  })
}

export function updateStoreStatus(id, status) {
  return request({
    url: `/stores/${id}/status`,
    method: 'put',
    params: { status }
  })
}

export function deleteStore(id) {
  return request({
    url: `/stores/${id}`,
    method: 'delete'
  })
}

export function switchStore(storeId) {
  return request({
    url: '/auth/switch-store',
    method: 'post',
    data: { storeId }
  })
}
