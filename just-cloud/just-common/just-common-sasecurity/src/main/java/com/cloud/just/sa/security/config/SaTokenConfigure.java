package com.cloud.just.sa.security.config;

import cn.dev33.satoken.interceptor.SaRouteInterceptor;
import cn.dev33.satoken.oauth2.logic.SaOAuth2Util;
import cn.dev33.satoken.router.SaRouter;
import cn.dev33.satoken.stp.StpLogic;
import cn.dev33.satoken.stp.StpUtil;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * Sa-Token 权限认证 配置类
 */
@Configuration
public class SaTokenConfigure implements WebMvcConfigurer {

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// 注册路由拦截器，自定义认证规则
		registry.addInterceptor(new SaRouteInterceptor((req, res, handler)->{
			// 根据路由划分模块，不同模块不同鉴权
			SaOAuth2Util.checkAccessToken(StpUtil.getTokenValue());
			SaRouter.match("/user/**", r -> StpUtil.checkPermission("user"));
			SaRouter.match("/admin/**", r -> StpUtil.checkPermission("admin"));
			SaRouter.match("/goods/**", r -> StpUtil.checkPermission("goods"));
			SaRouter.match("/orders/**", r -> StpUtil.checkPermission("orders"));
			SaRouter.match("/notice/**", r -> StpUtil.checkPermission("notice"));
			SaRouter.match("/comment/**", r -> StpUtil.checkPermission("comment"));
		})).addPathPatterns("/**");
	}

}
