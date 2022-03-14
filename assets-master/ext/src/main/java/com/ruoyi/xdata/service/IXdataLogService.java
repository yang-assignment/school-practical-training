package com.ruoyi.xdata.service;

import java.util.List;
import com.ruoyi.xdata.domain.XdataLog;

/**
 * 传输日志Service接口
 * 
 * @author yepanpan
 * @date 2021-06-05
 */
public interface IXdataLogService 
{
    /**
     * 查询传输日志
     * 
     * @param id 传输日志ID
     * @return 传输日志
     */
    public XdataLog selectXdataLogById(Long id);

    /**
     * 查询传输日志列表
     * 
     * @param xdataLog 传输日志
     * @return 传输日志集合
     */
    public List<XdataLog> selectXdataLogList(XdataLog xdataLog);

    /**
     * 新增传输日志
     * 
     * @param xdataLog 传输日志
     * @return 结果
     */
    public int insertXdataLog(XdataLog xdataLog);

    /**
     * 修改传输日志
     * 
     * @param xdataLog 传输日志
     * @return 结果
     */
    public int updateXdataLog(XdataLog xdataLog);

    /**
     * 批量删除传输日志
     * 
     * @param ids 需要删除的传输日志ID
     * @return 结果
     */
    public int deleteXdataLogByIds(Long[] ids);

    /**
     * 删除传输日志信息
     * 
     * @param id 传输日志ID
     * @return 结果
     */
    public int deleteXdataLogById(Long id);
}
