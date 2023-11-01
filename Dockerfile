# Dockerfile
# 使用 centos 作为基础镜像
FROM adoptopenjdk/openjdk8:x86_64-centos-jre8u312-b07
# 镜像描述信息
LABEL maintainer="Your Name <yourname@example.com>"
#维护者信息
MAINTAINER sunpeng
# 设置工作目录
WORKDIR /app
# 拷贝项目文件到镜像中
COPY . .
# 构建应用程序
RUN ./mvnw clean package

# 安装辅助工具 telnet，可以用于端口连通性测试
RUN yum update && yum install -y telnet
# 为容器打开指定的监听端口以实现与外部通信
EXPOSE 8000
# 启动命令
CMD ["java", "-jar", "app.jar"]