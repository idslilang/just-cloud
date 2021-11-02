package com.just.sa.config;

import cn.dev33.satoken.oauth2.logic.SaOAuth2Template;
import cn.dev33.satoken.oauth2.model.SaClientModel;
import org.springframework.stereotype.Component;

/**
 * @description:
 * @author: lilang
 * @version:
 * @modified By:1170370113@qq.com
 */
@Component
public class JustSaConfig extends SaOAuth2Template {

	// 根据 id 获取 Client 信息
	@Override
	public SaClientModel getClientModel(String clientId) {
		// 此为模拟数据，真实环境需要从数据库查询
		if("1001".equals(clientId)) {
			return new SaClientModel()
					.setClientId("10001")
					.setClientSecret("aaaa-bbbb-cccc-dddd-eeee")
					.setAllowUrl("*")
					.setContractScope("userinfo");
		}
		return null;
	}

	// 根据ClientId 和 LoginId 获取openid
	@Override
	public String getOpenid(String clientId, Object loginId) {
		// 此为模拟数据，真实环境需要从数据库查询
		return "gr_SwoIN0MC1ewxHX_vfCW3BothWDZMMtx__";
	}

}
