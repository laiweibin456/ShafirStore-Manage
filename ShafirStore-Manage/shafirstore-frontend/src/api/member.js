import request from './request'

export function getMemberList(params) {
  return request({
    url: '/members',
    method: 'get',
    params
  })
}

export function getMemberById(id) {
  return request({
    url: `/members/${id}`,
    method: 'get'
  })
}

export function getMemberByPhone(phone) {
  return request({
    url: `/members/phone/${phone}`,
    method: 'get'
  })
}

export function getAllMembers() {
  return request({
    url: '/members/all',
    method: 'get'
  })
}

export function addMember(data) {
  return request({
    url: '/members',
    method: 'post',
    data
  })
}

export function updateMember(data) {
  return request({
    url: '/members',
    method: 'put',
    data
  })
}

export function updateMemberStatus(id, status) {
  return request({
    url: `/members/${id}/status`,
    method: 'put',
    params: { status }
  })
}

export function deleteMember(id) {
  return request({
    url: `/members/${id}`,
    method: 'delete'
  })
}

export function updatePoints(data) {
  return request({
    url: '/members/points',
    method: 'post',
    data
  })
}

export function getMemberCount() {
  return request({
    url: '/members/count',
    method: 'get'
  })
}

export function getTopMembers(limit) {
  return request({
    url: '/members/top',
    method: 'get',
    params: { limit }
  })
}