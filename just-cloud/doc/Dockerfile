FROM mysql:8.0.24

MAINTAINER lengleng(wangiegie@gmail.com)

ENV TZ=Asia/Shanghai

RUN ln -sf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY ./just.sql /docker-entrypoint-initdb.d

COPY ./just_codegen.sql /docker-entrypoint-initdb.d

COPY ./just_config.sql /docker-entrypoint-initdb.d

COPY ./just_job.sql /docker-entrypoint-initdb.d
