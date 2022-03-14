package com.ruoyi.xdata.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.xdata.mapper.XdataLogMapper;
import com.ruoyi.xdata.domain.XdataLog;
import com.ruoyi.xdata.service.IXdataLogService;

/**
 * 传输日志Service业务层处理
 * 
 * @author yepanpan
 * @date 2021-06-05
 */
@Service
public class XdataLogServiceImpl implements IXdataLogService 
{
    @Autowired
    private XdataLogMapper xdataLogMapper;

    /**
     * 查询传输日志
     * 
     * @param id 传输日志ID
     * @return 传输日志
     */
    @Override
    public XdataLog selectXdataLogById(Long id)
    {
        return xdataLogMapper.selectXdataLogById(id);
    }

    /**
     * 查询传输日志列表
     * 
     * @param xdataLog 传输日志
     * @return 传输日志
     */
    @Override
    public List<XdataLog> selectXdataLogList(XdataLog xdataLog)
    {
        return xdataLogMapper.selectXdataLogList(xdataLog);
    }

    /**
     * 新增传输日志
     * 
     * @param xdataLog 传输日志
     * @return 结果
     */
    @Override
    public int insertXdataLog(XdataLog xdataLog)
    {
        return xdataLogMapper.insertXdataLog(xdataLog);
    }

    /**
     * 修改传输日志
     * 
     * @param xdataLog 传输日志
     * @return 结果
     */
    @Override
    public int updateXdataLog(XdataLog xdataLog)
    {
        return xdataLogMapper.updateXdataLog(xdataLog);
    }

    /**
     * 批量删除传输日志
     * 
     * @param ids 需要删除的传输日志ID
     * @return 结果
     */
    @Override
    public int deleteXdataLogByIds(Long[] ids)
    {
        return xdataLogMapper.deleteXdataLogByIds(ids);
    }

    /**
     * 删除传输日志信息
     * 
     * @param id 传输日志ID
     * @return 结果
     */
    @Override
    public int deleteXdataLogById(Long id)
    {
        return xdataLogMapper.deleteXdataLogById(id);
    }
}
