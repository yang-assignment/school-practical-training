package com.ruoyi.asset.controller;

import java.util.List;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiImplicitParam;
import com.ruoyi.asset.domain.AssetIt;
import com.ruoyi.asset.service.IAssetItService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * IT设备Controller
 * 
 * @author yepanpan
 * @date 2021-09-07
 */
@Api("IT设备管理")
@RestController
@RequestMapping("/asset/it")
public class AssetItController extends BaseController
{
    @Autowired
    private IAssetItService assetItService;

    /**
     * 查询IT设备列表
     */
    @ApiOperation("查询IT设备列表")   
    @PreAuthorize("@ss.hasPermi('asset:it:list')")
    @GetMapping("/list")
    public TableDataInfo list(AssetIt assetIt)
    {
        startPage();
        List<AssetIt> list = assetItService.selectAssetItList(assetIt);
        return getDataTable(list);
    }

    /**
     * 导出IT设备列表
     */
    @ApiOperation("导出IT设备列表")    
    @PreAuthorize("@ss.hasPermi('asset:it:export')")
    @Log(title = "IT设备", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(AssetIt assetIt)
    {
        List<AssetIt> list = assetItService.selectAssetItList(assetIt);
        ExcelUtil<AssetIt> util = new ExcelUtil<AssetIt>(AssetIt.class);
        return util.exportExcel(list, "it");
    }

    /**
     * 获取IT设备详细信息
     */
    @ApiOperation("获取IT设备详细信息")
    @ApiImplicitParam(name = "id", value = "IT设备ID", required = true, dataType = "int", paramType = "path") 
    @PreAuthorize("@ss.hasPermi('asset:it:query')")
    @GetMapping(value = "/{assetId}")
    public AjaxResult getInfo(@PathVariable("assetId") Long assetId)
    {
        return AjaxResult.success(assetItService.selectAssetItById(assetId));
    }

    /**
     * 新增IT设备
     */
    @ApiOperation("新增IT设备")
    @PreAuthorize("@ss.hasPermi('asset:it:add')")
    @Log(title = "IT设备", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AssetIt assetIt)
    {
        return toAjax(assetItService.insertAssetIt(assetIt));
    }

    /**
     * 修改IT设备
     */
    @ApiOperation("修改IT设备")  
    @PreAuthorize("@ss.hasPermi('asset:it:edit')")
    @Log(title = "IT设备", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AssetIt assetIt)
    {
        return toAjax(assetItService.updateAssetIt(assetIt));
    }

    /**
     * 删除IT设备
     */
    @ApiOperation("删除IT设备")
    @ApiImplicitParam(name = "id", value = "IT设备ID", required = true, dataType = "int", paramType = "path") 
    @PreAuthorize("@ss.hasPermi('asset:it:remove')")
    @Log(title = "IT设备", businessType = BusinessType.DELETE)
	@DeleteMapping("/{assetIds}")
    public AjaxResult remove(@PathVariable Long[] assetIds)
    {
        return toAjax(assetItService.deleteAssetItByIds(assetIds));
    }
}
