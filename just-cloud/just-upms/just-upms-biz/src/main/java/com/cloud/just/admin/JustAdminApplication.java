package com.cloud.just.admin;

import com.cloud.just.common.swagger.annotation.EnableJustSwagger2;
import com.cloud.just.sa.annotation.EnableJustResourceServer;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

@EnableJustSwagger2
@EnableJustResourceServer
@EnableDiscoveryClient
@SpringBootApplication(scanBasePackages  = {"com.cloud.just"})
@EnableFeignClients
public class JustAdminApplication {

	public static void main(String[] args) {
		SpringApplication.run(JustAdminApplication.class, args);
	}

}
