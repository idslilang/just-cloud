/*
 *    Copyright (c) 2018-2025, lengleng All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 * Neither the name of the pig4cloud.com developer nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 * Author: lengleng (wangiegie@gmail.com)
 */

package com.cloud.just.common.sentinel.handle;

import com.alibaba.csp.sentinel.Tracer;
import com.cloud.just.common.core.util.R;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpStatus;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.*;

import java.nio.file.AccessDeniedException;
import java.util.List;

/**
 * 全局异常处理，当引入sentinel时候，这里的全局异常一定要排在最高优先级，覆盖其他类的全局异常
 */
@Slf4j
@RestController
@RestControllerAdvice
@ConditionalOnProperty(name = {"feign.sentinel.global.exception"},havingValue = "true")
@Order(Ordered.HIGHEST_PRECEDENCE)
public class GlobalBizExceptionHandler {

	/**
	 * 全局异常.
	 * @param e the e
	 * @return R
	 */
	@ExceptionHandler(Exception.class)
	@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
	public R handleGlobalException(Exception e) {
		log.error("全局异常信息 ex={}", e.getMessage(), e);
		// 业务异常交由 sentinel 记录
		Tracer.trace(e);
		return R.failed(e.getLocalizedMessage());
	}

	/**
	 * AccessDeniedException
	 * @param e the e
	 * @return R
	 */
	@ExceptionHandler(AccessDeniedException.class)
	@ResponseStatus(HttpStatus.FORBIDDEN)
	public R handleAccessDeniedException(AccessDeniedException e) {
		log.error("拒绝授权异常信息 ex={}", e.getMessage());
		return R.failed("权限不足，不允许访问");
	}

	/**
	 * validation Exception
	 * @param exception
	 * @return R
	 */
	@ExceptionHandler({ MethodArgumentNotValidException.class })
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	public R handleBodyValidException(MethodArgumentNotValidException exception) {
		List<FieldError> fieldErrors = exception.getBindingResult().getFieldErrors();
		log.warn("参数绑定异常,ex = {}", fieldErrors.get(0).getDefaultMessage());
		return R.failed(fieldErrors.get(0).getDefaultMessage());
	}

	/**
	 * 避免 404 重定向到 /error 导致NPE ,ignore-url 需要配置对应端点
	 * @return R
	 */
	@DeleteMapping("/error")
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public R noHandlerFoundException() {
		return R.failed(HttpStatus.NOT_FOUND.getReasonPhrase());
	}

}
