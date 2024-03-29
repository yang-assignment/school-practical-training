package com.assets.service.impl;

import java.beans.IntrospectionException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartFile;

import com.assets.dao.DeviceMapper;
import com.assets.model.Device;
import com.assets.model.Deviceout;
import com.assets.model.Devicetype;
import com.assets.model.ExcelBean;
import com.assets.model.Organ;
import com.assets.service.DeviceService;
import com.assets.tool.ExcelUtil;
import com.assets.tool.Utils;
@Service("DeviceService")
public class DeviceServiceImpl implements DeviceService{
	@Resource
	private DeviceMapper mapper;

	@Override
	public void save(Device role) {
		// TODO Auto-generated method stub
		mapper.save(role);
	}

	@Override
	public boolean update(Device role) {
		// TODO Auto-generated method stub
		return mapper.update(role);
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return mapper.delete(id);
	}

	@Override
	public Device findById(int id) {
		return mapper.findById(id);
	}

	@Override
	public List<Device> findAll(int oid) {
		return mapper.findAll(oid);
	}

	@Override
	public List<Device> select_brand(Device role) {
		// TODO Auto-generated method stub
		return mapper.select_core(role);
	}
	@Transactional(rollbackFor = Exception.class)
	@Override
	public boolean batchDelete(String[] ids) {
		try{
			for (String id : ids){
	    		mapper.delete(Integer.valueOf(id));
	    	}
			return true;
        }catch(Exception e){
             e.printStackTrace();
             TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();//手动回滚事务
             return false;
        }
	}

	@Override
	public List<Organ> getOrgan() {
		// TODO Auto-generated method stub
		return mapper.findOrganALL();
	}

	@Override
	public List<Devicetype> getDeviceType() {
		// TODO Auto-generated method stub
		return mapper.findAllDtype();
	}
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void savaout(Deviceout deviceout) {
		try{
			mapper.savaout(deviceout);
			Device d=mapper.findById(deviceout.getDid());
			d.setStatus(2);
			mapper.update(d);
        }catch(Exception e){
             e.printStackTrace();
             TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();//手动回滚事务
        }
		
	}
	
	//导入数据
	@Transactional(rollbackFor = Exception.class)
	public boolean importExcelInfo(InputStream in, MultipartFile file, String salaryDate,int adminId,String user) {
	    List<List<Object>> listob;
		try {
			listob = ExcelUtil.getBankListByExcel(in,file.getOriginalFilename());
			List<Device> salaryList = new ArrayList<Device>();
		    //遍历listob数据，把数据放到List中
		    for (int i = 0; i < listob.size(); i++) {
		        List<Object> ob = listob.get(i);
		        Device salarymanage = new Device();
		        //设置编号
		       // salarymanage.setSerial(SerialUtil.salarySerial());
		        //通过遍历实现把每一列封装成一个model中，再把所有的model用List集合装载
		       // salarymanage.setAdminId(adminId);
		        salarymanage.setDtid(Integer.valueOf(ob.get(1).toString()));
		        salarymanage.setOid(adminId);
		        salarymanage.setCode("S"+Utils.getCurrentYear()+Utils.generateShortUuid());
		        salarymanage.setResidual(String.valueOf(ob.get(7)));
		        salarymanage.setOriginal(String.valueOf(ob.get(8)));
		        salarymanage.setStatus(1);
		        salarymanage.setProddate(String.valueOf(ob.get(10)));
		        salarymanage.setCreator(user);
		        salarymanage.setCreatetime(String.valueOf(ob.get(12)));
		        salarymanage.setBuyer(String.valueOf(ob.get(13)));
		        salarymanage.setBugdate(String.valueOf(ob.get(14)));
		        salarymanage.setSno(String.valueOf(ob.get(15)));
		        salarymanage.setCrtm(String.valueOf(ob.get(16)));
		        salarymanage.setMdtm(salaryDate);
		        salaryList.add(salarymanage);
		        System.err.println(salarymanage.toString());
		        mapper.save(salarymanage);
		    }
		    return true;
		    //批量插入
		    //
		} catch (Exception e) {
			// TODO Auto-generated catch block
			 TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();//手动回滚事务
			 return false;
		}
	    
	}
	
	
	//导出数据
	
	public XSSFWorkbook exportExcelInfo(int oid,String salaryDate) {
	    //根据条件查询数据，把数据装载到一个list中
	    List<Device> list = mapper.findAll(oid);
	    List<ExcelBean> excel=new ArrayList<>();
	    Map<Integer,List<ExcelBean>> map=new LinkedHashMap<>();
	    XSSFWorkbook xssfWorkbook=null;
	    //设置标题栏
	    excel.add(new ExcelBean("序号","did",0));
	    excel.add(new ExcelBean("设备类型","dtid",0));
	    excel.add(new ExcelBean("所属部门","oid",0));
	    excel.add(new ExcelBean("流水号","code",0));
	    excel.add(new ExcelBean("品牌","brand",0));
	    excel.add(new ExcelBean("国际编号","intlcode",0));
	    excel.add(new ExcelBean("型号","model",0));
	    excel.add(new ExcelBean("净残值","residual",0));
	    excel.add(new ExcelBean("原值","original",0));
	    excel.add(new ExcelBean("状态","status",0));
	    excel.add(new ExcelBean("生产日期","proddate",0));
	    excel.add(new ExcelBean("登记人","creator",0));
	    excel.add(new ExcelBean("登记时间","createtime",0));
	    excel.add(new ExcelBean("购买人","buyer",0));
	    excel.add(new ExcelBean("购买日期","bugdate",0));
	    excel.add(new ExcelBean("序列号","sno",0));
	    excel.add(new ExcelBean("创建时间","crtm",0));
	    excel.add(new ExcelBean("修改时间","mdtm",0));
	    map.put(0, excel);
	    String sheetName = salaryDate ;
	    //调用ExcelUtil的方法
	    try {
			xssfWorkbook = ExcelUtil.createExcelFile(Device.class, list, map, sheetName);
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IntrospectionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    return xssfWorkbook;
	}
	
}
