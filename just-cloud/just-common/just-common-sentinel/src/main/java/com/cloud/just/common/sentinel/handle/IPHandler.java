package com.cloud.just.common.sentinel.handle;

import cn.hutool.core.util.StrUtil;
import cn.hutool.extra.servlet.ServletUtil;
import com.alibaba.csp.sentinel.adapter.spring.webmvc.callback.RequestOriginParser;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;

/**
 * sentinel支持IP控制
 */
@Component
public class IPHandler implements RequestOriginParser {
	@Override
	public String parseOrigin(HttpServletRequest request) {
		// 判断header中是否有此参数

		String origin = ServletUtil.getClientIP(request);
		if (StrUtil.isBlank(origin)){
			origin = request.getHeader("origin");
			// 判断请求参数中是否有此参数
			if(StrUtil.isBlank(origin)){
				origin = request.getParameter("origin");
			}
		}

		if (StrUtil.isBlank(origin)) {
			// 或者自定义异常处理
			throw new IllegalArgumentException("请求参数不合法");
		}
		return origin;
	}
}
