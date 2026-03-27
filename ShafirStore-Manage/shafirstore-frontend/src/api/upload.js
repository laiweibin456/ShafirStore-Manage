import request from './request'

export function uploadImage(file) {
  const formData = new FormData()
  formData.append('file', file)

  return request({
    url: '/upload/image',
    method: 'post',
    data: formData,
    headers: {
      'Content-Type': 'multipart/form-data'
    }
  })
}

export function deleteImage(imageUrl) {
  return request({
    url: '/upload/image',
    method: 'delete',
    params: { imageUrl }
  })
}