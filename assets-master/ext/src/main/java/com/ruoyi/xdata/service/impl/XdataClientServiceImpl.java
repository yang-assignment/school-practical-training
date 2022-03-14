package com.ruoyi.xdata.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.xdata.mapper.XdataClientMapper;
import com.github.pagehelper.PageInfo;
import com.ruoyi.common.exception.CustomException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.sign.Md5Utils;
import com.ruoyi.common.utils.uuid.UUID;
import com.ruoyi.task.DbUtil;
import com.ruoyi.xdata.domain.XdataClient;
import com.ruoyi.xdata.service.IXdataClientService;

/**
 * 应用Service业务层处理
 * 
 * @author yepanpan
 * @date 2020-12-29
 */
@Service
public class XdataClientServiceImpl implements IXdataClientService 
{
    @Autowired
    private XdataClientMapper xdataClientMapper;

    /**
     * 查询应用
     * 
     * @param id 应用ID
     * @return 应用
     */
    @Override
    public XdataClient selectXdataClientById(Long id)
    {
        return xdataClientMapper.selectXdataClientById(id);
    }

    /**
     * 查询应用列表
     * 
     * @param xdataClient 应用
     * @return 应用
     */
    @Override
    public List<XdataClient> selectXdataClientList(XdataClient xdataClient)
    {
        return xdataClientMapper.selectXdataClientList(xdataClient);
    }

    /**
     * 新增应用
     * 
     * @param xdataClient 应用
     * @return 结果
     */
    @Override
    public int insertXdataClient(XdataClient xdataClient)
    {
    	if(StringUtils.isBlank(xdataClient.getCode())) {
    		xdataClient.setCode(Md5Utils.hash(UUID.fastUUID().toString()));
    	}
    	if(StringUtils.isBlank(xdataClient.getSecret())) {
    		xdataClient.setSecret(Md5Utils.hash(UUID.fastUUID().toString()));
    	}
        return xdataClientMapper.insertXdataClient(xdataClient);
    }

    /**
     * 修改应用
     * 
     * @param xdataClient 应用
     * @return 结果
     */
    @Override
    public int updateXdataClient(XdataClient xdataClient)
    {
        return xdataClientMapper.updateXdataClient(xdataClient);
    }

    /**
     * 批量删除应用
     * 
     * @param ids 需要删除的应用ID
     * @return 结果
     */
    @Override
    public int deleteXdataClientByIds(Long[] ids)
    {
        return xdataClientMapper.deleteXdataClientByIds(ids);
    }

    /**
     * 删除应用信息
     * 
     * @param id 应用ID
     * @return 结果
     */
    @Override
    public int deleteXdataClientById(Long id)
    {
        return xdataClientMapper.deleteXdataClientById(id);
    }
    

    /**
     * 查询数据库表
     * 
     * @param id 应用ID
     * @return 表集合
     */
    @Override
    public List<Map> selectTableList(Long id){
    	XdataClient client = xdataClientMapper.selectXdataClientById(id);
    	if(client == null) return null;
    	
    	Connection conn = DbUtil.getConnection(client);
    	DbUtil db = new DbUtil(conn);
    	String sql = "select table_name name from information_schema.TABLES where table_schema= DATABASE()";;
    	if("2".equals(client.getDbType())){
    		sql = "select TABLE_NAME name from all_tables;";
    	}else if("3".equals(client.getDbType())){
    		sql = "SELECT name FROM SysObjects";
    	}else if("4".equals(client.getDbType())) {
    		sql = "select tablename name from pg_tables where schemaname = 'public';";
    	}
    	try {
			return db.query(sql);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
    }
    
    /**
     * 查询数据库指定表的数据
     * 
     * @param id 应用ID
     * @param table 表名
     * @return 应用集合
     */
    @Override
    public PageInfo<Map> selectTableData(XdataClient xdataClient){
    	if(!xdataClient.getParams().containsKey("table")) {
    		throw new CustomException("必须选择数据表");
    	}
    	
    	XdataClient client = xdataClientMapper.selectXdataClientById(xdataClient.getId());
    	if(client == null) {
    		throw new CustomException("非法请求");
    	}
    	
    	String table = xdataClient.getParams().get("table").toString();
    	int rows = Integer.valueOf(xdataClient.getParams().get("rows").toString());
    	int offset = Integer.valueOf(xdataClient.getParams().get("offset").toString());
    	
    	Connection conn = DbUtil.getConnection(client);
    	DbUtil db = new DbUtil(conn);
    	String sql = " FROM "+ table + " WHERE 1";
    	if(StringUtils.isNotEmpty(xdataClient.getSearchValue())) {
    		sql += " AND " + xdataClient.getSearchValue(); 
    	}
    	String count = "SELECT COUNT(*) total " + sql;
    	String query = "";
    	if("1".equals(client.getDbType())){ //oracle
    		query = "SELECT * " + sql + " LIMIT "+offset + ","+rows;
    	}else if("2".equals(client.getDbType())){ //oracle
    		query = "SELECT * FROM (SELECT ROWNUM rowno, * "+sql +" AND ROWNUM <= "+(offset+rows)+") t WHERE rowno >= "+offset;
    	}else if("3".equals(client.getDbType())){ //sqlserver
    		query = "SELECT * FROM ( SELECT ROW_NUMBER() over(order by (select 0)) AS rowno, * FROM "+ sql +" AND rowno <= "+(offset+rows)+") t WHERE rowno >= "+offset;
    	}else if("4".equals(client.getDbType())){ //pg
    		query = "SELECT * " + sql + " LIMIT " + rows + " OFFSET " + offset;
    	}
    	try {
    		PageInfo<Map> page = new PageInfo<>();
    		page.setList(db.query(query));
    		page.setTotal(Long.valueOf(db.query(count).get(0).get("total").toString()));
			return page;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
    }
}
