package com.ruoyi.xdata.controller;

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
import com.ruoyi.xdata.domain.XdataLog;
import com.ruoyi.xdata.service.IXdataLogService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 传输日志Controller
 * 
 * @author yepanpan
 * @date 2021-06-05
 */
@Api("传输日志管理")
@RestController
@RequestMapping("/xdata/log")
public class XdataLogController extends BaseController
{
    @Autowired
    private IXdataLogService xdataLogService;

    /**
     * 查询传输日志列表
     */
    @ApiOperation("查询传输日志列表")   
    @PreAuthorize("@ss.hasPermi('xdata:log:list')")
    @GetMapping("/list")
    public TableDataInfo list(XdataLog xdataLog)
    {
        startPage();
        List<XdataLog> list = xdataLogService.selectXdataLogList(xdataLog);
        return getDataTable(list);
    }

    /**
     * 导出传输日志列表
     */
    @ApiOperation("导出传输日志列表")    
    @PreAuthorize("@ss.hasPermi('xdata:log:export')")
    @Log(title = "传输日志", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(XdataLog xdataLog)
    {
        List<XdataLog> list = xdataLogService.selectXdataLogList(xdataLog);
        ExcelUtil<XdataLog> util = new ExcelUtil<XdataLog>(XdataLog.class);
        return util.exportExcel(list, "log");
    }

    /**
     * 获取传输日志详细信息
     */
    @ApiOperation("获取传输日志详细信息")
    @ApiImplicitParam(name = "id", value = "传输日志ID", required = true, dataType = "int", paramType = "path") 
    @PreAuthorize("@ss.hasPermi('xdata:log:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(xdataLogService.selectXdataLogById(id));
    }

    /**
     * 新增传输日志
     */
    @ApiOperation("新增传输日志")
    @PreAuthorize("@ss.hasPermi('xdata:log:add')")
    @Log(title = "传输日志", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody XdataLog xdataLog)
    {
        return toAjax(xdataLogService.insertXdataLog(xdataLog));
    }

    /**
     * 修改传输日志
     */
    @ApiOperation("修改传输日志")  
    @PreAuthorize("@ss.hasPermi('xdata:log:edit')")
    @Log(title = "传输日志", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody XdataLog xdataLog)
    {
        return toAjax(xdataLogService.updateXdataLog(xdataLog));
    }

    /**
     * 删除传输日志
     */
    @ApiOperation("删除传输日志")
    @ApiImplicitParam(name = "id", value = "传输日志ID", required = true, dataType = "int", paramType = "path") 
    @PreAuthorize("@ss.hasPermi('xdata:log:remove')")
    @Log(title = "传输日志", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(xdataLogService.deleteXdataLogByIds(ids));
    }
}
