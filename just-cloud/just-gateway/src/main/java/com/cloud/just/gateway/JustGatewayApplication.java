package com.cloud.just.gateway;

import com.cloud.just.common.swagger.annotation.EnableJustSwagger2;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * 网关应用
 */
@EnableJustSwagger2
@EnableDiscoveryClient
@SpringBootApplication
public class JustGatewayApplication {

	public static void main(String[] args) {
		SpringApplication.run(JustGatewayApplication.class, args);
	}

}
