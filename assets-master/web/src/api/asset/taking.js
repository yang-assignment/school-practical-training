import request from '@/utils/request'

// 查询资产盘点列表
export function listTaking(query) {
  return request({
    url: '/asset/taking/list',
    method: 'get',
    params: query
  })
}

// 查询资产盘点详细
export function getTaking(id) {
  return request({
    url: '/asset/taking/' + id,
    method: 'get'
  })
}

// 新增资产盘点
export function addTaking(data) {
  return request({
    url: '/asset/taking',
    method: 'post',
    data: data
  })
}

// 修改资产盘点
export function updateTaking(data) {
  return request({
    url: '/asset/taking',
    method: 'put',
    data: data
  })
}

// 删除资产盘点
export function delTaking(id) {
  return request({
    url: '/asset/taking/' + id,
    method: 'delete'
  })
}

// 导出资产盘点
export function exportTaking(query) {
  return request({
    url: '/asset/taking/export',
    method: 'get',
    params: query
  })
}