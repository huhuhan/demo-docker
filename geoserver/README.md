### GeoServer

## 基本信息

默认账户：`admin/geoserver`

访问地址：`http://IP:PORT/geoserver`

## 部署

- 修改访问端口，默认8600

- 修改挂载资源路径，默认windows路径

 ```yml
  ports:
    - 8600:8080
  volumes:
    # 实际绝对路径（若写相对路径前缀$pwd）
    - D:\YH\test\docker\geoserver\geoserver-data:/opt/geoserver/data_dir
 ```

- 启动 ，基于docker-compose插件

  ```shell
  docker-compose up
  docker-compose stop
  docker-compose up -d
  ```

> 基础镜像，参考[geoserver](https://hub.docker.com/r/kartoza/geoserver)，[github](https://github.com/kartoza/docker-geoserver/blob/master/docker-compose.yml)

## 使用

1. 创建工作区
2. 新增数据存储，shape类型，选择本地资源shape文件，保存、发布
3. 填写基本信息、边框计算数据，保存
4. Layer Preivwe 预览

> demo-data里有演示用shape，复制到挂载目录里