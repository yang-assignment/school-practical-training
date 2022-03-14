package com.ruoyi.asset.service.impl;

import java.util.Date;
import java.util.List;

import com.ruoyi.common.exception.CustomException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.service.ISysConfigService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ruoyi.asset.mapper.AssetCategoryMapper;
import com.ruoyi.asset.mapper.AssetEnteringMapper;
import com.ruoyi.asset.mapper.AssetInfoMapper;
import com.ruoyi.asset.mapper.AssetMaterialMapper;
import com.ruoyi.asset.mapper.AssetPurchaseMapper;
import com.ruoyi.asset.domain.AssetCategory;
import com.ruoyi.asset.domain.AssetEntering;
import com.ruoyi.asset.domain.AssetInfo;
import com.ruoyi.asset.domain.AssetMaterial;
import com.ruoyi.asset.domain.AssetPurchase;
import com.ruoyi.asset.service.IAssetEnteringService;

/**
 * 入库管理Service业务层处理
 * 
 * @author yepanpan
 * @date 2021-03-05
 */
@Service
public class AssetEnteringServiceImpl implements IAssetEnteringService 
{
    @Autowired
    private AssetEnteringMapper assetEnteringMapper;
    @Autowired
    private AssetInfoMapper assetInfoMapper;
    @Autowired
    private AssetMaterialMapper assetMaterialMapper;
    @Autowired
    private AssetCategoryMapper assetCategoryMapper;
    @Autowired
    private AssetPurchaseMapper assetPurchaseMapper;
    @Autowired
    private ISysConfigService sysConfigService;


    /**
     * 查询入库管理
     * 
     * @param id 入库管理ID
     * @return 入库管理
     */
    @Override
    public AssetEntering selectAssetEnteringById(Long id)
    {
        return assetEnteringMapper.selectAssetEnteringById(id);
    }

    /**
     * 查询入库管理列表
     * 
     * @param assetEntering 入库管理
     * @return 入库管理
     */
    @Override
    public List<AssetEntering> selectAssetEnteringList(AssetEntering assetEntering)
    {
        return assetEnteringMapper.selectAssetEnteringList(assetEntering);
    }

    /**
     * 新增入库管理
     * 
     * @param assetEntering 入库管理
     * @return 结果
     */
    @Override
    @Transactional
    public int insertAssetEntering(AssetEntering assetEntering)
    {
    	int count = 0;
    	if(assetEntering.getAmount().floatValue() <=0) {
    		throw new CustomException("入库数量必须大于0");
    	}
    	AssetPurchase purchase = assetPurchaseMapper.selectAssetPurchaseById(assetEntering.getPurchaseId());
    	Float entered = assetEnteringMapper.selectEnteringTotal(assetEntering.getPurchaseId());
    	float total = (entered == null ? 0 : entered.floatValue()) + assetEntering.getAmount().floatValue();
    	if(total > purchase.getAmount().floatValue()) {
    		throw new CustomException("入库数量不能大于采购数量");
    	}
    	
    	AssetCategory cate = assetCategoryMapper.selectAssetCategoryById(assetEntering.getCateId());
    	if("1".equals(cate.getType())) {//固定资产入库
    		/*
    		if(StringUtils.isEmpty(assetEntering.getNums())) {
    			throw new CustomException("固定资产必须设置编号");
    		}
    		*/
    		String nums[] = null;
    		if(StringUtils.isNotEmpty(assetEntering.getNums())) {
    			nums = assetEntering.getNums().split("\n");
    		}
    		int amount = assetEntering.getAmount().intValue();
    		/*
    		if(nums.length < amount) {
    			throw new CustomException("编号数目与入库数量不一致");
    		}
    		*/
			Date d = new Date();

	    	String num = sysConfigService.selectConfigByKey("asset_num");
	    	if(StringUtils.isEmpty(num)) {
	    		num = "ZC-年-月-序号";
	    	}
		    num = num.replace("年", DateUtils.parseDateToStr("yyyy", d));
		    num = num.replace("月", DateUtils.parseDateToStr("MM", d));
		    String n = assetInfoMapper.selectMaxNum(num.substring(0, num.length() - 2));
		    int nm = 0;
		    if(n != null) {
		    	nm = Integer.parseInt(n.substring(n.length()-4));
		    }
		    nm += 1;
		    
    		AssetInfo m = new AssetInfo();
    		m.setCateId(cate.getId());
    		m.setCreateBy(SecurityUtils.getUsername());
            m.setCreateTime(DateUtils.getNowDate());
            m.setFactory(assetEntering.getFactory());
            m.setHouseId(assetEntering.getHouseId());
            m.setName(assetEntering.getName());
            m.setParam(assetEntering.getParam());
            m.setPrice(assetEntering.getPrice2());
            m.setPrice1(assetEntering.getPrice1());
            m.setPrice2(assetEntering.getPrice2());
            m.setProxy(assetEntering.getProxy());
            m.setStatus("1");
    		for(int i=0;i<amount;i++) {
    			m.setId(null);
    			if(nums != null && nums.length >= i) {
    				m.setNum(nums[i]);
    			}else {
    				m.setNum(num.replace("序号", String.format("%04d", nm)));
    				nm ++;
    			}
    			    		    
    			if(StringUtils.isEmpty(m.getNum())) {
        			throw new CustomException("编号不能为空");
        		}
    			count += assetInfoMapper.insertAssetInfo(m);
    		}
    	}else { //耗材入库
    		AssetMaterial m = new AssetMaterial();
    		m.setAmount(assetEntering.getAmount());
    		m.setCateId(cate.getId());
    		m.setCreateBy(SecurityUtils.getUsername());
            m.setCreateTime(DateUtils.getNowDate());
            m.setFactory(assetEntering.getFactory());
            m.setHouseId(assetEntering.getHouseId());
            m.setName(assetEntering.getName());
            m.setParam(assetEntering.getParam());
            m.setPrice1(assetEntering.getPrice1());
            m.setPrice2(assetEntering.getPrice2());
            m.setProxy(assetEntering.getProxy());
            m.setStatus("1");
            count += assetMaterialMapper.insertAssetMaterial(m);
    	}
    	
    	if(assetEntering.getRecvUserId() == null) assetEntering.setRecvUserId(SecurityUtils.getLoginUser().getUser().getUserId());    	
    	if(assetEntering.getRecvTime() == null) assetEntering.setRecvTime(new Date());
    	
        assetEntering.setCreateTime(DateUtils.getNowDate());
        assetEntering.setCreateBy(SecurityUtils.getUsername());
        count +=  assetEnteringMapper.insertAssetEntering(assetEntering);
        
        if(total  ==  purchase.getAmount().floatValue()) {
            //自动更新采购订单的完成状态
            count += assetPurchaseMapper.updateAssetPurchaseComplete(assetEntering.getPurchaseId());
    	}
        return count;
    }
    

    /**
     * 修改入库管理
     * 
     * @param assetEntering 入库管理
     * @return 结果
     */
    @Override
    public int updateAssetEntering(AssetEntering assetEntering)
    {
        assetEntering.setUpdateTime(DateUtils.getNowDate());
        assetEntering.setUpdateBy(SecurityUtils.getUsername());
        return assetEnteringMapper.updateAssetEntering(assetEntering);
    }

    /**
     * 批量删除入库管理
     * 
     * @param ids 需要删除的入库管理ID
     * @return 结果
     */
    @Override
    public int deleteAssetEnteringByIds(Long[] ids)
    {
        return assetEnteringMapper.deleteAssetEnteringByIds(ids);
    }

    /**
     * 删除入库管理信息
     * 
     * @param id 入库管理ID
     * @return 结果
     */
    @Override
    public int deleteAssetEnteringById(Long id)
    {
        return assetEnteringMapper.deleteAssetEnteringById(id);
    }
}
