package com.cloud.just.sa.security.service;

import cn.dev33.satoken.stp.StpInterface;
import cn.hutool.core.util.ArrayUtil;
import com.cloud.just.admin.api.dto.SaUserInfo;
import com.cloud.just.admin.api.dto.UserInfo;
import com.cloud.just.admin.api.feign.RemoteUserService;
import com.cloud.just.common.core.constant.CacheConstants;
import com.cloud.just.common.core.constant.SecurityConstants;
import com.cloud.just.common.core.util.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * 自定义权限验证接口扩展
 */
@Component
public class StpInterfaceImpl implements StpInterface {

    @Autowired
	RemoteUserService remoteUserService;

    @Autowired
    CacheManager cacheManager;


	public SaUserInfo loadUserByUsername(String username) {
		Cache cache = cacheManager.getCache(CacheConstants.USER_DETAILS);
		if (cache != null && cache.get(username) != null) {
			return (SaUserInfo) cache.get(username).get();
		}
		R<UserInfo> result = remoteUserService.info(username, SecurityConstants.FROM_IN);
		SaUserInfo userInfo = getUserDetails(result);
		if (cache != null) {
			cache.put(username, userInfo);
		}
		return userInfo;
	}



	private SaUserInfo getUserDetails(R<UserInfo> result) {
		if (result == null || result.getData() == null) {
			return null;
		}

		UserInfo info = result.getData();
		SaUserInfo saUserInfo = new SaUserInfo();

		List<String> roles = new ArrayList<>();
		List<String> permissions = new ArrayList<>();

		if (ArrayUtil.isNotEmpty(info.getRoles())) {
			// 获取角色
			Arrays.stream(info.getRoles()).forEach(role -> roles.add(SecurityConstants.ROLE + role));
			saUserInfo.setRoles(roles);
		}

		if (ArrayUtil.isNotEmpty(info.getPermissions())) {
			// 获取资源
			Arrays.stream(info.getPermissions()).forEach(permission -> permissions.add(SecurityConstants.ROLE + permission));
			saUserInfo.setPermissions(permissions);

		}
		return saUserInfo;
	}

	@Override
	public List<String> getPermissionList(Object loginId, String loginType) {

		SaUserInfo userInfo = loadUserByUsername(String.valueOf(loginId));
		return userInfo.getPermissions();
	}

	@Override
	public List<String> getRoleList(Object loginId, String loginType) {
		SaUserInfo userInfo = loadUserByUsername(String.valueOf(loginId));
		return userInfo.getRoles();
	}

}
