package com.ruoyi.sys.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageHelper;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.entity.SysDept;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.system.domain.SysNotice;
import com.ruoyi.system.service.ISysDeptService;
import com.ruoyi.system.service.ISysNoticeService;
import com.ruoyi.system.service.ISysUserService;

import io.swagger.annotations.Api;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 公开信息Controller
 * 
 * @author yepanpan
 * @date 2021-02-25
 */
@Api("公开接口")
@RestController
@RequestMapping("/sys/public")
public class SysPublicController extends BaseController
{
    @Autowired
    private ISysUserService userService;
    @Autowired
    private ISysDeptService deptService;
    @Autowired
    private ISysNoticeService noticeService;
    
    /**
     * 获取用户基本信息列表
     */
    @GetMapping("/user")
    public TableDataInfo list(SysUser user)
    {
        List<SysUser> list = userService.selectUser(user);
        return getDataTable(list);
    }
    
    /**
     * 获取部门基本信息列表
     */
    @GetMapping("/dept")
    public TableDataInfo dept(SysDept dept)
    {
        List<SysDept> list = deptService.selectDeptList(dept);
        return getDataTable(list);
    }

    /**
     * 获取最新公告列表
     */
    @GetMapping("/notice")
    public TableDataInfo notice()
    {
    	PageHelper.startPage(1, 5, "notice_id desc");
        List<SysNotice> list = noticeService.selectNoticeList(null);
        return getDataTable(list);
    }
}
