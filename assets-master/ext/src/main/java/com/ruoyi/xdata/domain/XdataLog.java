package com.ruoyi.xdata.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import lombok.Data;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 传输日志对象 xdata_log
 * 
 * @author yepanpan
 * @date 2021-06-05
 */

@ApiModel("传输日志实体")
@Data
public class XdataLog extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 自增长主键 */
    @ApiModelProperty("${comment}")
    private Long id;

    /** 管道 */
    @Excel(name = "管道")
    @ApiModelProperty("管道")
    private Long pipeId;
    private XdataPipe pipe;
    private XdataClient client;
    private XdataModel model;

    /** 开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "开始时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty("开始时间")
    private Date startTime;

    /** 结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "结束时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty("结束时间")
    private Date endTime;

    /** 结果 */
    @Excel(name = "结果")
    @ApiModelProperty("结果")
    private String result;

    /** 行数 */
    @Excel(name = "行数")
    @ApiModelProperty("行数")
    private Long rows;

    /** 错误说明 */
    @Excel(name = "错误说明")
    @ApiModelProperty("错误说明")
    private String error;


}
