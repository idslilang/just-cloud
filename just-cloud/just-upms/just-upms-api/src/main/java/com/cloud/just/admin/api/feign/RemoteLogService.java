package com.cloud.just.admin.api.feign;

import com.cloud.just.admin.api.entity.SysLog;
import com.cloud.just.admin.api.feign.factory.RemoteLogServiceFallbackFactory;
import com.cloud.just.common.core.constant.SecurityConstants;
import com.cloud.just.common.core.constant.ServiceNameConstants;
import com.cloud.just.common.core.util.R;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;



@FeignClient(contextId = "remoteLogService", value = ServiceNameConstants.UMPS_SERVICE,
		fallbackFactory = RemoteLogServiceFallbackFactory.class)
public interface RemoteLogService {

	/**
	 * 保存日志
	 * @param sysLog 日志实体
	 * @param from 内部调用标志
	 * @return succes、false
	 */
	@PostMapping("/log")
	R<Boolean> saveLog(@RequestBody SysLog sysLog, @RequestHeader(SecurityConstants.FROM) String from);

}
