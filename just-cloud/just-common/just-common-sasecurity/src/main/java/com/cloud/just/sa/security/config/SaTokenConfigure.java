package com.cloud.just.sa.security.config;

import cn.dev33.satoken.context.SaHolder;
import cn.dev33.satoken.filter.SaServletFilter;
import cn.dev33.satoken.id.SaIdUtil;
import cn.dev33.satoken.stp.StpUtil;
import cn.dev33.satoken.util.SaResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * Sa-Token 权限认证 配置类
 */
@Configuration
public class SaTokenConfigure implements WebMvcConfigurer {

	@Autowired
	private PermitAllUrlProperties permitAllUrl;


	@Bean
	public SaServletFilter getSaServletFilter() {
		return new SaServletFilter()
				.addInclude("/**")
				.addExclude(permitAllUrl.getUrls().toArray(new String[permitAllUrl.getUrls().size()]))
				.setAuth(obj -> {
					// 校验 Id-Token 身份凭证     —— 以下两句代码可简化为：SaIdUtil.checkCurrentRequestToken();
					String token = SaHolder.getRequest().getHeader(SaIdUtil.ID_TOKEN);
					SaIdUtil.checkToken(token);
					StpUtil.checkLogin();
				})
				.setError(e -> {
					return SaResult.error(e.getMessage());
				})
				;
	}


}
