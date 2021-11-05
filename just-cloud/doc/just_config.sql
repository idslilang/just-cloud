/*
 Navicat Premium Data Transfer

 Source Server         : eladmin
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : localhost:3306
 Source Schema         : just_config

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 05/11/2021 08:22:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `c_use` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `effect` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `c_schema` text COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfo_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info';

-- ----------------------------
-- Records of config_info
-- ----------------------------
BEGIN;
INSERT INTO `config_info` VALUES (1, 'application-dev.yml', 'DEFAULT_GROUP', '# 加解密根密码\njasypt:\n  encryptor:\n    password: pig #根密码\n\n# Spring 相关\nspring:\n  # 端口\nspring: \n    # redis配置 \n  redis:\n        # Redis数据库索引（默认为0）\n      database: 1\n        # Redis服务器地址\n      host: 127.0.0.1\n        # Redis服务器连接端口\n      port: 6379\n        # Redis服务器连接密码（默认为空）\n        # password: \n        # 连接超时时间\n      timeout: 10s\n      lettuce:\n          pool:\n                # 连接池最大连接数\n              max-active: 200\n                # 连接池最大阻塞等待时间（使用负值表示没有限制）\n              max-wait: -1ms\n                # 连接池中的最大空闲连接\n              max-idle: 10\n                # 连接池中的最小空闲连接\n              min-idle: 0\n\n  cloud:\n    sentinel:\n      eager: true\n      transport:\n        dashboard: just-sentinel:5003\n\n# 暴露监控端点\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n\n# feign 配置\nfeign:\n  sentinel:\n    enabled: true\n  okhttp:\n    enabled: true\n  httpclient:\n    enabled: false\n  client:\n    config:\n      default:\n        connectTimeout: 10000\n        readTimeout: 10000\n  compression:\n    request:\n      enabled: true\n    response:\n      enabled: true\n\n# mybaits-plus配置\nmybatis-plus:\n  mapper-locations: classpath:/mapper/*Mapper.xml\n  global-config:\n    banner: false\n    db-config:\n      id-type: auto\n      table-underline: true\n      logic-delete-value: 1\n      logic-not-delete-value: 0\n  configuration:\n    map-underscore-to-camel-case: true\n\n# spring security 配置\nsecurity:\n  oauth2:\n    resource:\n      loadBalanced: true\n      token-info-uri: http://just-auth/oauth/check_token\n    # 通用放行URL，服务个性化，请在对应配置文件覆盖\n    ignore:\n      urls:\n        - /v2/api-docs\n        - /actuator/**\n# swagger 配置\nswagger:\n  enabled: true\n  title: Just Swagger API\n  license: Powered By just4cloud\n  licenseUrl: https://just4cloud.com\n  terms-of-service-url: https://just4cloud.com\n  contact:\n    email: wangiegie@gmail.com\n    url: https://just4cloud.com\n  authorization:\n    name: just4cloud OAuth\n    auth-regex: ^.*$\n    authorization-scope-list:\n      - scope: server\n        description: server all\n    token-url-list:\n      - http://${GATEWAY_HOST:just-gateway}:${GATEWAY-PORT:9999}/auth/oauth/token', 'f16896043cd168308dd6f42cfd6004a5', '2019-11-29 16:31:20', '2021-11-04 23:41:20', 'nacos', '127.0.0.1', '', '', '通用配置', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (2, 'just-auth-dev.yml', 'DEFAULT_GROUP', '# 数据源\nspring:\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: 123456\n    url: jdbc:mysql://just-mysql:3306/just?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\n  freemarker:\n    allow-request-override: false\n    allow-session-override: false\n    cache: true\n    charset: UTF-8\n    check-template-location: true\n    content-type: text/html\n    enabled: true\n    expose-request-attributes: false\n    expose-session-attributes: false\n    expose-spring-macro-helpers: true\n    prefer-file-system-access: true\n    suffix: .ftl\n    template-loader-path: classpath:/templates/', '97fc81c6ee4364031294111cc6c2a7d7', '2019-11-29 16:31:48', '2021-09-11 10:22:07', 'nacos', '127.0.0.1', '', '', '认证中心配置', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (3, 'just-codegen-dev.yml', 'DEFAULT_GROUP', '## spring security 配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ENC(27v1agvAug87ANOVnbKdsw==)\n      client-secret: ENC(VbnkopxrwgbFVKp+UxJ2pg==)\n      scope: server\n\n# 数据源配置\nspring:\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: 123456\n    url: jdbc:mysql://just-mysql:3306/just_codegen?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\n  resources:\n    static-locations: classpath:/static/,classpath:/views/\n\n# 直接放行URL\nignore:\n  urls:\n    - /v2/api-docs\n    - /actuator/**\n', '06d385eb5fac575b69d3e2cb1e37964f', '2019-11-29 16:32:12', '2021-09-11 10:22:54', 'nacos', '127.0.0.1', '', '', '代码生成配置', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (4, 'just-gateway-dev.yml', 'DEFAULT_GROUP', 'spring:\n  cloud:\n    gateway:\n      locator:\n        enabled: true\n      routes:\n        # 认证中心\n        - id: just-auth\n          uri: lb://just-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - ValidateCodeGatewayFilter\n            # 前端密码解密\n            - PasswordDecoderFilter\n         # 认证中心\n        - id: just-sa-oauth\n          uri: lb://just-sa-oauth\n          predicates:\n            - Path=/sa/oauth2/**\n          filters:\n            # 验证码处理\n            - ValidateCodeGatewayFilter\n            # 前端密码解密\n            - PasswordDecoderFilter    \n        #UPMS 模块\n        - id: just-upms-biz\n          uri: lb://just-upms-biz\n          predicates:\n            - Path=/admin/**\n          filters:\n            # 限流配置\n            - name: RequestRateLimiter\n              args:\n                key-resolver: \'#{@remoteAddrKeyResolver}\'\n                redis-rate-limiter.replenishRate: 100\n                redis-rate-limiter.burstCapacity: 200\n        # 代码生成模块\n        - id: just-codegen\n          uri: lb://just-codegen\n          predicates:\n            - Path=/gen/**\n\n\ngateway:\n  encode-key: \'thanks,pig4cloud\'\n  ignore-clients:\n    - test\n    - pig\n\nswagger:\n  ignore-providers:\n    - just-auth\n    - just-codegen\n', 'f55f2a94678204120f5e3a61b93e4c70', '2019-11-29 16:32:42', '2021-11-04 23:29:41', 'nacos', '127.0.0.1', '', '', '网关配置', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (5, 'just-monitor-dev.yml', 'DEFAULT_GROUP', 'spring:\n  # 安全配置\n  security:\n    user:\n      name: ENC(8Hk2ILNJM8UTOuW/Xi75qg==)     # just\n      password: ENC(o6cuPFfUevmTbkmBnE67Ow====) # just\n', '85509c6f8c67c364dc78301896274f26', '2019-11-29 16:33:05', '2019-11-29 16:33:05', NULL, '127.0.0.1', '', '', '监控配置', NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (6, 'just-upms-biz-dev.yml', 'DEFAULT_GROUP', 'security:\n  oauth2:\n    client:\n    # pig\n      client-id: ENC(imENTO7M8bLO38LFSIxnzw==)\n      #pig\n      client-secret: ENC(i3cDFhs26sa2Ucrfz2hnQw==)\n      #just-client-id\n      # client-id: ENC(NBLe7s1xE6L2R+zBt1YxdhyvQBokrd1l)  \n      # #just-client-secret\n      # client-secret: ENC(pCdOZ6EM9ytj6z4XLefiOHTxa90ZwDESEwnCgCGIseE=)\n      scope: server\n\n# 数据源\nspring:\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: 123456\n    url: jdbc:mysql://just-mysql:3306/just?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&allowMultiQueries=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\n', '59d0fba806fd1023e50f756c7a1ff7df', '2019-11-29 16:52:32', '2021-09-20 13:53:35', 'nacos', '127.0.0.1', '', '', '统一权限', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (16, 'just-sa-oauth-dev.yml', 'DEFAULT_GROUP', '# 数据源\nspring:\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: 123456\n    url: jdbc:mysql://just-mysql:3306/just?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\n', 'd897bfd020a40eb1471e891715f20857', '2021-11-04 01:39:46', '2021-11-04 01:39:46', NULL, '127.0.0.1', '', '', 'sa-oauth配置信息', NULL, NULL, 'yaml', NULL);
COMMIT;

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfoaggr_datagrouptenantdatum` (`data_id`,`group_id`,`tenant_id`,`datum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='增加租户字段';

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfobeta_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_beta';

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfotag_datagrouptenanttag` (`data_id`,`group_id`,`tenant_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_tag';

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `uk_configtagrelation_configidtag` (`id`,`tag_name`,`tag_type`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_tag_relation';

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='集群、各Group容量信息表';

-- ----------------------------
-- Records of group_capacity
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info` (
  `id` bigint(64) unsigned NOT NULL,
  `nid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00',
  `src_user` text COLLATE utf8_bin,
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `op_type` char(10) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`),
  KEY `idx_gmt_create` (`gmt_create`),
  KEY `idx_gmt_modified` (`gmt_modified`),
  KEY `idx_did` (`data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='多租户改造';

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
BEGIN;
INSERT INTO `his_config_info` VALUES (4, 10, 'just-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  cloud:\n    gateway:\n      locator:\n        enabled: true\n      routes:\n        # 认证中心\n        - id: just-auth\n          uri: lb://just-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - ValidateCodeGatewayFilter\n            # 前端密码解密\n            - PasswordDecoderFilter\n        #UPMS 模块\n        - id: just-upms-biz\n          uri: lb://just-upms-biz\n          predicates:\n            - Path=/admin/**\n          filters:\n            # 限流配置\n            - name: RequestRateLimiter\n              args:\n                key-resolver: \'#{@remoteAddrKeyResolver}\'\n                redis-rate-limiter.replenishRate: 100\n                redis-rate-limiter.burstCapacity: 200\n        # 代码生成模块\n        - id: just-codegen\n          uri: lb://just-codegen\n          predicates:\n            - Path=/gen/**\n\n\ngateway:\n  encode-key: \'thanks,pig4cloud\'\n  ignore-clients:\n    - test\n    - pig\n\nswagger:\n  ignore-providers:\n    - just-auth\n    - just-codegen\n', '8f1a05199fb42b6c72e133815660fd85', '2010-05-05 00:00:00', '2021-11-03 21:19:24', 'nacos', '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (4, 11, 'just-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  cloud:\n    gateway:\n      locator:\n        enabled: true\n      routes:\n        # 认证中心\n        - id: just-auth\n          uri: lb://just-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - ValidateCodeGatewayFilter\n            # 前端密码解密\n            - PasswordDecoderFilter\n         # 认证中心\n        - id: just-auth\n          uri: lb://just-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - ValidateCodeGatewayFilter\n            # 前端密码解密\n            - PasswordDecoderFilter    \n        #UPMS 模块\n        - id: just-upms-biz\n          uri: lb://just-upms-biz\n          predicates:\n            - Path=/admin/**\n          filters:\n            # 限流配置\n            - name: RequestRateLimiter\n              args:\n                key-resolver: \'#{@remoteAddrKeyResolver}\'\n                redis-rate-limiter.replenishRate: 100\n                redis-rate-limiter.burstCapacity: 200\n        # 代码生成模块\n        - id: just-codegen\n          uri: lb://just-codegen\n          predicates:\n            - Path=/gen/**\n\n\ngateway:\n  encode-key: \'thanks,pig4cloud\'\n  ignore-clients:\n    - test\n    - pig\n\nswagger:\n  ignore-providers:\n    - just-auth\n    - just-codegen\n', '46d6e6f85433d66dc6b177b05c8c4fea', '2010-05-05 00:00:00', '2021-11-03 21:19:39', 'nacos', '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (4, 12, 'just-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  cloud:\n    gateway:\n      locator:\n        enabled: true\n      routes:\n        # 认证中心\n        - id: just-auth\n          uri: lb://just-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - ValidateCodeGatewayFilter\n            # 前端密码解密\n            - PasswordDecoderFilter\n         # 认证中心\n        - id: just-sa\n          uri: lb://just-sa\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - ValidateCodeGatewayFilter\n            # 前端密码解密\n            - PasswordDecoderFilter    \n        #UPMS 模块\n        - id: just-upms-biz\n          uri: lb://just-upms-biz\n          predicates:\n            - Path=/admin/**\n          filters:\n            # 限流配置\n            - name: RequestRateLimiter\n              args:\n                key-resolver: \'#{@remoteAddrKeyResolver}\'\n                redis-rate-limiter.replenishRate: 100\n                redis-rate-limiter.burstCapacity: 200\n        # 代码生成模块\n        - id: just-codegen\n          uri: lb://just-codegen\n          predicates:\n            - Path=/gen/**\n\n\ngateway:\n  encode-key: \'thanks,pig4cloud\'\n  ignore-clients:\n    - test\n    - pig\n\nswagger:\n  ignore-providers:\n    - just-auth\n    - just-codegen\n', 'a4805cbd87d9941eae5499b4cb14cb55', '2010-05-05 00:00:00', '2021-11-03 21:29:13', 'nacos', '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (4, 13, 'just-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  cloud:\n    gateway:\n      locator:\n        enabled: true\n      routes:\n        # 认证中心\n        - id: just-auth\n          uri: lb://just-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - ValidateCodeGatewayFilter\n            # 前端密码解密\n            - PasswordDecoderFilter\n         # 认证中心\n        - id: just-sa\n          uri: lb://just-sa\n          predicates:\n            - Path=/oauth2/**\n          filters:\n            # 验证码处理\n            - ValidateCodeGatewayFilter\n            # 前端密码解密\n            - PasswordDecoderFilter    \n        #UPMS 模块\n        - id: just-upms-biz\n          uri: lb://just-upms-biz\n          predicates:\n            - Path=/admin/**\n          filters:\n            # 限流配置\n            - name: RequestRateLimiter\n              args:\n                key-resolver: \'#{@remoteAddrKeyResolver}\'\n                redis-rate-limiter.replenishRate: 100\n                redis-rate-limiter.burstCapacity: 200\n        # 代码生成模块\n        - id: just-codegen\n          uri: lb://just-codegen\n          predicates:\n            - Path=/gen/**\n\n\ngateway:\n  encode-key: \'thanks,pig4cloud\'\n  ignore-clients:\n    - test\n    - pig\n\nswagger:\n  ignore-providers:\n    - just-auth\n    - just-codegen\n', '4512476a7e2d22952f60f163d2f891d1', '2010-05-05 00:00:00', '2021-11-03 21:34:08', 'nacos', '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (4, 14, 'just-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  cloud:\n    gateway:\n      locator:\n        enabled: true\n      routes:\n        # 认证中心\n        - id: just-auth\n          uri: lb://just-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - ValidateCodeGatewayFilter\n            # 前端密码解密\n            - PasswordDecoderFilter\n         # 认证中心\n        - id: just-sa\n          uri: lb://just-sa\n          predicates:\n            - Path=/sa/oauth2/**\n          filters:\n            # 验证码处理\n            - ValidateCodeGatewayFilter\n            # 前端密码解密\n            - PasswordDecoderFilter    \n        #UPMS 模块\n        - id: just-upms-biz\n          uri: lb://just-upms-biz\n          predicates:\n            - Path=/admin/**\n          filters:\n            # 限流配置\n            - name: RequestRateLimiter\n              args:\n                key-resolver: \'#{@remoteAddrKeyResolver}\'\n                redis-rate-limiter.replenishRate: 100\n                redis-rate-limiter.burstCapacity: 200\n        # 代码生成模块\n        - id: just-codegen\n          uri: lb://just-codegen\n          predicates:\n            - Path=/gen/**\n\n\ngateway:\n  encode-key: \'thanks,pig4cloud\'\n  ignore-clients:\n    - test\n    - pig\n\nswagger:\n  ignore-providers:\n    - just-auth\n    - just-codegen\n', '1e5107ff2587793ac5d15901d4d18a38', '2010-05-05 00:00:00', '2021-11-03 21:37:31', 'nacos', '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (4, 15, 'just-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  cloud:\n    gateway:\n      locator:\n        enabled: true\n      routes:\n        # 认证中心\n        - id: just-auth\n          uri: lb://just-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - ValidateCodeGatewayFilter\n            # 前端密码解密\n            - PasswordDecoderFilter\n         # 认证中心\n        - id: just-sa\n          uri: lb://just-sa\n          predicates:\n            - Path=/sa/oauth/**\n          filters:\n            # 验证码处理\n            - ValidateCodeGatewayFilter\n            # 前端密码解密\n            - PasswordDecoderFilter    \n        #UPMS 模块\n        - id: just-upms-biz\n          uri: lb://just-upms-biz\n          predicates:\n            - Path=/admin/**\n          filters:\n            # 限流配置\n            - name: RequestRateLimiter\n              args:\n                key-resolver: \'#{@remoteAddrKeyResolver}\'\n                redis-rate-limiter.replenishRate: 100\n                redis-rate-limiter.burstCapacity: 200\n        # 代码生成模块\n        - id: just-codegen\n          uri: lb://just-codegen\n          predicates:\n            - Path=/gen/**\n\n\ngateway:\n  encode-key: \'thanks,pig4cloud\'\n  ignore-clients:\n    - test\n    - pig\n\nswagger:\n  ignore-providers:\n    - just-auth\n    - just-codegen\n', '360184364f0e2a484235d496ad0ebd32', '2010-05-05 00:00:00', '2021-11-03 21:47:14', 'nacos', '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (0, 16, 'just-sa-dev', 'DEFAULT_GROUP', '', '# 数据源\nspring:\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: 123456\n    url: jdbc:mysql://just-mysql:3306/just?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\n  freemarker:\n    allow-request-override: false\n    allow-session-override: false\n    cache: true\n    charset: UTF-8\n    check-template-location: true\n    content-type: text/html\n    enabled: true\n    expose-request-attributes: false\n    expose-session-attributes: false\n    expose-spring-macro-helpers: true\n    prefer-file-system-access: true\n    suffix: .ftl\n    template-loader-path: classpath:/templates/', '97fc81c6ee4364031294111cc6c2a7d7', '2010-05-05 00:00:00', '2021-11-03 22:26:17', NULL, '127.0.0.1', 'I', '');
INSERT INTO `his_config_info` VALUES (13, 17, 'just-sa-dev', 'DEFAULT_GROUP', '', '# 数据源\nspring:\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: 123456\n    url: jdbc:mysql://just-mysql:3306/just?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\n  freemarker:\n    allow-request-override: false\n    allow-session-override: false\n    cache: true\n    charset: UTF-8\n    check-template-location: true\n    content-type: text/html\n    enabled: true\n    expose-request-attributes: false\n    expose-session-attributes: false\n    expose-spring-macro-helpers: true\n    prefer-file-system-access: true\n    suffix: .ftl\n    template-loader-path: classpath:/templates/', '97fc81c6ee4364031294111cc6c2a7d7', '2010-05-05 00:00:00', '2021-11-03 22:26:42', NULL, '127.0.0.1', 'D', '');
INSERT INTO `his_config_info` VALUES (0, 18, 'just-sa-dev.yml', 'DEFAULT_GROUP', '', '111', '698d51a19d8a121ce581499d7b701668', '2010-05-05 00:00:00', '2021-11-03 22:27:13', NULL, '127.0.0.1', 'I', '');
INSERT INTO `his_config_info` VALUES (14, 19, 'just-sa-dev.yml', 'DEFAULT_GROUP', '', '111', '698d51a19d8a121ce581499d7b701668', '2010-05-05 00:00:00', '2021-11-03 22:27:41', 'nacos', '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (0, 20, 'just-sa-oauth-dev.yml', 'DEFAULT_GROUP', '', '# 数据源\nspring:\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: 123456\n    url: jdbc:mysql://just-mysql:3306/just?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\n', 'd897bfd020a40eb1471e891715f20857', '2010-05-05 00:00:00', '2021-11-04 01:39:46', NULL, '127.0.0.1', 'I', '');
INSERT INTO `his_config_info` VALUES (14, 21, 'just-sa-dev.yml', 'DEFAULT_GROUP', '', '# 数据源\nspring:\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: 123456\n    url: jdbc:mysql://just-mysql:3306/just?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\n', 'd897bfd020a40eb1471e891715f20857', '2010-05-05 00:00:00', '2021-11-04 01:39:51', NULL, '127.0.0.1', 'D', '');
INSERT INTO `his_config_info` VALUES (4, 22, 'just-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  cloud:\n    gateway:\n      locator:\n        enabled: true\n      routes:\n        # 认证中心\n        - id: just-auth\n          uri: lb://just-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - ValidateCodeGatewayFilter\n            # 前端密码解密\n            - PasswordDecoderFilter\n         # 认证中心\n        - id: just-sa\n          uri: lb://just-sa\n          predicates:\n            - Path=/sa/oauth2/**\n          filters:\n            # 验证码处理\n            - ValidateCodeGatewayFilter\n            # 前端密码解密\n            - PasswordDecoderFilter    \n        #UPMS 模块\n        - id: just-upms-biz\n          uri: lb://just-upms-biz\n          predicates:\n            - Path=/admin/**\n          filters:\n            # 限流配置\n            - name: RequestRateLimiter\n              args:\n                key-resolver: \'#{@remoteAddrKeyResolver}\'\n                redis-rate-limiter.replenishRate: 100\n                redis-rate-limiter.burstCapacity: 200\n        # 代码生成模块\n        - id: just-codegen\n          uri: lb://just-codegen\n          predicates:\n            - Path=/gen/**\n\n\ngateway:\n  encode-key: \'thanks,pig4cloud\'\n  ignore-clients:\n    - test\n    - pig\n\nswagger:\n  ignore-providers:\n    - just-auth\n    - just-codegen\n', '1e5107ff2587793ac5d15901d4d18a38', '2010-05-05 00:00:00', '2021-11-04 01:42:33', 'nacos', '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (4, 23, 'just-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  cloud:\n    gateway:\n      locator:\n        enabled: true\n      routes:\n        # 认证中心\n        - id: just-auth\n          uri: lb://just-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - ValidateCodeGatewayFilter\n            # 前端密码解密\n            - PasswordDecoderFilter\n         # 认证中心\n        - id: just-sa\n          uri: lb://just-sa-oauth\n          predicates:\n            - Path=/sa/oauth2/**\n          filters:\n            # 验证码处理\n            - ValidateCodeGatewayFilter\n            # 前端密码解密\n            - PasswordDecoderFilter    \n        #UPMS 模块\n        - id: just-upms-biz\n          uri: lb://just-upms-biz\n          predicates:\n            - Path=/admin/**\n          filters:\n            # 限流配置\n            - name: RequestRateLimiter\n              args:\n                key-resolver: \'#{@remoteAddrKeyResolver}\'\n                redis-rate-limiter.replenishRate: 100\n                redis-rate-limiter.burstCapacity: 200\n        # 代码生成模块\n        - id: just-codegen\n          uri: lb://just-codegen\n          predicates:\n            - Path=/gen/**\n\n\ngateway:\n  encode-key: \'thanks,pig4cloud\'\n  ignore-clients:\n    - test\n    - pig\n\nswagger:\n  ignore-providers:\n    - just-auth\n    - just-codegen\n', '37e435627d29924029d38318cbe729c6', '2010-05-05 00:00:00', '2021-11-04 02:33:46', 'nacos', '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (4, 24, 'just-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  cloud:\n    gateway:\n      locator:\n        enabled: true\n      routes:\n        # 认证中心\n        - id: just-auth\n          uri: lb://just-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - ValidateCodeGatewayFilter\n            # 前端密码解密\n            - PasswordDecoderFilter\n         # 认证中心\n        - id: just-sa\n          uri: lb://just-sa-oauth\n          predicates:\n            - Path=/sa/oauth2/**\n          filters:\n            # 验证码处理\n            - ValidateCodeGatewayFilter\n            # 前端密码解密\n            - PasswordDecoderFilter    \n        #UPMS 模块\n        - id: just-upms-biz\n          uri: lb://just-upms-biz\n          predicates:\n            - Path=/center/admin/**\n          filters:\n            # 限流配置\n            - name: RequestRateLimiter\n              args:\n                key-resolver: \'#{@remoteAddrKeyResolver}\'\n                redis-rate-limiter.replenishRate: 100\n                redis-rate-limiter.burstCapacity: 200\n        # 代码生成模块\n        - id: just-codegen\n          uri: lb://just-codegen\n          predicates:\n            - Path=/gen/**\n\n\ngateway:\n  encode-key: \'thanks,pig4cloud\'\n  ignore-clients:\n    - test\n    - pig\n\nswagger:\n  ignore-providers:\n    - just-auth\n    - just-codegen\n', 'f4e526c8c47388f38f3164db51f77dfc', '2010-05-05 00:00:00', '2021-11-04 02:36:27', 'nacos', '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (4, 25, 'just-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  cloud:\n    gateway:\n      locator:\n        enabled: true\n      routes:\n        # 认证中心\n        - id: just-auth\n          uri: lb://just-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - ValidateCodeGatewayFilter\n            # 前端密码解密\n            - PasswordDecoderFilter\n         # 认证中心\n        - id: just-sa\n          uri: lb://just-sa-oauth\n          predicates:\n            - Path=/sa/oauth2/**\n          filters:\n            # 验证码处理\n            - ValidateCodeGatewayFilter\n            # 前端密码解密\n            - PasswordDecoderFilter    \n        #UPMS 模块\n        - id: just-upms-biz\n          uri: lb://just-upms-biz\n          predicates:\n            - Path=/admin/admin/**\n          filters:\n            # 限流配置\n            - name: RequestRateLimiter\n              args:\n                key-resolver: \'#{@remoteAddrKeyResolver}\'\n                redis-rate-limiter.replenishRate: 100\n                redis-rate-limiter.burstCapacity: 200\n        # 代码生成模块\n        - id: just-codegen\n          uri: lb://just-codegen\n          predicates:\n            - Path=/gen/**\n\n\ngateway:\n  encode-key: \'thanks,pig4cloud\'\n  ignore-clients:\n    - test\n    - pig\n\nswagger:\n  ignore-providers:\n    - just-auth\n    - just-codegen\n', '7532ee115819c0fbb3f3f41e63f7d2e0', '2010-05-05 00:00:00', '2021-11-04 02:37:32', 'nacos', '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (4, 26, 'just-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  cloud:\n    gateway:\n      locator:\n        enabled: true\n      routes:\n        # 认证中心\n        - id: just-auth\n          uri: lb://just-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - ValidateCodeGatewayFilter\n            # 前端密码解密\n            - PasswordDecoderFilter\n         # 认证中心\n        - id: just-sa\n          uri: lb://just-sa-oauth\n          predicates:\n            - Path=/sa/oauth2/**\n          filters:\n            # 验证码处理\n            - ValidateCodeGatewayFilter\n            # 前端密码解密\n            - PasswordDecoderFilter    \n        #UPMS 模块\n        - id: just-upms-biz\n          uri: lb://just-upms-biz\n          predicates:\n            - Path=/admin/**\n          filters:\n            # 限流配置\n            - name: RequestRateLimiter\n              args:\n                key-resolver: \'#{@remoteAddrKeyResolver}\'\n                redis-rate-limiter.replenishRate: 100\n                redis-rate-limiter.burstCapacity: 200\n        # 代码生成模块\n        - id: just-codegen\n          uri: lb://just-codegen\n          predicates:\n            - Path=/gen/**\n\n\ngateway:\n  encode-key: \'thanks,pig4cloud\'\n  ignore-clients:\n    - test\n    - pig\n\nswagger:\n  ignore-providers:\n    - just-auth\n    - just-codegen\n', '37e435627d29924029d38318cbe729c6', '2010-05-05 00:00:00', '2021-11-04 23:29:41', 'nacos', '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (1, 27, 'application-dev.yml', 'DEFAULT_GROUP', '', '# 加解密根密码\njasypt:\n  encryptor:\n    password: pig #根密码\n\n# Spring 相关\nspring:\n  redis:\n    host: just-redis\n    password:\n  cloud:\n    sentinel:\n      eager: true\n      transport:\n        dashboard: just-sentinel:5003\n\n# 暴露监控端点\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n\n# feign 配置\nfeign:\n  sentinel:\n    enabled: true\n  okhttp:\n    enabled: true\n  httpclient:\n    enabled: false\n  client:\n    config:\n      default:\n        connectTimeout: 10000\n        readTimeout: 10000\n  compression:\n    request:\n      enabled: true\n    response:\n      enabled: true\n\n# mybaits-plus配置\nmybatis-plus:\n  mapper-locations: classpath:/mapper/*Mapper.xml\n  global-config:\n    banner: false\n    db-config:\n      id-type: auto\n      table-underline: true\n      logic-delete-value: 1\n      logic-not-delete-value: 0\n  configuration:\n    map-underscore-to-camel-case: true\n\n# spring security 配置\nsecurity:\n  oauth2:\n    resource:\n      loadBalanced: true\n      token-info-uri: http://just-auth/oauth/check_token\n    # 通用放行URL，服务个性化，请在对应配置文件覆盖\n    ignore:\n      urls:\n        - /v2/api-docs\n        - /actuator/**\n# swagger 配置\nswagger:\n  enabled: true\n  title: Just Swagger API\n  license: Powered By just4cloud\n  licenseUrl: https://just4cloud.com\n  terms-of-service-url: https://just4cloud.com\n  contact:\n    email: wangiegie@gmail.com\n    url: https://just4cloud.com\n  authorization:\n    name: just4cloud OAuth\n    auth-regex: ^.*$\n    authorization-scope-list:\n      - scope: server\n        description: server all\n    token-url-list:\n      - http://${GATEWAY_HOST:just-gateway}:${GATEWAY-PORT:9999}/auth/oauth/token', '084969dc859793c707e706a34ae78d3b', '2010-05-05 00:00:00', '2021-11-04 23:41:20', 'nacos', '127.0.0.1', 'U', '');
COMMIT;

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `role` varchar(50) NOT NULL,
  `resource` varchar(512) NOT NULL,
  `action` varchar(8) NOT NULL,
  UNIQUE KEY `uk_role_permission` (`role`,`resource`,`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `username` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  UNIQUE KEY `uk_username_role` (`username`,`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');
COMMIT;

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='租户容量信息表';

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_info_kptenantid` (`kp`,`tenant_id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='tenant_info';

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
