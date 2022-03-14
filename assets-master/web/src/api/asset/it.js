import request from '@/utils/request'

// 查询IT设备列表
export function listIt(query) {
  return request({
    url: '/asset/it/list',
    method: 'get',
    params: query
  })
}

// 查询IT设备详细
export function getIt(assetId) {
  return request({
    url: '/asset/it/' + assetId,
    method: 'get'
  })
}

// 新增IT设备
export function addIt(data) {
  return request({
    url: '/asset/it',
    method: 'post',
    data: data
  })
}

// 修改IT设备
export function updateIt(data) {
  return request({
    url: '/asset/it',
    method: 'put',
    data: data
  })
}

// 删除IT设备
export function delIt(assetId) {
  return request({
    url: '/asset/it/' + assetId,
    method: 'delete'
  })
}

// 导出IT设备
export function exportIt(query) {
  return request({
    url: '/asset/it/export',
    method: 'get',
    params: query
  })
}