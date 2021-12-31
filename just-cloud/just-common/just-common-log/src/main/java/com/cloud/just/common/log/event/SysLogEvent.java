package com.cloud.just.common.log.event;

import com.cloud.just.common.log.entity.Log;
import org.springframework.context.ApplicationEvent;

/**
 * 系统日志事件
 */
public class SysLogEvent extends ApplicationEvent {

	public SysLogEvent(Log source) {
		super(source);
	}

}
