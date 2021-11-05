package com.cloud.just.sa.security.config;

import cn.dev33.satoken.filter.SaServletFilter;
import cn.dev33.satoken.interceptor.SaRouteInterceptor;
import cn.dev33.satoken.oauth2.logic.SaOAuth2Util;
import cn.dev33.satoken.router.SaRouter;
import cn.dev33.satoken.stp.StpLogic;
import cn.dev33.satoken.stp.StpUtil;
import cn.dev33.satoken.util.SaResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.annotation.security.PermitAll;

/**
 * Sa-Token 权限认证 配置类
 */
@Configuration
public class SaTokenConfigure implements WebMvcConfigurer {

//	@Autowired
//	private PermitAllUrlProperties permitAllUrl;


	@Bean
	public SaServletFilter getSaServletFilter() {
		return new SaServletFilter()
				.addInclude("/**")
				.addExclude("/favicon.ico")
				.setAuth(obj -> {
					System.out.println("hhhahh");
				})
				.setError(e -> {
					return SaResult.error(e.getMessage());
				})
				;
	}


	private void checkOauth() {
		SaOAuth2Util.checkAccessToken(StpUtil.getTokenValue());
	}

	private void chekPermissons() {

	}

	private void checkRoles() {

	}

}
