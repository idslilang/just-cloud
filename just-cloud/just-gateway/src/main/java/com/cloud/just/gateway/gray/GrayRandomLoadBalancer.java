package com.cloud.just.gateway.gray;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.RandomUtil;
import cn.hutool.core.util.StrUtil;
import com.alibaba.cloud.nacos.NacosServiceInstance;
import com.cloud.just.common.core.constant.CommonConstants;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.ObjectProvider;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.loadbalancer.*;
import org.springframework.cloud.loadbalancer.core.NoopServiceInstanceListSupplier;
import org.springframework.cloud.loadbalancer.core.RandomLoadBalancer;
import org.springframework.cloud.loadbalancer.core.ServiceInstanceListSupplier;
import org.springframework.http.HttpHeaders;
import reactor.core.publisher.Mono;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 重写choose 方法
 */
@Slf4j
public class GrayRandomLoadBalancer extends RandomLoadBalancer {

	private ObjectProvider<ServiceInstanceListSupplier> serviceInstanceListSupplierProvider;

	private String serviceId;

	public GrayRandomLoadBalancer(ObjectProvider<ServiceInstanceListSupplier> serviceInstanceListSupplierProvider,
								  String serviceId) {
		super(serviceInstanceListSupplierProvider, serviceId);
		this.serviceInstanceListSupplierProvider = serviceInstanceListSupplierProvider;
		this.serviceId = serviceId;
	}

	@Override
	public Mono<Response<ServiceInstance>> choose(Request request) {
		ServiceInstanceListSupplier supplier = serviceInstanceListSupplierProvider
				.getIfAvailable(NoopServiceInstanceListSupplier::new);
		return supplier.get(request).next().map(serviceInstances -> getInstanceResponse(serviceInstances, request));

	}

	Response<ServiceInstance> getInstanceResponse(List<ServiceInstance> instances, Request request) {

		// 注册中心无可用实例 抛出异常
		if (CollUtil.isEmpty(instances)) {
			log.warn("No instance available serviceId: {}", serviceId);
			return new EmptyResponse();
		}

		if (request == null || request.getContext() == null) {
			return super.choose(request).block();
		}

		DefaultRequestContext requestContext = (DefaultRequestContext) request.getContext();
		if (!(requestContext.getClientRequest() instanceof RequestData)) {
			return super.choose(request).block();
		}

		RequestData clientRequest = (RequestData) requestContext.getClientRequest();
		HttpHeaders headers = clientRequest.getHeaders();

		String reqVersion = headers.getFirst(CommonConstants.VERSION);

		// 遍历可以实例元数据，若匹配则返回此实例
		List<ServiceInstance> serviceInstanceList = instances.stream().filter(instance -> {
			NacosServiceInstance nacosInstance = (NacosServiceInstance) instance;
			Map<String, String> metadata = nacosInstance.getMetadata();
			String targetVersion = MapUtil.getStr(metadata, CommonConstants.VERSION);
			if (StrUtil.isBlank(reqVersion)) {
				return true;
			}
			return reqVersion.equalsIgnoreCase(targetVersion);
		}).collect(Collectors.toList());

		// 存在 随机返回
		if (CollUtil.isNotEmpty(serviceInstanceList)) {
			ServiceInstance instance = RandomUtil.randomEle(serviceInstanceList);
			log.debug("gray instance available serviceId: {} , instanceId: {}", serviceId, instance.getInstanceId());
			return new DefaultResponse(instance);
		}
		else {
			return  new EmptyResponse();
		}
	}

}
