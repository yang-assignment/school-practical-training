package com.ruoyi.asset.service;

import java.util.List;
import com.ruoyi.asset.domain.AssetIt;

/**
 * IT设备Service接口
 * 
 * @author yepanpan
 * @date 2021-09-07
 */
public interface IAssetItService 
{
    /**
     * 查询IT设备
     * 
     * @param assetId IT设备ID
     * @return IT设备
     */
    public AssetIt selectAssetItById(Long assetId);

    /**
     * 查询IT设备列表
     * 
     * @param assetIt IT设备
     * @return IT设备集合
     */
    public List<AssetIt> selectAssetItList(AssetIt assetIt);

    /**
     * 新增IT设备
     * 
     * @param assetIt IT设备
     * @return 结果
     */
    public int insertAssetIt(AssetIt assetIt);

    /**
     * 修改IT设备
     * 
     * @param assetIt IT设备
     * @return 结果
     */
    public int updateAssetIt(AssetIt assetIt);

    /**
     * 批量删除IT设备
     * 
     * @param assetIds 需要删除的IT设备ID
     * @return 结果
     */
    public int deleteAssetItByIds(Long[] assetIds);

    /**
     * 删除IT设备信息
     * 
     * @param assetId IT设备ID
     * @return 结果
     */
    public int deleteAssetItById(Long assetId);
}
