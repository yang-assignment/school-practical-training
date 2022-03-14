package com.ruoyi.asset.mapper;

import java.util.List;
import com.ruoyi.asset.domain.AssetIt;

/**
 * IT设备Mapper接口
 * 
 * @author yepanpan
 * @date 2021-09-07
 */
public interface AssetItMapper 
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
     * 删除IT设备
     * 
     * @param assetId IT设备ID
     * @return 结果
     */
    public int deleteAssetItById(Long assetId);

    /**
     * 批量删除IT设备
     * 
     * @param assetIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteAssetItByIds(Long[] assetIds);
}
