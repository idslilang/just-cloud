package com.cloud.just.sa.annotation;

import com.cloud.just.sa.aspect.JustSecurityInnerAspect;
import com.cloud.just.sa.security.config.PermitAllUrlProperties;
import com.cloud.just.sa.security.config.SaTokenConfigure;
import org.springframework.context.annotation.Import;

import java.lang.annotation.*;

/**
 * 资源服务注解
 */
@Documented
@Inherited
@Target({ ElementType.TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Import({SaTokenConfigure.class, PermitAllUrlProperties.class, JustSecurityInnerAspect.class})
public @interface EnableJustResourceServer {

}
