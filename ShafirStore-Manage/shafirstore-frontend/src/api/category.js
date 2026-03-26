import request from './request'

export function getCategoryTree() {
  return request({
    url: '/categories/tree',
    method: 'get'
  })
}

export function getAllCategories() {
  return request({
    url: '/categories',
    method: 'get'
  })
}

export function getCategoryById(id) {
  return request({
    url: `/categories/${id}`,
    method: 'get'
  })
}

export function getCategoryChildren(id) {
  return request({
    url: `/categories/${id}/children`,
    method: 'get'
  })
}

export function addCategory(data) {
  return request({
    url: '/categories',
    method: 'post',
    data
  })
}

export function updateCategory(id, data) {
  return request({
    url: `/categories/${id}`,
    method: 'put',
    data
  })
}

export function deleteCategory(id) {
  return request({
    url: `/categories/${id}`,
    method: 'delete'
  })
}