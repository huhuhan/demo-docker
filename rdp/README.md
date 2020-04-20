## RDP报表系统
>  仓库管理不包括RDP源码（webapps)和data数据包，可下载release或去[官网下载](http://product.mftcc.cn/rdp/download.html)

### 基础信息

- 启动成功后访问地址：`http://实际IP:端口/RDP-SERVER`
- 默认账户密码`admin/admin`
### 数据源配置

- 生成数据库`rdp_server`，脚本在db目录下

- 修改`rdp\webapps\RDP-SERVER\WEB-INF\classes\application.yml`的数据源属性
- 修改所选数据库源的连接配置
```yaml
#application.yml的数据库源，默认postgres
spring:
  profiles:
    active: postgres
```
```yaml
#application-postgres.yml例子
spring:
  datasource:
    type: com.alibaba.druid.pool.DruidDataSource
    driverClassName: org.postgresql.Driver
    druid:
      first:  #数据源1
        url: jdbc:postgresql://实际IP:端口/rdp_server
        username: 账户
        password: 密码
        connection-error-retry-attempts: 1
        break-after-acquire-failure: true
      second:  #数据源2
        url: jdbc:postgresql://实际IP:端口/rdp_server
        username: 账户
        password: 密码
```
### 现有报表复制
- 文件拷贝到该路径下`rdp\data\reportfiles`
### 其他
- 报表操作，参考`rdp\报表工具v2.4操作手册文档.pdf`
- [官网](http://product.mftcc.cn/rdp/index.html)

### 部署

- 修改docker挂载路径，内部路径不用修改。默认路径如下，为window环境

    ```yml
        volumes:
          # 实际绝对路径（若写相对路径前缀$pwd）
          - D:\YH\test\docker\hs\rdp\data:/usr/local/tomcat/data
          - D:\YH\test\docker\hs\rdp\webapps:/usr/local/tomcat/webapps
    ```
> docker-compose.yml文件不要放在挂载目录内

- 部署端口修改，修改9800为期望的端口

    ```yaml
        ports:
          - 9800:8080
    ```


- 镜像源版本更换，默认最新版tomcat，如`tomcat:8`，根据本地是否已有镜像可选，避免重复下载慢。

    ```yml
    image: tomcat
    ```

- 启动，在`docker-compose.yml`文件所在路径运行，前提已安装docker-compose插件，[安装参考](https://www.jianshu.com/p/1fd03bf4998d)

    ```shell
    # 后台启动容器
    docker-compose up -d
    # 回收资源，会停止、删除容器相关资源
    docker-compose down
    # 查看容器运行情况
    docker ps
    ```

