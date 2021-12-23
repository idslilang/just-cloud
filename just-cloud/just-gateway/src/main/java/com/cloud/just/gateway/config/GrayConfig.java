package com.cloud.just.gateway.config;

import com.cloud.just.gateway.gray.GrayReactorLoadBalancerConfiguration;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.cloud.loadbalancer.annotation.LoadBalancerClients;
import org.springframework.context.annotation.Configuration;

@Configuration
@LoadBalancerClients(defaultConfiguration = GrayReactorLoadBalancerConfiguration.class)
@ConditionalOnProperty(value = "gateway.gray.enabled", havingValue = "true")
public class GrayConfig {
}
