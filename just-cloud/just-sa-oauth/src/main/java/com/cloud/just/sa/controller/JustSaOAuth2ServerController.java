package com.cloud.just.sa.controller;

import cn.dev33.satoken.context.SaHolder;
import cn.dev33.satoken.oauth2.config.SaOAuth2Config;
import cn.dev33.satoken.oauth2.logic.SaOAuth2Handle;
import cn.dev33.satoken.stp.StpUtil;
import cn.dev33.satoken.util.SaResult;
import com.cloud.just.sa.config.JustSaConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @description:
 * @author: lilang
 * @version:
 * @modified By:1170370113@qq.com
 */
@RestController
public class JustSaOAuth2ServerController {

	@Autowired
	JustSaConfig justSaConfig;

	// 处理所有OAuth相关请求
	@RequestMapping("/oauth2/*")
	public Object request() {
		System.out.println("------- 进入请求: " + SaHolder.getRequest().getUrl());
		return SaOAuth2Handle.serverRequest();
	}

	// Sa-OAuth2 定制化配置
	@Autowired
	public void setSaOAuth2Config(SaOAuth2Config cfg) {
		cfg.setNotLoginView(() -> {
			String msg = "当前会话在SSO-Server端尚未登录，请先访问"
					+ "<a href='/oauth2/doLogin?name=sa&pwd=123456' target='_blank'> doLogin登录 </a>"
					+ "进行登录之后，刷新页面开始授权";
			return msg;
		}).setDoLoginHandle((name, pwd) -> {
			if ("sa".equals(name) ) {
				StpUtil.login(10001);
				return SaResult.ok();
			}
			return SaResult.error("账号名或密码错误");
		}).setConfirmView((clientId, scope) -> {
			String msg = "<p>应用 " + clientId + " 请求授权：" + scope + "</p>"
					+ "<p>请确认：<a href='/oauth2/doConfirm?client_id=" + clientId + "&scope=" + scope + "' target='_blank'> 确认授权 </a></p>"
					+ "<p>确认之后刷新页面</p>";
			return msg;
		})
		;
	}

	// 全局异常拦截
	@ExceptionHandler
	public SaResult handlerException(Exception e) {
		e.printStackTrace();
		return SaResult.error(e.getMessage());
	}
}
