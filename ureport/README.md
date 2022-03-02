
## 版本说明

> - 服务地址：`http://IP:PORT/ureport/designer`
> - 指定预览：`http://IP:PORT/ureport/preview?_u=yh-1.ureport.xml`，其中`yh-`是统一前缀，`1.ureport.xml`是报表名称。其他参数可选拼接


### 1.0 & latest

- 支持PDF文字水印，加上请求参数`&watermark=XXXXXXXXXXX`
- 镜像：`huhuhan/ureport:1.0`
- 支持挂载系统日志路径：`/usr/ureport/log`
- 支持挂载默认服务器文件系统：`/usr/ureport/file`
- 支持JVM参数，用`JAVA_OPTS`
- 支持环境参数配置，用`PARAMS`
    - 默认`--spring.profiles.active=h2`
    - 可选`--spring.profiles.active=yh`, 支持mysql、postgresql，补充数据库连接参数
    
        ```properties
          --spring.profiles.active=yh
          --spring.datasource.url=jdbc:mysql://192.168.1.53:3306/ureport?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true&serverTimezone=Asia/Shanghai
          --spring.datasource.username=root
          --spring.datasource.password=yanghan
          --spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
        ```
        
        ```properties
          --spring.profiles.active=yh
          --spring.datasource.url=jdbc:postgresql://192.168.1.53:5432/ureport
          --spring.datasource.username=postgres
          --spring.datasource.password=yanghan
          --spring.datasource.driver-class-name=org.postgresql.Driver
        ```

- h2环境，支持访问控制台
    ```
    Driver Class: org.h2.Driver
    JDBC URL: jdbc:h2:~/ureport
    User Name: root
    Password: 
    ```

