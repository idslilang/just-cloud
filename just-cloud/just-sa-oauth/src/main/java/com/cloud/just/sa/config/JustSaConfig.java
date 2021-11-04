package com.cloud.just.sa.config;

import cn.dev33.satoken.oauth2.logic.SaOAuth2Template;
import cn.dev33.satoken.oauth2.model.AccessTokenModel;
import cn.dev33.satoken.oauth2.model.SaClientModel;
import cn.hutool.core.util.ObjectUtil;
import com.cloud.just.sa.entity.SysOauthClientDetails;
import com.cloud.just.sa.service.SysOauthClientDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @description:
 * @author: lilang
 * @version:
 * @modified By:1170370113@qq.com
 */
@Component
public class JustSaConfig extends SaOAuth2Template {

    @Autowired
	SysOauthClientDetailsService sysOauthClientDetailsService;

	// 根据 id 获取 Client 信息
	@Override
	public SaClientModel getClientModel(String clientId) {

		SysOauthClientDetails saClient = sysOauthClientDetailsService.findClientDetailsById(clientId);

		if(ObjectUtil.isNotNull(saClient)){
			return new SaClientModel()
					.setClientId(saClient.getClientId())
					.setClientSecret(saClient.getClientSecret())
					.setAllowUrl("*")
					.setContractScope(saClient.getScope());
		}
		return null;
	}


	public AccessTokenModel generateAccessToken(String code) {

		// 1、先校验
		AccessTokenModel at = super.generateAccessToken(code);

		// 6、返回 Access-Token
		return at;
	}

	// 根据ClientId 和 LoginId 获取openid
	@Override
	public String getOpenid(String clientId, Object loginId) {
		// 此为模拟数据，真实环境需要从数据库查询
		return "gr_SwoIN0MC1ewxHX_vfCW3BothWDZMMtx__";
	}

}
