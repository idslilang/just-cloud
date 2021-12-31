package com.cloud.just.common.log.event;

import com.cloud.just.common.log.entity.Log;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.event.EventListener;
import org.springframework.core.annotation.Order;
import org.springframework.scheduling.annotation.Async;


/**
 *异步监听日志事件
 */
@Slf4j
@RequiredArgsConstructor
public class SysLogListener {

	Logger logger = LoggerFactory.getLogger(SysLogListener.class);

	@Async
	@Order
	@EventListener(SysLogEvent.class)
	public void saveSysLog(SysLogEvent event) {
		Log sysLog = (Log) event.getSource();
		logger.info("syslog----> {}",sysLog);
	}

}
