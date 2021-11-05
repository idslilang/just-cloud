package com.cloud.just.sa;

import com.cloud.just.common.feign.annotation.EnableJustFeignClients;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * @description:
 * @author: lilang
 * @version:
 * @modified By:1170370113@qq.com
 */
@EnableDiscoveryClient
@EnableJustFeignClients
@SpringBootApplication
public class JustSaOAuth2ServerApplication {
	public static void main(String[] args) {
		SpringApplication.run(JustSaOAuth2ServerApplication.class, args);
		System.out.println("\nSa-Token-OAuth Server端启动成功");
	}
}
