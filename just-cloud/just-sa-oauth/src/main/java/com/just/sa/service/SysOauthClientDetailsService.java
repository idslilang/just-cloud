package com.just.sa.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.just.sa.entity.SysOauthClientDetails;


/**
 * 客户端操作
 */
public interface SysOauthClientDetailsService extends IService<SysOauthClientDetails> {

	/**
	 * 通过ID删除客户端
	 * @param id
	 * @return
	 */
	Boolean removeClientDetailsById(String id);

	/**
	 * 根据客户端信息
	 * @param sysOauthClientDetails
	 * @return
	 */
	Boolean updateClientDetailsById(SysOauthClientDetails sysOauthClientDetails);



	SysOauthClientDetails findClientDetailsById(String id);

}
