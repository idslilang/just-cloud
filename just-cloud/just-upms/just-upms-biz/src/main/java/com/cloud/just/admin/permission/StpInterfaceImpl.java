package com.cloud.just.admin.permission;

import cn.dev33.satoken.stp.StpInterface;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.cloud.just.admin.api.dto.SaUserInfo;
import com.cloud.just.admin.api.dto.UserInfo;
import com.cloud.just.admin.api.entity.SysUser;
import com.cloud.just.admin.service.SysUserService;
import com.cloud.just.common.core.constant.CacheConstants;
import com.cloud.just.common.core.constant.SecurityConstants;
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
	private SysUserService userService;


	@Autowired
	CacheManager cacheManager;


	public SaUserInfo loadUserByUsername(String username) {
		Cache cache = cacheManager.getCache(CacheConstants.USER_DETAILS);
		if (cache != null && cache.get(username) != null) {
			return (SaUserInfo) cache.get(username).get();
		}

		SysUser user = userService.getOne(Wrappers.<SysUser>query().lambda().eq(SysUser::getUsername, username));
		if (user != null) {
			return getUserDetails(userService.getUserInfo(user));
		}

		return null;
	}


	private SaUserInfo getUserDetails(UserInfo userInfo) {
		if (userInfo == null) {
			return null;
		}

		SaUserInfo saUserInfo = new SaUserInfo();

		List<String> roles = new ArrayList<>();
		List<String> permissions = new ArrayList<>();

		if (ArrayUtil.isNotEmpty(userInfo.getRoles())) {
			// 获取角色
			Arrays.stream(userInfo.getRoles()).forEach(role -> roles.add(SecurityConstants.ROLE + role));
			saUserInfo.setRoles(roles);
		}

		if (ArrayUtil.isNotEmpty(userInfo.getPermissions())) {
			// 获取资源
			Arrays.stream(userInfo.getPermissions()).forEach(permission -> permissions.add(SecurityConstants.ROLE + permission));
			saUserInfo.setPermissions(permissions);

		}
		return saUserInfo;
	}

	@Override
	public List<String> getPermissionList(Object loginId, String loginType) {

		SaUserInfo userInfo = loadUserByUsername(String.valueOf(loginId));
		if (!ObjectUtil.isEmpty(userInfo)) {
			return userInfo.getPermissions();
		}
		return null;
	}

	@Override
	public List<String> getRoleList(Object loginId, String loginType) {
		SaUserInfo userInfo = loadUserByUsername(String.valueOf(loginId));

		if (!ObjectUtil.isEmpty(userInfo)) {
			return userInfo.getRoles();
		}
		return null;
	}

}
