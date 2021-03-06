## 简介
- 镜像配置使用总结

- [配置笔记](https://huhuhan.github.io/blog/views/docker/docker-demo.html)

> 若博客中的配置代码冲突，以这里为主！

## 清单

- geoserver：地图图层发布服务
- rdp：[开源报表系统](http://product.mftcc.cn/rdp/index.html) , tomcat容器
- web：纯前端，发布于tag中，用于测试dockerfile和docker-compose的不同部署方式
- kafka：中间件
- mysql：数据库
- postgres：数据库
- jenkins：可持续化构建
- nexus3：仓库管理服务
- elasticsearch：搜索引擎
- rocketMQ: 消息中间件
- minio：文件系统 oss对象存储服务
- redis：缓存数据库
- activemq：中间件
- portainer：docker编排，可视化管理平台
- docker: 守护进程的配置参考文件`daemon.json`
- service: Linux系统服务，配置参考脚本
- jdk: 官方并发jar包，`java -jar`运行，用于理解并发线程