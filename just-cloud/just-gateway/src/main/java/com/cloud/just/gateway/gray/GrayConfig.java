package com.cloud.just.gateway.gray;

import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.cloud.loadbalancer.annotation.LoadBalancerClients;
import org.springframework.context.annotation.Configuration;


/**
 * LoadBalancerClients 动态加载不同的配置类 https://segmentfault.com/a/1190000040082624
 * 通过使用 @LoadBalancerClients 和 @LoadBalancerClient 注解可以自动生成对应的 LoadBalancerClientSpecification 进而实现公共负载均衡配置或者特定某个微服务的负载均衡配置。
 */
@Configuration
@LoadBalancerClients(defaultConfiguration = GrayRandomLoadBalancerConfiguration.class)
@ConditionalOnProperty(value = "gateway.gray.enabled", havingValue = "true")
public class GrayConfig {
}
