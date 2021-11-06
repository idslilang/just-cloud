package com.cloud.just.common.core.util;

import cn.hutool.core.util.StrUtil;
import com.cloud.just.common.core.constant.SecurityConstants;

import java.util.ArrayList;
import java.util.List;

public class ResourceUtils {


	public static  List<Integer>  getRoleIds(List<String> roles) {
		List<Integer> roleIds = new ArrayList<>();
		roles.stream().forEach(data -> {
					String id = StrUtil.removePrefix(data, SecurityConstants.ROLE);
					roleIds.add(Integer.parseInt(id));
				});
		return roleIds;
	}
}
