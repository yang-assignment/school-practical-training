import request from '@/utils/request'

// 查询传输日志列表
export function listLog(query) {
  return request({
    url: '/xdata/log/list',
    method: 'get',
    params: query
  })
}

// 查询传输日志详细
export function getLog(id) {
  return request({
    url: '/xdata/log/' + id,
    method: 'get'
  })
}

// 新增传输日志
export function addLog(data) {
  return request({
    url: '/xdata/log',
    method: 'post',
    data: data
  })
}

// 修改传输日志
export function updateLog(data) {
  return request({
    url: '/xdata/log',
    method: 'put',
    data: data
  })
}

// 删除传输日志
export function delLog(id) {
  return request({
    url: '/xdata/log/' + id,
    method: 'delete'
  })
}

// 导出传输日志
export function exportLog(query) {
  return request({
    url: '/xdata/log/export',
    method: 'get',
    params: query
  })
}