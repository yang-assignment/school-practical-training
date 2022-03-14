package com.ruoyi.asset.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import lombok.Data;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import com.ruoyi.common.core.domain.BaseEntity;
import com.ruoyi.common.core.domain.entity.SysUser;

/**
 * IT设备对象 asset_it
 * 
 * @author yepanpan
 * @date 2021-09-07
 */

@ApiModel("IT设备实体")
@Data
public class AssetIt extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 资产ID */
    @ApiModelProperty("${comment}")
    private Long assetId;
    private AssetInfo asset;

    /** 是否在线 */
    @Excel(name = "是否在线")
    @ApiModelProperty("是否在线")
    private String isOnline;

    /** IP地址 */
    @Excel(name = "IP地址")
    @ApiModelProperty("IP地址")
    private String ip;

    /** MAC地址 */
    @Excel(name = "MAC地址")
    @ApiModelProperty("MAC地址")
    private String mac;

    /** 网关 */
    @Excel(name = "网关")
    @ApiModelProperty("网关")
    private String gateway;

    /** 最后在线时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "最后在线时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty("最后在线时间")
    private Date lastTime;

    private SysUser user;

}
