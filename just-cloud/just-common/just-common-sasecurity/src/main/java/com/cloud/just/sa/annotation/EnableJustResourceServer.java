package com.cloud.just.sa.annotation;

import java.lang.annotation.*;

/**
 * 资源服务注解
 */
@Documented
@Inherited
@Target({ ElementType.TYPE })
@Retention(RetentionPolicy.RUNTIME)
public @interface EnableJustResourceServer {

}
