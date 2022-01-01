package com.cloud.just.minapp.controller;

import com.cloud.just.admin.api.feign.RemoteTokenService;
import com.cloud.just.common.core.util.R;
import com.cloud.just.sa.annotation.Inner;
import io.swagger.annotations.Api;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * @description:
 * @author: lilang
 * @version:
 * @modified By:1170370113@qq.com
 */

@RestController
@RequiredArgsConstructor
@RequestMapping("/user")
@Api(value = "user", tags = "用户管理模块")
@Slf4j
public class UserAdminController {

	@Autowired
	RemoteTokenService remoteTokenService;

	@GetMapping("/hello")
	@Inner
	public R getById(@RequestParam Integer id) {
		Map hashMap = new HashMap<String, String>();
		remoteTokenService.getTokenPage(hashMap,null);
		return R.ok("hello minapp world!");
	}




}
