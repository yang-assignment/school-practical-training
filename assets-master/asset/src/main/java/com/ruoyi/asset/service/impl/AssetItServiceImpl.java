package com.ruoyi.asset.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.asset.mapper.AssetItMapper;
import com.ruoyi.asset.domain.AssetIt;
import com.ruoyi.asset.service.IAssetItService;

/**
 * IT设备Service业务层处理
 * 
 * @author yepanpan
 * @date 2021-09-07
 */
@Service
public class AssetItServiceImpl implements IAssetItService 
{
    @Autowired
    private AssetItMapper assetItMapper;

    /**
     * 查询IT设备
     * 
     * @param assetId IT设备ID
     * @return IT设备
     */
    @Override
    public AssetIt selectAssetItById(Long assetId)
    {
        return assetItMapper.selectAssetItById(assetId);
    }

    /**
     * 查询IT设备列表
     * 
     * @param assetIt IT设备
     * @return IT设备
     */
    @Override
    public List<AssetIt> selectAssetItList(AssetIt assetIt)
    {
        return assetItMapper.selectAssetItList(assetIt);
    }

    /**
     * 新增IT设备
     * 
     * @param assetIt IT设备
     * @return 结果
     */
    @Override
    public int insertAssetIt(AssetIt assetIt)
    {
        return assetItMapper.insertAssetIt(assetIt);
    }

    /**
     * 修改IT设备
     * 
     * @param assetIt IT设备
     * @return 结果
     */
    @Override
    public int updateAssetIt(AssetIt assetIt)
    {
        return assetItMapper.updateAssetIt(assetIt);
    }

    /**
     * 批量删除IT设备
     * 
     * @param assetIds 需要删除的IT设备ID
     * @return 结果
     */
    @Override
    public int deleteAssetItByIds(Long[] assetIds)
    {
        return assetItMapper.deleteAssetItByIds(assetIds);
    }

    /**
     * 删除IT设备信息
     * 
     * @param assetId IT设备ID
     * @return 结果
     */
    @Override
    public int deleteAssetItById(Long assetId)
    {
        return assetItMapper.deleteAssetItById(assetId);
    }
}
