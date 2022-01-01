package com.cloud.just.sa.security;

import cn.dev33.satoken.context.SaHolder;
import cn.dev33.satoken.id.SaIdUtil;
import cn.dev33.satoken.interceptor.SaRouteInterceptor;
import cn.dev33.satoken.router.SaRouter;
import cn.dev33.satoken.stp.StpUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * Sa-Token 权限认证 配置类
 */
@Configuration
@Slf4j
public class SaTokenConfigure implements WebMvcConfigurer {



	@Autowired
	private PermitAllUrlProperties permitAllUrl;


	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// 注册路由拦截器，自定义认证规则
		registry.addInterceptor(new SaRouteInterceptor((req, res, handler)->{
			// 校验 Id-Token 身份凭证     —— 以下两句代码可简化为：SaIdUtil.checkCurrentRequestToken();
			String token = SaHolder.getRequest().getHeader(SaIdUtil.ID_TOKEN);
			SaIdUtil.checkToken(token);
			//** 去除需要过滤的url 不能在excludePathPatterns 排除 ，会出现循环依赖
			for (String url :permitAllUrl.getUrls()){
				if(SaRouter.match(url).isHit()){
					// 命中规则结束
					return ;
				}
			}
			StpUtil.checkLogin();
		})).addPathPatterns("/**");
	}




}
