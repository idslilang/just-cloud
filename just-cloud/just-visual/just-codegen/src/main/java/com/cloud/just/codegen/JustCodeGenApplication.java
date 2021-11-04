/*
 * Copyright (c) 2020 just4cloud Authors. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.cloud.just.codegen;

import com.cloud.just.common.datasource.annotation.EnableDynamicDataSource;
import com.cloud.just.common.feign.annotation.EnableJustFeignClients;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * @author lengleng
 * @date 2020/03/11 代码生成模块
 */
@EnableDynamicDataSource
@EnableJustFeignClients
@EnableDiscoveryClient
@SpringBootApplication
//@EnableJustResourceServer
public class JustCodeGenApplication {

	public static void main(String[] args) {
		SpringApplication.run(JustCodeGenApplication.class, args);
	}

}
