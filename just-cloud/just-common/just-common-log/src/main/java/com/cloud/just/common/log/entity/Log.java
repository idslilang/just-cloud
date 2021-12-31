package com.cloud.just.common.log.entity;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.time.LocalDateTime;

/**
 * 日志表
 */
@Data
public class Log {

	private static final long serialVersionUID = 1L;

	/**
	 * 创建者
	 */
	private String createBy;

	/**
	 * 创建时间
	 */
	private LocalDateTime createTime;

	/**
	 * 更新者
	 */
	private String updateBy;

	/**
	 * 更新时间
	 */
	private LocalDateTime updateTime;
	/**
	 * 编号
	 */
	@JsonSerialize(using = ToStringSerializer.class)
	private Long id;

	/**
	 * 日志类型
	 */
	private String type;

	/**
	 * 日志标题
	 */
	private String title;

	/**
	 * 操作IP地址
	 */
	private String remoteAddr;

	/**
	 * 用户浏览器
	 */
	private String userAgent;

	/**
	 * 请求URI
	 */
	private String requestUri;

	/**
	 * 操作方式
	 */
	private String method;

	/**
	 * 操作提交的数据
	 */
	private String params;

	/**
	 * 执行时间
	 */
	private Long time;

	/**
	 * 异常信息
	 */
	private String exception;

	/**
	 * 服务ID
	 */
	private String serviceId;

	/**
	 * 删除标记
	 */
	private String delFlag;

}
