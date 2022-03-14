package com.ruoyi.task;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.xdata.domain.XdataLog;
import com.ruoyi.xdata.domain.XdataPipe;
import com.ruoyi.xdata.mapper.XdataClientMapper;
import com.ruoyi.xdata.mapper.XdataLogMapper;
import com.ruoyi.xdata.mapper.XdataPipeMapper;

/**
 * 数据同步的定时任务
 * @author Administrator
 *
 */
@Component("xdata")
public class XDataJob {
	@Autowired	 
    private DataSource dataSource; 
	@Autowired	 
	private XdataPipeMapper xdataPipeMapper;
	@Autowired	 
	private XdataLogMapper xdataLogMapper;
	@Autowired	 
	private XdataClientMapper xdataClientMapper;
	private boolean runing = false;
	
	/**
	 * 定时任务入口
	 */
	@Scheduled(cron = "0 0/3 * * * ?")
	public void sync() {
		if(runing) {
			System.out.println("正在执行中，本次任务将忽略...");
			return;
		}
		this.runing = true;
		List<XdataPipe> list = xdataPipeMapper.selectJobs();
		for(XdataPipe p : list) {
			int count = trans(p);

			if(count > 0) {
				p.setLastResult(0l + count);
				p.setLastTime(new Date());
				xdataPipeMapper.updateXdataPipe(p);
			}				
		}
		this.runing = false;
	}
	
	/**
	 * 自定义任务入口
	 */
	public void run(int id) {
		XdataPipe pipe = xdataPipeMapper.selectXdataPipeById(0l + id);
		if(pipe != null) {
			trans(pipe);
		}else {
			System.err.println("管道不存在!");
		}
	}
	
	public int trans(XdataPipe pipe) {
		Connection con1 = DbUtil.getConnection(xdataClientMapper.selectXdataClientById(pipe.getClientId()));
		if(con1 == null) {
			System.err.println("连接目标数据库失败!");
			return -1;
		}
		
		XdataLog log = new XdataLog();
		log.setPipeId(pipe.getId());
		log.setStartTime(new Date());
		int count = 0;
		Connection con2 = null;
		try {			
			con2 = dataSource.getConnection();
			DbUtil db1 = new DbUtil(con1);
			DbUtil db2 = new DbUtil(con2);
			con1.setAutoCommit(false);
			con2.setAutoCommit(false);
			if("r".equals(pipe.getMode())) {
				count = trans(pipe, db2, db1);
			}else {
				count =trans(pipe, db1, db2);
			}
			con1.commit();
			con2.commit();
			db1.stop();
			db2.stop();
			con1.close();
			con1 = null;
			con2.close();
			con2 = null;
			
			log.setResult("1");
			log.setRows(count + 0l);
		}catch (SQLException e) {
			log.setResult("0");
			log.setRows(0l);
			log.setError(e.getMessage());
			e.printStackTrace();
		}finally {
			try {
				if(con1 != null) con1.close();
				if(con2 != null) con2.close();
			}catch (Exception e) {
				log.setError(log.getError()+e.getMessage());
			}
			log.setEndTime(new Date());
			xdataLogMapper.insertXdataLog(log);			
		}
		
		return count;
	}
	
	public int trans(XdataPipe pipe, DbUtil read, DbUtil write) throws SQLException{
		int page = 0;
		int rows = 1000;
		int count = 0;
		while(true) {
			String sql = pipe.getReadSql().replaceAll("#\\{_offset\\}", (page * rows) +"");
			sql = sql.replaceAll("#\\{_rows\\}", rows +"");
			Date dt = pipe.getLastTime();
			if(dt == null) {
				dt = new Date();
				dt.setTime(0l);
			}
			sql = sql.replaceAll("#\\{_last\\}", "'"+DateUtils.parseDateToStr(DateUtils.YYYY_MM_DD_HH_MM_SS, dt)+"'");
			List<Map> list = read.query(sql);
			if(list == null || list.size() == 0) {
				break;
			}
			for(Map data : list) {
				if(write.find(pipe.getExistSql(), data) == null) {
					write.exec(pipe.getInsertSql(), data);
				}else {
					write.exec(pipe.getUpdateSql(), data);
				}
				count ++;
			}		
			if(pipe.getReadSql().indexOf("#{_rows}") > 0 && list.size() == rows) {//有分页且读满所有行，说明可能还有数据
				page ++;
			}else {//不分页直接退出
				break;
			}	
		}
		return count;
	}
}
