package com.cloud.just.sa.security;

import cn.dev33.satoken.id.SaIdUtil;
import feign.RequestInterceptor;
import feign.RequestTemplate;
import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.stereotype.Component;

/**
 * feign拦截器, 在feign请求发出之前，加入一些操作 
 */
@Component
@ConditionalOnBean(EnableFeignClients.class)
public class FeignInterceptor implements RequestInterceptor {
    // 为 Feign 的 RCP调用 添加请求头Id-Token 
    @Override
    public void apply(RequestTemplate requestTemplate) {
        requestTemplate.header(SaIdUtil.ID_TOKEN, SaIdUtil.getToken());
    }
}
